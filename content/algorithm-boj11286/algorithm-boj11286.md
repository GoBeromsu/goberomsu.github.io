---
title: 백준 11286 절댓값 힙
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

# 백준 11286 절댓값 힙

## 문제

절댓값 힙은 다음과 같은 연산을 지원하는 자료구조이다.

배열에 정수 x (x ≠ 0)를 넣는다.
배열에서 절댓값이 가장 작은 값을 출력하고, 그 값을 배열에서 제거한다. 절댓값이 가장 작은 값이 여러개일 때는, 가장 작은 수를 출력하고, 그 값을 배열에서 제거한다.
프로그램은 처음에 비어있는 배열에서 시작하게 된다.

입력에서 0이 주어진 회수만큼 답을 출력한다. 만약 배열이 비어 있는 경우인데 절댓값이 가장 작은 값을 출력하라고 한 경우에는 0을 출력하면 된다.

## 풀이

```python
import sys
import heapq

n = int(sys.stdin.readline())
heap=[]
for i in range(n):
    num=int(sys.stdin.readline())
    if num ==0:
        if not heap:
            print(0)
            continue
        print(heapq.heappop(heap)[1])
    else:
        heapq.heappush(heap,(abs(num),num))
```

heapq 라이브러리를 사용하면 간단하게 풀 수 있다.
다른 최소 힙, 최대 힙 문제와 똑같이 튜플로 값을 대입하여 우선순위를 지정한다.
