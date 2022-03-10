---
emoji: 🏃
categories: algorithm
title: 백준 2275 - 부녀회장이 될테야
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
---
<!-- 
튜토리얼, 하우 투 가이드, 설명 ,레퍼런스 
https://documentation.divio.com/tutorials/
-->
# 백준 2275 - 부녀회장이 될테야
## 문제

주희는 이번 기회에 부녀회장이 되고 싶어 각 층의 사람들을 불러 모아 반상회를 주최하려고 한다.

이 아파트에 거주하려면 a층의 b호에 살려면 자신의 아래(a-1)층의 1호부터 b호까지 사람들의 수의 합만큼 사람들을 데려와 살아야 한다

주어지는 양의 정수 k와 n에 대해 k층에 n호에는 몇 명이 살고 있는지 출력하라.

### 조건

1. 아파트에 비어있는 집은 없고, 모든 주민들은 계약 조건을 지킨다.
2. 아파트엔 0층이 존재, 0층의 i호에는 i명이 산다.

## 문제풀이
### 주요 아이디어

재귀 함수를 사용해서 문제를 풀었더니, 시간을 초과해버렸다. 재귀 함수의 경우 반복되는 연산이 많아 속도가 느려지는 단점이 있다.

이를 해결하기 위해 메모제이션(Memoization) 기법을 사용한다.

메모제이션이란 반복되지만 변하지 않는 값을 저장해, 해당 값이 필요할 때 다시 연산하는 것이 아니라 저장한 값을 가져오는 것이다.

이 문제의 경우 변수가 2 개여서 리스트를 이용해 메모제이션을 사용했다.

### 풀이 순서
  
1. 해당 호실의 인원 수를 계산하는 재귀 함수 destNum() 정의
2. memo_list를 거쳐 destNum() 값을 저장하고 리턴한다.
3. 결과 값 출력
    

### Code

```python
import sys

num = int(sys.stdin.readline())
floor=0
room =0
arr=[]
memo_list= [[None]*15 for i in range(15)]

def destNum(floor,room):
    if(memo_list[floor][room] is not None):
        return memo_list[floor][room]
    if(floor==0):
        return room
    else:
        dest=0
        for i in range(1,room+1):
            memo_list[floor-1][i] =destNum(floor-1,i)
            dest += memo_list[floor-1][i]
        memo_list[floor][room] = dest
        return memo_list[floor][room]

for i in range(num):
    floor = int(sys.stdin.readline())
    room = int(sys.stdin.readline())
    arr.append([floor,room])
for j in range(num):
    print(destNum(arr[j][0],arr[j][1]))
```