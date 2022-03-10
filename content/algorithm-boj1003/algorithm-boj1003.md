---
emoji: 🏃
categories: algorithm
title: 백준 1003 피보나치 함수
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
---
# 백준 1003 피보나치 함수
## 문제

피보나치 수열의 0과 1의 갯수를 구해서 출력하는 문제이다

첫째 줄에 테스트 케이스의 개수 T가 주어진다.

각 테스트 케이스는 한 줄로 이루어져 있고, N이 주어진다. N은 40보다 작거나 같은 자연수 또는 0이다.

### 출력

각 테스트 케이스마다 0이 출력되는 횟수와 1이 출력되는 횟수를 공백으로 구분해서 출력한다.

## 풀이

```python
import sys
# fibo(n) = fibo(n-2) + fibo(n-1)
zdp = [1,0]
odp = [0,1]
for i in range(2,41):
    zdp.append(zdp[i-2]+zdp[i-1])
    odp.append(odp[i-2]+odp[i-1])

n = int(sys.stdin.readline())

for j in range(n):
    num = int(sys.stdin.readline())
    print(f"{zdp[num]} {odp[num]}")
```


0과 1의 갯수를 따로 계산해서 출력하면 된다.
