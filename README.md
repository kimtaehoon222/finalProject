# Easy Work

> **KH 정보 교육원**에서 진행한 파이널 프로젝트입니다. 
**이지워크**는 직원들 간 의사소통 및 정보 공유를 원활하게 해주며 비대면으로 가능한 다양한 기능들을 통해 업무 만족도 및 효율을 높여주는 **그룹웨어** 프로그램 입니다. 
개인화/그룹화 된 서비스를 제공하고 효율적인 업무 관리를 통해 직원 간 원활한 정보 공유 및 협업 소통을 지원합니다.
> 

## ✍️ **목차**

1. 개발 환경
2. 프로젝트 설계 주안점
3. 구현 기능
4. 팀원 및 주 담당 기능
5. 프로젝트 화면

## ⚙️ **개발 환경**

- **Language**
    - JAVA 8
    - HTML5
    - CSS3
    - JavaScript
    - JSP
    - SQL
- **Database**
    - Oracle 11g
- **Web Server & WAS**
    - Apache-Tomcat 9.0.60
- **Framework & Library**
    - Spring Framework(STS 3)
    - MyBatis 3.5.6
    - jQuery 3.6.0
    - Gson
    - Json
    - FullCalendar
    - GoogleChart.js
    - Chart.js
    - JSTL Core
    - EL
    - Ajax
    - Lombok
- **Tools & ETC**
    - GitHub
    - Oracle SQL Developer
    - Notion
    - Bootstrap

## ✅ **프로젝트 설계 주안점**

- 기본 C, R, U, D를 활용하여 완성도 높은 프로그램 개발
- 결재 관리, 메일 관리, 개인 및 부서 일정 관리, 출퇴근 및 휴가 관리, 1대1 채팅, 인사 관리
- 사용자 편의성 증대를 위한 직관적인 UI 설계
- 유사 프로그램의 세밀한 분석을 통한 차별화 기능에 중점
- 서비스 간 원활한 호환

## 🛠️ **구현 기능**

- **로그인 관련** : 로그인/로그아웃 기능, login 인터셉터 기능, 로그인 계정 별 권한에 따른 인사 페이지 접근 제한 기능
- **메인 페이지 구성** : '오늘의 일정' 연동, '결재 관리’ 연동, ‘읽지 않은 메일’ 연동, 메일 수신 알람 기능, 채팅 도착 알람 기능, 출/퇴근 기능, ‘이번 달 입사자’ 연동, 날씨 API를 통한 날씨 정보 확인, 실시간 날짜 및 시간 확인 가능
- **메일 관리** : 메일 송신(보낸 메일함), 예약 메일 발송(예약 메일함), 예약 메일 발송 취소, 메일 수신(받은 메일함), 주소록 조회, 참조인 선택, 메일 삭제, 메일 영구삭제, 메일 복원, 답장 및 전달
- **근태 관리** : 출근/퇴근 기능, 상태 표시(온라인, 오프라인, 자리비움), 휴가 관리 및 누적 근무 현황 조회
- **인사 관리** : 사원 주소록 조회, 퇴사자 및 미승인 직원 관리, 직원 정보 수정, 직원 정보 삭제
- **일정 관리** : 개인 및 부서 일정 등록, 일정 수정, 일정 삭제, 월간 및 주간 일정 관리, 해야할 일 목록 등록/수정/삭제
- **결재 관리** : 품의서 작성, 휴가원 작성, 결재 수정, 결재 삭제, 결재 승인 및 반려, 결재 현황 조회
- **회의실 예약** : 예약 현황 조회, 회의실 예약, 예약 취소, 예약 목록 조회
- **1:1 채팅** : 부서별 직원 조회, 48시간 이후 채팅 내역 자동 삭제
- **통계** : 연도 및 월 별 부서 메일 수/발신 현황 집계, 부서 및 직급 별 급여 비율 및 누적 합계, 연도 및 월 별 입사자 및 퇴사자 현황 집계 → 리스트 및 그래프 출력
- **회계 관리** : 부서 별 법인 카드 지출 내역 관리, 결제 내역 등록 및 조회, 결제 현황 그래프

## 👥 **팀원 및 주 담당 기능**

![](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/7dbf9cc0-f434-4104-b2e4-b3a9ae3ce2c6/Untitled.png)

## 🖥️ **프로젝트 화면**

![mainHome](https://user-images.githubusercontent.com/81502408/178286818-afa0aadc-4ec5-4097-bc0f-d24c34e6867e.png)

메인 홈 

![메일 홈 ](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/79db6df5-2aa3-4545-8fb2-9c719a3f74ae/Untitled.png)

메일 홈 

![메일 작성](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b1adbe7e-f8a5-4022-b7c9-cae729daec0d/Untitled.png)

메일 작성

![받은 메일함](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/6310033c-48e7-4a85-b547-94ccb0c8cb43/Untitled.png)

받은 메일함
