---
emoji: 🏃
categories: algorithm
title: 백준 7576 토마토
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
description:
---
<!-- 
튜토리얼, 하우 투 가이드, 설명 ,레퍼런스 
https://documentation.divio.com/tutorials/
-->

# 백준 7576 토마토

## 문제

철수의 토마토 농장에서는 토마토를 보관하는 큰 창고를 가지고 있다. 토마토는 아래의 그림과 같이 격자 모양 상자의 칸에 하나씩 넣어서 창고에 보관한다.

창고에 보관되는 토마토들 중에는 잘 익은 것도 있지만, 아직 익지 않은 토마토들도 있을 수 있다. 보관 후 하루가 지나면, 익은 토마토들의 인접한 곳에 있는 익지 않은 토마토들은 익은 토마토의 영향을 받아 익게 된다. 하나의 토마토의 인접한 곳은 왼쪽, 오른쪽, 앞, 뒤 네 방향에 있는 토마토를 의미한다. 대각선 방향에 있는 토마토들에게는 영향을 주지 못하며, 토마토가 혼자 저절로 익는 경우는 없다고 가정한다. 철수는 창고에 보관된 토마토들이 며칠이 지나면 다 익게 되는지, 그 최소 일수를 알고 싶어 한다.

토마토를 창고에 보관하는 격자모양의 상자들의 크기와 익은 토마토들과 익지 않은 토마토들의 정보가 주어졌을 때, 며칠이 지나면 토마토들이 모두 익는지, 그 최소 일수를 구하는 프로그램을 작성하라. 단, 상자의 일부 칸에는 토마토가 들어있지 않을 수도 있다.

## 풀이

```python
import sys
from collections import deque
m,n=map(int,sys.stdin.readline().split())
mp=[]
q= deque()
dx,dy=[-1,1,0,0],[0,0,-1,1]
res=0

for i in range(n):
    mp.append(list(map(int,sys.stdin.readline().split())))

def find(mp):
    global q
    for i in range(n):
        for j in range(m):
            if mp[i][j]== 1:
                q.append([i,j])

def bfs():
    while q:
        x,y=q.popleft()
        for i in range(4):
            nx,ny=dx[i]+x,dy[i]+y
            if 0<=nx<n and 0<=ny<m and mp[nx][ny]==0:
                mp[nx][ny]=mp[x][y]+1
                q.append([nx,ny])

find(mp)
bfs()

for i in mp:
    for j in i:
        if j==0:
            print(-1)
            exit()
    res=max(res,max(i))
print(res-1)
```

* 흐름은 얼추 맞는데 bfs나 dfs 문제를 많이 안풀어봐서 문제 갈피를 못잡는 경향이 있다

이 문제의 핵심 포인트는 벡터와 bfs이다.
이런식으로 탐색하는 문제를 만날 경우 벡터를 사용하면 편하게 위치를 바꿀 수 있다

주어진 맵에서 익은 토마토가 있는 좌표를 추출한다.
추출한 좌표를 시작점으로 토마토를 익혀나간다. 토마토가 여러 개여도 상관이 없는게 결국은 새로운 토마토를 익힐 때마다 이 전 토마토에 일 수가 나오기 때문이다.
