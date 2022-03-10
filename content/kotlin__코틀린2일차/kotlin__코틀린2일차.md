---
emoji: 🏃
categories: language
title: 코틀린 2일차
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
cover: 
description:
---

## 2일 차를 시작하면서

글을 쓸 때마다 코드를 다 붙여 넣을 수 없으니 커밋을 할 때 기능 별로 나눠서 해야겠다란 생각이 들었다. 그냥 남기기 용도라 팀플 할 때 빼면 거의 신경 안썼는데 이런게 기본이지 않나 습관 들여야겠다.

## 화면 추가 및 연결

- 원리는 간단하다. 액티비티 추가, manifest에 액티비티 추가, xml 파일 추가
  - 액티비티(기능), xml(화면), manifest(허락 받기?)

```kotlin
        button_list.setOnClickListener {
            var intent = Intent(this, PlaylistActivity::class.java)
            startActivity(intent)
        }
```

- 위의 코드는 mainActivity의 버튼 코드이다
  - intent 안에 PlaylistActivity 추가
  - 액티비티 추가

## 레코딩 된 파일 읽어오기

```kotlin
class PlaylistActivity : AppCompatActivity() {

    var mp3Path: String = Environment.getExternalStorageDirectory().absolutePath + "/Download/"
    var listFiles = File(mp3Path).listFiles()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.playlist)

        var fileName: String? = null
        var extName: String? = null
        var mp3List = mutableListOf<String>()

        for (file in listFiles) {
            fileName = file.getName()
            extName = fileName.substring(-3)
            if (extName == "mp3") {
                mp3List.add(fileName)
            }
        }

        button_back.setOnClickListener {
            var intent = Intent(this, MainActivity::class.java)
            startActivity(intent)
        }
    }
```

1. Download 폴더 내 파일들을 listfiles()로 가져온다
2. 가져온 파일들 중 확장자(뒤의 3자리)가 mp3인 파일의 이름을 mp3List에 넣는다

* 이제 mp3 파일만 불러와서 출력하면 된다.

### 에러 사항

* 파일이 배열에 추가가 안되길래 뭐지? 했는데 원래 코틀린에서 arraylist는 추가 불가능이란다
  * 그래서 mutablelist로 바꿔서 선언했다.
* 리스트 뷰를 만드려고 했는데 계속 실패했다. 
  * 리스트 뷰는 어댑터가 필요한데 어댑터에 대한 이해가 부족했다.
* 일단 어댑터가 구현이 안되서 빼고 실행했는데 화면이 꺼져서 뭔가했더니 안드로이드가 원래 그런가 에러가 발생하면 그냥 안된다
  * 말하고 보니 당연한거같네

## 앞으로 할일

* 디버깅 할 때 편하게 중간 중간 진행사항 출력하게 만들어야겠다
  * println같은 걸로