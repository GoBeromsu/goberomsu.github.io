---
emoji: 🏃
categories: algorithm
title: 선택정렬
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
---

## 선택 정렬

'가장 작은 것을 선택해서 제일 앞으로 보낸다.' 생각에 기인한 알고리즘이다.
배열 내에 인덱스는 이미 정해져 있고 그 위치에 어떤 값을 넣을지 고른다. 

배열 내에 원소가 들어갈 인덱스(자리)는 이미 정해져 있고, 그 위치에 어떤 값을 넣을지 고르는 알고리즘이다.

10개의 원소 중 크기가 작은 원소부터 차례대로 배열에 넣어야 하는 상황을 생각해보자.
이때 최솟값이 들어갈 자리는 배열의 제일 왼쪽으로 정해져 있다. 
10개의 원소 중 가장 작은 값을 찾기 위해 9번 비교해야 한다.
2번째 최솟값은 8번, 3번째 최솟값은 7번 해야 한다. 

즉 각각 (n-1) (n-2)... n번 비교하게 되고, 총 n(n-1)/2번 반복하면 정렬이 끝난다.
그렇다면 선택 정렬의 시간 복잡도는 O(N^2)임을 알 수 있다(선택 정렬의 최선, 최악, 평균 시간 복잡도는 동일하다)

```js
let i, j, min, index, temp;

let array = [1, 10, 5, 8, 7, 6, 4, 3, 2, 9];
for (i = 0; i < 10; i++) {
  min = 9999;
  for (j = i; j < 10; j++) {
    if (min > array[j]) {
      min = array[j];// 최솟값 저장
      index = j; // 최솟 값 위치(인덱스) 저장
    }
  }
  temp = array[i];
  array[i] = array[index];
  array[index] = temp;
}

for (i = 0; i < 10; i++) {
  console.log(array[i]);
}

```
### 특징

* 간단하게 구현할 수 있으나 비효율적이다.
* 추가적인 메모리 소모가 적다
  * 따로 계산을 위한 공간을 필요로 하지 않는다.

### Reference

[[알고리즘] 선택 정렬이란](https://gmlwjd9405.github.io/2018/05/06/algorithm-selection-sort.html)
[[정렬] 선택정렬(Selection Sort)의 개념/Java코드/시간복잡도/공간복잡도](https://devuna.tistory.com/28)
[[정렬 알고리즘 모음]](https://st-lab.tistory.com/168)