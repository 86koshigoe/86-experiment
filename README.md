PHP+Nginx+MySQL
===============


Vagrant と Berkshelf と Chef Zero を使った開発環境構築の試み。

- コミュニティクックブックのphp
  - デフォルトでパッケージを使うので 5.4 系が入る
  - ソースから入れることもできる
    - バージョン指定無しだと 5.5.9 が入った
      - checksum を指定しないと一致しなくて失敗した
      - SHA256 のチェックサムで指定する必要がある模様(詳細未確認)
- PHP FPM
  - コミュニティブックのレシピを使うとパッケージインストールになり、ソースで入れたPHPのAPIバージョンと一致せずNOTICEが出てしまう
  - remi-php55 対応の yum-remi クックブックを使うと PHP 5.5 の php/php-fpm がインストールされる
  - listen = /var/run/php-fpm-www.sock;
- MySQL の詳細設定
  - mysql コミュニティクックブックを使っていて node[mysql][enable_utf8] に文字列を入れて真にすると utf8 が設定ファイルに追加される
  - TODO: InnoDB パラメータチューニング
- Nginx の詳細設定
  - /etc/nginx/default.d/*.conf
  - TODO: アプリ用の自前クックブックで Nginx の設定を準備する
    - root が location の中で変えられず…

## Nginx ##

手作業で `/etc/nginx/default.d/php-fpm.conf` を作って phpinfo が見られる事だけ確認。
```
location ~ \.php$ {
    root           /var/www/html;
    fastcgi_pass   unix:/var/run/php-fpm-www.sock;
    fastcgi_index  index.php;
    fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
    include        fastcgi_params;
}
```
