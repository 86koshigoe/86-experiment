PHP+Nginx+MySQL
===============


Vagrant と Berkshelf と Chef Zero を使った開発環境構築の試み。

- コミュニティクックブックのphp
  - デフォルトでパッケージを使うので 5.4 系が入る
  - ソースから入れることもできる
    - バージョン指定無しだと 5.5.9 が入った
      - checksum を指定しないと一致しなくて失敗した
      - SHA256 のチェックサムで指定する必要がある模様(詳細未確認)
- TODO: PHP FPM
  - コミュニティブックのレシピを使うとパッケージインストールになり、ソースで入れたPHPのAPIバージョンと一致せずNOTICEが出てしまう
  - remi-php55 対応の yum-remi クックブックを使うと PHP 5.5 の php/php-fpm がインストールされる
  - TODO: (pool|listen|) user/group => nginx
  - TODO: socket 対応
- TODO: MySQL の詳細設定
- TODO: Nginx の詳細設定
