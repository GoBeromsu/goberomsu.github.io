---
emoji: 🏃
categories: algorithm
title: 백준 7662 이중 우선 큐
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
description:
---
<!-- 
튜토리얼, 하우 투 가이드, 설명 ,레퍼런스 
https://documentation.divio.com/tutorials/
-->

# 백준 7662 이중 우선 큐

## 문제

이중 우선순위 큐(dual priority queue)는 전형적인 우선순위 큐처럼 데이터를 삽입, 삭제할 수 있는 자료 구조이다. 전형적인 큐와의 차이점은 데이터를 삭제할 때 연산(operation) 명령에 따라 우선순위가 가장 높은 데이터 또는 가장 낮은 데이터 중 하나를 삭제하는 점이다. 이중 우선순위 큐를 위해선 두 가지 연산이 사용되는데, 하나는 데이터를 삽입하는 연산이고 다른 하나는 데이터를 삭제하는 연산이다. 데이터를 삭제하는 연산은 또 두 가지로 구분되는데 하나는 우선순위가 가장 높은 것을 삭제하기 위한 것이고 다른 하나는 우선순위가 가장 낮은 것을 삭제하기 위한 것이다.

정수만 저장하는 이중 우선순위 큐 Q가 있다고 가정하자. Q에 저장된 각 정수의 값 자체를 우선순위라고 간주하자.

Q에 적용될 일련의 연산이 주어질 때 이를 처리한 후 최종적으로 Q에 저장된 데이터 중 최댓값과 최솟값을 출력하는 프로그램을 작성하라.

## 풀이

```python
import heapq
def sync(arr):
    while arr and id[arr[0][1]] == 0:
        heapq.heappop(arr)

T = int(input())
for test_case in range(T):
    max_arr = []
    min_arr = []
    id = [0] * 1000000
    K = int(input())
    for i in range(K):
        S, num = input().split()

        if S == "I":
            heapq.heappush(max_arr, (-1 * int(num), i))
            heapq.heappush(min_arr, (int(num),i))
            id[i] = 1
            
        else:

            if num == "1":
                sync(max_arr)
                if max_arr:
                    id[max_arr[0][1]] = 0
                    heapq.heappop(max_arr)

            elif num == "-1":
                sync(min_arr)
                if min_arr:
                    id[min_arr[0][1]] = 0
                    heapq.heappop(min_arr)

    sync(max_arr)
    sync(min_arr)

    if len(max_arr) == 0:
        print("EMPTY")
    else:
        print(-1 * max_arr[0][0], end =" ")
        print(min_arr[0][0])

```

heapq 내장 함수들로만 문제를 풀었는데 시간 초과가 신나게 떴다.
그래서 이래저래 구글링하면서 다른 분들 블로그를 보고 풀이를 적으며 이해하려 한다.

sync 함수는 동기화하는 함수이다. 최대 힙과 최소 힙을 만들고, 값을 빼다 보면 두 배열의 값이 달라지기 때문이다.

힙의 최댓값의 인덱스는 0이다. 이 때 두 배열은 서로 인덱스 0의 값이 끝에 위치하기 때문에 id가 0인 것을 pop하는 방식으로 서로 동기화 할 수 있다.