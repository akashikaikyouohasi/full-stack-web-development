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
- `python manage.py migrate --settings config.settings.development`でmigrate実施
    - 初期値作成
        ```
        INSERT INTO `app`.`hello` (`world`) VALUES ('123');
        ```
- `cd api; django-admin startapp inventory`でDjangoプロジェクト内で新しいアプリケーション（inventoryフォルダー）作成する
### アプリケーションファイルの説明
- `__init__.py`:
  - このファイルは、ディレクトリをPythonパッケージとして認識させるためのものです。

- `admin.py`:
  - Django管理サイトにアプリケーションのモデルを登録するためのファイルです。

- `apps.py`:
  - アプリケーションの設定を定義するファイルです。

- `models.py`:
  - データベースのモデルを定義するファイルです。

- `tests.py`:
  - アプリケーションのテストを定義するファイルです。

- `views.py`:
  - ビュー（リクエストを処理してレスポンスを返す関数やクラス）を定義するファイルです。

- `migrations/`:
  - データベースのマイグレーションファイルを格納するディレクトリです。