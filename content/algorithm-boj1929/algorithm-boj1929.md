---
emoji: 🏃
categories: algorithm
title: 백준 1929 소수 구하기
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
description:
---
<!-- 
튜토리얼, 하우 투 가이드, 설명 ,레퍼런스 
https://documentation.divio.com/tutorials/
-->

# 백준 1929 소수 구하기
## 문제
M이상 N이하의 소수를 모두 출력하는 프로그램을 작성하시오.
## 풀이

* N이하의 소수들을 모두 구한 후 M과 N 사이의 소수를 출력한다

## CODE

```
import sys
M,N = map(int, sys.stdin.readline().split())
arr = [False,False] + [True] * (N-1)
for i in range(2,N+1):
    for j in range(2*i,N+1,i):
        arr[j] = False
for i in range(M,N+1):
    if arr[i] == True:
        print(i)
```