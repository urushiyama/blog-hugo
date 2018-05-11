---
title: "BibTeXの罠"
date: 2018-05-07T01:46:00+09:00
draft: false
tags:
    - "BibTeX"
    - "TeX"
keywords:
    - "BibTeX"
    - "順番"
---

# BibTeXの罠

BibTeX形式の引用は多くのデジタルライブラリで提供されており，サクッと引用をつけるのに便利である．しかし，使用するにあたってひとつハマった点がある．

## データ項目の記載の有無とデータ項目の表記順

そのハマった点というのは，書誌情報にデータ項目を記入するか否かでデータ項目の表記順が変わる点である．

<!--more-->

例えば，次のようなbibファイルを用意したとする．

```tex
@inproceeding {S18,
    author = {Smith, Jane},
    title = {A Title},
    booktitle = {Proceedings of the ~},
    series = {PROC '18},
    pages = {19--25},
    year = {2018},
    publisher = {PUB},
    location = {Tokyo, Japan}
}

@inproceeding {BWY17,
    author = {Baker, Tom and Watson, Dick and Yun, Harry},
    title = {Another Title},
    booktitle = {Proceedings of the ~},
    series = {PROC '17},
    pages = {203--211},
    year = {2017},
    publisher = {PUB},
}
```

この2本を引用すると，次のような引用リストが出力される．

[S18] Jane Smith. A Title. In Proceedings of the ~, PROC '18, pp. 19--25, Tokyo, Japan, **2018. PUB.**

[BWY17] Tom Baker, Dick Watson, and Harry Yun. Another Title. In Proceedings of the ~, PROC '17, pp. 203--211. **PUB, 2017.**

ここで各Referenceの最後を見ると，publisherとyearの表示される順番が入れ替わっている！

## 原因

[S18]には`location`のデータ項目が定義されている一方で，[BWY17]には`location`が定義されていないため．

## 対策

1. bstファイルをいい感じにつくる
    
    記述量もエラーの量も多くなりそうなので，私は2つ目の対策を取った．
    
1. 書誌情報のもつデータ項目の種類を揃える
    
    単純にデータ項目の種類を揃えることで，文献ごとにデータ項目の表記順が揺れることは回避できる．
