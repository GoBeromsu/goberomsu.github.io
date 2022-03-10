---
emoji: 🏃
categories: algorithm
title: algorithm_boj2178
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
description:
---
<!-- 
튜토리얼, 하우 투 가이드, 설명 ,레퍼런스 
https://documentation.divio.com/tutorials/
-->

# 백준 2178 미로 탐색

## 문제

## 풀이

* 첫 번째 풀이

```python
import sys
sys.setrecursionlimit(15000)

N,M = map(int, sys.stdin.readline().split())
MAX =sys.maxsize
mp = [[MAX]*(M+1) for _ in range(N+1)]

for n in range(1,N+1):
    cnt=1
    for m in list(map(int,sys.stdin.readline().rstrip())):
        mp[n][cnt]=m
        cnt+=1
ans=[]
def solve(x,y,count):
    if x==N and y==M:
        ans.append(count)
        return
    if x==0 or y==0 or x==N+1 or y==M+1:
        return
    if mp[x][y]==0 or mp[x][y]==2:
        return
    elif mp[x][y]==1:
        mp[x][y]=2
        solve(x, y+1, count+1)
        solve(x+1, y, count+1)
        solve(x, y-1, count+1)
        solve(x-1, y, count+1)
solve(1, 1,1)
print(min(ans))
```

위의 코드는 틀린 코드이다. 재귀 함수를 이용해서 탐색해서 목적지에 도달했을 때의 카운트를 추가하도록 했다.

아래 코드는 bfs로 다시 풀어 제출한 정답 코드이다.

```python
import sys
from collections import deque

N,M = map(int,sys.stdin.readline().split())
mp=[]

for _ in range(N):
    mp.append(list(map(int,sys.stdin.readline().rstrip())))

dx=[-1,0,1,0]
dy=[0,1,0,-1]

visited = [[0]*M for _ in range(N)]

q=deque([(0,0)])
while q:
    x,y =q.popleft()
    if x==N-1 and y==M-1:
        print(visited[x][y]+1)
    for i in range(4):
        nx,ny=x+dx[i],y+dy[i]

        if 0<= nx <N and 0<= ny<M:
            if visited[nx][ny] ==0 and mp[nx][ny]==1:
                visited[nx][ny] = visited[x][y]+1
                q.append((nx,ny))
```

* 뭐가 문제일까? 처음 코드도 나름 bfs 느낌인데 싶어 왜 bfs로 찾은 경로가 최단 경로인지 찾아보았다

bfs는 넓이 우선 탐색이다. 즉 루트 노드부터 시작해서 거리가 1,2,3,.... 인 자식 노드들을 차례대로 방문한다.
즉 이렇게 순환하면 자식 노드들은 루트 노드로부터 거리가 1,2,3 이므로 최소 거리를 보장받게 된다.