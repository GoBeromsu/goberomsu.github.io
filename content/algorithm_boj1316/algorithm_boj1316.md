---
title: 백준 1316 - 그룹 단어 체커
categories: algorithm
emoji: 🏃
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
---
<!-- 
튜토리얼, 하우 투 가이드, 설명 ,레퍼런스 
https://documentation.divio.com/tutorials/
-->

# 백준 1316 - 그룹 단어 체커

## 문제

주어진 N 개의 단어들 중 그룹 단어는 몇 개인가?

## 그룹 단어란

단어에 존재하는 모든 문자에 대하여 각 문제가 연속적으로 나타나는 단어를 말한다.

aaabb는 그룹 단어이지만, aabba는 그룹 단어가 아니다

## 문제 풀이 

### 주요 아이디어

단어에 존재하는 문자의 연속되는 최대 길이와 단어 내에 해당 문자가 몇 개있는지 비교한다.

두 값이 같을 경우에만 그룹 단어이다

### 풀이 순서

1. 단어에 존재하는 문자의 연속되는 최대 길이를 Value, 해당 문자를 Key로 딕셔너리에 저장한다.
2. 딕셔너리의 Value와 단어 내 문자의 갯수가 일치하는지 확인
3. 일치하는 경우 checkPoint를 참으로 반환하고, count를 올린다.
4. count 출력

### Code

```python
import sys 

num = int(sys.stdin.readline())
strArr=[]
count = 0

for i in range(num):
    strArr.append(sys.stdin.readline().rstrip())

for i in range(len(strArr)):
    word= strArr[i]
    dic={}
    checkPoint=True
    for j in range(1,len(word)):
        if(word[j-1]==word[j]):
            if(j==1):
                dic[word[j-1]]=1
            dic[word[j]] +=1
        elif(word[j] in dic.items()):
            continue
        else:
            dic[word[j]]=1
    for key,value in dic.items():
        if(word.count(key)!=value):
            checkPoint=False
            break
    if(checkPoint is True):
        count+=1
print(count)
```