---
emoji: 🏃
categories: algorithm
title: 백준 1927 최소 힙
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
description:
---
<!-- 
튜토리얼, 하우 투 가이드, 설명 ,레퍼런스 
https://documentation.divio.com/tutorials/
-->

# 백준 1927 최소 힙

## 문제 

널리 잘 알려진 자료구조 중 최소 힙이 있다. 최소 힙을 이용하여 다음과 같은 연산을 지원하는 프로그램을 작성하시오.

* 배열에 자연수 x를 넣는다.
* 배열에서 가장 작은 값을 출력하고, 그 값을 배열에서 제거한다.
프로그램은 처음에 비어있는 배열에서 시작하게 된다.

## 풀이

```python
import sys
import heapq
num = int(sys.stdin.readline())
numbers = []

for i in range(num):
    n=int(sys.stdin.readline())
    if n==0:
        if numbers:
            print(heapq.heappop(numbers))
        else:
            print(0)
    else:
        heapq.heappush(numbers, n)
```

* 파이썬의 heapq 라이브러리를 사용하면 간단하게 풀 수 있다.

힙은 특정한 규칙을 가지는 트리로써, 최댓값과 최솟값을 찾는 연산을 빠르게 하기 위해 고안된 완전이진트리이다.