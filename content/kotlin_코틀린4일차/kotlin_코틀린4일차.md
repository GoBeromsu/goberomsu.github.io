---
emoji: 🏃
categories: language
title: 코틀린4일차
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
cover: 
description:
---

## Time Picker 추가

- 깔끔하게 시간을 설정하기 위해 time Picker을 이용하기로 했다.
  - second까지 표현 가능하는 것을 원해서 gradle로 모듈을 추가로 받았다

```xml
implementation 'com.kovachcode:timePickerWithSeconds:1.0.1'
```

```kotlin
        val timePicker = MyTimePickerDialog(
            this,
            MyTimePickerDialog.OnTimeSetListener() { timePicker: TimePicker, hoursOfDay: Int, minute: Int, seconds: Int ->

                timeText.setText(
                     String.format("%02d", hoursOfDay) +
                            ":" + String.format("%02d", minute) +
                            ":" + String.format("%02d", seconds)
                );
            },
            Calendar.HOUR_OF_DAY,
            Calendar.MINUTE,
            Calendar.SECOND,
            true
        )

        timePicker.show()

    }
```

- 일단은 실행하면 메인 화면에서 설정된 시간을 출력시키게 설정해 놓았다.
- 패키지를 받긴 했는데 오래되기도 하고 자바 코드라 코틀린으로 바꿔서 넣었다.

## Setting된 시간 Count하기

```kotlin
val timePicker = MyTimePickerDialog(
            this,
            MyTimePickerDialog.OnTimeSetListener() { timePicker: TimePicker, hoursOfDay: Int, minute: Int, seconds: Int ->
                sumOfTime = hoursOfDay * 60 * 60 + minute * 60 + seconds
                var Timer = object : CountDownTimer(sumOfTime!!.toLong(), 100) {
                    override fun onTick(millisUntilFinished: Long) {
                        timeText.setText("${millisUntilFinished} 남았습니다")
                    }

                    override fun onFinish() {
                        Toast.makeText(this@MainActivity, "CountDown Finished.", Toast.LENGTH_SHORT)
                            .show()
                    }
                }
                Timer.start()
            },
            Calendar.HOUR_OF_DAY,
            Calendar.MINUTE,
            Calendar.SECOND,
            true
        )

```

- sumOfTime으로 시,분,초를 초로 환산해서 카운트 다운 하도록 했다.
  - 왜냐면 일단 계획이 Graphic으로 초를 퍼센트로 구현할 생각이라 일부러 합쳤다.
- CounDownTimer를 이용했다
  - onTick은 틱당 할 행동
  - onFinish는 타이머 끝났을 때 할 행동이다

## functijon 분할

- 역시 자바나 코틀린이나 객체 지향이 최고 아닌가
  - 디버깅 할 때 귀찮기도 하고 function을 나눴다.

### SetTimer

```kotlin
    fun setTimer() {
        val timePicker = MyTimePickerDialog(
            this,
            MyTimePickerDialog.OnTimeSetListener() { timePicker: TimePicker, hoursOfDay: Int, minute: Int, seconds: Int ->
                sumOfTime = hoursOfDay * 60 * 60 + minute * 60 + seconds
                storeTime(sumOfTime)
                startTimer()
            },
            Calendar.HOUR_OF_DAY,
            Calendar.MINUTE,
            Calendar.SECOND,
            true
        )
        timePicker.show()
    }
```

- timePicker를 이용했고 시간 설정 관련 기능을 모아두었다.

### startTimer

```kotlin

    fun startTimer() {

        var countDownTime = sumOfTime
        timerTask = timer(period = 1000) {

            countDownTime--

            runOnUiThread { timeText.setText("$countDownTime") }
        }
    }
```

- 1초씩 COUNTDOWN하는 함수이다.
- kotlin에서 지원하는 timer를 이용했다.

### storeTime

- sumOfTime라는 전역 변수에 시간을 저장해뒀다.
  - 나중에 DB까지 쓸 단계가 온다면 바꿀 생각이다
- 확실히 깔꼼하군

```kotlin
    fun storeTime(Time: Int): Int {
        sumOfTime = Time
        Toast.makeText(this@MainActivity, "${sumOfTime}은 storeTime에서 호출됨", Toast.LENGTH_SHORT)
            .show()
        return sumOfTime
    }
```
## 추가해야할 기능

* Timer 기능 완성
  * stop
  * initailize
  * 카운트가 음수가 되지 않도록 설정
* 그래픽 기능 설정

## 훔 오늘의 후기

* 생각보다 구현 속도가 빠르다
* DB까지 추가해 볼까?
* 언눙 만들고 다른 것도 만들어보자
* 하다보니 점점 속도가 붙네
* 하루에 2시간 정도 괜찮다 취미는 역시 코딩인가