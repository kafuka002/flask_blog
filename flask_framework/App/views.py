import hashlib
import os
from datetime import datetime
from random import randint

from flask import Blueprint, request, redirect, url_for, session, make_response, jsonify, current_app
from flask import render_template

from App.forms import RegisterForm
from common.SMS import sms
from database import db
from App.models import BlogArticle, Category, User, Reply
from common.func import add_username, login_decorator
from common.verifycode import vc

user = Blueprint('user', __name__)


# 主页
@user.route('/')
@user.route('/<int:page>/')
def blog(page=1):

    pagination = db.session.query(BlogArticle).order_by(BlogArticle.click_num.desc()).paginate(page, 4)
    # 给列表里的文章添加文章作者的属性， 方便模板调用
    random_article = add_username(pagination.items)

    # 每页显示3个页码，第一页显示1，2，3，最后一页显示4，5，6，其它页显示i-1,i,i+1
    if page == 1:
        pagination.page_range = range(1, 4)
    elif page == pagination.pages:
        pagination.page_range = range(page-2, page+1)
    else:
        pagination.page_range = range(page-1, page+2)

    top_article = db.session.query(BlogArticle).order_by(BlogArticle.click_num.desc()).limit(3).all()
    top_categories = db.session.query(Category).order_by(Category.quote_num.desc()).limit(5).all()
    return render_template('index.html', **locals())


# 个人
@user.route('/home/')
@login_decorator
def home():
    uid = session.get('uid')
    newest_article = db.session.query(BlogArticle).filter(BlogArticle.uid==uid).order_by(BlogArticle.create_time.desc()).limit(3).all()
    # 给文章对象添加username属性
    newest_article = add_username(newest_article)
    latest_article = db.session.query(BlogArticle).filter(BlogArticle.uid==uid).order_by(BlogArticle.create_time).limit(3).all()
    return render_template('home.html', newest_article=newest_article, latest_article=latest_article)


# 帖子 <int:bid>/ bid
@user.route('/post/<int:bid>/')
def post(bid):
    article = db.session.query(BlogArticle).filter(BlogArticle.bid==bid).first()

    # 给帖子对象添加用户名属性，方便视图函数调用
    username = User.query.get(article.uid).username
    article.username = username

    top_article = db.session.query(BlogArticle).order_by(BlogArticle.click_num.desc()).limit(3).all()
    top_categories = db.session.query(Category).order_by(Category.quote_num.desc()).limit(5).all()

    # 查找帖子的前三个评论，按评论时间排序
    replies = db.session.query(Reply).filter(Reply.bid==bid).order_by(Reply.create_time.desc()).limit(3).all()
    # 增加用户名属性
    replies = add_username(replies)
    return render_template('post.html', **locals())


# 图形验证码
@user.route('/verify/')
def verify_code():
    result = vc.generate()
    session['code'] = vc.code
    # 创建响应对象
    response = make_response(result)
    response.headers["Content-Type"] = "image/png"
    return response


# 短信验证
@user.route("/send/",methods=["GET","POST"])
def send_sms():
    phone = request.values.get('phone')
    if phone:
        # 产生验证码
        num = randint(10000, 99999)
        # 添加到session
        session['sms'] = str(num)
        para = "{'number':'%d'}" % num
        res = sms.send(phone,para)
        return jsonify({'code': 0, 'msg': '发送成功'})
    return jsonify({"code": 1, 'msg': "电话号码不存在"})

# 注册
@user.route('/register/', methods=['GET', 'POST'])
def register():
    form = RegisterForm(request.form)
    if request.method == 'POST':
        if form.validate_on_submit():
            # 获取验证数据
            username = form.nickname.data.upper()
            password = form.password.data
            user = User(username=username)
            # 保存用户信息
            user.password = hashlib.sha256(password.encode()).hexdigest()
            db.session.add(user)
            db.session.commit()
            user = User.query.filter(User.username==username).first()
            session['uid'] = user.uid
            return redirect(url_for('user.blog'))
    return render_template('register.htm', **locals())


# 登录
@user.route('/login/', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        # 首字母大写
        username = request.form.get('loginname').upper()
        password = request.form.get('password')
        db_password = db.session.query(User.password).filter(User.username==username).first()
        if db_password:
            if hashlib.sha256(password.encode()).hexdigest() == db_password[0]:
                uid = db.session.query(User.uid).filter(User.username==username).first()[0]
                session['uid'] = uid
                return redirect(url_for('user.home'))
        # 消息提示
        return render_template('login.htm', msg="用户名或密码错误")
    return render_template('login.htm')


# 退出登录
@user.route('/logout/')
@login_decorator
def logout():
    session.pop('uid')
    return redirect(url_for('user.login'))


# 写博客界面
@user.route('/blogging/', methods=['GET', 'POST'])
@login_decorator
def blogging():
    # 获取文件上传对象
    if request.method == 'POST':
        uid = session.get('uid')
        fobj = request.files.get('img')
        if fobj:
            now_time = datetime.now().strftime('%Y-%m-%d-%H-%M-%S')
            base_path = current_app.config.get('UPLOAD_FOLDER')
            file_name = f'{uid}-{now_time}' + os.path.splitext(fobj.filename)[1]
            path = os.path.join(base_path, file_name)
            fobj.save(path)
            # 保存文章信息
            article = BlogArticle(title=request.form.get('title'), picture=os.path.join('/static/upload', file_name),
                                  content=request.form.get('content'), create_time=now_time, uid=uid)
            db.session.add(article)
            db.session.commit()
            return redirect(url_for('user.home'))
    return render_template('blogging.html')


# 评论路由
@user.route('/reply/<int:bid>/', methods=['post'])
@login_decorator
def reply(bid):
    uid = session.get('uid')
    usercomment = request.form.get('usercomment')
    now_time = datetime.now().strftime('%Y-%m-%d-%H-%M-%S')
    # 增加一条评论数据
    reply = Reply(content=usercomment, create_time=now_time, uid=uid, bid=bid)
    # 给对应文章的评论量 +1
    article = BlogArticle.query.get(bid)
    article.comment_num += 1
    db.session.add(reply)
    db.session.add(article)
    db.session.commit()
    return redirect(url_for('user.post', bid=bid))
