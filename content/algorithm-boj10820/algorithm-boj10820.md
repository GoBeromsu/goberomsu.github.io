---
title: 백준 10820 문자열 분석
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

# 백준 10820 문자열 분석

## 문제

문자열 N개가 주어진다. 이때, 문자열에 포함되어 있는 소문자, 대문자, 숫자, 공백의 개수를 구하는 프로그램을 작성하시오.

각 문자열은 알파벳 소문자, 대문자, 숫자, 공백으로만 이루어져 있다.

### 입력

첫째 줄부터 N번째 줄까지 문자열이 주어진다. (1 ≤ N ≤ 100) 문자열의 길이는 100을 넘지 않는다.

### 출력

첫째 줄부터 N번째 줄까지 각각의 문자열에 대해서 소문자, 대문자, 숫자, 공백의 개수를 공백으로 구분해 출력한다.

## 풀이

대소문자,공백, 숫자를 카운트하는건 어렵지 않았다. EOF 처리랑 문자열을 어떻게 만질것인가가 관건이다.

문제 풀 때 rstrip()을 무심코 사용했었는데 그래서 틀릴 뻔 했다.

#### rstrip()

[rstrip()](https://www.w3schools.com/python/ref_string_rstrip.asp)은 인자로 주어지는 문자를 문자열에서 모두 지우는 메소드이다.
기본적으로 아무것도 주어지지 않으면 문자열의 끝(개행문자)와 공백을 지운다.

### 핵심 아이디어

- EOF 처리를 어떻게 할 것인가?

문자열이 얼마나 들어올지 알려주지 않기 때문에 try 문을 이용해 EOF 예외 처리를 했다.

```python
while 1:
  try:
    pass
  except EOFError:
    pass
```

그리고 입력된 문자열이 존재하는지 확인해서 없을 경우 while문을 멈추게 했다.

```python
s = sys.stdin.readline().rstrip('\n)
if not s:
  break
```

## Code

```python

def fun(s):

    small,big,number,space=0,0,0,0

    for val in s:
        if val.isupper():
            big+=1
        elif val.islower():
            small+=1
        elif val == ' ':
            space+=1
        elif val.isdigit():
            number+=1
        else:
            return -1
            break
    return f"{small} {big} {number} {space}"

while 1:
    try:
        s = sys.stdin.readline().rstrip('\n')
        if not s:
            break
        else:
            ans = fun(s)
            if ans ==-1:
                break
            else:
                print(ans)

    except EOFError:
        break
```
