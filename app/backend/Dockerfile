# Python
FROM --platform=arm64 python:3.12

# 作業ディレクトリを指定
WORKDIR /app

# ライブラリのインストール
COPY requirements.txt .
COPY requirements.lock .
RUN pip3 install -r requirements.lock
