---
emoji: 🏃
categories: algorithm
title: 백준 1918 후위 표기식
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
---
<!-- 
튜토리얼, 하우 투 가이드, 설명 ,레퍼런스 
https://documentation.divio.com/tutorials/
-->
# 백준 1918 후위 표기식
## 문제

입력된 중위 표기식을 후위 표기식으로 바꾸어 출력할 것

## 문제 풀이

주어진 문자열의 첫 글자부터 문자열인지 파악한다.

* 문자열일 경우 바로 result에 추가한다.
* __*__ 또는 __/__ 가 올 경우
  * __*__ 와 __/__가 연산의 우선순위에 있기 때문에 먼저 값을 뺀다
* __+__ 또는 __-__ 가 올 경우
  __*__ 스택의 끝에 ( 가 올 때까지 스택의 값을 result에 추가한다
  __*__ 출력이 끝나면 (를 스택에서 빼낸다
* ) 가 올 경우
  * 스택의 끝에 (가 올 때까지 스택의 값을 result에 추가한다
    * __*__ 나 __-__ 가 괄호 안에 있을 경우 괄호 안의 값을 출력하기 위함


## Code

```python
import sys

stack = []
expression = list(sys.stdin.readline().rstrip())
res = ''
for s in expression:
    if 'A' <= s and s<='Z':
        res+=s
    else:
        if s =='(':
            stack.append(s)
        elif s =='*' or s=='/':
            while stack and (stack[-1] == '*' or stack[-1] =='/':
                res+=stack.pop()
            stack.append(s)
        elif s=='+' or s =='-':
            while stack and stack[-1] !='(':
                res+= stack.pop()
            stack.append(s)
        elif s == ')':
            while stack and stack[-1] != '(':
                res += satck.pop()
            stack.pop()
while stack:
    res+=stack.pop()
print(res)
```