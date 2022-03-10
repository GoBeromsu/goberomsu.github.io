---
emoji: 🏃
categories: etc
title: "헥소 블로그로 가쟈!"
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
excerpt: "시작은 어렵지 않지 그럼그럼"


cover: https://user-images.githubusercontent.com/37897508/80951264-89d26f00-8e32-11ea-80c2-778d62c7b217.PNG
---

# 왜 Hexo로 가는거야?

Jekyll이 확실히 편하긴한데 몬가 로컬에서 실행시킬 때도 그렇고 빌드업 시간이 늘어나는게 맘에 걸려서 이유를 찾다보니 그냥 hexo로 옮기면 되겠다 싶었다. hexo가 속도는 확실히 빠르기도 하고 Node.js 기반이라 겸사겸사 공부도 할 수 있을거 같아서도 큰 이유 중 하나이다.

# Get it start Hexo Blog

## Setting

### 필수 설치 사항

- Node.js
- Git
- Hexo 설치
  ```
  $ npm install -g hexo-cli
  ```

### 블로그 초기 세팅

- 주의 사항
  - hexo는 github repo에 jekyll처럼 코드를 올리지 않아요.
    - 때문에 repo에는 생성된 페이지만 올라갑니다
    - hexo deploy하면 알아서 배포 해줍니다
    - 모르고 push하면 충돌 일어납니다(경험담..)
    - backup 걱정이 그래서 생기는데 google에 git submodule 검색하면 해결책이 나옵니다
      - 저는 그냥 cloud에 올려버리고 거기서 실행하고 있습니다(편안)

1. Hexo 블로그 초기화 및 필요 라이브러리 설치

```
$ hexo init <folder>
$ cd <folder>
$ npm install
```

2. Theme 설치

- 마음에 드는 테마를 고른 후 themes 폴더에 넣습니다

```
$ cd folder
$ git clone <theme의 git url> thems\<name>
```

- config.yml에서 원하는 테마로 바꿉니다
  - default는 아마 landscape 테마 일거에요

3. Hexo Blog 배포

- 아래 커맨드는 배포 및 로컬에서 블로그를 실행하는 명령어 입니다

```
$ hexo deploy --g && hexo server
```

### 블로그 꾸미기

hexo가 중국인 개발자가 만들어서 docs가 중국어가 많다고 하는데 영어로 번역해서 보니까 그냥저냥 할만합니다. 그리고 docs가 되게 자세히 나와있어 조곰씩 보면서 하면 금방 할 수 있어요 jekyll 보다 구조가 단순한거 같습니다. 제가 쓰는 테마는 [butterfly](https://github.com/jerryc127/hexo-theme-butterfly) 입니다.

- 제가 쓰는 테마 기준으로 설명할게요 하지만 큰 틀은 같으니 걱정 안하셔도 됩니다

- butterfly theme
  - pc 와 mobile에서 접근할 때 동적으로 화면이 조절이 되서 요걸로 했습니다.
  - 카테고리 정리도 편합니다
  - document가 자세히 나와 금방 따라할 수 있습니다
- theme/butterfly/config.yml 수정
  - 각각의 옵션 마다 주석이 달려 있습니다
- hexo에서 각주 쓰기
  - 각주를 지원 안해서 따로 설치 해야합니다
  ```
  $ npm un hexo-renderer-marked --save
  $ npm i hexo-renderer-markdown-it --save
  ```
  - root 디렉터리의 config.yml에 아래 코드를 넣습니다
  ```
  markdown:
  render:
    html: true
    xhtmlOut: false
    breaks: true
    linkify: true
    typographer: true
    quotes: '“”‘’'
  plugins:
    - markdown-it-abbr
    - markdown-it-footnote
    - markdown-it-ins
    - markdown-it-sub
    - markdown-it-sup
  anchors:
    level: 2
    collisionSuffix: 'v'
    permalink: true
    permalinkClass: header-anchor
    permalinkSymbol: ¶
  ```
- hexo 블로그 이미지 올리기
  - hexo의 경우 /img/<이미지> 식으로 더 짧고 간단하게 이미지에 접근 할 수 있습니다
  - 하지만 thumnail, background, post에 들어갈 이미지가 가끔 적용이 안될 때가 있습니다
  - github repo - issues 에 이미지를 올리고 링크를 따와서 붙여넣기 하면 됩니다
  - google drive에서도 해봤는데 되긴 되는데 로딩 속도가 깃허브가 더 빠릅니다
    - 이게 나름 응급책이긴한데 링크에서 이미지 값을 받아오는 거라 로딩 시간이 맘에 안듭니다
    - 아직 왜 가끔 이미지가 안올라가는지 이유를 못찾아서 이렇게 합는 중입니다

## Hexo 명령어

- hexo clean
  - 기존의 캐시들을 지워버립니다
  - 가끔 렌더링 하다가 오류 발생할 때 사용함
- hexo generate
  - 블로그 페이지를 생성합니다
- hexo deploy
  - 블로그 페이지를 배포합니다
- hexo server
  - 로컬에서 hexo 블로그를 실행시킵니다
  - default port는 4000입니다
  - -p 옵션으로 포트를 조정할 수 있습니다
- hexo list [post|category|route|page]
  - 선택한 인자들의 정보를 출력한다