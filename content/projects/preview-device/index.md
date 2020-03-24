---
title: "PreviewDevice"
date: 2020-01-16T05:10:00+09:00
draft: false
tags:
    - "Library / Framework"
    - "Swift"
keywords:
    - "ライブラリ"
    - "SwiftUI"
    - "OSS"
    - "フレームワーク"
    - "live preview"
    - "プレビュー"
projectroot: true
paginatable: true
shorttitle: "PreviewDevice"
navigations:
    - title: "Repository"
      url: "https://github.com/urushiyama/YUPreviewDevice.framework"
twittercardtype: "summary"
catchcopy: "YUPreviewDevice.framework"
description: "SwiftUIのプレビューに，定義済みデバイスを追加します．"
---

YUPreviewDevice.frameworkは，SwiftUIのプレビューに，定義済みデバイスを追加します．

<!--more-->

[SwiftUI](https://developer.apple.com/xcode/swiftui/)は，ネイティブUIをつくるためのエレガントな方法のひとつです.
しかし，そのプレビュー機能は扱いづらいものです．
例えば特定のデバイスでのプレビューを見るためには，特定のデバイス名を一字一句正確に`View.previewDevice(_:)`にわたす必要があります．
"iPhone Xʀ"，"iPad Pro (12.9-inch) (2nd generation)"，"Apple Watch Series 4 - 40mm"など，どうやったら正確なデバイス名を覚えられるのでしょうか．

YUPreviewDevice.frameworkは，SwiftUIのプレビューに，定義済みデバイスを追加します．
このフレームワークを用いることにより，以下のように特定デバイスのプレビューを見ることができるようになります．
```swift
struct YourSwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    YourSwiftUIView()
      .previewDevice(PreviewDevice.iPhone_11_Pro_Max)
      .previewDisplayName(PreviewDevice.iPhone_11_Pro_Max.rawValue)
  }
}
```

あるいは，異なる画面の縦横比を持つiOSデバイスすべてのプレビューをかんたんに見ることもできます．
```swift
struct YourSwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    ForEach(PreviewDevice.Product.latest_iOS_devices_with_defferent_ratio) { device in
      YourSwiftUIView()
        .previewDevice(PreviewDevice(rawValue: device.name))
        .previewDisplayName(device.name)
    }
  }
}
```

## ライセンス

MITライセンスで公開しています．
詳細は[リポジトリ](https://github.com/urushiyama/YUPreviewDevice.framework)をご覧ください．
