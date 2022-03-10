---
emoji: 🏃
categories: algorithm
title: 백준 2407 조합
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
description:
---
<!-- 
튜토리얼, 하우 투 가이드, 설명 ,레퍼런스 
https://documentation.divio.com/tutorials/
-->

# 백준 2407 조합

## 문제

nCm을 출력한다.

## 풀이

```python
import sys
from itertools import combinations

n,m = map(int,sys.stdin.readline().split())
numbers=[0 for i in range(101)]
numbers[1],numbers[2]=1,2
for i in range(3,n+1):
    numbers[i]=numbers[i-1]*i

print(numbers[n]//(numbers[m]*numbers[n-m]))
```