---
emoji: 🏃
categories: etc
title: Hexo Blog 초기 설정하는 방법
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
  - git
cover:
description: 포스트 저장 레퍼지터리, 하드링크 생성
---

## 포스트 저장 레포지터리

Hexo 블로그는 generate 과정에서 생성된 Public 폴더 내용들을 깃허브 레퍼지터리에 뿌려 웹사이트를 생성한다

나머지 파일들은 따로 백업을 해야하는데 나 같은 경우 처음에는 onedrive를 작업환경에 동기화해서 사용했었다. 하지만 블로그를 빌딩할 때마다 함께 시작하는 노트북의 비행기 소리가 시끄러워 github에 레퍼지터리를 따로 파기로 했다.

블로그 배포를 할 때 hexo-deployer-git을 사용하는데 그래선지 따로 작업 폴더에는 git이 없어서 submodule 필요 없이 레퍼지터리를 새로 생성했다.

### remote repo 가져오기

```git
$ git init
$ git remote add origin main [github repository 주소]
```

### gitignore 파일 수정

onedrive를 사용했을 당시 비행기 소리의 원인은 내가 nodemodule을 포함한 작업 폴더 전체를 백업했기 때문이다. 같은 실수를 반복하지 않기 위해 gitignore 설정을 한다

```git
# I don't want this
*.json

.deploy_git/
.github/
themes/
node_modules/
```

- \*.json 같은 경우 루트 디렉터리(gitigonore 파일이 위치한 장소)에서 json 포맷을 add 하지 않겠다는 소리
- themes/ 는 디렉터리 themes 하위 어떤 내용도 add 하지 않겠다는 내용이다

수정을 마쳤다면 커밋하고 푸시까지 해주면 끝이다!

## \_config.yml 하드링크 생성

hexo 블로그의 경우 config.yml 파일로 웹 페이지 전체적인 세팅을 한다. \_config.yml 파일은 루트 디렉터리와 다운 받은 테마에서 볼 수 있다.

npm을 통해 테마를 다운로드 받은 경우 nodemodule의 하위 디렉터리에 테마가 저장된다. 즉 다운로드 받은 테마의 config 파일을 수정하려면 구석에 숨은 디렉터리를 직접 찾아가야한다.

처음엔 직접 찾아갔는데 귀찮기도하고 나중에 블로그 갈아엎을 때를 대비해서 블로그 루트 디렉터리에 하드링크를 생성하기로 했다.

```shell
$ ln node_modules/hexo-theme-butterfly/_config.yml butterfly_config.yml
```

위의 커맨드를 입력하면 루트 디렉터리에 butterfly_config.yml 파일이 생성된 걸 알 수 있다.

## deploy 및 push script 작성

배포 저장소와 포스트 저장소가 다르니 저장할 때 마다 번거러움이 있어 script를 만들었다. 윈도우 환경에서 git bash를 사용해 shell script를 돌릴 수 있었다.

### autoPush.sh 생성 및 alias 등록

```shell
$ cd D:\MyBlog
$ git add *
$ echo "Pleas Type Commit Message!!"
$ read commitMsg
$ git commit -m "$commitMsg"
$ git push
$ hexo deploy -g
```

autoPush.sh 내용은 위와 같다. 블로그의 루트 디렉터리로 이동 후 커밋 메시지를 받고 푸시 후 배포하는 스크립트이다

이젠 sh 명령어로 git bash 쉘에서 스크립트를 실행할 수 있다.

```shell
$ sh autoPush.sh
```

하지만 저것도 귀찮으니 alias에 등록한다

```shell
$ alias aPush="sh autoPush.sh"
```

이젠 aPush 커맨드만 입력하면 배포까지 한 번에 할 수 있다.
