---
emoji: 🏃
categories: algorithm
title: 백준 2630 색종이 만들기
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
description:
---
<!-- 
튜토리얼, 하우 투 가이드, 설명 ,레퍼런스 
https://documentation.divio.com/tutorials/
-->

# 백준 2630 색종이 만들기
## 문제

전체 종이의 크기가 N×N(N=2k, k는 1 이상 7 이하의 자연수) 이라면 종이를 자르는 규칙은 다음과 같다.

전체 종이가 모두 같은 색으로 칠해져 있지 않으면 가로와 세로로 중간 부분을 잘라서 <그림 2>의 I, II, III, IV와 같이 똑같은 크기의 네 개의 N/2 × N/2색종이로 나눈다. 나누어진 종이 I, II, III, IV 각각에 대해서도 앞에서와 마찬가지로 모두 같은 색으로 칠해져 있지 않으면 같은 방법으로 똑같은 크기의 네 개의 색종이로 나눈다. 이와 같은 과정을 잘라진 종이가 모두 하얀색 또는 모두 파란색으로 칠해져 있거나, 하나의 정사각형 칸이 되어 더 이상 자를 수 없을 때까지 반복한다.

입력으로 주어진 종이의 한 변의 길이 N과 각 정사각형칸의 색(하얀색 또는 파란색)이 주어질 때 잘라진 하얀색 색종이와 파란색 색종이의 개수를 구하는 프로그램을 작성하시오.

## 풀이

```python
import sys
N = int(sys.stdin.readline())

m = [list(map(int, sys.stdin.readline().split())) for _ in range(N)]
wcount,bcount=0,0

def recurs(x, y, N):
    global wcount,bcount
    color = m[x][y]
    for i in range(x, x + N):
        for j in range(y, y + N):
            if color != m[i][j]:
                recurs(x, y, N // 2)
                recurs(x, y + N // 2, N // 2)
                recurs(x + N // 2, y, N // 2)
                recurs(x + N // 2, y + N // 2, N // 2)
                return
    if color == 0:
        wcount+=1
    else:
        bcount+=1

recurs(0, 0, N)
print(wcount)
print(bcount)
```

* 첫 색상이 나머지 색상과 동일한지 확인해서 틀릴 경우 사각형을 쪼갠다
  * 재귀 형식으로 4토막씩 계속 나누니까 틀린 부분만 쏙 찾아낼 수 있다
* 각각 색깔을 비교해서 카운트를 올린 후 출력한다