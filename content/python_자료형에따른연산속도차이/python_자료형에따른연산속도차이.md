---
emoji: 🏃
categories: language
title: 자료형에 따른 연산속도 차이
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
description:
---
<!-- 
튜토리얼, 하우 투 가이드, 설명 ,레퍼런스 
https://documentation.divio.com/tutorials/
-->

## 시작

PS를 하다보면 여러 값을 접근할 일이 많다.
list를 사용해서 인덱스에 접근하는 방식으로 주로 문제를 풀었는데, 어느 순간 시간 초과가 발생했다.
알고보니 파이썬에서는 자료형에 따라 연산 속도가 달라, 때에 따라 dictionary 등을 이용하면 시간을 단축 할 수 있다고한다. 


## 무엇을 사용해야하는가

dictionary와 set의 인덱싱,저장,삭제,탐색의 시간 복잡도가 O(1)이다.
반면 list는 데이터 삽입,삭제에서 O(N)의 시간 복잡도를 가진다.

즉 꼭 인덱싱을 해야하는 일이아니라면 dictionary와 set을 쓰는게 더 효율적이다.

실제로 그러한지 [백준 10809번 문제](https://www.acmicpc.net/problem/10809)로 테스트해 보았다.

각각의 코드는 변화를 최소화하고, 반복문의 수행 시간만 측정하였다.

```python
## List로 짠 코드
for i in range(len(val)):
    for j in range(a,a+26):
        if (val[i] == chr(j) and arr[j-a]==-1):
            arr[j-a]=i
for i in range(len(arr)):
    print(arr[i], end=' ')

## Dictionary로 짠 코드
for i in range(len(val)):
    for j in range(a,a+26):
        if val[i] == chr(j) and dic[chr(j)]==-1:
            dic[chr(j)] = i

for value in dic:
    print(dic[value], end=' ')    
```

결과는 역시나 Dictionary가 4배 정도 빨랐다.

![사진](/img/python_자료형에따른연산속도차이_speecheck.jpg)


## 시간 복잡도를 신경 써야하는 이유
한 발자국 더 나아가서 왜 코드를 짤 때 시간 복잡도를 고려 해야하는지 생각해보자

```python
def is_unique(alist:[int])->bool:
  for i in range(len(alist)): ## O(N)
    for j in range(i+1,len(alist)): ## O(N)
      if alist[i] == a[j]: ## O(1)
        return False ## O(1)
  return True  ## O(1)
```
is_unique()의 시간 복잡도는 O(N) * O(N)*O(1)+O(1)인 O(N**2)이다.
is_unique()는 주어진 리스트의 길이가 늘어날 수록 시간도 4배 9배 16 배로 느려진다.

시간 복잡도의 합에서는 여러 항들 중 영향력이 가장 큰 항 하나가 시간 복잡도이다.

반면에 시간 복잡도의 곱에서는 항끼리 곱하기 때문에 시간 복잡도가 빠르게 증가한다.

그러므로 시간 복잡도를 최소한으로 코드를 짜는 것은 입력 값과 범위가 커질 수 록 더 효율적이다.


## 자료형들의 시간 복잡도

파이썬에서는 자료형에 따라 다른 메소드가 존재하고, 각각의 시간 복잡도 또한 다르다. 

### List

|기능|예시|시간 복잡도|
|---|---|---|
|Index|L[i]|O(1)|
|Store|L[i]=0|O(1)|
|Length|len(L)|O(1)|
|Append|L.append()|O(1)|
|Sort|L.sort()|O(N Log N)|

### Set


기능     | 예시      | 시간 복잡도         |
--------------|--------------|---------------|
Length        | len(s)       | O(1)	     |
Add           | s.add(5)     | O(1)	     |
Containment   | x in/not in s| O(1)	     |
Remove        | s.remove(..) | O(1)	     | 
Discard       | s.discard(..)| O(1)	     |
Pop           | s.pop()      | O(1)	     |
Union         | s | t        | O(len(s)+len(t))
Intersection  | s & t        | O(len(s)+len(t))
Difference    | s - t        | O(len(s)+len(t))

### Dictionary

Operation     | Example      | Class         |
-------------|--------------|---------------|
Index         | d[k]         | O(1)	     |
Store         | d[k] = v     | O(1)	     |
Length        | len(d)       | O(1)	     |
Delete        | del d[k]     | O(1)	     |
get/setdefault| d.get(k)     | O(1)	     |
Pop           | d.pop(k)     | O(1)	     | 
Pop item      | d.popitem()  | O(1)	     | 
View          | d.keys()     | O(1)	     | 
Construction  | dict(...)    | O(len(...))   |
Iteration     | for k in d:  | O(N)          |

## Reference

[자료형에 따른 시간 복잡도](https://www.ics.uci.edu/~pattis/ICS-33/lectures/complexitypython.txt)