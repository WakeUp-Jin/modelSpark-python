from flask import Flask
from src.routes.usre import user_bp

# 创建 Flask 应用实例
app = Flask(__name__)

# 注册蓝图
app.register_blueprint(user_bp, url_prefix="/user")

if __name__ == "__main__":
    app.run(debug=True)
