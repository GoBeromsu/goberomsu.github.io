---
emoji: 🏃
categories: algorithm
title: 백준 1697 숨바꼭질
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
description:
---
<!-- 
튜토리얼, 하우 투 가이드, 설명 ,레퍼런스 
https://documentation.divio.com/tutorials/
-->

# 백준 1697 숨바꼭질

## 문제

수빈이는 동생과 숨바꼭질을 하고 있다. 수빈이는 현재 점 N(0 ≤ N ≤ 100,000)에 있고, 동생은 점 K(0 ≤ K ≤ 100,000)에 있다. 수빈이는 걷거나 순간이동을 할 수 있다. 만약, 수빈이의 위치가 X일 때 걷는다면 1초 후에 X-1 또는 X+1로 이동하게 된다. 순간이동을 하는 경우에는 1초 후에 2*X의 위치로 이동하게 된다.

수빈이와 동생의 위치가 주어졌을 때, 수빈이가 동생을 찾을 수 있는 가장 빠른 시간이 몇 초 후인지 구하는 프로그램을 작성하시오.

첫 번째 줄에 수빈이가 있는 위치 N과 동생이 있는 위치 K가 주어진다. N과 K는 정수이다.

## 풀이

bfs 개념을 직접 문제에 적용해본 적이 없어서, 그걸로 어떻게 문제를 푼다는거지? 했었다.

```python
import sys
from collections import deque

n,k = map(int,sys.stdin.readline().split())
MAX=100000
clock = [0 for i in range(MAX+1)]


def bfs(n):
    q= deque([n])
    while q:
        x=q.popleft()
        if x==k:
            return clock[x]
        for i in (x-1,x+1,x*2):
            if 0<=i <=MAX and not clock[i]:
                clock[i]=clock[x]+1
                q.append(i)
print(bfs(n))
```

수빈이의 처음 위치를 x라 하자. 수빈이는 x-1, x*2, x+1로 이동할 수 있다.
수빈이는 각각의 값에 대해 다시 또 x-1, x*2, x+1로 이동할 수 있다.

큐에 수빈이의 처음 위치를 넣은 후 반복문이 1회 돌 때마다 카운트한다.(시간 초를 세기 위해서이다)
차례차례 다음 회차의 노드들을 큐에 넣은 후 하나하나 동생의 위치와 비교한다