---
emoji: 🏃
categories: 블로그
title: bubbleSort
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
description:
---
<!-- 
튜토리얼, 하우 투 가이드, 설명 ,레퍼런스 
https://documentation.divio.com/tutorials/
-->

아이디어는 옆에 있는 값과 비교해서 더 작은 값을 앞으로 보내면 어떨까?

n 개의 수를 정렬한다면, 첫 번째는 n 번 째까지 비교하고 두 번째는 n-1 번째까지 비교한다.
이를 반복 한다면 n, n-1, n-2 ... 1 번 비교

버블 정렬의 시간 복잡도는 O(N^2)이다

선택 정렬보다 더 시간이 오래 걸리는 이유는 비교 연산을 계속 실행하기 때문이다