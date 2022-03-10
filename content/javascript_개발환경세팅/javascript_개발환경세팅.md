---
emoji: 🏃
categories: language
title: javascript 개발환경 세팅
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
subtitle: Vscode를 사용하자
---

# 응? 뜬금 javascript 하는거냐?

깊게 공부할 생각은 없고 그냥 코드를 읽으면 이렇게 돌아가는구나 자바스크립트는 이런 언어 이구나 알고 싶다. 그런것도 있고 자바 스크립트의 철학이라던가 워게임 할 때도 필요하고 하니 미리 조곰 해두려고 이 때 아니면 언제 해보냐?

# VScode에서 jscode 개발 환경 세팅

- liver server 설치
  - 파일 - 설정 - liveserver default 브라우저 크롬으로 변환
- html, js 파일 생성

  ```html
  <!DOCTYPE html>
  <html lang="en">
    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>Document</title>
    </head>
    <body>
      <script type="text/javascript" src="test.js"></script>
    </body>
  </html>
  ```

  - vscode에서 html 파일 생성 후 html:5 입력 후 엔터치면 디폴트 세팅을 해줌
  - 생성한 js파일을 소스로 받아오게 설정해주자

여기까지 하면 준비 끝! 그래서 테스트 삼아 실행을 해보았다

- liveserver 포트는 5500번으로 열었다

![image](https://user-images.githubusercontent.com/37897508/81424405-db5f5e80-9190-11ea-8f3e-c72bd784ce67.png)
![image](https://user-images.githubusercontent.com/37897508/81424421-e5815d00-9190-11ea-9bdb-dd26cbc1cbb7.png)
