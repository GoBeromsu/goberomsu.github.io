---
emoji: 🏃
categories: language
title: javascript 모르겠어요 - 1
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
description: 까먹을 나를 위해 적어본다 모르는걸 기록하는거라 순차적이지 않아요
---

## const

자바스크립트에서 변수를 선언할 때 ES6 전에는 var을 사용했었다.

변수를 var 형태로 선언할 경우 문제가 발생한다

* 변수를 한 번 더 선언할 수 있다

```js
var name = "me"; //me

console.log(name);

var name = "you";

console.log(name); // you
```

같은 이름의 변수를 선언해도 오류가 나지 않는다. 이 경우엔 코드가 많아질수록 내가 쓴 변수가 어떻게 돌아가는지 모르는 상황이 발생할 수 있다.

* 호이스팅

변수는 선언 - 초기화 - 할당 순서를 걸쳐 생성된다.

호이스팅은 함수 안의 선언들을 모아서 함수 유효 범위(스코프) 내의 최상단에서 선언하는 것을 말한다

var을 통해 변수를 생성할 경우 선언-초기화 과정이 한 번에 일어나기 때문에

```js
console.log(hi); // undefined
var hi;
```

위와 같이 변수 선언 전에 변수를 사용하더라도 오류가 발생하지 않는다. 컴퓨터 입장에서는 존재는 하지만 누군지 모르는 상태가 되는 것이다

const는 변수 선언 단계와 초기화 단계가 분리되어 진행하고, 의도치 않는 재선언을 방지한다

주로 const는 재할당이 필요없는 상수와 객체에 사용한다

## Viewpot

뷰 포트는 브라우저(스크린)에 현재 보이는 화면이다

그래서 화면이 달라지면 뷰포트의 넓이와 높이는 달라질 수 있다.

뷰 포트보다 문서의 크기가 크다면 스크롤이 생기는데, 뷰포트에 안보이는 내용은 스크롤을 통해 볼 수 있다.

```js
document.documentElement.clientHeight // 뷰포트의 높이
document.documentElement.clientHeight // 뷰포트의 넓이
```
## window.addListener와 document.addListener의 차이

window는 브라우저 그 자체이고, document는 브라우저 내에 문서를 객체화 한 것이다.

큰 차이는 없고 window 안에 document도 포함된다.

그래서 addListener를 사용할 때 트리거의 기준이 브라우저인가 DOM인가 조금만 고려하면서 쓰면 된다

## 화살표 함수 (arrow function expression)

```js
document.getElementById("mobile-toc-button").addEventListener("click", () => {
  if (
    window.getComputedStyle($cardTocLayout).getPropertyValue("opacity") === "0"
  )
    mobileToc.open();
  else mobileToc.close();
});
```

위의 코드에선 () => 형태로 함수를 사용하는데 이를 arrow funciton 즉 화살표 함수이다

화살표 함수를 쓰면 표현이 간결해지는 장점이 있다

화살표 함수는 일반적인 함수 표현에 비해 제한점이 있다

- 애로우 함수 자체의 this나 super를 사용할 수 없다
  - 대신 화살표 함수를 둘러싸는 영역의 this를 사용한다
- 스코프 지정을 할 때 call, apply, bind 메소드를 사용할 수 없다

일반적인 형태는 아래와 같다

```js
(param1, param2 ----,paramN) => { statement }
```

특히 매개 변수가 없을 경우 ()를 생략할 수 있다, statement가 한 개 일 경우 {}도 생략 가능하다

## 익명함수

익명 함수는 함수 리터럴 방식으로 쓰여진 이름 없는 함수이다.

리터럴 방식이란 흔히 우리는 변수를 선언할 때 var a = 10 이렇게 선언하는데 이를 리터럴 방식이라고 한다

함수 리터럴 방식이란 함수를 말 그대로 변수에 저장하는 것을 말한다

```js
var funB = function (n) {
  alert(n);
};
```

위의 코드는 일반적인 익명 함수의 형식이다. 익명 함수로 선언된 경우 호이스팅 될 때 변수 부분만 상단부로 올라 간다. 함수 호출이 선언하는 곳보다 아래에 있어야한다.
이와 같은 특징 때문에 불필요한 메모리 사용을 줄일 수 있다.
]
## scrollBy()란

window.scrollBy()는 주어진 양만큼 document를 스크롤하는 함수이다
스크롤 이동을 픽셀 단위로 하기 때문에 Poisiton들의 값에는 이동하고 싶은 크기의 픽셀을 적으면된다

{} 안의 behavior의 Option은 smooth, instant, auto(default)가 있다.

- smooth : 스크롤을 부드럽게 이동시킨다
- instant : 주어진 픽섹말큼 한 번에 이동(점프)한다.
- auto(default) : 브라우저에 따라 선택되게함

```js
window.scrollBy(X Position,Y Position)
window.scrollBY({top:Y Position,left:X Position,behavior:'option'})
```

- Y Position이 음수이면 위로, 양수이면 아래로 스크롤한다.
  - Document의 시작이 0, 끝이 최대 길이이기 때문이다.

