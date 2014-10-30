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

- 退会リンクの色を他のところと変える
- プライバシーポリシーの作成
- 駅来訪記録の削除機能
- 各種実績の追加
- 本番用ドメイン取得
- 各駅毎の情報をAPIで取得して表示
- メトロAPIの連続投入制限機能

### 実施中

- 各駅へのスタンプ画像の追加
- アプリの説明および問合せページ

### 実施済み

- アカウント削除機能
- twitterとfacebook認証によるユーザ名衝突の回避
- 駅来訪者一覧表示
- github認証

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
