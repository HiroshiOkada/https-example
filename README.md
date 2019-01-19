# https-example

ブラウザの JavaScipt から Accelerometer を読み出すためにに https で
配信する必要があります。

これは https で配信する簡単な Web サーバーを Python, Ruby, Node.js 又は Docker(lighttpd)
で記述するサンプルです。

証明書は Let's Encrypt の certbot で取得したものwコピーして使用する事を想定しています。

## 使い方

### Python

* 環境変数 PORT が設定されていばそのポートで配信します。
* そうでなければ、ポート 8444 で配信します。
* Python3.6.5 で動作確認しています。
* `certs/fullchain.pem` `certs/privkey.pem` が必要です。

```
./server.py
```

### Ruby

* 環境変数 PORT が設定されていばそのポートで配信します。
* そうでなければ、ポート 8444 で配信します。
* Ruby2.5.3 で動作確認しています。
* `certs/cert.pem`, `certs/chain.pem`, `certs/privkey.pem` が必要です。

```
./server.rb
```

### Node.js

* 環境変数 PORT が設定されていばそのポートで配信します。
* そうでなければ、ポート 8444 で配信します。
* node v10.14.2 で動作確認しています。
* `certs/fullchain.pem` `certs/privkey.pem` が必要です。

```
npm ci
npm start
```

### Docker

* Docker version 18.09.0
* `certs/cert.pem`, `certs/chain.pem`, `certs/privkey.pem` が必要です。

```
./server-docker.sh
```

