---
emoji: 🏃
categories: algorithm
title: 백준 1931 회의실 배정
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
description:
---
<!-- 
튜토리얼, 하우 투 가이드, 설명 ,레퍼런스 
https://documentation.divio.com/tutorials/
-->
# 백준 1931 회의실 배정

## 문제

한 개의 회의실이 있는데 이를 사용하고자 하는 N개의 회의에 대하여 회의실 사용표를 만들려고 한다. 각 회의 I에 대해 시작시간과 끝나는 시간이 주어져 있고, 각 회의가 겹치지 않게 하면서 회의실을 사용할 수 있는 회의의 최대 개수를 찾아보자. 단, 회의는 한번 시작하면 중간에 중단될 수 없으며 한 회의가 끝나는 것과 동시에 다음 회의가 시작될 수 있다. 회의의 시작시간과 끝나는 시간이 같을 수도 있다. 이 경우에는 시작하자마자 끝나는 것으로 생각하면 된다.

## 풀이

처음 풀이는 회의실 배정 한 곳을 체크해서, 간 곳은 안 가고, 바로 이어지는 회의 시간을 이어갈 때마다 카운트하는 방식으로 풀었다.
하지만 시간 초과

문제를 잘못 이해했었다. 꼭 이어질 필요는 없다.

```python
import sys
time = int(sys.stdin.readline())
conference = [list(map(int,sys.stdin.readline().split())) for _ in range(time)]

count=0
def conf(start,end,cnt,check):
    global count
    for i in range(time):
        if check[i]:
            if i==time-1:
                count=max(count,cnt)
                break
            else:
                continue
        elif conference[i][0]==end+1:
            check[i]=True
            conf(conference[i][0], conference[i][1], cnt+1,check)
            check[i]=False

for i in range(time):
    check=[False]*time
    check[i]=True
    conf(conference[i][0], conference[i][1], 1,check)
print(count)
```

빨리 끝나는 것 중 빨리 시작하는 순서로 빠르게 집어 넣으면 더 빠르게 답을 구해낼 수 있다.

```python
import sys

time = int(sys.stdin.readline())
conference = [list(map(int,sys.stdin.readline().split())) for _ in range(time)]

conference = sorted(conference,key=lambda x:[x[1],x[0]])

mx=0
start=0

for c in conference:
    if c[0] >= start:
        start= c[1]
        mx+=1
print(mx)
```