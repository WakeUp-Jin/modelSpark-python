# 使用官方 Python 作为基础镜像
FROM python:3.13-slim

# 设置工作目录
WORKDIR /app

# 安装系统依赖
RUN apt-get update && apt-get install -y build-essential libffi-dev curl

# 复制 poetry.lock 和 pyproject.toml 文件
COPY pyproject.toml poetry.lock* /app/

# RUN mkdir -p /etc/poetry && chmod 777 /etc/poetry

# 安装 Poetry（通过 pip）
RUN pip install --upgrade pip && \
    pip install -i https://pypi.tuna.tsinghua.edu.cn/simple poetry



# # 安装项目依赖
RUN poetry install --no-dev --no-root -v


# # 激活虚拟环境
# # ENV VIRTUAL_ENV=/app/.venv
# # ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# # ENV PATH="/root/.cache/pypoetry/virtualenvs/modelspark-python-9TtSrW0h-py3.13/bin:$PATH"

 
# # 复制项目文件到容器
COPY . /app

# 创建数据库存储目录（如果不存在的话）
RUN mkdir -p /app/dbStore

# 暴露 Flask 默认端口
# EXPOSE 8000

# EXPOSE 5000

# 默认的命令会在 docker-compose 启动时由 docker-compose 管理
