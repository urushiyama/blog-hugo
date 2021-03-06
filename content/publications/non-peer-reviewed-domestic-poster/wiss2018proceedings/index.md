---
title: "指の軌跡に基づく手元の視認が不要なスマートフォン向けかな文字入力手法（WISS2018）"
date: 2018-09-27T00:00:00+09:00
draft: false
paginatable: true
url_pdf: https://www.wiss.org/WISS2018Proceedings/demo/1-A07.pdf
# url_doi: /#
url_bib: https://urushiyama.github.io/publications/non-peer-reviewed-domestic-poster/wiss2018proceedings/assets/urushiyamaWISS2018demo.bib
# url_project: /#
# url_repo: /#
authors:
    - "漆山裕太"
    - "中村拓人"
    - "志築文太郎"
publisher:
    name: "日本ソフトウェア科学会"
    id: "https://www.jssst.or.jp/"
reference: <u>漆山裕太</u>，中村拓人，志築文太郎．指の軌跡に基づく手元の視認が不要なスマートフォン向けかな文字入力手法．第26回インタラクティブシステムとソフトウェアに関するワークショップ（WISS2018），日本ソフトウェア科学会，2018年9月，2 pages．
tags:
    - "WISS"
    - "ワークショップ"
keywords:
    - "WISS 2018"
    - "デモ発表"
categories:
    - "non-peer-reviewed"
    - "domestic"
    - "archival"
    - "poster"
ogimage: "img/figure1.jpg"
---

## 概要

手元を見ずにスマートフォンによる文字入力が行えれば，ユーザは歩行中あるいは会話中にスマートフォンにてメモを取ることができる．しかし，視覚以外の感覚によりタッチ位置をタッチ前に知覚することは困難であるため，キーを視認する必要がある．
我々は文字入力時に手元の視認が不要な，指の軌跡に基づくスマートフォン向けのかな文字入力手法を提案する．
提案手法は，タッチ位置を基点とする円形領域および外側の上下左右4方向の領域を指が一筆書きにて通過する順序に基づいて，文字の子音および母音を決定するため，正確さの粗いタッチ操作に対して堅牢な文字入力が期待される．

<!--more-->

![子音選択の様子．a：ハ行の選択．b：バ行の選択．c：パ行の選択．](img/figure1.jpg)

![子音選択に続く母音選択の様子．a：カ行の選択．b：aに続きア段の選択．c：aに続きイ段の選択．](img/figure2.jpg)

![子音および母音すべてに対応する指の軌跡の略図．a：子音に対応する軌跡．b：母音に対応する軌跡．](img/figure3.jpg)
