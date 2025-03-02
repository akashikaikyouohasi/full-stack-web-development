## 概要
[実装で学ぶフルスタックWeb開発 エンジニアの視野と知識を広げる「一気通貫」型ハンズオン](https://www.shoeisha.co.jp/book/detail/9784798179834)の学習用のリポジトリです

## commit　prefix
参考：https://qiita.com/muranakar/items/20a7927ffa63a5ca226a

| prefix | 説明 |
| ----- | ----- |
|fix	|既存の機能の問題を修正する場合に使用します|
|hotfix	|緊急の変更を追加する場合に使用します。|
|add	|新しいファイルを追加する場合に使用します。|
|feat	|新しい機能を追加する場合に使用します。|
|update	|既存の機能に問題がないが、修正を加えたい場合に使用します。|
|remove |ファイルを削除する場に使用します。|
|delete |機能を削除する場合に使用します。|

※他は必要になったら追加する

## メモ
- MySQLの初期データ
    - https://dev.mysql.com/doc/index-other.html
- Next.jsの初期化コマンド
    - `yarn create next-app frontend --ts --eslint`
- ENTRYPOINT と CMD の違い
    - ENTRYPOINT:
        - コンテナが起動したときに必ず実行されるコマンドを指定します。
        - docker run コマンドで追加の引数を渡すことができます。
    - CMD:
        - デフォルトのコマンドを指定しますが、docker run コマンドで別のコマンドを指定すると上書きされます。
        - ENTRYPOINT と組み合わせて使用することができます。