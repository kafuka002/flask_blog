from functools import wraps

from flask import session, redirect, url_for

from App.models import User


def add_username(article_list):
    for article in article_list:
        username = User.query.get(article.uid).username
        article.username = username
    return article_list


def login_decorator(func):
    """
    :param func:  需要检验是否登录的函数
    :return: 原函数或者'/login'
    """
    @wraps(func)   # 保留原函数的一些属性，如函数名，不然会导致路由的映射视图函数重名
    def inner_func(*args, **kwargs):
        if session.get('uid'):
            return func(*args, **kwargs)
        else:
            return redirect(url_for('user.login'))
    return inner_func
