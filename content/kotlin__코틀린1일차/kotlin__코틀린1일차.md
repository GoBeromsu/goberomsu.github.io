---
emoji: 🏃
categories: language
title: 코틀린 1 일차
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
cover: 
description: Simple recoder
---

## 간단한 Recoder 만들기

책도 있고 유튜브도 있으니까 일단 박치기로 만들어보면서 겪어 보기로 했다. 몸으로 겪는 것은 잘 까먹지 않기 마련이니

### MaiActivity.kt

```kotlin

class MainActivity : AppCompatActivity() {

    private var output: String? = null
    private var mediaRecorder: MediaRecorder? = null
    private var state: Boolean = false

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        button_start.setOnClickListener {
            if (ContextCompat.checkSelfPermission(
                    this,
                    android.Manifest.permission.RECORD_AUDIO
                ) != PackageManager.PERMISSION_GRANTED && ContextCompat.checkSelfPermission(
                    this,
                    android.Manifest.permission.WRITE_EXTERNAL_STORAGE
                ) != PackageManager.PERMISSION_GRANTED
            ) {
                //Permission is not granted
                val permissions = arrayOf(
                    android.Manifest.permission.RECORD_AUDIO,
                    android.Manifest.permission.WRITE_EXTERNAL_STORAGE,
                    android.Manifest.permission.READ_EXTERNAL_STORAGE
                )
                ActivityCompat.requestPermissions(this, permissions, 0)
            } else {
                startRecording()
            }
        }
        button_stop.setOnClickListener {
            stopRecording()
        }


    }

    private fun startRecording() {
        //config and create MediaRecorder Object
        val fileName: String = java.util.Date().getTime().toString() + ".mp3"
        output =
            Environment.getExternalStorageDirectory().absolutePath + "/Download/" + fileName //내장메모리 밑에 위치
        mediaRecorder = MediaRecorder()
        mediaRecorder?.setAudioSource((MediaRecorder.AudioSource.MIC))
        mediaRecorder?.setOutputFormat((MediaRecorder.OutputFormat.MPEG_4))
        mediaRecorder?.setAudioEncoder(MediaRecorder.AudioEncoder.AAC)
        mediaRecorder?.setOutputFile(output)

        try {
            mediaRecorder?.prepare()
            mediaRecorder?.start()
            state = true
            Toast.makeText(this, "레코딩 시작되었습니다.", Toast.LENGTH_SHORT).show()
        } catch (e: IllegalStateException) {
            e.printStackTrace()
        } catch (e: IOException) {
            e.printStackTrace()
        }
    }

    private fun stopRecording() {
        if (state) {
            mediaRecorder?.stop()
            mediaRecorder?.reset()
            mediaRecorder?.release()
            state = false
            Toast.makeText(this, "중지 되었습니다.", Toast.LENGTH_SHORT).show()
        } else {
            Toast.makeText(this, "레코딩 상태가 아닙니다.", Toast.LENGTH_SHORT).show()
        }
    }


}
```

- 자바랑 구성이 비슷하다. 조곰씩 다른 정도

  - 처음이라 클래스 안에 다 박아두고 했는데 기능이 단순해서 그럴 필요가 없기도하고 다음엔 나눠서해보자

- 코틀린은 상속을 콜론 : 으로 표현한다
- 코틀린은 null에 엄격한데 ?를 사용하면 null을 쓸 수 있다.
- 코틀린과 안드로이드 생명주기를 보면 프로그램이 실행되면 onCreate()부터 시작한다. 그래서 oncreate 자동생성 되는 거였음
  - oncreate()는 최초 1회만 실행된다
  - onstart()
    - 액티비티가 화면으로 보일때 실행되는 메소드
  - onpause()
    - 액티비티를 떠나는 경우 실행되는 메소드
  - onResume()
    - 액티비티가 시작되면 실행되는 메소드, onstart 다음으로 실행됨
  - onStop()
    - 액티비티가 화면에 보이지 않을 때 실행되는 메소드
  - ondestroy()
    - 액티비티가 메모리에서 제거될 때 실행되는메소드

![190527_Activity-LifeCycle](https://user-images.githubusercontent.com/37897508/87264079-0c923d00-c4fa-11ea-8065-90195f5db1ea.png)

* Toast는 뭔고 하니 잠깐씩 텍스트라던가 알림을 띄우는 기능이다
* 자바처럼 리스너를 이용해 움직이다
* 약간 체감상 mvc 모델 느낌이다 
  * Kotlin에서 짠 코드를 view(activity_main.xml)의 id와 연결한다

### activity_main.xml

```xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

    <ImageView
        android:id="@+id/imageView2"
        android:layout_width="285dp"
        android:layout_height="473dp"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent"
        app:srcCompat="@drawable/record" />

    <Button
        android:id="@+id/button_start"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginStart="100dp"
        android:layout_marginTop="28dp"
        android:text="Start"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toBottomOf="@+id/imageView2"
        android:layout_marginLeft="100dp" />

    <Button
        android:id="@+id/button_stop"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginTop="28dp"
        android:layout_marginEnd="100dp"
        android:text="Stop"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintTop_toBottomOf="@+id/imageView2"
        android:layout_marginRight="100dp" />

    <TextView
        android:id="@+id/textView"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_marginTop="52dp"
        android:text="Voice Recorder"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent" />
</androidx.constraintlayout.widget.ConstraintLayout>

```
* 뭐 그냥 안드로이드 스튜디오가 gui툴을 지원해줘서 쉽게한다 
* 코틀린과는 id를 통해서 연결한다
* html css 생각 나더라
### AndroidManifest.xml

```xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.test">
    <uses-permission android:name="android.permission.RECORD_AUDIO" />
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />

    <application
        android:allowBackup="true"
        android:icon="@mipmap/ic_launcher"
        android:label="@string/app_name"
        android:roundIcon="@mipmap/ic_launcher_round"
        android:supportsRtl="true"
        android:theme="@style/AppTheme">
        <activity android:name=".MainActivity">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />

                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
    </application>

</manifest>
```
* 우리가 만들 앱(실행 파일)의 권한을 지정해준다.
* DB 정의 하는 느낌? 아이콘은 뭘 쓸 것인가 어떤 권한이 있는가 필터를 적용할 것인가
* manifest에 등록하지 않으면 파일간 연결이 안된다