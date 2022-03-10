---
emoji: 🏃
categories: algorithm
title: 백준 1303 전쟁 - 전투
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
---
<!-- 
튜토리얼, 하우 투 가이드, 설명 ,레퍼런스 
https://documentation.divio.com/tutorials/
-->

# 백준 1303 전쟁 - 전투

## 문제

## 풀이

```PYTHON
import sys
from collections import deque


N,M = map(int,sys.stdin.readline().split())
mp = []
for i in range(M):
    mp.append(list(sys.stdin.readline().rstrip()))

visited=[[False] * N for _ in range(M)]
W, B = [], []
dx, dy = [0, 0, 1, -1], [1, -1, 0, 0]

def bfs(x, y):
    q = deque([(x, y)])
    color = mp[x][y]
    count=0
    while q:
        x, y = q.popleft()
        for i in range(4):
            nx,ny=x+dx[i],y+dy[i]
            if nx<0 or ny<0 or nx>=M or ny>=N:
                continue    
            if color==mp[nx][ny] and visited[nx][ny]==False:
                visited[nx][ny]=True
                q.append((nx,ny))
                count+=1
    if count==0:
        count=1
    if color=='W':
        W.append(count)
    else:
        B.append(count)
    
for i in range(M):
    for j in range(N):
        if not visited[i][j]:
            bfs(i, j)

answer=[]
for i in (W,B):
    ans=0
    for j in i:
        ans+=j**2
    answer.append(ans)
print(*answer)
```

* 졸린 관계로 식이 좀 더럽다
* 계속 왜 틀렸나 했는데 visited를 만들 때 가로와 세로를 헷갈렸다.

다음엔 좀 더 신경 써야 할 것

1. 따로 리스트를 선언해서 간 곳을 체크하라

* 괜히 복잡해져서 헷갈리느니, 그냥 체크하자

2. 디버깅할 때 값이 제대로 입력 되는지 확인하자

이런 유형의 bfs 문제는 간 곳을 체크해서 카운트만 하면 되기 때문에 자주 문제를 풀어서 익숙해지도록 하자
