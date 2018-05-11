---
title: "東方風神録をParallels Desktop 13+SteelSeries Nimbusコントローラで操作する"
date: 2018-05-05T13:12:28+09:00
lastmod: 2018-05-11T16:16:03+09:00
draft: false
tags:
    - "東方"
    - "ゲーム"
    - "MFiコントローラ"
    - "Parallels"
keywords:
    - "東方"
    - "ゲーム"
    - "MFiコントローラ"
    - "SteelSeries Nimbus"
    - "Parallels Desktop 13"
---

# 東方風神録をParallels Desktop 13+SteelSeries Nimbusコントローラで操作する

PC用のコントローラといえばPS4コントローラやUSB接続のHIDコントローラを用いることが一般的だが，
iOS用に購入したMFiコントローラを使い道が少ない為に放置していたので，Macとペアリングして活用できないだろうか，
と思った次第である．

はじめに要約すると，

- Parallels Desktop 13で東方風神録は問題なく動作する
- SteelSeries NimbusコントローラはMacとBluetooth接続可能
- ただしプロトコルが特殊なのでキーマッピングアプリケーションが別途必要

以下に動作手順の詳細を述べる．

<!--more-->

{{% toc %}}

## Step 1. 必要なものを揃える

ハードウェア・ソフトウェアを持っていないのであれば，まずそれらを用意する．

- 東方風神録 Etc.
    
    あきばお〜等の店舗・通販で入手可能．
    風神録以外でもおそらく動作するが，DirectX 9を用いたものを推奨する．

- Parallels Desktop 13
    
    公式サイトからでも購入できるが，Amazonのパッケージ版を買う方が割引されていることが多い．
    Wineを用いた方法が検索すると多くヒットするが，Wineの配布サイトが悪質なアドネットワークを用いているようなので，利用を見送った．

- Windows 10のライセンス
    
    ProでもHomeでも問題ない．

- SteelSeries Nimbus （MFi コントローラ）
    
    そもそもこの手法を取ろうと思うのはこのコントローラあるいはHORI等のMFiコントローラを持て余している人であろう．

## Step 2. ソフトウェアのインストール

### Mac（ホストOS）側

1. Parallels Desktopのインストール

1. Windowsの仮装端末へのインストール

    インストール方法は[ググる](https://www.google.co.jp/search?q=parallels+windows+%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB)と多数記事が見つかるので省略する．

1. GamepadMenuのインストール

    Githubで公開されている[このページ](https://github.com/robbertkl/GamepadMenu/releases)から
    ZIPファイルをダウンロード・展開し，GamepadMenu.appをアプリケーションフォルダに移動する．

    一応はGithubにソースコードが上がっているので，Wineよりはましかな，といったところ．
    Gatekeeperによる警告が表示される場合は右クリック＞開くを選択すると強制的に実行することができる（MacOSのTips）．

### Windows（ゲストOS）側

1. DirectXのインストール

    DirectXエンドユーザランタイムが同梱されていないものを動かすには必須．
    最新のものをMicrosoftから[ダウンロード](https://www.microsoft.com/ja-jp/directx/)・インストールしておくとよい．

1. 東方風神録のインストール

## Step 3. 各種設定

### Parallelsの設定

Windows仮想端末をシャットダウンした上で，Windows仮想端末の設定を開き，
ハードウェア＞グラフィック＞詳細設定＞3Dアクセラレーションのプルダウンメニューから
"DirectX 9"を選択する．

### MacとMFiコントローラのペアリング

MacOSのシステム環境設定を開き，"Bluetooth"を選択する．
MFiコントローラのボタン等を操作し（NimbusではBluetoothマークのついたボタンを長押しする）
ペアリングモードを開始させると，しばらく後にMacのBluetooth環境設定画面内のリストに
コントローラ名が表示されるので，その横にある「接続」ボタンをクリックして接続する．

### GamepadMenuの設定

GamepadMenu.appをFinderで右クリックし，「パッケージの内容を表示」を選択する．
Contents＞Resources＞Presetsに移動し，Presetsフォルダ内に以下を"Touhou.plist"としてテキスト形式で保存する．

{{% download path="assets/Touhou.plist" name="Touhou.plist" %}}

```plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>Directional pad - Up</key>
	<integer>126</integer>
	<key>Directional pad - Down</key>
	<integer>125</integer>
	<key>Directional pad - Left</key>
	<integer>123</integer>
	<key>Directional pad - Right</key>
	<integer>124</integer>
	<key>Left stick - Up</key>
	<integer>126</integer>
	<key>Left stick - Down</key>
	<integer>125</integer>
	<key>Left stick - Left</key>
	<integer>123</integer>
	<key>Left stick - Right</key>
	<integer>124</integer>
	<key>Button A</key>
	<integer>6</integer>
	<key>Button B</key>
	<integer>7</integer>
	<key>Button X</key>
	<integer>56</integer>
	<key>Button Y</key>
	<integer>8</integer>
	<key>Home button</key>
	<integer>53</integer>
	<key>Left shoulder</key>
	<integer>56</integer>
	<key>Right shoulder</key>
	<integer>6</integer>
	<key>Left trigger</key>
	<integer>8</integer>
	<key>Right trigger</key>
	<integer>59</integer>
</dict>
</plist>
```

## Step 4. 動作確認

1. MacとMFiコントローラを接続する
1. GamepadMenu.appを開く
1. メニューバーの :video_game:アイコンを選択し，"コントローラ名"＞"Touhou.plist"を選択する
1. Parallels DesktopからWindows仮想端末を開く
1. Windows仮想端末上で東方風神録を起動する
1. コントローラを操作して東方風神録が動作するか確認する

うまく動作すればAボタン・R1トリガーでショット・決定，Bボタンでボム，
Yボタン・L1トリガーで低速移動，Xボタン・L2トリガーでトランス（東方神霊廟），
R2トリガー（+決定）でスキップができるようになっているはずである．

## Step 5. More Configuration

### スキップ押下時にスティックを倒すとMac側でMisson Control等が発生することの対策

- 2018/5/12 追記

標準では，コントロールキー（Ctrl）を押した状態でカーソルキーを入力すると
MacOS側でキー入力が処理され，Misson ControlやMacOS上の
別のフルスクリーンアプリケーションに画面が切り替わる．

ここで，東方風神録などのスキップにはCtrlが割り当てられているため，
スキップ中にスティックを傾けると画面が切り替わり，ゲームの操作が不能になってしまうため，
そのままスキップが完了して被弾する，といった不都合が生じる．

この対策として，Parallels Desktopの環境設定を開き，
ショートカット＞macOS システムショートカット＞macOS システムショートカットを送信する: 
の下にあるプルダウンメニューから「常に」を選択する．
この設定により，Ctrl入力がシステムショートカットに割り当てられているキーの組み合わせとして
入力されたとしても，全てのキー入力がWindows仮装端末側に転送されるようになるため，
前述の不都合が発生しなくなる．

### ボタン配置を変更する

ボタン配置が気に入らない方向け．

Touhou.plistは各ボタン・スティック・トリガーを表す`key`と，
それが押されたときに入力されるCarbon Frameworkのイベント番号を表す`integer`
または入力される文字を表す`string`の辞書（ハッシュ）になっているので，
/System/Library/Frameworks/Carbon.framework/Frameworks/HIToolbox.framework/Headers/Events.hを参考にして
任意の文字あるいはモディファイアキーを設定できる．

「C言語のヘッダファイルの意味がわからない！」という方は，Touhou.plistのkeyとintegerの組み合わせを
入れ替えることでボタン配置を入れ替えればよい．プログラマでなくとも，
XcodeをMac App StoreからダウンロードしてXcodeでplistファイルをひらけば
キーや値をGUIで編集することも可能である．

## HCI研究への応用

iOS端末でもMac端末でもMFiコントローラはペアリングできるため，趣味の範囲外にも，
様々なOSで利用可能なゲームコントローラを用いた操作手法を提案するときにこの手法が適用できそうである．[^1]

[^1]: Android端末であればUSB接続でもBluetooth接続でもHIDコントローラが使えることには目をつぶっている．
