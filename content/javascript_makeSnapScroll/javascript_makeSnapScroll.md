---
emoji: 🏃
categories: language
title: 바닐라 자바스크립트로 Snap scroll 구현
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
description: 나름의 계획은 있었다 삽질하기 전까진
---

## 사전 조사

### Snap-Scroll 구현 방안

스냅 스크롤은 [fullPage.js](https://alvarotrigo.com/fullPage/ko/)나 이번에 CSS 업데이트하면서 추가된 CSS-Snap-Scroll 기능으로 구현한다

보통 스크롤을 트리거로 사용해 페이지를 바꾸는걸 목적으로하는데 나같은 경우 한 페이지 내에서 제목 단위로 애니메이션을 구현하고 싶었다.

스크롤을 한 번 하면 다음 제목까지 주르륵 내려가는 애니메이션을 상상했는데 찾아보니 가장 비슷한 애니메이션이 Snap-scroll 애니메이션이었다. 하지만 fullPage.js나 css 내장 Snap-Scroll 기능을 사용했지만 실패해서 바닐라 자바스크립트로 구현해보기로 했다

(2021.09.22) CSS-SNAP-Scroll 도전해봤는데 안된다. 내가 포스트를 쓰면 템플릿 엔진을 거쳐서 포스트를 html로 변환한다. page-content div 하위에 h2 태그 기준으로 div를 묶어 올리려면 엔진을 뜯어 고쳐야하는 것도 문제인데 CSS-SNAP-Scroll을 쓰더라도 내 생각대로 구현하려면 별도의 스크롤을 또 써야한다

#### 블로그 소스 분석

현재 내가 쓰고 있는 theme은 [Butterfly](https://github.com/jerryc127/hexo-theme-butterfly)이다.
butterfly 테마의 layout 디렉터리 하위의 post.pug를 보면 포스트의 내용들이 page-content 클래스 하위에 뿌려진다.

![post-pug](/img/makeSnapScroll_pug.jpg)
![블로그 포스트의 html 소스](/img/makeSnapScroll_pageContent.jpg)

post 레이아웃은 /source/css/\_layout/post.styl에 정의되어 있다.
레이아웃은 css 프리프로세서인 styl을 사용해 아래 사진의 beautify()처럼 함수로 형식들을 묶어서 사용하고 있었다.

![post.styl](/img/makeSnapScroll_css.jpg)

## 구현

### 목표 && 아이디어

태그들과 현재 뷰포트의 절대 위치를 계산 후 뷰포트의 탑과 가장 가까운 태그로 이동하게 한다

- 뷰포트 내에 H2 Tag가 유일할 때만 애니메이션을 실행 시킨다
- 뷰포트의 3 등분하여 최상단을 제외한 영역에 h2 태그가 있을 때 애니메이션을 실행한다
- 다운 스크롤 할 때만 애니메이션을 실행한다

#### 아이디어

1. h2 태그들의 위치를 세션 브라우저에 저장하자
2. 태그들의 절대위치만 기억해두고, 뷰포트 안에 있는지만 체크해서 애니메이션을 실행시키면 되지 않을까?

### Source Code

```js
const h2Tags = document.querySelectorAll("h2");
const viewPortHeight = document.documentElement.clientHeight;
let bPosition = document.documentElement.scrollTop;
const h2Height = 42;
const viewPortDownBuffer = 150;
let count;

const setTagsStorage = function () {
  count = 0;
  for (tag of h2Tags) {
    count++;
    sessionStorage.setItem(count, tag.offsetTop - h2Height);
    console.log("tag" + count + " : " + sessionStorage.getItem(count));
  }
};
setTagsStorage();

const getTag = function (tagNum) {
  return parseInt(sessionStorage.getItem(tagNum));
};

const getTagsLength = function () {
  return h2Tags.length;
};

// 뷰포트 높이의 2/3 ~ 1 안에 태그가 있는가
const checkInTag = function () {
  for (count = 1; count <= getTagsLength(); count++) {
    if (
      window.pageYOffset <= getTag(count) &&
      getTag(count) < window.pageYOffset + (viewPortHeight - viewPortDownBuffer)
    ) {
      return true;
    }
  }
  return false;
};

const checkTagOnTop = function () {
  for (count = 1; count <= getTagsLength(); count++) {
    if (
      window.pageYOffset < getTag(count) &&
      getTag(count) < window.pageYOffset + 20
    ) {
      return true;
    }
  }
  return false;
};

const checkDown = function () {
  const aPosition = document.documentElement.scrollTop;
  if (bPosition < aPosition) {
    bPosition = aPosition;
    return true;
  }
  bPosition = aPosition;
  return false;
};
const snapScroll = function () {
  if (!checkTagOnTop() && checkInTag()) {
    scrollBy(0, 10);
  }
};

window.addEventListener("scroll", function () {
  if (checkDown()) {
    snapScroll();
  }
});
```

### function 설명

#### setTagsStorage

```js
const setTagsStorage = function () {
  count = 0;
  for (tag of h2Tags) {
    count++;
    sessionStorage.setItem(count, tag.offsetTop - h2Height);
  }
};
```

setTagsStorage는 문서의 상단부터 순차적으로 h2 태그들의 위치를 세션 스터리지에 저장하는 함수이다

태그 값들을 저장하기 위해서는 세션 스터리지를 이용했는데 태그들의 위치만 저장하면 되는 간단한 일이라 데이터베이스를 이용해야할 필요성을 못 느껴 브라우저에 저장하는게 나을 것 같다 생각했기 때문이다

브라우저에 데이터를 저장하는 방법으로는 로컬 스터리지, 세션 스터리지 등이 있는데 로컬 스터리지 같은 경우 브라우저에 값이 저장된 후 사용자가 따로 제거하지 않을 경우 계속 저장되기 때문에 사용하지 않았다.

세션 스터러지 같은 경우는 브라우저를 닫을 때 저장된 값들이 지워진다.

(2021.10.03) 그럼에도 페이지를 떠날 때 세션 스터리지 값을 지우는게 좋은데 아직 구현하진 않았다. 일단은 페이지를 옮길 때 마다 태그 값들을 덮어 씌워서 작동하고 있다.
#### getTags

```js
  const getTag = function (tagNum) {
    return parseInt(sessionStorage.getItem(tagNum));
  };
```

getTag는 브라우저에 저장되어 있는 값들을 키 값을 이용해 가져오는 메소드이다.
세션 스터리지에 저장된 value는 String이라서 정수로 바꿔준 후 반환하게 하였다.

#### getTagsLength
```js
  const getTagsLength = function () {
    return h2Tags.length;
  };
```

h2Tags는 document의 쿼리 셀렉터로 문서 내 h2 값들이 저장되어 있는 노드 배열이다.

문서 내 h2 값들이 얼마나 저장되어 있는지 알 수 있다.

#### checkInTag
```js
  const checkInTag = function () {
    for (count = 1; count <= getTagsLength(); count++) {
      if (
        window.pageYOffset <= getTag(count) &&
        getTag(count) <
          window.pageYOffset + (viewPortHeight - viewPortDownBuffer)
      ) {
        return true;
      }
    }
    return false;
  };
```

checkInTag는 현재 뷰포트(브라우저가 유저에게 현재 보여주고 있는 화면)에 태그가 있다면 true를 반환하는 함수이다
단 뷰포트에서 하단에서는 애니메이션을 발생시키고 싶지 않아 viewPortDownBuffer를 이용해 뷰포트 크기를 제한했다.

#### checkTagOnTop
```js
  const checkTagOnTop = function () {
    for (count = 1; count <= getTagsLength(); count++) {
      if (
        window.pageYOffset < getTag(count) &&
        getTag(count) < window.pageYOffset + 20
      ) {
        return true;
      }
    }
    return false;
  };
```

뷰포트 최상단에 태그가 현재 위치해 있다면 true를 반환하는 함수이다. 
스크롤 속도가 너무 빠르면 정해 놓은 값을 지나가버리는 버그가 있어서 뷰포트 상단 값과 비교하는게 아니라 뷰포트 상단 일정 범위 내에 있는지 체크하게 함수를 수정했다.


#### checkDown
```js
  const checkDown = function () {
    const aPosition = document.documentElement.scrollTop;
    if (bPosition < aPosition) {
      bPosition = aPosition;
      return true;
    }
    bPosition = aPosition;
    return false;
  };
```

스크롤 이벤트가 발생하면 스크롤의 현재 위치와 마지막 위치를 비교해 스크롤이 아래로 내려가고 있는지 확인하는 함수이다.

애니메이션을 다운 스크롤할 때만 애니메이션을 발생시키고 싶어서 추가했다.

#### snapScroll 애니메이션 구현
```js
  const snapScroll = function () {
    if (!checkTagOnTop() && checkInTag()) {
      scrollBy(0, 10);
    }
  };

  window.addEventListener("scroll", function () {
    if (checkDown()) {
      snapScroll();
    }
  });
```

scrollby는 현재 위치에서 스크롤을 지정한 픽셀만큼 이동시키는 함수이다. 
위에 서술한 check 함수들을 스크롤 이벤트가 발생할 때 마다 체크해서 이동하게 만들었다.


## 피드백

1. 알고리즘 공부의 필요성을 느꼈다.
    개발은 문제 해결의 연속이다. 코드를 몇 번 갈아 엎다보니, 근본적으로 알고리즘 능력이 좋았다면 더 빠르게 만들 수 있지 않았을까 싶었다. 지금 내가 짜는 코드가 얼마나 효율적인지 가늠이 안되니까 조심스럽기도 했고, 갑자기 브라우저에서 메모리 소모가 심하다고 알림이 뜨고 하니 이래서 다들 알고리즘 공부를 하는구나 새삼 알아가는 시간이었다.
2. 테스트 케이스나 코드를 작성하지 않고 만들었다
    console.log를 열심히 찍어가며 함수들을 구현했지만, 테스트 코드를 사용하지 않은게 아쉽다. 코드가 몇 십 줄 밖에 안되는데 중간 중간 헤맨적이 있는데 좀 더 덜 헤맬 수 있지 않았을까 싶다