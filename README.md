tokyometro-stamp-rally　[demo   on heroku](https://tokyometro-stamp-rally.herokuapp.com)
====

## 概要
東京メトロの[オープンデータ活用コンテスト](http://tokyometro10th.jp/future/opendata/index.html)
応募用に作成中のWebアプリです。  
アプリを実行しているモバイル端末等の位置情報をもとに東京メトロ各駅（全143駅）への訪問を記録できます。


## 使い方
アプリのURLへアクセスしOAuth認証にてログイン後、位置情報判定を実施。  
東京メトロの駅にいる場合は、その駅への訪問が記録されスタンプ画像がゲットできます。


## TODO

### 未実施
- ツイートボタン、いいねボタンの設置
- 退会リンクの色を他のところと変える
- プライバシーポリシーの作成
- 駅来訪記録の削除機能
- 各種実績の追加
- 本番用ドメイン取得
- 各駅毎の情報をAPIで取得して表示
- メトロAPIの連続投入制限機能
- メトロAPIのエラーハンドリング

### 実施中
- 各駅へのスタンプ画像の追加
- アプリの説明および問合せページ

### 実施済み
- アカウント削除機能
- twitterとfacebook認証によるユーザ名衝突の回避
- 駅来訪者一覧表示
- github認証


## 本番環境について

### herokuapp

herokuのアプリケーションはテスト用、本番用の2つ用意する。
- テスト tokyometro-stamp-rally.herokuapp.com
- 本番用 metrobear.herokuapp.com

### ドメインの取得
独自ドメインとして metrobear.tokyo をムームードメインにて取得。  
アプリのURLは https://sr.metrobear.tokyo にする。  
将来の拡張のためにサブドメインを付けておく。  

### herokuへ独自ドメインを設定する
#### herokuアプリにZerigo DNSのアドオンを追加
```
$ heroku addons:add zerigo_dns
Adding zerigo_dns on metro... done, v6 (free)
Use `heroku addons:docs zerigo_dns` to view documentation.
```

#### herokuアプリにサブドメインを追加
```
$ heroku domains:add sr.metrobear.tokyo
Adding sr.metrobear.tokyo to metrobear... done
```

#### ムームードメイン側の設定変更
ムームードメインのDNS設定にてZerigo DNSのレコードを追加する。
コントロールパネルの「ネームサーバ設定変更」から「取得したドメインで使用する ※上級者向け」
のラジオボタンを選択し、以下の内容を登録する。
```
a.ns.zerigo.net
b.ns.zerigo.net
c.ns.zerigo.net
d.ns.zerigo.net
e.ns.zerigo.net
f.ns.zerigo.net
```

あわせて、ムームードメイン側でCNAMEレコードを追加する。
（sr.metrobear.tokyoからmetrobear.herokuapp.com
へリダイレクトされるようにする）

#### 参考
[herokuのカスタムドメイン設定](https://devcenter.heroku.com/articles/custom-domains#the-herokuapp-com-domain)


### 独自ドメインへのSSL(https)導入
月額5＄程度必要となるため、今回は利用しない。ログイン認証については、
github、twitter、facebook、それぞれのサイトへリダイレクトされるため暗号化される。

### OAuth認証の設定
github、twitter、facebook、それぞれの開発者サイトにて
認証に必要なAPIキーを取得する。

以下の計6つのAPIキーをherokuの環境変数に設定する。
```
TMSR_TWITTER_CONSUMER_KEY
TMSR_TWITTER_CONSUMER_SECRET
TMSR_FACEBOOK_APP_ID
TMSR_FACEBOOK_APP_SECRET
TMSR_GITHUB_CLIENT_ID
TMSR_GITHUB_APP_IDHUB_CLIENT_SECRET
```

### デプロイ先
herokuに上記独自ドメインを設定して運用する。


### アクセス解析
herokuのnewrelicアドオンおよびGoogle Analyticsを使用する。


## APIキー
東京メトロのオープンデータを利用するために必要となるAPIキーは第三者への公開が禁止されているため、
本アプリはAPIキーを環境変数(TMSR_ACCESS_TOKEN)から取得して動作します。

APIキーは下記のように設定します。

シェルでの設定例
```
$ export TMSR_ACCESS_TOKEN=w1xvatanovwev6af2qorchfw76a2jv3dx6crynvt02byht91ev5wxcawgzx2k414
```

herokuでの設定例
```
$ heroku config:add TMSR_ACCESS_TOKEN=w1xvatanovwev6af2qorchfw76a2jv3dx6crynvt02byht91ev5wxcawgzx2k414
Setting config vars and restarting tokyometro-stamp-rally... done, v21
TMSR_ACCESS_TOKEN: w1xvatanovwev6af2qorchfw76a2jv3dx6crynvt02byht91ev5wxcawgzx2k414
```

(APIキーはダミーです)

## License
MIT

## Author
[knjcode](https://github.com/knjcode) and Stamps by gorakkuma
