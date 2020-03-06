"""
配置文件
"""
import os

DEBUG = True
SECRET_NAME = 'adasdasdasdsdsdafsdfdfssdfdsf'
SQLALCHEMY_DATABASE_URI = "mysql+pymysql://root:123456@127.0.0.1:3306/flask_t"
SQLALCHEMY_TRACK_MODIFICATIONS = False
SECRET_KEY = 'afas4fa156df16sd1f16sdf4166sd'
UPLOAD_FOLDER = os.path.join(os.getcwd(), 'static/upload')