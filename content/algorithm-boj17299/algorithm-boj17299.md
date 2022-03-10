---
emoji: 🏃
categories: algorithm
title: 백준 17299 오등큰수
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
description:
---
<!-- 
튜토리얼, 하우 투 가이드, 설명 ,레퍼런스 
https://documentation.divio.com/tutorials/
-->
# 백준 17299 오등큰수
## 문제

크기가 N인 수열 A = A1, A2, ..., AN이 있다. 수열의 각 원소 Ai에 대해서 오등큰수 NGF(i)를 구하려고 한다.

Ai가 수열 A에서 등장한 횟수를 F(Ai)라고 했을 때, Ai의 오등큰수는 오른쪽에 있으면서 수열 A에서 등장한 횟수가 F(Ai)보다 큰 수 중에서 가장 왼쪽에 있는 수를 의미한다. 그러한 수가 없는 경우에 오등큰수는 -1이다.

예를 들어, A = [1, 1, 2, 3, 4, 2, 1]인 경우 F(1) = 3, F(2) = 2, F(3) = 1, F(4) = 1이다. A1의 오른쪽에 있으면서 등장한 횟수가 3보다 큰 수는 없기 때문에, NGF(1) = -1이다. A3의 경우에는 A7이 오른쪽에 있으면서 F(A3=2) < F(A7=1) 이기 때문에, NGF(3) = 1이다. NGF(4) = 2, NGF(5) = 2, NGF(6) = 1 이다.

__오등큰수__ 란 한 인덱스의 오른 편에 있는 자기보다 등장한 횟수가 큰 수 중 가장 왼쪽에 있는 수이다.

## 풀이

미리 result를 -1로 선언해두고, 딕셔너리에 빈도수를 저장한다.

주어진 값이 저장된 list인 arr의 값이 스택에 마지막 값의 빈도수를 비교한다.

스택의 마지막 값의 빈도수가 arr의 값의 빈도수 보다 작다면 arr의 값은 스택에 저장된 값의 오큰수이다.

### 핵심 아이디어

* 스택에 인덱스를 저장한다

## CODE

```python
import sys

result = [-1 for i in range(int(sys.stdin.readline()))]
arr = list(map(int, sys.stdin.readline().split()))
dic={}
stack = []
for i in arr:
    if i in dic:
        dic[i]+=1
    else:
        dic[i]=1

for s in enumerate(arr):
    while stack and dic[arr[stack[-1]]]<dic[s[1]]:
        result[stack.pop()]=s[1]
    stack.append(s[0])

print(*result)
```