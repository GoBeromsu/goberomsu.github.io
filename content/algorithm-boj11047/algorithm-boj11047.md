---
title: 백준 11047 동전 0
categories: algorithm
emoji: 🏃
author: 범수D
date: '2022-03-10 18:00:00'
tags: 블로그
---
<!-- 
튜토리얼, 하우 투 가이드, 설명 ,레퍼런스 
https://documentation.divio.com/tutorials/
-->

# 동전 0

## 문제
준규가 가지고 있는 동전은 총 N종류이고, 각각의 동전을 매우 많이 가지고 있다.

동전을 적절히 사용해서 그 가치의 합을 K로 만들려고 한다. 이때 필요한 동전 개수의 최솟값을 구하는 프로그램을 작성하시오.


## 풀이

```python
import sys

n,k = map(int,sys.stdin.readline().split())
coins=[int(sys.stdin.readline()) for i in range(n)]
cnt=0


for i in range(n-1,-1,-1):
    if k==0:
        break
    if coins[i]>k:
        continue
    cnt+=k//coins[i]
    k%=coins[i]
print(cnt)
```