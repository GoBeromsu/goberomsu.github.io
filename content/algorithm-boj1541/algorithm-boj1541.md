---
emoji: 🏃
categories: algorithm
title: 백준 1541 잃어버린 괄호
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
description:
---
<!-- 
튜토리얼, 하우 투 가이드, 설명 ,레퍼런스 
https://documentation.divio.com/tutorials/
-->

# 백준 1541 잃어버린 괄호

## 문제

세준이는 양수와 +, -, 그리고 괄호를 가지고 식을 만들었다. 그리고 나서 세준이는 괄호를 모두 지웠다.

그리고 나서 세준이는 괄호를 적절히 쳐서 이 식의 값을 최소로 만들려고 한다.

괄호를 적절히 쳐서 이 식의 값을 최소로 만드는 프로그램을 작성하시오.

## 풀이

```python
import sys
from collections import deque

sen =sys.stdin.readline().rstrip()
sentence = deque([i for i in sen])
numbers,op=[],[]

temp=''
while sentence:
    x = sentence.popleft()
    if 48<=ord(x)<=57:
        temp+=x
    else:
        numbers.append(int(temp))
        temp=''
        op.append(x)
numbers.append(int(temp))

op=deque(op)
flag=True
res,idx=0,9999

for i in range(len(op)):
    if op[i]=='-':
        idx=i
        break

if idx==9999:
    print(sum(numbers))
else:
    print(sum(numbers[0:idx+1])-sum(numbers[idx+1:len(numbers)]))
```

* 문제를 똑바로 읽을 것
* 생각을 좀 더 깊이 할 것

괄호를 쳐서 이 식의 값을 최소로 만들려면, -가 등장한 후 모든 값이 음수가 되면 된다.