## ファイル情報
- urls.py
    - ルーティング設定
- asgi.py
    - 非同期通信定義
- wsgi.py
    - フロントエンドとの通信定義

## メモ
- `pip freeze > requirements.lock`で依存関係の固定
- `django-admin startproject config .`でDjangoプロジェクト作成
- `python manage.py migrate --settings config.settings.development`defaultマイグレーション
- `python manage.py makemigrations --settings config.settings.development`でマイグレーションファイルの作成