---
emoji: 🏃
categories: sql
title: 없어진 기록 찾기 - 프로그래머스 SQL 고득점 KIT
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
description:
---
<!-- 
튜토리얼, 하우 투 가이드, 설명 ,레퍼런스 
https://documentation.divio.com/tutorials/
-->

# 없어진 기록 찾기

ANIMAL_INS 테이블은 동물 보호소에 들어온 동물의 정보를 담은 테이블입니다. ANIMAL_INS 테이블 구조는 다음과 같으며, ANIMAL_ID, ANIMAL_TYPE, DATETIME, INTAKE_CONDITION, NAME, SEX_UPON_INTAKE는 각각 동물의 아이디, 생물 종, 보호 시작일, 보호 시작 시 상태, 이름, 성별 및 중성화 여부를 나타냅니다.

ANIMAL_OUTS 테이블은 동물 보호소에서 입양 보낸 동물의 정보를 담은 테이블입니다. ANIMAL_OUTS 테이블 구조는 다음과 같으며, ANIMAL_ID, ANIMAL_TYPE, DATETIME, NAME, SEX_UPON_OUTCOME는 각각 동물의 아이디, 생물 종, 입양일, 이름, 성별 및 중성화 여부를 나타냅니다. ANIMAL_OUTS 테이블의 ANIMAL_ID는 ANIMAL_INS의 ANIMAL_ID의 외래 키입니다.

천재지변으로 인해 일부 데이터가 유실되었습니다. 입양을 간 기록은 있는데, 보호소에 들어온 기록이 없는 동물의 ID와 이름을 ID 순으로 조회하는 SQL문을 작성해주세요.

## 풀이

```SQL
SELECT OUTS.ANIMAL_ID,OUTS.NAME FROM ANIMAL_OUTS AS OUTS LEFT JOIN ANIMAL_INS AS INS ON OUTS.ANIMAL_ID = INS.ANIMAL_ID WHERE INS.ANIMAL_ID IS NULL ORDER BY OUTS.ANIMAL_ID
```

* 개념만 보다가 직접 풀려니까 애매한게 느껴졌다 공부가 더 필요하다

* LEFT JOIN

```SQL
SELECT * FROM ANIMAL_OUTS AS OUTS LEFT JOIN ANIMAL_INS AS INS ON OUTS.ANIMAL_ID = INS.ANIMAL_ID 
```

SQL 문을 위와 같이 작성해보자. JOIN 결과를 보면 ANIMAL_OUTS 테이블이 왼쪽, ANIMAL_INS가 오른쪽에 나오는걸 알 수 있다.

즉 LEFT JOIN은 SELECT ~ FROM [TABLE 이름] 일 때 먼저 나온 테이블 결과 값을 어느 쪽에 출력할 것이냐 정하는거다

* ON

JOIN을 사용하려면 무엇을 기준으로 조인할 것인지 정해야한다.

```SQL
ON OUTS.ANIMAL_ID = INS.ANIMAL_ID 
```

그래서 위의 SQL 문을 보면 ANIMAL_ID를 기준으로 조인한 것을 알 수 있다.