---
emoji: 🏃
categories: etc
title: 관계 데이터베이스 언어(SQL)(실기)
author: 범수
date: '2022-03-10 18:00:00'
tags: 블로그
description:
---

## SQL

- SQL
  - 관계 데이터 베이스에서 사용되는 대표적인 언어
  - 관계 대수와 관계 해석을 기초로함

### DDL

- 관계 데이터 베이스에서 사용될 테이블, 스키마, 도메인, 인덱스 , 뷰등을 정의하거나 수정, 제거하기 위해 사용되는 언어

#### CREATE

- 정의 및 생성을 하기위해 사용하는 명령어
- 괄호의 의미
  - {} : 반복
  - [] : 생략 가능
  - | : 선택

* CREATE TABLE 테이블\_이름 : 테이블 생성
* {속성*이름 데이터*타입} : 테이블을 구성하는 속성 수 만큼 속성 이름과 데이터 타입 기입
  - [NOT NULL]
    - 테이블 생성 시 특정 속성 값에 'NULL'이 없도록 지정할 때 사용하며 생략 가능
* PRIMARY KEY(속성이름)
  - 기본 키 속성 지정할 때 사용
* UNIQUE(속성\_이름)
  - 대체키 지정 시 사용
  - 속성의 모든 값이 고유한 값을 가지도록 지정할 때 사용
* FOREIGN KEY(속성 이름)
  - 외래키를 지정할 때 사용
  - FOREIGN KEY(속성 이름)
    - 외래키로 사용될 속성 이름 기입
  - REFERENCES 참조 테이블(속성 이름)
    - 참조 테이블(속성 이름)
    - 참조할 테이블 이름과 속성 이름 기입
* CONSTRAINT 제약 조건*이름 CHECK(속성*이름 = 범위 값)

  - 테이블을 생성할 때 특정 속성에 대해 속성 값의 범위를 지정할 때 사용

* 외래키 지정 옵션

  - ON DELETE
    - 참조 테이블 튜플 삭제시 기본 테이블은 어떤 형태로 대처할지 선택
  - ON UPDATE
    - "" 변경되면 기본 테이블은 어떤 형태로 대처할지 선택
  - CASCADE
    - 참조 테이블의 튜플에 삭제 변화가 있는 경우 기본 테이블도 같이 연쇄적으로 삭제/변화가 되도록 할 때 사용
  - SET NULL
    - 참조 테이블의 튜플에 삭제 변화가 있는 경우 기본 테이블의 관련된 속성 값을 NULL 값으로 변경할 때 사용
  - SET DFUALT
    - 참조 테이블의 튜플에 삭제 변화가 있는 경우 기본 테이블의 관련 속성 값을 기본 값으로 변경할 때 사용
  - NO ACTION
    - 참조 테이블의 튜플에 삭제 변화가 있는 경우 기본 테이블에 아무런 변화가 없도록 지정할 때 사용

* DATA TYPE

  - 데이터의 유형을 말한다.
  - 데이터 타입의 종류
    - 정수
      - INT
    - 실수
      - FLOAT REL
    - 고정길이 문자
      - CHAR()
    - 가변길이 문자
      - VARCHAR
    - 시간
      - TIME
    - 날짜
      - DATE

* 스키마 정의
  - CREATE SCHEMA 스키마\_이름 AUTHORIZATIO 사용자;
* 도메인 정의
  - CREATE DOMAIN 도메인\_이름 데이터\_타입 [DEFAULT 기본값][ constraint 제약조건_이름] CHECK(VALUE IN(범위 값))
* 인덱스 정의
  - CREATE [UNIQUE] INDEX 인덱스\_이름 ON 테이블\_이름(속성\_이름 [ASC|DESC])[CLUSTER];
  - UNIUQE
    - 중복을 허용하지 않도록 인덱스 생성
  - ON 테이블\_이름(속성\_이름)
    - 지정된 테이블의 속성으로 인덱스를 만듬

#### ALTER

- 기존에 만들어진 테이블에 새로운 속성을 추가하거나 기존 속성을 변경 삭제할 때 사용하는 명령어

- ALTER TABLE 테이블 이름 - ADD 속성\_이름 데이터\*타입 [DEFAULT];
- ALTER TABLE 테이블 이름 - ALTER 속성\_이름 [SET DEFAULT];
- ALTER TABLE 테이블 이름 - DROP 속성\_이름 [CASCADE | RESTRICT];

#### DROP

- DROP TABLE 테이블\_이름 [CASCAD|RESTRICT];
- DROP SCHEMA 스키마\_이름 [CASCAD|REASTRICT];
- DROP DOMAIN 도메인\_이름 [CASCAD|REASTRICT];
- DROP VIEW 뷰\_이름 [CASCAD|REASTRICT];
- DROP INDEX 인덱스\_이름;
- DROP CONSTRAINT 제약조건\_이름'

### DML

- 데이터베이스 내의 자료를 실제 사용자가 이용하기 위한 언어

#### SELECT(검색문)

- SELET [DISTINCT] 속성\_이름 FROM 테이블\_이름 [WHERE 조건]GROUP BY 속성\_이름 [HAVING 그룹 조건]][ORDER BY 속성\_이름 [ASC | DESC]];
  - WHERE
    - 검색에 필요한 조건 기술
    - 관계 연산자와 논리 연산자 등의 다양한 연산자를 이용할 수 있음
    - BETWEEN A AND B
      - A와 B 사이 값 고르기
  - GROUP BY
    - 작업의 효율을 위해 한 속성 값을 그룹으로 분류하고자 할 때 사용
    - HAVING : GROUP BY에 의해 그룹으로 분류한 후 조건을 제시할 때 사용
  - ORDER BY
    - 검색하고자 하는 속성 값을 정렬하여 검색하고자 하는 경우 사용
    - 생략시 오름차순 정렬, 정렬 기준은 2가지 이상 주어질 수 있음

* 집계 함수를 이용한 검색문
  - SUM(속성\_이름)
  - AVG(속성\_이름)
  - MAX(속성\_이름)
  - MIN(속성\_이름)
  - COUNT(속성\_이름)
* AS

  - 속성 이름 기술

* 하위 질의문
  - 질의문 안의 질의문
  - WHERE 속성 IN(질의문)
  - EXISTS( 질의문 )
* 부분 매치 질의문
  - 조건문 작성 시 자료의 일부를 가지고 비교하여 검색하는 질의문
  - % : 여러 문자
  - \_ : 한 자리
  - %과 \_ 사용시 = 대신 LIKE 사용
* NULL 과 비교시 IS 사용

* JOIN 질의문
  - 테이블1 JOIN 테이블2 ON [조인 조건]
  - JOIN ~ ON 질의문
  - JOIN ~ USING(속성)

#### INSERT

- INSERT INTO 테이블\_이름[(속성\_이름...)] VALUES (자료...);
  - 테이블의 모든 속성 값을 가지고 있는 경우 속성 이름을 생략해도 괜찮다
- VALUES
  - 각 속성에 삽입될 실제 자료

#### UPDATE

- UPDATE 테이블*이름 SET 속성*이름 = 변경 내용 [WHERE 조건];
  - UPDATE 테이블\_이름
  - SET 속성\_이름=변경 내용

#### DELETE

- DELETE FROM 테이블\_이름 [WHERE 조건];

### DCL

- COMMIT
  - 데이터베이스 내의 연산이 성공적으로 종료되어 연산에 의한 수정 내용을 지속적으로 유지하기 위한 명령어
  - SQL에 의해 수정된 내용을 유지시키는 명령어
- ROLLBACK
  - 연산이 비정상적으로 종료되거나 정상적으로 수행이 되었다하더라도 수행되기 이전 상태로 되돌리기 위한 명령어
  - 연산 내용을 취소할 때 사용
- GRANT
  - 관리자가 사용자에게 데이터베이스에 대한 권한을 부여하기 위한 명령어
    - GRANT 권한 내용 ON 테이블 \_이름 TO 사용자 [WITH GRANT OPTION];
    - WITH GRANT OPTION이란
      - 사용자가 관리자로부터 받은 권한을 다른 사용자에게 줄 수 있는 권한까지 주는 것
- REVOKE
  - 관리자가 사용자에게 부여했던 권한을 취소하기 위해 사용되는 명령어
  - REVOKE 권한 내용 ON 테이블_이름 FROM 사용자 [CASCADE]
