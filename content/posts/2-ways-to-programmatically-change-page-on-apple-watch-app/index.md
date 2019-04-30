---
title: "Apple Watchアプリでプログラムによるページ遷移を行う2つの方法"
date: 2018-08-02T19:31:24+09:00
draft: false
paginatable: true
tags:
    - "WatchOS"
    - "アプリ開発"
keywords:
    - "ページ遷移"
    - "WatchOS"
    - "アプリ開発"
---

Apple Watchアプリを作成するとき，next pageを用いてViewを複数のページに渡って配置することができる．その際に，あるViewから別のViewへプログラムによりページ遷移したい場合がある．本稿では，プログラムによりページ遷移を行う方法を2つ紹介する．

<!--more-->

{{% toc %}}

## 前提

- Swift 4.x
- WatchOS 4

## 方法1. NotificationとWKInterfaceController.becomeCurrentPageを用いる

おそらく一般的にはこちらの方法が用いられていると思う．この方法ではページ遷移の際に，ユーザのスワイプによるページ遷移と同様のアニメーションが発生する．そのため，ページ遷移の発生をユーザに意識させる場合に有効であろう．

### 1. 遷移先ページのコントローラ自身をNotificationのオブザーバに登録する

```swift
class DestinationPageController: WKInterfaceController {
  /* ~~~ */
  override func awake(withContext context: Any?) {
    super.awake(withContext: context)
    
    /* ~~~ */

    NotificationCenter.default.addObserver(self, selector: #selector(self.receiveMovePageNotification(_:)), name: Notification.Name(rawValue: "moveToDestinationPage") , object: nil)
  }
}
```

### 2. 遷移先ページのコントローラにbecomeCurrentPageを発火するためのメソッドを追加する

本当はselectorに直接becomeCurrentPageをselectorとして登録したいのだが，selectorに登録するメソッドはただ1つの引数（NSNotification）を持たなければならないため，`self.becomeCurrentPage`を呼び出すメソッドを追加する．

```swift
class DestinationPageController: WKInterfaceController {
  /* ~~~ */
  @objc func receiveMovePageNotification(_ notification: Notification?) {
    self.becomeCurrentPage()
  }
}
```

### 3. 遷移元ページの遷移を発生させたい箇所でNotificationをpostする

このときpostするNotification.Nameは，手順1で用いた値にする必要がある．

```swift
class OriginPageController: WKInterfaceController {
  /* ~~~ */
  func someActionOccurred() {
    NotificationCenter.default.post(name: Notification.Name(rawValue: "moveToDestinationPage"), object: nil)
  }
}
```

### 複数経路の遷移を実装する際の注意点

Notificationのオブザーバは，登録時にobjectを指定しない限り，あらゆるobjectからのpostに対して反応するため，遷移先ごとに異なるNotification.Nameを用いる必要がある．

## 方法2. WKInterfaceController.reloadRootPageControllersを用いる

この方法では，ページ遷移のみならず，表示するページの数や種類を変更できる．一方，すべてのページが再度読み込まれるため，遷移前のページ群と遷移後のページ群がユーザにとって別のものに見える点には注意が必要となる．

### 1. 各ページのコントローラに名前をつける

例えば，storyboard上の各Controllerを選択し，Identifierに一意な名前をつける．

### 2. 遷移元ページの遷移を発生させたい箇所でページのリロードを行う

withNamesに各ページのコントローラにつけた名前を0ページ目から順に並べた配列を渡し，pageIndexに遷移先のページ番号を渡す．

```swift
class OriginPageController: WKInterfaceController {
  /* ~~~ */
  func someActionOccurred() {
    WKInterfaceController.reloadRootPageControllers(withNames: ["OriginPage","DestinationPage"], contexts: nil, orientation: .horizontal, pageIndex: 1)
  }
}
```

### 最後に

ここで示したコード断片は何ら著作的でないものなので，パブリックドメインである．自己責任の限りご自由にお使いください．
