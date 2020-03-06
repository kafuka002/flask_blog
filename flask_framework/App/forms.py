import re

from flask import session
from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField
from wtforms.validators import DataRequired, Length, EqualTo, Email, ValidationError

from App.models import User


def check_phone(form1,field):
    if not re.match(r'(13\d|14[5|7]|15\d|166|17[3|6|7]|18\d)\d{8}$',field.data):
        raise ValidationError("电话号码不符合规则")


class RegisterForm(FlaskForm):
    nickname = StringField("用户名",validators=[DataRequired("用户名必须输入")])
    password = PasswordField("密码",validators=[DataRequired("密码必须输入"),Length(min=8,max=20,message="密码长度必须在8-20位")])
    pwdagain = PasswordField("确认密码",validators=[EqualTo("password",message="两次密码不一致")])
    phonenum = StringField("电话",validators=[check_phone])
    phonecode = StringField("短信验证码", validators=[DataRequired("短信验证码必须输入")])
    piccode = StringField("图片验证码", validators=[DataRequired("图片验证码必须输入")])

    # 验证用户是否重名
    # 自定义的验证方法： validate_字段名
    def validate_nickname(self,field):
        # value是一个对象，获取用户输入的值应该是field.data
        user = User.query.filter(User.username==field.data).first()
        if user:
            raise ValidationError("用户名重名")
        return field

    def validate_phonecode(self,field):
        # value是一个对象，获取用户输入的值应该是field.data
        if field.data != session.get('sms'):
            raise ValidationError("短信验证码输入错误")
        return field

    def validate_piccode(self,field):
        # value是一个对象，获取用户输入的值应该是field.data
        if field.data != session.get('code'):
            raise ValidationError("图片验证码输入错误")
        return field