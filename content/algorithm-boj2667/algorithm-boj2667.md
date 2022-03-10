---
emoji: 🏃
categories: algorithm
title: 백준 2667 단지번호붙이기
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
description:
---
<!-- 
튜토리얼, 하우 투 가이드, 설명 ,레퍼런스 
https://documentation.divio.com/tutorials/
-->

# 백준 2667 단지 번호 붙이기

## 문제

정사각형 모양의 지도가 있다. 1은 집이 있는 곳을, 0은 집이 없는 곳을 나타낸다. 철수는 이 지도를 가지고 연결된 집의 모임인 단지를 정의하고, 단지에 번호를 붙이려 한다. 여기서 연결되었다는 것은 어떤 집이 좌우, 혹은 아래위로 다른 집이 있는 경우를 말한다. 대각선상에 집이 있는 경우는 연결된 것이 아니다. 지도를 입력하여 단지수를 출력하고, 각 단지에 속하는 집의 수를 오름차순으로 정렬하여 출력하는 프로그램을 작성하시오.

## 풀이

```python
import sys
sys.setrecursionlimit(15000)

n = int(sys.stdin.readline())
graph=[]
for _ in range(n):
    graph.append(list(map(int,sys.stdin.readline().rstrip())))

grp=[]
cnt=0
dx=[-1,1,0,0]
dy=[0,0,-1,1]

def dfs(x,y):
    global cnt
    if x<0 or x>=n or y<0 or y>=n:
        return False
    if graph[x][y]==1:
        cnt+=1
        graph[x][y]=0
        for i in range(4):
            dfs(x+dx[i], y+dy[i])
        return True

for i in range(n):
    for j in range(n):
        if dfs(i,j):
            grp.append(cnt)
            cnt=0
print(len(grp))
grp.sort()
for i in grp:
    print(i)
```

* 문제를 제대로 읽자
* bfs, dfs 문제를 많이 풀어보자

Base case를 먼저하고 시작해야한다. 재귀 함수의 경우 무한 루프에 빠질 수 있기 때문이다.