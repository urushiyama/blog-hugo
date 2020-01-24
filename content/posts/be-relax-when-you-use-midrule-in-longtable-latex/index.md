---
title: "LaTeXのlongtable環境内でmidruleを使うときにはrelaxしよう"
date: 2020-01-24T13:50:00+09:00
draft: false
paginatable: true
tags:
    - "LaTeX"
    - "備忘録"
    - "longtable"
    - "booktabs"
keywords:
    - "LaTeX"
    - "longtable"
    - "booktabs"
    - "midrule"
    - "relax"
---

結論から先に述べると，longtable環境内でmidruleを使うときには`\midrule\relax`とすべき．

<!--more-->

{{% toc %}}

## 参考文献

- [booktabs - "Undefined control sequence" on left parenthesis after midrule in longtable - TeX - LaTeX Stack Exchange](https://tex.stackexchange.com/questions/228755/undefined-control-sequence-on-left-parenthesis-after-midrule-in-longtable)
- [CTAN: Package booktabs](https://www.ctan.org/pkg/booktabs)

## きっかけ

TA業務のためにJupyter NotebookファイルのPDF変換スクリプトを`nbconvert`コマンドを利用する形で書いているのだが，中間出力のLaTeXファイルのタイプセットがエラーになる事例があった．
"Undefined control sequence"エラーが発生しており，エラー箇所は下記の3行目であった．

```latex
\begin{longtable}[]{@{}ll@{}}
\toprule
(a) & (b) \tabularnewline
\midrule
% :
% :
\end
```

## 原因と対策

[参考文献](#参考文献)のStack Overflowによると，`booktabs`パッケージが丸括弧をオプションの指定に用いているため，表の中身に丸括弧が含まれると上記エラーを吐く,
とのことだった．
CTANにて`booktabs`パッケージのドキュメントを確認したところ，`\cmidrule`のオプション指定に丸括弧を用いていることがわかった．
`\toprule`や`\midrule`にはオプション指定のために丸括弧を用いていないが，何かしら実装に問題があるのだろう．

「表の中には丸括弧を使わない」とすれば全く問題ないものの，Jupyter Notebookファイルを作成するのはTAがやることではなく，教員がテンプレートを作成して受講生が記入するので，記述方法を矯正することは困難である．
そこで，[参考文献](#参考文献)のStack Overflowにならい，`nbconvert`コマンドが出力するLaTeXファイルを`sed`のパイプを通して修正することにした．

```shell
nbconvert ... \
    | sed -e 's/\\toprule/\\toprule\relax/g' \
    | sed -e 's/\\midrule/\\midrule\relax/g'
```

具体的には，`\toprule`および`\midrule`のあとに続けて`\relax`をつけることにより，`booktabs`パッケージの丸括弧を定義する環境から続く表の中身を切り離している．

```latex
\begin{longtable}[]{@{}ll@{}}
\toprule\relax
(a) & (b) \tabularnewline
\midrule\relax
% :
% :
\end
```

## あとがき

`nbconvert`コマンドはPandocを介して変換しているので，Pandocでも同様の問題が発生する可能性がある．
