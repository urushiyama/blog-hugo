---
title: "PreviewDevice"
date: 2020-01-16T05:10:00+09:00
draft: false
tags:
    - "Library / Framework"
    - "Swift"
keywords:
    - "Library"
    - "SwiftUI"
    - "OSS"
    - "Framework"
    - "live preview"
    - "predefined devices"
projectroot: true
paginatable: true
shorttitle: "PreviewDevice"
navigations:
    - title: "Repository"
      url: "https://github.com/urushiyama/YUPreviewDevice.framework"
twittercardtype: "summary"
catchcopy: "YUPreviewDevice.framework"
description: "Add pre-defined preview devices for SwiftUI."
---

YUPreviewDevice.framework adds pre-defined preview devices for SwiftUI.

<!--more-->

[SwiftUI](https://developer.apple.com/xcode/swiftui/) is the one of elegant ways for building native UI.
However, its preview is totally messy.
To show preview on a specific device, you need to exactly type a specific name such as "iPhone Xʀ", "iPad Pro (12.9-inch) (2nd generation)" or "Apple Watch Series 4 - 40mm" in `View.previewDevice(_:)`.
How can we remember the exact name?

YUPreviewDevice.framework adds pre-defined preview devices for SwiftUI.
Using this framework, you can easily preview your app on a specific device:
```swift
struct YourSwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    YourSwiftUIView()
      .previewDevice(PreviewDevice.iPhone_11_Pro_Max)
      .previewDisplayName(PreviewDevice.iPhone_11_Pro_Max.rawValue)
  }
}
```

You can also easily preview your app on multiple iOS devices with different ratio:
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

## License

This framework is published under MIT License.
For further info, please see [the repository](https://github.com/urushiyama/YUPreviewDevice.framework).
