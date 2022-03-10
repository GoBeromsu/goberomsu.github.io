---
emoji: 🏃
categories: algorithm
title: 백준 18870 좌표 압축
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
description:
---
<!-- 
튜토리얼, 하우 투 가이드, 설명 ,레퍼런스 
https://documentation.divio.com/tutorials/
-->

# 백준 18870 좌표 압축

## 문제

수직선 위에 N개의 좌표 X1, X2, ..., XN이 있다. 이 좌표에 좌표 압축을 적용하려고 한다.

Xi를 좌표 압축한 결과 X'i의 값은 Xi > Xj를 만족하는 서로 다른 좌표의 개수와 같아야 한다.

X1, X2, ..., XN에 좌표 압축을 적용한 결과 X'1, X'2, ..., X'N를 출력해보자.

## 풀이

```python
import sys

n = int(sys.stdin.readline())
numbers = list(map(int,sys.stdin.readline().split()))
sNumbers = sorted(list(set(numbers)))
numDic={}
for num in numbers:
    numDic[num]=0

for i in range(len(sNumbers)):
    numDic[sNumbers[i]]=i

for i in range(n):
    print(numDic[numbers[i]], end=' ' )

```

생각해보니 주어진 숫자들의 중복을 제거하고, 정렬하면 각 인덱스가 자기보다 작은 수의 숫자가 된다.

-10 -9 1 2 3 처럼 정렬된 상태에서 -10은 0개, -9는 1개식으로 구할 수 있는 것이다.