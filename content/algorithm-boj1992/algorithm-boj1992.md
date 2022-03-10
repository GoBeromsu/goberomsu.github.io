---
emoji: 🏃
categories: algorithm
title: 백준 1992 쿼드 트리
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
description:
---
<!-- 
튜토리얼, 하우 투 가이드, 설명 ,레퍼런스 
https://documentation.divio.com/tutorials/
-->

# 백준 1992 쿼드 트리

## 문제

흑백 영상을 압축하여 표현하는 데이터 구조로 쿼드 트리(Quad Tree)라는 방법이 있다. 흰 점을 나타내는 0과 검은 점을 나타내는 1로만 이루어진 영상(2차원 배열)에서 같은 숫자의 점들이 한 곳에 많이 몰려있으면, 쿼드 트리에서는 이를 압축하여 간단히 표현할 수 있다.

주어진 영상이 모두 0으로만 되어 있으면 압축 결과는 "0"이 되고, 모두 1로만 되어 있으면 압축 결과는 "1"이 된다. 만약 0과 1이 섞여 있으면 전체를 한 번에 나타내지를 못하고, 왼쪽 위, 오른쪽 위, 왼쪽 아래, 오른쪽 아래, 이렇게 4개의 영상으로 나누어 압축하게 되며, 이 4개의 영역을 압축한 결과를 차례대로 괄호 안에 묶어서 표현한다

영상을 압축한 결과를 출력하라

## 풀이

```python
import sys
sys.setrecursionlimit(15000)

n = int(sys.stdin.readline())

tree = [list(map(int,sys.stdin.readline().rstrip())) for _ in range(n)]
ans=[]
def solve(x,y,length):
    global ans
    node = tree[x][y]

    for i in range(x,x+length):
        for j in range(y,y+length):
            if node!=tree[i][j]:
                ans.append("(")
                quad=length//2
                solve(x, y, quad)
                solve(x, y+quad, quad)
                solve(x+quad, y, quad)
                solve(x+quad, y+quad, quad)
                ans.append(")")
                return
    ans.append(node)
solve(0, 0, n)
print("".join(map(str,ans)))
```

* 파이썬에서 재귀 제한이 걸렸을 땐 sys.setrecursionlimit(num)으로 제한을 풀어주자
* 함수 list()는 문자열이나 정수를 리스트로 변환한다. 
  * split()를 매개변수 없이 쓸 경우 띄어쓰기 없이 붙어버린다.

