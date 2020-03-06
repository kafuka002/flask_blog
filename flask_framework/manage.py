from flask import Flask
from flask_script import Manager
from flask_migrate import Migrate, MigrateCommand

from App.views import user

from database import db


app = Flask(__name__)

# 加载配置文件
app.config.from_pyfile('settings.py')

# 初始化数据库访问对象
db.init_app(app)

# 注册蓝图
app.register_blueprint(user)

# 实例化迁移对象
manager = Manager(app)
Migrate(app, db)
manager.add_command('db', MigrateCommand)


if __name__ == '__main__':
    manager.run()
