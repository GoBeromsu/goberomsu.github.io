---
emoji: 🏃
categories: secure
title: "칼리 리눅스 설치 및 초기 세팅"
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
excerpt: "시작은 어렵지 않지 그럼그럼"

cover: 
---

# Setting

## 실습 환경

- Window 10
- Kali-2018.2 version
  - RAM : 8GB
  - HardDisk : 80GB
- VM Wokrstation Pro

## 시작 전 이건 알고 가자

### Kali-linux란 무엇인가

[^1]: 데비안은 free OS,안정성과 보안 중점 OS
[^2]: 12학번 선배에게 들으니 본인은 백트랙으로 실습했다 하더라

- 데비안 계열 Linux[^1]
- 모의 해킹 툴
  - OS를 설치하면 해킹 툴들과 사용법이 나와있음
  - 공식 홈페이지에서 무료로 다운로드 가능
  - 백트랙의 후속 버전[^2]

### 설치 과정 중 에러

#### ~ can be run after disabling Device/Creditial Guard Error

![Error Message](https://user-images.githubusercontent.com/37897508/80946668-82f32e80-8e29-11ea-878f-e3419f0154df.PNG)

일종의 방화벽이 걸려있어서 생기는 에러이다. 나같은 경우 VM Workstation을 사용하는데 윈도우 자체에서 지원하는 VM 매니저가 이미 설치되어 있어서 오류가 뜨는거라 추측한다

[^3]: 하이퍼 바이저는 윈도우 VM 매니저이다.

- 해결법
  - 가상화 보안 해제
    1. gpedit 실행
    2. 컴퓨터 구성 -> 관리 템플릿 -> 시스템 -> Device Guard 접속
    3. "가상화 기반 보안 켜기"를 "사용 안 함"으로 설정
  - 하이퍼 바이저 해제[^3]
    1. 제어판 - 프로그램 - windows 기능 켜기/끄기 - Hyper-V접근
    2. Hyper-V 체크 해제

#### 한글 입력이 안될 때

- 지역 및 언어 - 입력 소스 설정 - 나사모양 - 변환 key 설정
  ![설정](https://user-images.githubusercontent.com/37897508/81172174-b88a4a00-8fd8-11ea-954f-efefd80a2113.png)

- 터미널에서 하는법

```
$ apt-get install fcitx-hangul
$ apt-get install fcitx-lib*
$ apt-get install fonts-nanum*
$ init 6
```

- 위의 커맨드를 모두 입력했다면 입력기에서 설정해야한다
  - 입력기 설정 창 커맨드는 im-config
  - 입력기 설정에서 기본 입력기를 fctix로 설정
  - fcitx-config-gtk3 입력 후 한글 추가 및 전환 키 입력

### ETC

- 칼리 처음 실행하면 잠겨 있음
  - 2018 버전
    - ID : root
    - PWD : toor
  - 2020 버전
    - ID/PWD : kali
- VM에서 마우스 포인터 탈출하기
  - ctrl + alt 누르면 된다
