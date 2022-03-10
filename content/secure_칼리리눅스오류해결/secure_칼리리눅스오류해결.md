---
emoji: 🏃
categories: secure
title: 칼리 리눅스 오류 해결
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
cover: 
description: ifconfig 실행 안됨
---

## ifconfig 실행 안되는 오류 해결 방법

![ipconfig](https://user-images.githubusercontent.com/37897508/86571785-f7bf2200-bfac-11ea-8460-635b42a8cdb2.png)

실습을 진행 중 IP를 확인하려 했는데 ifconfig를 쳤더니 커맨드를 찾을 수 없다고 나왔다. 그래서 내가 착각했나..? 싶어 ipcofnig까지 쳤는데 역시나 찾을 수 없다고 나온다

### 해결 방법

```shell
root@kali:/home/kali# ip a
```
위의 커맨드를 입력하면 IP를 확인할 수 있다 데이반 9 버전부터 ifconfig 커맨드가 실행되지 않는다고 한다. 

## command not found 오류

가끔 기본 커맨드임에도 불구하고 커맨드가 입력이 되지 않는 경우가 있다. command not found라고 쉘에 출력이되는데 이를 해결해보자

### 해결 방법

리눅스에서 커맨드를 실행 시키는 방법은 alias처럼 일종의 단축키를 저장해두고 불러오는 방식이다. command not found는 이 저장된 단축키를 불러오는 중 경로가 잘못된 경우 발생한다.

![캡처](https://user-images.githubusercontent.com/37897508/86774904-ec91f200-c091-11ea-8dc3-8b96c534bf70.JPG)

이제 문제를 해결해보자 vim이던 vi 던 편집기로 .bash_profile을 연 후 아래 경로로 수정한다.(아래 폴더들도 수정하면 된다)

* bashrc
* bash_profile

![command not found](https://user-images.githubusercontent.com/37897508/86774911-edc31f00-c091-11ea-8d0d-d195046fbd30.JPG)

그 후 soruce [file] 명령어를 실행 시켜야한다. source 커맨드는 shell bulit-in command이다.

```shell
$ source .bashrc
```