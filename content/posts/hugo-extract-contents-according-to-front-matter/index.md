---
title: "Front Matterに基づいてHugoのコンテンツ（ページ）を抽出する"
date: 2019-03-30T21:10:01+09:00
draft: false
tags:
    - "Hugo"
keywords:
    - "hugo"
    - "リストアップ"
    - "パターンマッチ"
---

先日Webページの論文リストを更新し，「査読付き/査読なし」，「国際/国内」，といったカテゴリ別に分けてリスト表示する機能を追加した．
その際に，各ページのFront Matterに記載したカテゴリ情報をもとにページを抽出する方法を見つけたので，備忘録を残しておく．

<!--more-->

{{% toc %}}

## 前提

- Hugo v0.54.0

また，各ページの[Front Matter](https://gohugo.io/content-management/front-matter/)に以下のようなカテゴリ情報を示すArrayを記入していることとする：
```yaml
categories:
- "non-archival"
- "international"
- "conference"
- "poster"
- "peer-reviewed"
```

上記例はyamlの記述だが，yamlでなくとも，Front MatterとしてArrayをパラメータ指定してあれば問題ない．

## Case 1: ある1つのカテゴリ情報をもつページを抽出

例えば，"poster"というカテゴリ情報をもつページを抽出するには，以下の`where`文を用いれば良い：
```go
{{ where .Data.Pages ".Params.categories" "intersect" (slice "poster") }}
```

`.Data.Pages`でサイト上の全ページ情報を抽出元として，`".Params.categories"`でFront Matter上に記載したパラメータ中の`categories`を検索対象として指定している．

抽象化すると次の通り：
```go
{{ where <抽出元> ".Params.<カテゴリ情報を示すArray名>" "intersect" (slice "<抽出するカテゴリ情報>") }}
```

## Case 2: 複数のカテゴリ情報を**すべて**有するページを抽出

例えば，"international"と"poster"という2つのカテゴリ情報をすべてもつページを抽出するには，以下の`where`文を用いれば良い：
```go
{{ where .Data.Pages ".Params.categories" "intersect" (slice "poster") | intersect (where .Data.Pages ".Params.categories" "intersect" (slice "international")) }}
```

また，"peer-reviewed"，"international"，"poster"という3つのカテゴリ情報をすべてもつページを抽出する方法は次の通り：
```go
{{ where .Data.Pages ".Params.categories" "intersect" (slice "poster") | intersect (where .Data.Pages ".Params.categories" "intersect" (slice "international")) | intersect (where .Data.Pages ".Params.categories" "intersect" (slice "peer-reviewed")) }}
```

以降，複数のカテゴリ情報をすべてもつページを抽出するには，後ろに`| intersect ...`を順次追加すればよい．

```go
{{ where <抽出元> ".Params.<カテゴリ情報を示すArray名>" "intersect" (slice "<カテゴリ情報1>") | intersect (where <抽出元> ".Params.<カテゴリ情報を示すArray名>" "intersect" (slice "<カテゴリ情報2>")) | intersect (where <抽出元> ".Params.<カテゴリ情報を示すArray名>" "intersect" (slice "<カテゴリ情報3>")) | intersect (where <抽出元> ".Params.<カテゴリ情報を示すArray名>" "intersect" (slice "<カテゴリ情報3>")) [| intersect...] }}
```

## Case 3: 複数のカテゴリ情報を**いずれか1つ以上**有するページを抽出

Case 2をもとにナイーブに実装するならば，Case 2の`| intersect`を`| union`に変えるだけで良い．
例えば，"international"と"poster"という2つのカテゴリ情報のうちいずれかをもつページを抽出するには，以下の`where`文を用いれば良い：
```go
{{ where .Data.Pages ".Params.categories" "intersect" (slice "poster") | union (where .Data.Pages ".Params.categories" "intersect" (slice "international")) }}
```

ただし，もっと短く実装することができる：
```go
{{ where .Data.Pages ".Params.categories" "intersect" (slice "poster", "international") }}
```

3つ以上のうちいずれか1つ以上をもつページを抽出するには，順次`slice`の引数として追加すれば良い．

```go
{{ where <抽出元> ".Params.<カテゴリ情報を示すArray名>" "intersect" (slice "<カテゴリ情報1>", "<カテゴリ情報2>", "<カテゴリ情報3>" [, "<カテゴリ情報4>"...]) }}
```
