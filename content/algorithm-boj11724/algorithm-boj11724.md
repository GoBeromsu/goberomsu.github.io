---
title: 백준 11724 연결 요소 개수
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

# 백준 11724 연결 요소 개수

## 문제 

방향 없는 그래프가 주어졌을 때, 연결 요소 (Connected Component)의 개수를 구하는 프로그램을 작성하시오.

첫째 줄에 정점의 개수 N과 간선의 개수 M이 주어진다. (1 ≤ N ≤ 1,000, 0 ≤ M ≤ N×(N-1)/2) 둘째 줄부터 M개의 줄에 간선의 양 끝점 u와 v가 주어진다. (1 ≤ u, v ≤ N, u ≠ v) 같은 간선은 한 번만 주어진다.

## 풀이

문제 푸는 흐름은 맞는데 BFS와 DFS 개념이 아직 덜 잡힌 것 같다.

### DFS 풀이

```python
import sys

sys.setrecursionlimit(10000)

n,m = map(int,sys.stdin.readline().split())
nodes = [[] for i in range(n+1)]
nodes[0]=[0,0]
check = [False for _ in range(n+1)]

cnt = 0
for i in range(m):
    node1,node2 = map(int,sys.stdin.readline().split())
    nodes[node1].append(node2)
    nodes[node2].append(node1)
    nodes[node1].sort()
    nodes[node2].sort()

def dfs(start):
    check[start]=True
    for i in nodes[start]:
        if not check[i]:
            dfs(i)


for i in range(1,n+1):
    if check[i] == False:
        cnt+=1
        dfs(i)

print(cnt)
```

### BFS 풀이

```PYTHON
import sys
from collections import deque

sys.setrecursionlimit(10000)
# 방향 없는 그래프가 주어졌을 때, 연결 요소 개수 세는 법

n, m = map(int, sys.stdin.readline().split())
nodes = [[] for i in range(n + 1)]
check = [False for _ in range(n + 1)]

cnt = 0
for i in range(m):
    node1, node2 = map(int, sys.stdin.readline().split())
    nodes[node1].append(node2)
    nodes[node2].append(node1)
    nodes[node1].sort()
    nodes[node2].sort()

def bfs(node):
    check[node] == True
    q = deque([node])
    while q:
        v = q.popleft()
        for i in nodes[v]:
            if not check[i]:
                check[i] = True
                q.append(i)

for i in range(1, n + 1):
    if not check[i]:
        cnt += 1
        bfs(i)

print(cnt)

```