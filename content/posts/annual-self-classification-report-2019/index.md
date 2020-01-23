---
title: "Annual Self-Classification Reportを提出した（2019年度）"
date: 2020-01-23T10:14:00+09:00
draft: false
paginatable: true
tags:
    - "アプリ開発"
    - "備忘録"
    - "Annual Self-Classification Report"
keywords:
    - "アプリ開発"
    - "Annual Self-Classification Report"
---

httpsをアプリで使っていると提出が求められるAnnual Self-Classification Reportを実際に提出したので，そのログを残しておく．

<!--more-->

{{% toc %}}

## 参考文献

- [ios - Annual Self-Classification Report - Stack Overflow](https://stackoverflow.com/questions/48462206/annual-self-classification-report)
- [アプリの公開に伴う年次自己番号分類報告の提出について – しろログ](https://blog.hakoniwa.net/archives/1537)

## 2020/01/23 提出

以下のようなメールを[BISとENC Encryption Request Coordinator](mailto:crypt-supp8@bis.doc.gov,enc@nsa.gov?subject=Annual%20Self-Classification%20Report%20Submission&body=Dear%20BIS%20%26%20ENC%20Encryption%20Request%20Coordinator%2C%0D%0A%0D%0AI%E2%80%99m%20a%20developer%20of%20apps%20available%20from%20%24%7BAPP_DISTRIBUTOR%7D%2C%20which%20use%20only%20https%20encryption.%0D%0AHence%20I%20want%20to%20submit%20the%20annual%20self-classification%20report.%0D%0APlease%20check%20and%20accept%20the%20attached%20CSV%20file.%0D%0A%0D%0ASincerely%20yours%2C%0D%0A%0D%0A%24%7BFULL_NAME%7D) 宛に送った．

```shell
Dear BIS & ENC Encryption Request Coordinator,

I’m a developer of apps available from Mac App Store, which use only https encryption.
Hence I want to submit the annual self-classification report.
Please check and accept the attached CSV file.

Sincerely yours,

${FULL_NAME}
```

また，添付ファイルとして以下のようなCSVファイルを送った．

```shell
PRODUCT NAME,MODEL NUMBER,MANUFACTURER,ECCN,AUTHORIZATION TYPE,ITEM TYPE,SUBMITTER NAME,TELEPHONE NUMBER,E-MAIL ADDRESS,MAILING ADDRESS, NON-U.S. COMPONENTS,NON-U.S. MANUFACTURING LOCATIONS
${APP_NAME},${APP_IDENTIFIER},SELF,5D992,MMKT,Mobility and mobile applications n.e.s.,${FULL_NAME},(+81)-${PHONE_NUMBER},${MAIL_ADDRESS},${ADDRESS},NO,${PREFECTURE} Japan
${ANOTHER_APP_NAME},${ANOTHER_APP_IDENTIFIER},SELF,5D992,MMKT,Mobility and mobile applications n.e.s.,${FULL_NAME},(+81)-${PHONE_NUMBER},${MAIL_ADDRESS},${ADDRESS},NO,${PREFECTURE} Japan
```

`${APP_IDENTIFIER}`にはApp Storeに登録する際のApp IDを記入した．
