---
emoji: 🏃
categories: algorithm
title: 백준 1780 종이의 개수
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
description:
---
<!-- 
튜토리얼, 하우 투 가이드, 설명 ,레퍼런스 
https://documentation.divio.com/tutorials/
-->

# 백준 1780 종이의 개수

## 문제

N×N크기의 행렬로 표현되는 종이가 있다. 종이의 각 칸에는 -1, 0, 1 중 하나가 저장되어 있다. 우리는 이 행렬을 다음과 같은 규칙에 따라 적절한 크기로 자르려고 한다.

만약 종이가 모두 같은 수로 되어 있다면 이 종이를 그대로 사용한다.
(1)이 아닌 경우에는 종이를 같은 크기의 종이 9개로 자르고, 각각의 잘린 종이에 대해서 (1)의 과정을 반복한다.
이와 같이 종이를 잘랐을 때, -1로만 채워진 종이의 개수, 0으로만 채워진 종이의 개수, 1로만 채워진 종이의 개수를 구해내는 프로그램을 작성하시오.

## 풀이

```python
import sys

def solve(x,y,n):

    num = paper[x][y]
    for i in range(x,x+n):
        for j in range(y,y+n):
            if (paper[i][j]!=num):
                for k in range(3):
                    for l in range(3):
                        solve(x+k*n//3, y+l*n//3, n//3)
                return
    plus(num)
def plus(num):
    global a,b,c
    if num ==-1:
        a+=1
    elif num==0:
        b+=1
    else:
        c+=1 

N = int(sys.stdin.readline())
paper = [list(map(int,sys.stdin.readline().split())) for _ in range(N)]
a,b,c=0,0,0

solve(0,0,N)

for cnt in (a,b,c):
    print(cnt))
```

* 계속 흐름은 맞는데 조금씩 빗나간다. 이런 유형의 문제를 많이 풀어봐야 해결 될듯하다
* [백준 1074](https://www.acmicpc.net/problem/1074)도 그렇고 recursion과 분할에 좀 더 집중해야할 듯
주어진 종이를 순회하면서 값이 다르다면 9 조각 낸다.
만약 종이의 모든 숫자가 같다면 해당 숫자를 카운트한다.

### 다음에 이런 문제를 만난다면?

1. 분할은 범위 조절이 중요한 문제이다. 그러니 범위를 나타내는 식을 나타낼 것
2. for 문이 중첩되는 것을 무서워하지 말자.