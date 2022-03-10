---
emoji: 🏃
categories: algorithm
title: 이분 탐색
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
---
<!-- 
튜토리얼, 하우 투 가이드, 설명 ,레퍼런스 
https://documentation.divio.com/tutorials/
-->
## 이분 탐색이란(What is binary Search)

이분 탐색은 __정렬된 배열__에서 중앙값과 비교하여 목표값을 찾는 알고리즘이다.

목표 값을 중앙값(Mid)과 비교하여,중앙값보다 목표값이 작거나 크다면 범위를 중앙 값 기준으로 범위를 절반 제한하며 탐색한다.

길이 15이고, 인덱스와 배열의 값이 같은 배열에서 이분 탐색을 하는 상황을 가정해보자(편의상 배열의 중앙 값은 Mid, 시작은 start, 끝은 end다.)
start의 인덱스는 0, end는 14이다. Mid는 (0+14)2인 7이다.

우리가 찾고 싶은 값은 3이다.
3은 mid 7보다 작으므로, 중앙값 기준으로 왼쪽에 있으며, 중앙 값의 오른편은 값이 없음을 신뢰할 수 있다.
이 때 왼 편을 기준으로 다시 이분 탐색을 한다.
start는 0,end는 (mid-1)인 6, 새로운 mid는 (0+6)/3이다.
그 후 다시 3을 찾을 때까지 이분 탐색을 반복한다.

이분 탐색의 핵심은 중앙 값을 이용해 검색 범위를 줄여나가는 것이다.

이분 탐색의 시간 복잡도는 최대 성능 O(1), 최악 성능은 O(log2 n)이며, 평균 성능은 O(log n)이다.

## Code:
아래 코드는 aList에 이분 탐색을 하여 값을 있으면 1, 없으면 0을 반환한다

```python
import sys

def bnSearch(num:int,aList:list):
    start=0
    end=len(aList)-1
    while(start<=end):
        mid = int((start+end)/2)
        if(num>aList[mid]):
            start = mid+1
        elif(num<aList[mid]):
            end=mid-1
        elif(num==aList[mid]):
            return 1
    return 0
```

## Reference

[Wikipedia_binarySearch](https://en.wikipedia.org/wiki/Binary_search_algorithm)
[[알고리즘] 이분탐색](https://sirzzang.github.io/programming/Programming-Binary-Search/)