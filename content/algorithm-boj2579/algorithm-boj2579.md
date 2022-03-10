---
emoji: 🏃
categories: algorithm
title: 백준 2579 계단오르기
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
description:
---
<!-- 
튜토리얼, 하우 투 가이드, 설명 ,레퍼런스 
https://documentation.divio.com/tutorials/
-->

# 계단 오르기

## 문제

계단 오르는 데는 다음과 같은 규칙이 있다.

1. 계단은 한 번에 한 계단씩 또는 두 계단씩 오를 수 있다. 즉, 한 계단을 밟으면서 이어서 다음 계단이나, 다음 다음 계단으로 오를 수 있다.
2. 연속된 세 개의 계단을 모두 밟아서는 안 된다. 단, 시작점은 계단에 포함되지 않는다.
3. 마지막 도착 계단은 반드시 밟아야 한다.

4.
따라서 첫 번째 계단을 밟고 이어 두 번째 계단이나, 세 번째 계단으로 오를 수 있다. 하지만, 첫 번째 계단을 밟고 이어 네 번째 계단으로 올라가거나, 첫 번째, 두 번째, 세 번째 계단을 연속해서 모두 밟을 수는 없다.

각 계단에 쓰여 있는 점수가 주어질 때 이 게임에서 얻을 수 있는 총 점수의 최댓값을 구하는 프로그램을 작성하시오.

## 풀이

```python
import sys

n = int(sys.stdin.readline())
stair = [int(sys.stdin.readline()) for _ in range(n)]
dp = [0 for i in range(n)]

dp[0] = stair[0]
dp[1] = stair[0]+stair[1]
dp[2] = max(stair[0]+stair[2],stair[1]+stair[2])

for i in range(3,n):
    dp[i] = max(stair[i]+dp[i-2],stair[i-1]+stair[i]+dp[i-3])
print(dp[n-1])
```

전형적인 DP 문제이다. 처음에는 끝 계단은 무조건 포함해야하니까. 값들을 입력 받고 뒤집어서 무조건 첫 계단을 포함하고 시작하려고 했었다.(실패)

주어진 조건을 보면 연속된 세 개의 계단을 모두 밟아서도 안된다고 한다.
점화식을 쓸 때 이 조건을 중심으로 짜야한다.

dp[i]는 stair[i]+dp[i-2]와 stair[i]+stair[i-1]+dp[i-3] 중 최댓 값이다.
위의 식의 경우 dp[i] 내에는 무조건 stair[i]가 포함된걸 확신할 수 있다.
이제 우리는 i 번째 계단을 무조건 밟고 있다.

그렇다면 지금까지 어떤 계단을 밟아 왔을까?

stair[i]+dp[i-2]는 i-1 칸을 안밟고 넘어 온 것이다.
stair[i]+stair[i-1]+dp[i-3]은 연속해서 i 번째 계단까지 밟고 왔다.

점화식을 세웠으니 이제 문제는 거의 다 풀었다.

다만 계단의 개수가 300개로 제한되어 있으니 미리 배열을 300개 선언해두면 혹시 모를 INDEX ERROR를 방지할 수 있다.
