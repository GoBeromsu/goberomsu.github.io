---
emoji: 🏃
categories: language
title: 코틀린 기초 문법
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
cover: 
---

- 갑자기 군대가기 전에 앱 몇게 만들고 가고 싶어서 하게 됬다 별거 없는 동긴데 재밌어보여서 한 것도 크다.

## Basic

- package:source files 위치에 source file이 위치해야한다
  - 자바랑 똑같다고 생각하자
- programe entry point
  - 컴파일하면 어디서부터 시작하는가?
    - main 함수부터 실행한다.
  ```kotlin
  fun main(){
    println("hello world!")
    }
  ```
- function 정의는 어떻게 하나?
  - fun sum(a:Int, b: Int) : Int{} 순으로 진행한다
  - unit을 쓰면 리턴 값 생략 가능!
- 변수
  - val : 자바의 final
  - var : 변수
    - 아래와 같이 사용한다
  ```kotlin
    var a : Int = 1
  ```
- string templates

  ```kotlin
  var a =1
  var s1 = = "a is $a"
  ```
보니까 루비 느낌으로 객체로 인식하는거 같음. 변수.replace() 이렇게 사용하는 것들이 있네