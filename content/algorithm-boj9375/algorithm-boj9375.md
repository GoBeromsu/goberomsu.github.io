--- 
emoji: 🏃
categories: algorithm
title: 백준 9375 패션왕 신해빈
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
description:
---
<!-- 
튜토리얼, 하우 투 가이드, 설명 ,레퍼런스 
https://documentation.divio.com/tutorials/
-->

# 백준 9375 패션왕 신해빈

## 문제

해빈이는 패션에 매우 민감해서 한번 입었던 옷들의 조합을 절대 다시 입지 않는다. 예를 들어 오늘 해빈이가 안경, 코트, 상의, 신발을 입었다면, 다음날은 바지를 추가로 입거나 안경대신 렌즈를 착용하거나 해야한다. 해빈이가 가진 의상들이 주어졌을때 과연 해빈이는 알몸이 아닌 상태로 며칠동안 밖에 돌아다닐 수 있을까?

### 입력

첫째 줄에 테스트 케이스가 주어진다. 테스트 케이스는 최대 100이다.

* 각 테스트 케이스의 첫째 줄에는 해빈이가 가진 의상의 수 n(0 ≤ n ≤ 30)이 주어진다.
* 다음 n개에는 해빈이가 가진 의상의 이름과 의상의 종류가 공백으로 구분되어 주어진다. 같은 종류의 의상은 하나만 입을 수 있다.
* 모든 문자열은 1이상 20이하의 알파벳 소문자로 이루어져있으며 같은 이름을 가진 의상은 존재하지 않는다.

### 출력

각 테스트 케이스에 대해 해빈이가 알몸이 아닌 상태로 의상을 입을 수 있는 경우를 출력하시오.

## 풀이

```python
import sys

n = int(sys.stdin.readline())

for _ in range(n):
    number = int(sys.stdin.readline())
    if number==0:
        print(0)
        continue
    
    clothes=dict()
    for _ in range(number):
        clo_name,clo_type=map(str,sys.stdin.readline().split())
        if clo_type in clothes.keys():
            clothes[clo_type]+=1
        else:
            clothes[clo_type]=1

        cnt=1
        for key in clothes.keys():
            cnt*=clothes[key]+1
    print(cnt-1)
```

### 처음 풀이 때 잘못한 점

딕셔너리로 값들을 정리하고, combination을 사용해서 문제를 풀었다.
하지만 시간 초과를 받았다. 생각이 효율적이지 않았다.

나름 계산을 줄여보려고 딕셔너리에 옷의 갯수를 넣고, 옷의 갯수끼리 조합을 구하고, 조합 안의 숫자를 곱한 총합이 해진이가 입을 수 있는 옷의 가지수이기 때문이다.

### 두 번째 풀이

여러 해설들을 보다보니, [해진이가 입을 수 있는 옷의 조합(알몸 포함) - 1(알몸인 경우)]로 구하면 식이 생각보다 엄청 간단해진다.

또 오늘 배운 점은 예외 처리이다. 테스트 케이스가 주어질 때 해진이가 옷이 없는 경우가 있다. 이 때 바로 0으로 예외 처리를 해야하는데 처음 풀 때는 신경쓰지 않았다.