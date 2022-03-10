---
emoji: 🏃
categories: algorithm
title: 백준 1389 케빈 베이컨의 6단계 법칙
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
description:
---
<!-- 
튜토리얼, 하우 투 가이드, 설명 ,레퍼런스 
https://documentation.divio.com/tutorials/
-->

# 백준 1389 케빈 베이컨의 6단계 법칙

## 문제

BOJ 유저의 수와 친구 관계가 입력으로 주어졌을 때, 케빈 베이컨의 수가 가장 작은 사람을 구하는 프로그램을 작성하시오.

첫째 줄에 유저의 수 N (2 ≤ N ≤ 100)과 친구 관계의 수 M (1 ≤ M ≤ 5,000)이 주어진다. 
둘째 줄부터 M개의 줄에는 친구 관계가 주어진다. 친구 관계는 A와 B로 이루어져 있으며, A와 B가 친구라는 뜻이다. 
A와 B가 친구이면, B와 A도 친구이며, A와 B가 같은 경우는 없다. 
친구 관계는 중복되어 들어올 수도 있으며, 친구가 한 명도 없는 사람은 없다. 
모든 사람은 친구 관계로 연결되어져 있다. 
사람의 번호는 1부터 N까지이며, 두 사람이 같은 번호를 갖는 경우는 없다.

## 풀이

```python
import sys
from collections import deque
n,m= map(int, sys.stdin.readline().split())

persons = [[] for _ in range(n+1)]
kebin = [0 for _ in range(n+1)]
for i in range(1,m+1):
    p1,p2 = map(int,sys.stdin.readline().split())
    persons[p1].append(p2)
    persons[p2].append(p1)
    persons[p1].sort()
    persons[p2].sort()

def bfs(person):
    q = deque([person])
    check,count=[],[0]*(n+1)
    while q:
        x=q.popleft()
        for i in persons[x]:
            if i not in check:
                count[i]=count[x]+1
                check.append(i)
                q.append(i)
    kebin[person]=sum(count)
for i in range(1,n+1):
    bfs(i)


print(kebin.index(min(kebin[1:])))
```

* 노드(친구)를 거칠 때마다 해당 노드의 count를 세서 저장하고, 리스트 kebin에 합을 저장한다.