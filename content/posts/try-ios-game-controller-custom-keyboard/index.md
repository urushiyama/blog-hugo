---
title: "ゲームコントローラで操作できるiOSカスタムキーボードをつくろうと（して挫折）した話"
date: 2018-05-13T20:23:00+09:00
draft: false
tags:
    - "iOS"
    - "カスタムキーボード"
    - "MFiコントローラ"
keywords:
    - "iOS"
    - "カスタムキーボード"
    - "custom keyboard"
    - "MFiコントローラ"
    - "SteelSeries Nimbus"
    - "gamecontroller"
---

iOSでMFiコントローラにより操作可能なカスタムキーボードの作成を試みた．

結果としてはうまくいかず挫折したが，作成時にハマった点を2つ述べる．

<!--more-->

## 動機

iOSはMFiコントローラを接続して対応するゲームの操作に用いることができる．
例えばMineCraft PEでも，MFiコントローラを接続してあたかもコンシューマ機のごとく
プレイヤーの操作が可能である．

しかし，SteelSeries Nimbusのような独立型コントローラを用いる際，
ゲーム内で文字入力が求められる場面では，一度コントローラから手を離し，
画面上に表示されるソフトウェアキーボードに手を伸ばさなければならない[^1]．

これでは好ましいインタラクションとはいえないので，
ゲームコントローラで文字入力を可能とするアプリを探してみたが，調べた限りでは見つからなかった．

そこで，「無いならつくればいい」精神にのっとり，
iOSでゲームコントローラにより操作可能なカスタムキーボードの作成を試みた．

## ハマった点

### デバッガをつないだときのみ時折発生するSIGQUIT

第一にハマった点は，デバッガを繋いだ状態で作成したカスタムキーボードを起動したときのみ，
viewDidLoad関数内あるいはその前にSIGQUITが発生してカスタムキーボードが選択できなくなる
ことが，条件不明で時折発生する点である．

```
dyld`_dyld_debugger_notification:
->  0x1008354ac <+0>: ret
```

上記2行目で"signal SIGQUIT"が発生している．

自分の書いた箇所で発生しているならまだしも，Single View Appを作成後に
TargetにCustom Keyboard Extensionを追加した直後のものをビルドしてもこの現象が発生する．

一方で，デバッガをつながずに実機上で作成したカスタムキーボードを選択した場合には
この現象が全く発生しない．

### Custom Keyboard Extension側のみGamepadのプロパティが読み取れない

今回カスタムキーボードの作成を諦めた原因は，
Custom Keyboard Extension側のみGCGamepadのプロパティが読み取れない点である．

正確には，プロパティには普通のアプリ同様のアクセスが可能である．
しかし，プロパティの値が全く更新されないのである．
handlerを登録しても実行されず，
Timer.scheduledTimerを用いてポーリングしても値は全て初期値のままである．

コードが間違っているかな，と不安になり，アプリ側に同じコードをコピペすると
何も問題なくすんなりと動作し，プロパティの値が更新されている．

おそらく，iOSのカスタムキーボードに対する制約のひとつとして
GameControllerの入力を取得不可にしているのではないだろうか．[^2]

[^1]: Bluetoothキーボードを接続しておくと手の移動量は幾分改善される．
[^2]: ならば標準のキーボードでMFiコントローラ対応してくれよ，と．