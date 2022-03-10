---
emoji: 🏃
categories: language
title: 코틀린5일차
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
cover:
description:
---

# 2주간 어데 도망갔나?

7월 말에 정보처리 산업기사 시험이 있어서 그거 빡 준비해야겠다는 생각에 계속 그 공부만 했다. 뭐 사실 핑계인거 같긴하지만 결론적으로 정보처리 붙었으니까 후회 없다! 그러고는 중간중간 유튭이나 구글링으로 어떻게 하면 더 잘만들까? 찾아보다보니 시간이 훅가버렸다

# 진행 과정

1.0 베타 버전?을 다 만들었다. 내가 원했던건 간단하게 그냥 카운트 타이머 시간 경과를 그래픽으로 보여주고 싶었다.

## 뭘 배웠냐?

* 안드로이드 스튜디오랑 친해졌다
  * 이렇게 돌아간다. 이런 기능이 있다(단축키를 좀 더 외웠다던가, 뜬금포 오류의 원인)
* 파일 구조랑 친해졌다.
  * maven, gradle 원리 같은 것들
* 라이브러리랑 좀 놀아봤다.
  * 깃허브 돌아다니면서 코드를 보고 참고했다.
  * 라이브러리를 받아와서 좀 써봤다.
* OOP에 대한 갈증이 생겼다.
  * 내가 봐도 지금 짠 코드 난장판이다 휴
  * 이대로 협업하면 난리나는 거야 분발하자

## 세부 기능

### TIMER

```kotlin
    fun startTimer(hours: Int, minutes: Int, seconds: Int) {

        var seconds = seconds
        var minutes = minutes
        var hours = hours

        timerTask = timer(period = 1000) {
            sumOfTime--
            seconds--
            if (seconds < 0) {
                minutes--
                seconds = 59
            }
            if (minutes < 0) {
                hours--
                minutes = 59
            }

            var timerSeconds = seconds.toString()
            var timerMinutes = minutes.toString()
            var timerHours = hours.toString()


            if (seconds < 10) {
                timerSeconds = "0$seconds"
            }
            if (minutes < 10) {
                timerMinutes = "0$minutes"
            }
            if (hours < 10) {
                timerHours = "0$hours"
            }
            runOnUiThread {

                timeText.setText("$timerHours : $timerMinutes : $timerSeconds")
            }
            if (sumOfTime==0){
                timerTask!!.cancel()
                timeText.setText("00 : 00 : 00")
            }
        }

        btn_reset.setOnClickListener() {
            timerTask!!.cancel()
            sumOfTime = 0
            setTimePicker()
        }

    }
```
* 3항 연산자를 써서 더 코드를 줄이고 싶은데 코틀린에 없다네? 뭐 대신 굳이의 영역이긴하더라
* 아쉬운대로 00:00:00 포맷을 맞추고 싶어서 string으로 바꿔서 적용했다.
* 아래 reset 기능도 만들었는데 맘에 안든다.
  * 저게 왜 저기 있어야 하나 싶은데 timer 인스턴스를 잘못만들었다. 담엔 이렇게 안할거다


### ProgressBar

```xml
    <com.sfyc.ctpv.CountTimeProgressView
        android:id="@+id/countTimeProgressView"
        android:layout_width="match_parent"
        android:layout_height="443dp"
        android:paddingTop="30dp"
        app:backgroundColorCenter=" #FFFFFF"
        app:borderBottomColor="#000000"
        app:borderDrawColor="#CDC8EA"
        app:borderWidth="5dp"
        app:countTime="5000"
        app:markBallColor="#002FFF"
        app:markBallFlag="true"
        app:markBallWidth="3dp"
        app:startAngle="0"
        app:textStyle="jump"
        app:titleCenterColor="#000000"
        app:titleCenterSize="40dp"
        app:titleCenterText="" />

```

```kotlin
    fun setProgressBar() {
        with(countTimeProgressView) {
            startAngle = 0f
            countTime = 6000L
            borderWidth = 7f
            borderBottomColor = Color.GRAY
            borderDrawColor = Color.BLACK
            backgroundColorCenter = Color.WHITE
            markBallFlag = true
            markBallWidth = 9f
            markBallColor = Color.BLUE
            titleCenterText = "Time is Gold"
            titleCenterTextColor = Color.BLACK
            titleCenterTextSize = 50f
            addOnEndListener(object : CountTimeProgressView.OnEndListener {
                override fun onAnimationEnd() {
                    Toast.makeText(this@MainActivity, "Count Finished", Toast.LENGTH_SHORT).show()
                }

                override fun onClick(overageTime: Long) {
                    if (countTimeProgressView.isRunning) {
                        countTimeProgressView.cancelCountTimeAnimation()
                        Log.e("overageTime", "overageTime = " + overageTime)
                    } else {
                        countTimeProgressView.startCountTimeAnimation()
                    }
                }
            })
        }
        countTimeProgressView.startCountTimeAnimation()
    }
```
* xml에서 기본 세팅을 하지만 코틀린에서 재정의 할 수 있다. 


