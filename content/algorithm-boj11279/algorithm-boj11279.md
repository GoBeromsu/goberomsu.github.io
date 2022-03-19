---
title: 백준 11279 최대 힙
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

# 백준 11279 최대 힙

## 문제

널리 잘 알려진 자료구조 중 최대 힙이 있다. 최대 힙을 이용하여 다음과 같은 연산을 지원하는 프로그램을 작성하시오.

배열에 자연수 x를 넣는다.
배열에서 가장 큰 값을 출력하고, 그 값을 배열에서 제거한다.
프로그램은 처음에 비어있는 배열에서 시작하게 된다.

## 풀이

```python
import sys
import heapq

# 배열에 자연수를 x를 넣는다
# 배열에서 가장 큰 값을 출력하고 그 값을 배열에서 제거한다

n = int(sys.stdin.readline())
l = []

for i in range(n):
    t= int(sys.stdin.readline())
    if t == 0:
        if not l:
            print(0)
        else:
            print(heapq.heappop(l)[1])
    else:
        heapq.heappush(l, (-t,t))

```

파이썬의 heapq 라이브러리는 최솟 값만 정렬한다.
그래서 맥스 heap을 구하려면 위의 코드처럼 트릭을 써야한다.

값을 음수로 넣어서 정렬하면 최댓 값이 최솟 값이 되는 원리이다