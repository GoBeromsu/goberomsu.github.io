---
emoji: 🏃
categories: language
title: range() 와 enumerate() 차이 
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

파이썬에서 for문은 for [변수] in [list, tuple dic 등 객체] 형태로 사용된다
PS를 하다보면 인덱싱 할 일이 많은데 난 주로 주어진 리스트 등의 길이를 이용해서 인덱스에 접근했었다.

```python
for i in range(len(list)):
  print(list[i])
```

그런데 for 문을 파이썬 스타일로 사용하려면 enumetriate()를 사용하는게 나은 선택이란 글을 보았다.

왜 enumerate()를 써야하는지, range()와의 차이점은 무엇인지 알아보자

## range()

range()는 파이썬 기본 내장(built_in) 함수이다.
주로 range(stop),range(start,stop,step) 두 형태로 매개 변수를 받는다.

[python docs](https://docs.python.org/ko/3/library/functions.html#func-range)를 보면 range()는 함수보다는 범위와 불변 시퀀스형이라한다

즉 range()는 숫자의 시퀀스를 나타내기 위해 사용되는 수정할 수 없는 시퀀스형이다.

## enumerate()

enumerate는 "열거하다"란 뜻이다. 
enumerate()는 아래와 같이 (sequence,count) 형태로 열거 객체를 튜플로 반환한다.

```python
def enumerate(sequence,start=0):
  n=start
  for elem in sequence:
    yield n, elem
    n+=1
```

예를 들어 사계절이 저장된 리스트를 enumerate()에 넣어본다면

```python
seaons=['spring','summer','fall','winter']
list(enumerate(seaons))
```

[(0, 'Spring'), (1, 'Summer'), (2, 'Fall'), (3, 'Winter')] 이런 식으로 객체를 반환한다.

## 왜 enumerate()를 사용하는걸 권장하는가

[스택 오버플로우](https://stackoverflow.com/questions/24150762/pythonic-range-vs-enumerate-in-python-for-loop)에 이에 대한 답변이 달려있다.

range()를 사용할 경우 arr[i]처럼 range()에서 반환되는 시퀀스를 iterable 객체에 다시 집어넣어야한다.

이 때 arr[i]는 리스트이기 때문에 [상대적으로 튜플을 사용한 것에 비해 처리 비용이 비싸다](https://learnbatta.com/blog/why-tuple-is-faster-than-list-in-python-22/).

또한 range(len()) 형태로 for 문을 사용하면 indexing 가능한(또는 Countable) 객체만 사용가능하다.

반면에 enumerate()를 사용한다면 모든 반복되는 객체에서 사용 가능하다.

list를 사용할 경우에 모든 객체들이 반복되는지 신뢰할 수 없지만, enumerate 같은 경우 호출된 객체의 모든 항목이 반복되는 것을 신뢰할 수 있다.

앞으로는 range(len())보다는 enuemrate를 사용해봐야겠다.


