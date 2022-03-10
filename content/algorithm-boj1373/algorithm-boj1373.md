---

categories: algorithm
emoji: 🏃
title: 백준 1373 2진수 8진수

author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
---

<!--
튜토리얼, 하우 투 가이드, 설명 ,레퍼런스
https://documentation.divio.com/tutorials/
-->

# 백준 1373 2진수 8진수

## 문제

2진수가 주어졌을 때, 8진수로 변환하는 프로그램을 작성하시오.

## 풀이

파이썬에서는 내장 함수로 8진수 변환 함수인 oct가 존재한다.
또한 int()의 경우 매개 변수를 이용해서 2진수로 표현할 수 있다.

int(input(),2)는 입력 받은 십진수를 2진수로 바꿔준다.

## 코드

```python
print(oct(int(input(),2))[2:])
```
