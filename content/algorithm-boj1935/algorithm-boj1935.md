---
emoji: 🏃
categories: algorithm
title: 백준 1935 후위 표기식 2
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
description:
---
<!-- 
튜토리얼, 하우 투 가이드, 설명 ,레퍼런스 
https://documentation.divio.com/tutorials/
-->

# 백준 1935 후위 표기식 2
## 문제

후위 표기식과 각 피연산자에 대응하는 값들이 주어져 있을 때, 그 식을 계산하는 프로그램을 작성하시오.

## 입력

첫째 줄에 피연산자의 개수(1 ≤ N ≤ 26) 가 주어진다.
둘째 줄에는 후위 표기식이 주어진다. (여기서 피연산자는 A~Z의 영대문자이며, A부터 순서대로 N개의 영대문자만이 사용되며, 길이는 100을 넘지 않는다)
셋째 줄부터 N+2번째 줄까지는 각 피연산자에 대응하는 값이 주어진다. 3번째 줄에는 A에 해당하는 값, 4번째 줄에는 B에 해당하는값 , 5번째 줄에는 C ...이 주어진다, 그리고 피연산자에 대응 하는 값은 100보다 작거나 같은 자연수이다.

후위 표기식을 앞에서부터 계산했을 때, 식의 결과와 중간 결과가 -20억보다 크거나 같고, 20억보다 작거나 같은 입력만 주어진다.

## 풀이

### 핵심 아이디어

* 후위 표기식의 계산 방식을 알고 있는가
  * 컴퓨터가 순차적으로 어떻게 계산해 나가도록 할 것인가?

후위 표기식으로 표기를 하게 되면 연산자의 우선순위에 따라 연산자가 피연산자 뒤에 정렬되어 있다.
그래서 앞에서 부터 차례대로 스택에 넣고 값을 계산해나가면 된다.

## CODE

```python
import sys

stack = []
num = int(sys.stdin.readline())
exp = list(sys.stdin.readline().rstrip())

dic = {chr(key+65):int(sys.stdin.readline()) for key in range(num)}

for s in exp:
    if s.isalpha():
        stack.append(dic[s])
    else:
        n1=stack.pop()
        n2=stack.pop()
        if s=='+':
            stack.append(n1+n2)
        elif s=='-':
            stack.append(n2-n1)
        elif s=='*':
            stack.append(n2*n1)
        elif s=='/':
            stack.append(n2/n1)

print(F"{stack[0]:.2f}")
```
