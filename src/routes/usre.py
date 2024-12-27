from flask import Blueprint, request

# 定义蓝图
user_bp = Blueprint("user", __name__)


# 在蓝图中定义路由
@user_bp.route("/", methods=["Post"])
def hello():
    print(vars(request))
    data = request.get_json()
    print(data)
    return {"msg": "hello world"}
