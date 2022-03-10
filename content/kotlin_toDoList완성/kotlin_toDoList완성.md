---
emoji: 🏃
categories: language
title: toDoList완성
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
cover: https://user-images.githubusercontent.com/37897508/81902661-77f38780-95fb-11ea-8441-d6e2127ffd5b.png
description: project 정리
---

# 코드 리뷰

## What you learend in This Project

- Javascript, HTML, CSS 과 조곰 친해졌다
- Jascript의 기본 동작을 알게 됬다
  - 이 녀석은 이런 느낌으로 움직이구나
  - 왜 쓰는 구나
  - sexy한 언어군

## html

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />

    <link rel="stylesheet" href="index.css" />
    <title>Test</title>
  </head>
  <body>
    <div class="js-clock">
      <h1>00:00</h1>
    </div>
    <form class="js-form form">
      <input type="text" placeholder="what is your name?" />
    </form>
    <h4 class="js-greetings greetings"></h4>
    <form class="js-toDoForm">
      <input type="text" placeholder="write a todo" />
    </form>
    <ul class="js-toDoList" id="toDoList"></ul>
    <spanc class="js-weather"></spanc>
  </body>
  <script src="clock.js"></script>
  <script src="todo.js"></script>
  <script src="greeting.js"></script>
  <script src="bg.js"></script>
  <script src="weather.js"></script>
</html>
```

## javascript

### greeting.js

```javascript
const form = document.querySelector(".js-form"); // js-form 클래스를 받아옴
const input = form.querySelector("input"); // input tag 들을 받아옴
const greeting = document.querySelector(".js-greetings"); //  js-greetings 클래스를 받아옴

const USER_LS = "currentUser"; // User 확인을 위한 변수
const SHOWING_CN = "showing"; // css 변환을 위한 변수

function saveName(text) {
  // local storage에 currentUser로 saveName 함수에 입력받은 텍스트를 유저 이름으로 수정
  localStorage.setItem(USER_LS, text);
}

function handleSubmit(event) {
  event.preventDefault(); // placeholder 이벤트 막기
  const currentValue = input.value; // 현재 입력된 값 저장
  paintGreeting(currentValue); // input 값 인수로 보내기
  saveName(currentValue); // 현재 값을 local storage에 저장
}

function askForName() {
  form.classList.add(SHOWING_CN);
  form.addEventListener("submit", handleSubmit);
}

function paintGreeting(text) {
  form.classList.remove(SHOWING_CN); // 기존의 form의 input이 안보이게함
  greeting.classList.add(SHOWING_CN); // js-greeting h4 태그가 보임
  greeting.innerText = `Hello ${text}`; // js-greeting h4 태그에 text입력
}

function loadName() {
  const currentUser = localStorage.getItem(USER_LS); // 저장된 유저 이름을 불러온다

  if (currentUser === null) {
    askForName(); // currentUser가 비어있다면 askForName 호출
  } else {
    paintGreeting(currentUser); // currentuser가 있다면 paintGreeting 호출
  }
}

function init() {
  loadName();
}

init();
```

### bg.js

```javascript
const body = document.querySelector("body"); // body 태그에 접근한다

const IMG_NUMBER = 4; // 이미지 최대 갯수

function paintImage(imgNumber) {
  // 배경 이미지를 칠하는 함수
  const image = new Image(); // 이미지 객체를 생성
  image.src = `images/${imgNumber + 1}.jpg`; // 이미지 소스로 images 하위 폴더 이미지들을 추가
  image.classList.add("bgImage"); //   이미지를 bgImage라는 클래스로 추가한다
  body.prepend(image); // bgImage 클래스를 바디에 추가
}

function getRandom() {
  // 랜덤으로 숫자를 반환하는 함수
  const number = Math.floor(Math.random() * IMG_NUMBER);
  return number;
}

function init() {
  const randomNumber = getRandom();
  paintImage(randomNumber);
}

init();
```

### wether.js

```javascript
const COORDS = "coords";
const API_KEY = "60b305147a7e043321d283d3c83b4fa2";
const weather = document.querySelector(".js-weather"); //js-weather class를 불러옴

function getWeather(latitude, longitude) {
  fetch(
    `https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=${API_KEY}&units=metric`
  )
    .then(function (json) {
      return json.json(); // json을 text로 읽어옴??
    })
    .then(function (json) {
      console.log(json);
      const temperture = json.main.temp; // json에서 온도 점수를 가져온다
      const place = json.name; // json에서 위치 정보를 가져온다
      weather.innerText = `${temperture}'C @${place}`;
    });

  // fetch로 url로 api를 받아온다
  //
}

function saveCoords(coordsObj) {
  localStorage.setItem(COORDS, JSON.stringify(coordsObj)); // local storage에 COORDS란 변수에 coordsObj를 json으로 바꾸어 저장
}

function handleGeoSuccess(position) {
  console.log("success");
  const latitude = position.coords.latitude; //api에서 위치 정보를 가져옴
  const longitude = position.coords.longitude;

  const coordsObj =
    // latitude longitude 객체 선언
    {
      latitude,
      longitude,
    };
  saveCoords(coordsObj);
  getWeather(latitude, longitude);
}
function handleGeoError() {
  console.log("error");
}
function askForCoords() {
  navigator.geolocation.getCurrentPosition(handleGeoSuccess); // handleGeoSuccess를 콜백함수로 현재 위치를 받아옴
}

function loadCoords() {
  const loadedCoords = localStorage.getItem(COORDS); // location 정보를 받아옴
  if (loadedCoords === null) {
    askForCoords(); // 정보가 없다면 askForCoords로 이동
  } else {
    const parseCoords = JSON.parse(loadedCoords); //json parse
    getWeather(parseCoords.latitude, parseCoords.longitude); // location  정보 바탕으로 날씨를 받아옴
  }
}

function init() {
  loadCoords();
}

init();
```

### clock.js

```javascript
const clockContainer = document.querySelector(".js-clock"); // .js-clock을 index.html에서 불러온다
const clockTitle = clockContainer.querySelector("h1"); // .js-clock의 child인 h1 tag를 불러온다

function getTime() {
  // 현재 시간을 가져오는 함수
  clockTitle.innerText = ` ${hours < 10 ? `0${hours}` : hours} : ${
    minutes < 10 ? `0${minutes}` : minutes
  } : ${seconds < 10 ? `0${seconds}` : seconds}`;

  // ` `을 통해 shell 처럼 변수를 받아오고 쓸 수 있음
  // 삼항 연산자로 시 분 초가 10이하 일경우 0추가
}

function init() {
  setInterval(getTime, 1);
}

init();
```
