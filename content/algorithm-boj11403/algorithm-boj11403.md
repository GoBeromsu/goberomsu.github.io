---
title: 백준 11403 경로 찾기
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

# 백준 11403 경로 찾기

## 문제

가중치 없는 방향 그래프 G가 주어졌을 때, 모든 정점 (i, j)에 대해서, i에서 j로 가는 경로가 있는지 없는지 구하는 프로그램을 작성하시오.

### 입력
첫째 줄에 정점의 개수 N (1 ≤ N ≤ 100)이 주어진다. 둘째 줄부터 N개 줄에는 그래프의 인접 행렬이 주어진다. i번째 줄의 j번째 숫자가 1인 경우에는 i에서 j로 가는 간선이 존재한다는 뜻이고, 0인 경우는 없다는 뜻이다. i번째 줄의 i번째 숫자는 항상 0이다.

### 출력

총 N개의 줄에 걸쳐서 문제의 정답을 인접행렬 형식으로 출력한다. 정점 i에서 j로 가는 경로가 있으면 i번째 줄의 j번째 숫자를 1로, 없으면 0으로 출력해야 한다

## 풀이

```python
import sys
from collections import deque

n = int(sys.stdin.readline())
mp=[list(map(int,sys.stdin.readline().split())) for _ in range(n)]

nodes=[[] for i in range(n)]

for i in range(len(mp)):
    for j in range(len(mp[i])):
        if mp[i][j]==1:
            nodes[i].append(j)

def bfs(node):
    q=deque()
    visited=[False]*n
    for i in nodes[node]:
        q.append(i)
        visited[i]=True

    while q:
        x=q.popleft()
        for i in nodes[x]:
            if not visited[i]:
                visited[i]=True
                mp[node][x]=1
                q.append(i)
                nodes[node].append(i)
                mp[node][i]=1
for i in range(n):
    bfs(i)

for m in mp:
    print(*m)
```

초기에 연결된 연결된 노드들을 추가한다. ( 방향 그래프임을 유의할 것)
이미 연결된 노드들을 visited 체크하고, q에 넣어 연결된 노드들이 또 연결된 노드를 찾는다.

시간 복잡도를 줄이기 위해 중간 중간 맵 변환해주는 것도 잊지 말자

### 꼭 잊지 말자

* BFS 문제의 경우 순완 오류에 빠지거나 검색 범위가 너무 넓어질 수 있으니, visited 처럼 갔는지 체크하자
* 매개 변수와 베이스 케이스를 명확히 하자


### 잘한 점

* 답지를 보지 않고 문제를 풀었다.
  * 내가 만든 내 풀이!
* 문제를 차근차근 읽어서 처음에 헤매지 않음