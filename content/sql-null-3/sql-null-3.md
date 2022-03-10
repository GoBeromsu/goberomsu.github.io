---
emoji: 🏃
categories: sql
title: NULL 처리하기 - 프로그래머스 SQL 고득점 KIT
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
description:
---
<!-- 
튜토리얼, 하우 투 가이드, 설명 ,레퍼런스 
https://documentation.divio.com/tutorials/
-->

# NULL 처리하기

입양 게시판에 동물 정보를 게시하려 합니다. 동물의 생물 종, 이름, 성별 및 중성화 여부를 아이디 순으로 조회하는 SQL문을 작성해주세요. 이때 프로그래밍을 모르는 사람들은 NULL이라는 기호를 모르기 때문에, 이름이 없는 동물의 이름은 "No name"으로 표시해 주세요.

위 문제의 핵심은 NULL 값일 때 속성 NAME의 NULL을 "No name"으로 바꾸는 것이다.

## 풀이

```sql
SELECT ANIMAL_TYPE,IFNULL(NAME,'No name'),SEX_UPON_INTAKE FROM ANIMAL_INS ORDER BY ANIMAL_ID
```

MYSQL에서는 IFNULL(속성,'치환 값') 형식으로 NULL 값일 때 값을 치환 할 수 있다.
