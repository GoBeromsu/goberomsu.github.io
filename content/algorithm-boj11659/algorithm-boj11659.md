---
title: 백준 11659 구간 합 구하기 4
categories: algorithm
emoji: 🏃
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
---
<!-- 
튜토리얼, 하우 투 가이드, 설명 ,레퍼런스 
https://documentation.divio.com/tutorials/
-->

# 백준 11659 구간 합 구하기 4

## 문제

수 N개가 주어졌을 때, i번째 수부터 j번째 수까지 합을 구하는 프로그램을 작성하시오.

## 풀이

```python
import sys

n,m = map(int,sys.stdin.readline().split())
numbers = list(map(int,sys.stdin.readline().split()))
sums = [0,numbers[0]]

for num in range(2,len(numbers)+1):
    sums.append(sums[num-1]+numbers[num-1])

for i in range(m):
    start,end=map(int,sys.stdin.readline().split())
    print(sums[end]-sums[start-1])
```

간단한 문제인데, 계속 시간 초과가 나왔었다.
구간 합을 구할 때마다 계속 반복되는 연산이 많아 그런거라, 합을 미리 구해 빼서 해결하였다