---
title: "<Escape ME & Markdown>"
date: 2018-04-30T07:09:32+09:00
draft: false
tags:
    - "Hugo"
keywords:
    - "Hugo"
    - "エスケープ処理"
---

# \<Escape ME!\>

山カッコ (\<\>)，アンパサンド (\&)，クォーテーション (")，...HTMLの世界にはエスケープすべき文字があり，Hugoは何も指定がなければ自動的にこれらの文字をエスケープして出力する．エスケープしないことを明示するために`safeHTML`や`safeURL`といったフィルタが用意されているものの，実際にジェネレータがエスケープするかどうかは文脈から判断する仕様であり，Template埋め込み位置によって記述を変える必要があるので，わかりづらい．そこで，Hugoのエスケープ処理について調べてみた．

<!--more-->

{{% toc %}}

## safeHTMLは何をしているのか

Go言語は全くわからないが，[ここら辺](https://github.com/gohugoio/hugo/blob/914cc85e22af2e6c28f24a5fc70de94e4b9f1b1b/tpl/safe/safe.go#L37-L41)がsafeHTMLの本体なんじゃないかと予想する．この関数を見た限りでは，safeHOGEは入力文字列をHOGEの文法としてパース処理しているようにみえる．ということは，`{{ .Params.Hoge | safeURL | safeHTML }}`という記述は`.params.Hoge`をURL文法であるという宣言で囲み，それをさらにHTML文法であるという宣言で囲んでいることになる．

## 具体的にどうすべきか

```html
<meta property="og:title" content="{{ .Title }}">
<!-- or -->
<meta property="og:title" content="{{ .Title | .safeHTML }}">
```

この場合は前者の方が正しく山カッコ (\<\>)やアンパサンド (\&)を含む文字列を処理できる．

```html
<meta property="og:description" content="{{ .Summary }}">
<!-- or -->
<meta property="og:description" content="{{ .Summary | .safeHTML }}">
```

~~だが，こちらの場合は後者でないと山カッコ (\<\>)やアンパサンド (\&)がエスケープされてしまう．~~

と思っていたが，[metaタグのcontent内は`&amp;`実体参照で書くらしい](https://qiita.com/ituki_b/items/7041804eca8dfe663591)ので，前者の方が正しく処理できることになる．

まとめると，

1. 基本的にはフィルタなしでOK
1. URLをパラメータに放り込んで使うなら`safeURL`
1. HTMLタグを含む文字列をHTMLとして解釈させるなら`safeHTML`
1. ただしMarkdownファイルで山カッコ (\<\>)やアンパサンド (\&)は`\`でエスケープ

といったところだろうか．

## Blackfridayの功罪

HugoのMarkdownパーサであるBlackfridayも，意図しない文字を出力する原因になりうる．
Blackfridayはデフォルトで引用符や二重引用符を左右対応づけた文字に変換するのだが，このExtensionをdisableにする方法がわからなかった[^1]．文章中に`'`や`"`を表記する必要があるかと言われると微妙だが，わざわざインラインコードにする手間が発生するのも微妙である．
また，3連ドット(`...`)も三点リーダ(...)に変えてしまう．深く考えなくとも綺麗に整形してくれるという利点と，入力文字が意図せずに変換されてしまうという欠点がBlackfridayには同居しているように思える．

[^1]: [`smartypants`は無効化している](https://gohugo.io/getting-started/configuration/#blackfriday-options)のだが...
