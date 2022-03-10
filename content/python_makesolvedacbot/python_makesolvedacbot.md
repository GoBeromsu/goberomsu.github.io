---
emoji: 🏃
categories: language
title: python_MakesolvedAcBot
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
description:
---
<!-- 
튜토리얼, 하우 투 가이드, 설명 ,레퍼런스 
https://documentation.divio.com/tutorials/
-->

## Solved ac slack bot 만들기

하루에 한 번 내가 그 날 푼 문제들을 알려주는 봇

내가 푼 문제들을 저장한 후 다음 날과 비교하여 달라졌으면 출력

* 서버에서 푼 문제들을 받아와서 가공할 것
* 문제 정보 
  * 번호
  * 이름

문제 정보를 받아와서 dictionary에 저장
    * key : 문제 번호
    * value : 문제 이름 
  
### 데이터

### mazassumnida 분석

## What is github action

* github 자체 CI/CD 플랫폼
* Package Registry 저장소
  * 소스코드를 빌드하고 난 artifact들을 저장하고 관리 배포함
* 사용 신청을 해야함
* 리눅스, macOs, 윈도우 플랫 폼 제공
* 병렬로 워크플로우 실행 가능(MATRIX)

### WorkFlow

자동화된 전체 프로세스를 나타낸 순서도
workflow file을 전달하면 github actions가 실행

### Job

여러 step을 그룹 지어주는 역할, 단일한 가상환경 제공
각 잡끼리 서로 다른 가상 환경 부여 가능
잡끼리 디펜던시를 설정, 병렬 실행 가능

* step 
  * job 안에서 순차적으로 실행되는 프로세스 단위
  * 파일 시스템을 통하여 서로 정보를 공유할 수 있음
  * 명령을 내리거나 action 실행 가능

### Action

* 단순히 os에서 지원하는 명령 뿐만 아니라 미리 제공된 action 또는 사용자가 커스텀한 액션을 호출하는 매커니즘

* 도커 컨테이너나 자바스크립트를 통해서 실행됨

### Event

정의한 workflow를 언제 실행시킬 것인가

## 깃허브 액션 어떡할래?

[이 글](https://jonnung.dev/devops/2020/01/31/github_action_getting_started/)을 보면 이전 스텝의 결과 값을 매개변수로 받을 수 있음

1. 어제까지 푼 문제 목록들을 저장소에 저장
   1. 레퍼지터리 파일을 참조 가능
      1. 레퍼지터리를 루트로해서 그냥 가져옴
   2. 액션 내에서 파일을 저장소에 저장 가능
2. 오늘까지 푼 문제들과 비교
3. 비교해서 추가된 문제들을 반환 받음
4. 오늘까지 푼 문제들은 다시 저장 
5. 슬랙으로 메시지 보냄