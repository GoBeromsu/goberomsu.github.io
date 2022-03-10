---
emoji: 🏃
categories: algorithm
title: 백준 15654 N과 M (5)
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
description:
---
<!-- 
튜토리얼, 하우 투 가이드, 설명 ,레퍼런스 
https://documentation.divio.com/tutorials/
-->

# 백준 15654 N과 M (5)

## 문제

N개의 자연수와 자연수 M이 주어졌을 때, 아래 조건을 만족하는 길이가 M인 수열을 모두 구하는 프로그램을 작성하시오. N개의 자연수는 모두 다른 수이다.

N개의 자연수 중에서 M개를 고른 수열

## 풀이

```python
import sys
from itertools import permutations
N,M=map(int,sys.stdin.readline().split())
numbers = list(map(int,sys.stdin.readline().split()))
numbers.sort()

for n in permutations(numbers, M):
    print(*n)
```