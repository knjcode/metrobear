東京メトロスタンプラリー　[Tokyometro Stamp Rally](https://tokyometro-stamp-rally.herokuapp.com)
====

## 概要

東京メトロの[オープンデータ活用コンテスト](http://tokyometro10th.jp/future/opendata/index.html)
応募用に作成した、スタンプラリーアプリです。

携帯端末等のGPS情報をもとに東京メトロ各駅（全143駅）の往訪を記録できます。

## TODO

- プライバシーポリシーの作成
- 駅来訪者一覧表示
- 駅来訪記録の削除機能

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

## Licence

[MIT](https://github.com/tcnksm/tool/blob/master/LICENCE)

## Author

[Kenji Doi](https://github.com/knjcode)
