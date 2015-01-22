PHP+Nginx+MySQL
===============


Vagrant と Berkshelf と Chef Zero を使った開発環境構築の試み。

- コミュニティクックブックのphp
  - デフォルトでパッケージを使うので 5.4 系が入る
  - ソースから入れることもできる
    - バージョン指定無しだと 5.5.9 が入った
      - checksum を指定しないと一致しなくて失敗した
      - SHA256 のチェックサムで指定する必要がある模様(詳細未確認)
- TODO: php fpm
- TODO: MySQL の詳細設定
- TODO: Nginx の詳細設定
