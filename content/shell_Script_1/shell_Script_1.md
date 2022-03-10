---
emoji: 🏃
categories: language
title: 리눅스 쉘 스크립트 익히기 -1
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
description: Hacker 랭크에서 쉘스크립트 문제를 풀며 실력 향상
---

## Hacker Rank로 쉘 스크립트를 배우다

알고리즘 연습용 사이트를 찾다가, 영어이긴 하지만 해커랭크에서는 문제를 많이 풀면 배찌? 등급도 나눠준다길래 동기부여에 좋을거 같아 시작했다.

막상 시작하니 해커랭크에서 알고리즘을 비롯한 SQL, Shell 등 챌린지도 있길래, 마침 쉘스크립팅 능력의 필요성을 느끼고 있어 시작하게 되었다.

## Linux Shell with Hacker Rank

### Let's Echo

```shell
# echo "HELLO"
```

명령어 echo는 출력 명령어이다.

### Looping and Skipping

```shell
for var in {1..99..2}
do
    echo $var
done
```

- 변수를 사용할 때는 변수 앞에 $를 붙여야 인식한다

### A Personalized Echo

```shell
read name
echo Welcome $name
```

- read는 입력 값을 받는 명령어이다
  - read [var]

### The World of Numbers

```shell
read varX
read varY

echo $(($varX + $varY))
echo $(($varX - $varY))
echo $(($varX * $varY))
echo $(($varX / $varY))
```

- (var)처럼 변수를 감싸서 변수를 연산을 인식 시킬 수 있다
- expr 명령어나 사칙 연산 값을 변수에 담아서도 풀 수 있다.

### Comparing Numbers

```shell
read valX
read valY

if [ $valX -eq $valY ]
then
    echo "X is equal to Y"
elif [ $valX -gt $valY ]
then
    echo "X is greater than Y"
elif [ $valX -lt $valY ]
then
    echo "X is less than Y"
fi
```

- 조건문 if [ 조건 ]를 쓸 땐 []의 앞뒤에 공백이 있어야한다
  - 이거 땜에 왜 안되지싶었다
- 기본적인 형식은 아래와 같다

```shell
if [ 조건 ]
then
    [ statment ]
elif [ 조건 2]
then
    [ statement ]
else
fi

```

### Getting started with conditionals

입력 값으로 Y와 y가 주어질 경우엔 YES 아닐 경우 NO를 출력하는 문제이다

```shell
read val

Lowercase()
{
 echo $* | tr "[A-Z]" "[a-z]"
}


if [ $(Lowercase $val) == "y" ]
then
    echo "YES"
else
    echo "NO"
fi
```

- Lowercase()란 함수를 만들어 입력 값을 무조건 소문자로 바꾸게 만들었다
  - tr은 translate의 약자로 지정한 문자를 삭제하거나 변환하는 명령어이다
- 함수 내에 매개변수를 만들고 사용할 때 간편해서 이게 쉘스크립트의 매력인가 싶다.

### More on Conditionals

#### 문제

삼각형의 세 변을 나타내는 세 정수(X,Y, Z)가 주어졌을 때, 삼각형이 스칼렌인지, 이등변인지, 등변인지를 확인한다.

세 변이 모두 같으면 **EQUATIONAL** 을 출력합니다.
그렇지 않으면, 양쪽이 같으면 **ISOSCELES** 를 출력합니다.
그렇지 않으면 **SCALENE** 을 출력합니다.

#### 풀이

```shell
read x
read y
read z

if [ $x -eq $y -a $x -eq $z ]
then
    echo EQUILATERAL
elif [ $x -eq $y -o $y -eq $z ]
then
    echo ISOSCELES
else
    echo SCALENE
fi

```

- 논리 연산자 & 와 | 는 각각 -a(AND), -o(OR)와 같다.
  - 논리 연산자를 조건문 내에서 여러 개 쓰고 싶다면 [ 조건문 1] && [조건문 2] ... &&[조건문 N] 형식으로 사용가능 하다

### Arithmetic Operations

#### 문제

+,-,\*,^, / 및 괄호를 포함하는 수학식이 제공됩니다. 식을 읽고 평가하십시오. 소수점 이하 3자리로 반올림한 결과를 표시합니다.

#### 풀이

```shell
read val

val=${val// /}

function Cut(){
    echo "scale=$1;${2}" | bc
}

bRound=`Cut 4 $val`

if [ ${bRound: -1} -eq 5 ];then
    dest=`echo "${#bRound}-1" | bc`
    echo "${bRound:0:$dest}+0.001" | bc
else
    Cut 3 $val
fi
```

- ${ **String** / A / B }

  - A는 변환할 대상 문자열
    - / : 첫 번째로 만나는 A만 변환
    - // : 문자열 내 모든 A 형식을 변환
  - B는 변환할 문자열
  - 띄어쓰기 때문에 인자를 다 못받아 내길래 띄어쓰기를 없애려고 사용하였다

* 연산 명령어 bc를 이용했는데 5를 올리지 않고 버리길래 좀 헤맸다
  - printf를 쓰면 간단하게 해결할 수 있는 문제였다
  ```shell
    read num
    echo $num | bc -l | xargs printf "%.3f"
  ```
  - xargs는 앞선 명령의 결과를 입력으로 받아 인자를 연속적으로 사용할 수 있게한다

- bc는 연산 명령어이다
  - echo **Calculation Expression** | bc 형식으로 사용한다
  - scale은 소숫점 몇 째자리에서 반올림 할 지 결정하는 옵션이다
- ${**#String Expression** }에서 #은 문자열의 갯수를 세는 특수문자이다
