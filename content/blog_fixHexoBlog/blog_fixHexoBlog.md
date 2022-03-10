---
emoji: 🏃
categories: etc
title: Hexo 블로그 오류 해결
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
cover:
description: 미래의 삽질 예방
---

# Hexo Blog Error 해결

## Category && tags 화면 렌더링 오류

```md
title: tags
type: "tags"
```

- source\tags\index.md에서 type: "tags" 또는 layout: tags를 추가한다.
- 헥소 블로그의 경우 카테고리와 태그 페이지를 직접 만드는데 **hexo new page tags** 명령어를 입력하여 index.md를 만들면 layout이나 type 옵션이 추가 되어 있지않다.
  - 페이지를 만들 때 scaffold 양식 그대로 만들기 때문이다
- category도 똑같은 방식대로 해결하면 된다

## Github 배포 안됨

- git 모듈이 설치가 안되어 있어서 그런 것이다. 그냥 설치하면 된다.

```shell
$ npm install --save hexo-deployer-git
```

## 이미지 렌더링 안될 때

* 로컬 서버에서는 이미지가 보이는데, 배포하면 이미지가 404 not found가 뜨는 오류가 있었다.
* 이미지 확장자를 대문자 JPG로 했었는데, jpg로 바꾸니까 오류 해결