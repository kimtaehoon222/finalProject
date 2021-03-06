# EasyWork

> **KH 정보 교육원**에서 진행한 파이널 프로젝트입니다. 
**EasyWork**는 직원들 간 의사소통 및 정보 공유를 원활하게 해주며 비대면으로 가능한 다양한 기능들을 통해 업무 만족도 및 효율을 높여주는 **그룹웨어** 프로그램 입니다. 
개인화/그룹화 된 서비스를 제공하고 효율적인 업무 관리를 통해 직원 간 원활한 정보 공유 및 협업 소통을 지원합니다.
> 

## ✍️ **목차**

1. 개발 환경
2. 프로젝트 설계 주안점
3. 구현 기능
4. 팀원 및 주 담당 기능
5. ERD
6. 프로젝트 화면

## ⚙️ **개발 환경**

- **Language**
    - JAVA 8
    - JavaScript
- **Database**
    - Oracle 11g
- **Web Server & WAS**
    - Apache-Tomcat 9.0.60
- **Library**
    - jQuery 3.6.0
    - Gson, Json
    - FullCalendar
    - GoogleChart.js, Chart.js
    - Lombok
- **Skill Stack**
    - Spring
    - MyBatis
    - Ajax
- **Collaboration Tools**
    - GitHub
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

![Untitled (1)](https://user-images.githubusercontent.com/81502408/178287588-43a47912-4a19-43c0-b122-0c7c8532213d.png)

## 🏗️ **ERD**
![2asy work (2)](https://user-images.githubusercontent.com/81502408/178409279-fe8c4bd0-1a6f-4b3c-b303-8faf187f1a39.png)

## 🖥️ **서비스 화면**

### [회원가입]
![회원가입](https://user-images.githubusercontent.com/81502408/178290689-6d499681-a1b8-4744-8ea4-ed08ad034c5b.JPG)
### [로그인]
![로그인](https://user-images.githubusercontent.com/81502408/178290692-42da72c7-c16b-416f-85a5-9952a3e79101.JPG)
### [메일관리 - 메인 페이지]
![mainHome](https://user-images.githubusercontent.com/81502408/178286818-afa0aadc-4ec5-4097-bc0f-d24c34e6867e.png)
### [메일관리 - 홈]
![메일홈](https://user-images.githubusercontent.com/81502408/178290652-28d38bc4-bb6e-4323-ba95-3e2d61757c3c.JPG)
### [메일관리 - 받은 메일함]
![받은메일함](https://user-images.githubusercontent.com/81502408/178290667-bfb481a1-7aa7-47c7-b9cd-522d5a445117.JPG)
### [메일관리 - 보낸 메일함]
![보낸메일함](https://user-images.githubusercontent.com/81502408/178290672-aae7f906-cab7-418f-b793-1535e7440d10.JPG)
### [메일관리 - 예약 메일함]
![예약메일함](https://user-images.githubusercontent.com/81502408/178290679-2e212328-3622-4c3d-8ddf-5ff3621cc92f.JPG)
### [메일관리 - 휴지통]
![휴지통](https://user-images.githubusercontent.com/81502408/178290703-72489f88-d682-4a3d-acae-6ddf005ccbb0.JPG)
### [메일관리 - 메일 작성]
![메일작성하기](https://user-images.githubusercontent.com/81502408/178290724-caa9cfd8-84b0-42af-98a5-72ef59c5162c.JPG)
### [메일관리 - 메일 상세조회]
![메일상세](https://user-images.githubusercontent.com/81502408/178290734-eb59ebef-58cb-4126-a3ce-8b9b02a8ab19.JPG)
### [메일관리 - 수신인 및 참조인 주소록]
![메일주소록](https://user-images.githubusercontent.com/81502408/178290742-fa071268-183c-482e-bbb1-755d07a46399.JPG)
### [결재관리 - 홈]
![결재홈](https://user-images.githubusercontent.com/81502408/178412597-e10b5998-2fae-45d1-bc46-62580e93d9ab.JPG)
### [결재관리 - 결재 대기함]
![내결재대기](https://user-images.githubusercontent.com/81502408/178412605-b69da396-6c7c-4072-8336-061e0d52358a.JPG)
### [결재관리 - 요청 결재함]
![요청결재함](https://user-images.githubusercontent.com/81502408/178412620-f423c19c-83e9-4449-995d-ca2ecf39ed78.JPG)
### [결재관리 - 결재 상세조회(등록 및 수정)]
![결재상세](https://user-images.githubusercontent.com/81502408/178412599-6bfc7ec0-6e83-49cc-b300-d084cfa5b746.JPG)
### [결재관리 - 결재 상세조회(협조문-반려)]
![협조문](https://user-images.githubusercontent.com/81502408/178467657-f1f1d168-f513-4c93-9ffc-3ae44e5d630c.jpg)
### [결재관리 - 결재 상세조회(품의서-완료)]
![품의서](https://user-images.githubusercontent.com/81502408/178467667-c7ac72a2-81d8-42b0-bc18-95ce70785a8e.jpg)
### [회의실 예약 - 예약 현황조회]
![회의실](https://user-images.githubusercontent.com/81502408/178412713-24772c3c-3072-4180-9660-56d01c8126c1.JPG)
### [회의실 예약 -예약하기]
![회의실예약](https://user-images.githubusercontent.com/81502408/178412717-43ec12e3-e5d6-43ce-8935-4af6ac6394ab.JPG)
### [회의실 예약 - 예약 상세조회]
![회의실상세](https://user-images.githubusercontent.com/81502408/178412725-f520950f-2ccb-476c-ad20-f6766247477a.JPG)
### [근태관리 - 근태 현황조회]
![근태홈](https://user-images.githubusercontent.com/81502408/178412624-6b495f6a-6fd5-499e-916e-75e19e914610.JPG)
### [근태관리 - 연차 내역조회]
![연차내역](https://user-images.githubusercontent.com/81502408/178412638-10c1cf2f-1e7c-47af-a87c-12f16f4067d7.JPG)
### [채팅 - 1:1 실시간 채팅]
![채팅](https://user-images.githubusercontent.com/81502408/178412653-c94de6a1-4863-467d-a827-75f4626ed667.JPG)
### [일정관리 - 월간 일정]
![월간일정](https://user-images.githubusercontent.com/81502408/178413641-9d043f25-399b-4ed9-bac3-e90299afeae5.JPG)
### [일정관리 - 주간 일정]
![주간일정](https://user-images.githubusercontent.com/81502408/178413647-963e82f0-299f-40ba-a942-f1dd8489d13c.JPG)
### [일정관리 - 일정 목록조회]
![일정목록](https://user-images.githubusercontent.com/81502408/178413669-98cd3cdd-bf42-4721-8b2d-1e8afd2a5aad.JPG)
### [일정관리 - 일정 검색]
![일정검색](https://user-images.githubusercontent.com/81502408/178413686-01f619d9-74e0-441e-8e8b-5c1768b62c45.JPG)
### [일정관리 - 일정 등록]
![일정등록](https://user-images.githubusercontent.com/81502408/178413697-74e76770-dccc-4aa8-a0a1-9f2caa7ce6c5.JPG)
### [일정관리 - 일정 상세조회]
![일정상세](https://user-images.githubusercontent.com/81502408/178413808-7c466183-d956-46e4-bac1-33375d039f80.JPG)
### [회계관리 - 홈]
![회계관리 홈](https://user-images.githubusercontent.com/81502408/178414871-8b9ad573-2fb0-46e0-ac42-6d4dad1f7804.JPG)
### [회계관리 - 사용내역 검색]
![사용내역검색](https://user-images.githubusercontent.com/81502408/178414896-3d273554-3287-4f56-924b-7a262c06ddd6.JPG)
### [회계관리 - 사용내역 등록]
![사용내역등록](https://user-images.githubusercontent.com/81502408/178414908-427ab567-ab13-4921-9887-737bdc9de764.JPG)
### [회계관리 - 사용내역 상세조회]
![사용내역상세](https://user-images.githubusercontent.com/81502408/178414914-a5133b0f-475c-40d5-a502-e5f92af773c3.JPG)
### [직원 주소록 - 직원 주소록]
![직원주소록](https://user-images.githubusercontent.com/81502408/178414826-bde81472-4c7c-4b67-8a84-b8b43c4c19a4.JPG)
### [직원 주소록 - 직원 검색]
![직원검색](https://user-images.githubusercontent.com/81502408/178414832-1b258d5b-6080-4697-980f-2e7fe0dcc4ea.JPG)
### [직원 주소록 - 직원 상세조회]
![직원상세](https://user-images.githubusercontent.com/81502408/178414835-1424b45d-7286-46e3-843c-c94839e966c1.JPG)
### [통계 - 결과조회]
![통계조회](https://user-images.githubusercontent.com/81502408/178414940-98a0119c-69d5-41d0-88bd-781e563ea508.JPG)
![통계2](https://user-images.githubusercontent.com/81502408/178414948-133f560a-200b-49aa-9592-188bad89f6c7.JPG)
### [인사관리 - 직원목록]
![직원목록](https://user-images.githubusercontent.com/81502408/178416734-c8f7b6b8-4982-4fa3-9c98-de96856c82d7.JPG)
### [인사관리 - 직원정보 상세조회]
![직원정보](https://user-images.githubusercontent.com/81502408/178416741-0897fa14-7f15-4c01-a6dc-d7128ea48ab4.JPG)
### [인사관리 - 퇴사자목록]
![퇴사자목록](https://user-images.githubusercontent.com/81502408/178416727-c6e2e392-c288-4c46-9c60-7fe5190da589.JPG)
### [인사관리 - 미승인 직원관리]
![미승인직원](https://user-images.githubusercontent.com/81502408/178416689-c47e5a16-0657-4e85-b87d-65980130b241.JPG)
### [인사관리 - 미승인 직원승인]
![승인하기](https://user-images.githubusercontent.com/81502408/178416784-28909444-9e17-41db-a468-4428d172a6c8.JPG)
