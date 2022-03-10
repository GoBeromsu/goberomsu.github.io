---
emoji: 🏃
categories: algorithm
title: 백준 2004 조합 0의 개수
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
description:
---
<!-- 
튜토리얼, 하우 투 가이드, 설명 ,레퍼런스 
https://documentation.divio.com/tutorials/
-->

# 백준 2004 조합 0의 개수
## 문제

$n \choose m$의 끝자리 $0$의 개수를 출력하는 프로그램을 작성하시오

### 입력

첫째 줄에 정수 $n$, $m$ ($0 \le m \le n \le 2,000,000,000$, $n \ne 0$)이 들어온다.

## 풀이

범위가 너무 넓어 직접 조합을 구하면 시간 초과가 일어난다. 그래서 승수를 이용했다.
$8!$ 의 경우 2가 7번 들어있다.

2가 4번 $(2,4,6,8)$ , 4가 1번 $(4,8)$ ,8이 1번 $(8)$ 이렇게 범위 내에 7번 들어있다.

같은 원리로 5도 구할 수 있다.

뒤에 $0$ 이 오려면 2와 5가 각 1개 씩 필요하므로 $n, m, n-m $의 2와 5의 갯수를 각 각 구해 최솟값을 찾으면 0의 갯수를 찾을 수 있다.

## 코드
### 메모이제이션을 사용하자 - 시간 초과

범위 값이 넓어 시간 초과가 예상되어 메모이제이션을 사용했다.
하지만 인덱스를 선언하는 것부터가 너무 범위가 넓고, 접근하는 것도 같은 이유로 시간 초과 당했다

```python
import sys

fac = [1,1]+[0]*2000000000
def fact(n):
    if fac[n] != 0:
        return fac[n]
    else:
        fac[n] = n * fact(n-1)
        return fac[n]
def comb(n,m):
    return int(fact(n)/(fact(m)*fact(n-m)))

cnt=0
n,m = map(int,sys.stdin.readline().split())
num=list(map(int,str(comb(n, m))))

for i in range(len(num)):
    if num.pop() == 0:
        cnt+=1
    else:
        print(cnt)
        break
```

### 정답 코드

```python
n, m = map(int, input().split())

def two_count(n):
    two = 0
    while n != 0:
        n = n // 2
        two += n
    return two

def five_count(n):
    five = 0
    while n != 0:
        n = n // 5
        five += n
    return five

print(min(two_count(n) - two_count(n - m) - two_count(m), five_count(n) - five_count(n - m) - five_count(m)))
```

## Reference

![[백준] 2004번(python)](https://tmdrl5779.tistory.com/95)