---
emoji: 🏃
categories: sql
title : 프로그래머스 고득점 KIT 중복 제거하기
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
description:
---
<!-- 
튜토리얼, 하우 투 가이드, 설명 ,레퍼런스 
https://documentation.divio.com/tutorials/
-->

# 프로그래머스 고득점 KIT 중복 제거하기

## 문제

동물 보호소에 들어온 동물의 이름은 몇 개인지 조회하는 SQL 문을 작성해주세요. 이때 이름이 NULL인 경우는 집계하지 않으며 중복되는 이름은 하나로 칩니다.

## 풀이

```SQL
SELECT COUNT(DISTINCT NAME) FROM ANIMAL_INS WHERE NAME IS NOT NULL
```

DISTINCT를 사용하면 오류가 떠서 뭔가 했는데, COUNT() 내에 사용해야했었다.