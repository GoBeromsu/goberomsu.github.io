---
emoji: 🏃
categories: language
title: 코틀린3일차
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
cover: 
description:
---

## 시간 출력 오류 수정

- 분명히 시간과 함께 수정되도록 해놓았는데 [쓰레기 값].mp3로 저장되서 수정했다!

```kotlin
  val timeFormat = SimpleDateFormat("yyyyMMddHHmm")
  val time = timeFormat.format(java.util.Date())
  val fileName: String = time + ".mp3"
```
* SimpleDateFormat()을 이용해 시간 포맷을 설정했더니 해결되었다.

## listview listener 설정

```kotlin
        setContentView(R.layout.playlist)
        view_mp3.adapter = ArrayAdapter(this, android.R.layout.simple_list_item_1, mp3List)

        view_mp3.onItemClickListener =
            AdapterView.OnItemClickListener { parent, view, position, id ->
                val seletedVoice = parent.getItemAtPosition(position) as String

                Toast.makeText(this, "${Environment.getExternalStorageDirectory()}/Download/"+seletedVoice, Toast.LENGTH_SHORT).show()

                audioPlay.setDataSource("${Environment.getExternalStorageDirectory()}/Download/"+seletedVoice)
                
                audioPlay.prepare()
                audioPlay.start()
            }
```

* ArrayAdapter로 리스트뷰와 배열을 연결한다
* onItemClickListener를 정의한다
  * 클릭한 아이템의 포지션을 문자열로 받는다
    * 받은 문자열의 이름을 toast로 알림
    * download 하위 파일 중 같은 이름의 mp3 파일을 찾아 재생

* mediaplay에서 prepare 하지 않으면 start 못함

## 향후 계획

* 재생도 되고 리스트뷰도 완성했는데 여기서 완성도를 더 높여야할까?
  * 찝찝할 거 같기도 하고 흠 고민 중이다ㅣ
* 정보가 파편화되어있어서 공부하는데 어렵다
  * docs 보면서 공부하는 즁