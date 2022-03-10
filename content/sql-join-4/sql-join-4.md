---
emoji: 🏃
categories: sql
title: 중성화 여부 파악하기 - 프로그래머스 SQL 고득점 KIT
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
description:
---
<!-- 
튜토리얼, 하우 투 가이드, 설명 ,레퍼런스 
https://documentation.divio.com/tutorials/
-->

# 중성화 여부 파악하기

## 문제

ANIMAL_INS 테이블은 동물 보호소에 들어온 동물의 정보를 담은 테이블입니다. ANIMAL_INS 테이블 구조는 다음과 같으며, ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE는 각각 동물의 아이디, 생물 종, 보호 시작일, 보호 시작 시 상태, 이름, 성별 및 중성화 여부를 나타냅니다.

보호소의 동물이 중성화되었는지 아닌지 파악하려 합니다. 중성화된 동물은 SEX_UPON_INTAKE 컬럼에 'Neutered' 또는 'Spayed'라는 단어가 들어있습니다. 동물의 아이디와 이름, 중성화 여부를 아이디 순으로 조회하는 SQL문을 작성해주세요. 이때 중성화가 되어있다면 'O', 아니라면 'X'라고 표시해주세요.

## 풀이

```SQL
SELECT ANIMAL_ID,NAME,CASE WHEN(SEX_UPON_INTAKE LIKE '%NEUTERED%' OR SEX_UPON_INTAKE LIKE '%SPAYED%') THEN 'O' ELSE 'X' END AS 중성화 FROM ANIMAL_INS ORDER BY ANIMAL_ID
```

* 조건문을 사용할 줄 알아야한다.

조건문은 SQL에서 2 가지가 있다. (CASE 와 If )
(나중에 공부하다 배우면 더 기술하겠음)

CASE의 경우 아래와 같은 형식으로 사용한다.
WHEN을 여러 개 사용해서 다중 조건문으로도 사용할 수 있다.

```SQL
CASE WHEN 조건문 THEN 참인 경우의 값 ELSE 거짓인 경우의 값 END 컬럼 명
```

If 문은 아래와 같다

```if
IF (조건문) 참일 경우의 값 ELSE 거짓일 경우의 값 END 컬럼명
```