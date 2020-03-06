from database import db


class User(db.Model):
    """
    用户表
    主键：uid
    """
    __tablename__ = 'user'

    uid = db.Column(db.Integer, primary_key=True, autoincrement=True)
    username = db.Column(db.String(30), nullable=False)
    password = db.Column(db.String(128), nullable=False)
    gender = db.Column(db.Integer, default=1)


class UserDetail(db.Model):
    """
    用户详情，和用户是一对一关系
    主键：did
    """
    __tablename__ = 'detail'

    did = db.Column(db.Integer, primary_key=True, autoincrement=True)
    phone = db.Column(db.String(11))
    email = db.Column(db.String(200))
    uid = db.Column(db.Integer)


class BlogArticle(db.Model):
    """
    文章表，和用户是一对多关系
    主键：bid
    """
    __tablename__ = 'article'

    bid = db.Column(db.Integer, primary_key=True, autoincrement=True)
    category1 = db.Column(db.String(30), default='Business')
    category2 = db.Column(db.String(30), default='Technology')
    title = db.Column(db.String(100))
    picture = db.Column(db.String(300))
    content = db.Column(db.String(3000))
    create_time = db.Column(db.DateTime)
    comment_num = db.Column(db.Integer, default=0)
    click_num = db.Column(db.Integer, default=0)
    uid = db.Column(db.Integer)


class Reply(db.Model):
    """
    评论表，和用户是一对多关系，和文章是一对多关系
    """
    __tablename__ = 'reply'

    rid = db.Column(db.Integer, primary_key=True, autoincrement=True)
    content = db.Column(db.String(3000))
    create_time = db.Column(db.DateTime)
    uid = db.Column(db.Integer)
    bid = db.Column(db.Integer)


class Category(db.Model):
    """
    分类表
    """
    __tablename__ = 'category'

    cid = db.Column(db.Integer, primary_key=True, autoincrement=True)
    category_name = db.Column(db.String(30))
    quote_num = db.Column(db.Integer)
    create_time = db.Column(db.DateTime)



