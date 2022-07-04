<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.workie.easy.employee.model.dto.Employee" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  <!-- jstl cdn -->
<%
	String contextPath = request.getContextPath();
	Employee loginEmp = (Employee)session.getAttribute("loginEmp");
%>     

<!DOCTYPE html>

<!-- =========================================================
* Sneat - Bootstrap 5 HTML Admin Template - Pro | v1.0.0
==============================================================

* Product Page: https://themeselection.com/products/sneat-bootstrap-html-admin-template/
* Created by: ThemeSelection
* License: You must have a valid license purchased in order to legally use the theme for your project.
* Copyright ThemeSelection (https://themeselection.com)

=========================================================
 -->
<!-- beautify ignore:start -->
<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
   
  data-assets-path="<%=contextPath %>/assets/"
  data-template="vertical-menu-template-free"
>
  <head>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>2asy Work</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="<%=contextPath %>/resources/assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="<%=contextPath %>/resources/assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="<%=contextPath %>/resources/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="<%=contextPath %>/resources/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="<%=contextPath %>/resources/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="<%=contextPath %>/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <link rel="stylesheet" href="<%=contextPath %>/resources/assets/vendor/libs/apex-charts/apex-charts.css" />

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="<%=contextPath %>/resources/assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="<%=contextPath %>/resources/assets/js/config.js"></script>
    
    <style>
	#enrollForm>table{width:50%;}
    #enrollForm>table *{ margin:5px;}
	#center {
			   text-align: center;
			   margin: auto;
			   justify-content: center;
			   display: flex;
			}
	@keyframes fadeInDown {
        0% {
            opacity: 0;
            transform: translate3d(0, -100%, 0);
        }
        to {
            opacity: 1;
            transform: translateZ(0);
        }
    }
    #msgBox {
        position: relative;
        animation: fadeInDown 1s;
    }
    
    .text-gradient {
    background: -o-linear-gradient(40deg, #c381db, #4e92f9);
    background: linear-gradient(50deg, #c381db, #4e92f9);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}
	</style>
  </head>

  <body>
	<c:if test="${ !empty msg }">
		<script>
			alert("${msg}");
		</script>
		<c:remove var="msg" scope="session"/>

	</c:if> 

    <div id="mainAlert" style="text-align: center; display:none;" class="alert alert-primary alert-dismissible" role="alert">
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    
  

  <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
      
   
        <!-- Menu -->

        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
          <div class="app-brand demo">
            <a href="main.do" class="app-brand-link">
              <span class="app-brand-logo demo">
                <svg
                  width="25"
                  viewBox="0 0 25 42"
                  version="1.1"
                  xmlns="http://www.w3.org/2000/svg"
                  xmlns:xlink="http://www.w3.org/1999/xlink"
                >
                  <defs>
                    <path
                      d="M13.7918663,0.358365126 L3.39788168,7.44174259 C0.566865006,9.69408886 -0.379795268,12.4788597 0.557900856,15.7960551 C0.68998853,16.2305145 1.09562888,17.7872135 3.12357076,19.2293357 C3.8146334,19.7207684 5.32369333,20.3834223 7.65075054,21.2172976 L7.59773219,21.2525164 L2.63468769,24.5493413 C0.445452254,26.3002124 0.0884951797,28.5083815 1.56381646,31.1738486 C2.83770406,32.8170431 5.20850219,33.2640127 7.09180128,32.5391577 C8.347334,32.0559211 11.4559176,30.0011079 16.4175519,26.3747182 C18.0338572,24.4997857 18.6973423,22.4544883 18.4080071,20.2388261 C17.963753,17.5346866 16.1776345,15.5799961 13.0496516,14.3747546 L10.9194936,13.4715819 L18.6192054,7.984237 L13.7918663,0.358365126 Z"
                      id="path-1"
                    ></path>
                    <path
                      d="M5.47320593,6.00457225 C4.05321814,8.216144 4.36334763,10.0722806 6.40359441,11.5729822 C8.61520715,12.571656 10.0999176,13.2171421 10.8577257,13.5094407 L15.5088241,14.433041 L18.6192054,7.984237 C15.5364148,3.11535317 13.9273018,0.573395879 13.7918663,0.358365126 C13.5790555,0.511491653 10.8061687,2.3935607 5.47320593,6.00457225 Z"
                      id="path-3"
                    ></path>
                    <path
                      d="M7.50063644,21.2294429 L12.3234468,23.3159332 C14.1688022,24.7579751 14.397098,26.4880487 13.008334,28.506154 C11.6195701,30.5242593 10.3099883,31.790241 9.07958868,32.3040991 C5.78142938,33.4346997 4.13234973,34 4.13234973,34 C4.13234973,34 2.75489982,33.0538207 2.37032616e-14,31.1614621 C-0.55822714,27.8186216 -0.55822714,26.0572515 -4.05231404e-15,25.8773518 C0.83734071,25.6075023 2.77988457,22.8248993 3.3049379,22.52991 C3.65497346,22.3332504 5.05353963,21.8997614 7.50063644,21.2294429 Z"
                      id="path-4"
                    ></path>
                    <path
                      d="M20.6,7.13333333 L25.6,13.8 C26.2627417,14.6836556 26.0836556,15.9372583 25.2,16.6 C24.8538077,16.8596443 24.4327404,17 24,17 L14,17 C12.8954305,17 12,16.1045695 12,15 C12,14.5672596 12.1403557,14.1461923 12.4,13.8 L17.4,7.13333333 C18.0627417,6.24967773 19.3163444,6.07059163 20.2,6.73333333 C20.3516113,6.84704183 20.4862915,6.981722 20.6,7.13333333 Z"
                      id="path-5"
                    ></path>
                  </defs>
                  <g id="g-app-brand" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                    <g id="Brand-Logo" transform="translate(-27.000000, -15.000000)">
                      <g id="Icon" transform="translate(27.000000, 15.000000)">
                        <g id="Mask" transform="translate(0.000000, 8.000000)">
                          <mask id="mask-2" fill="white">
                            <use xlink:href="#path-1"></use>
                          </mask>
                          <use fill="#696cff" xlink:href="#path-1"></use>
                          <g id="Path-3" mask="url(#mask-2)">
                            <use fill="#696cff" xlink:href="#path-3"></use>
                            <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-3"></use>
                          </g>
                          <g id="Path-4" mask="url(#mask-2)">
                            <use fill="#696cff" xlink:href="#path-4"></use>
                            <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-4"></use>
                          </g>
                        </g>
                        <g
                          id="Triangle"
                          transform="translate(19.000000, 11.000000) rotate(-300.000000) translate(-19.000000, -11.000000) "
                        >
                          <use fill="#696cff" xlink:href="#path-5"></use>
                          <use fill-opacity="0.2" fill="#FFFFFF" xlink:href="#path-5"></use>
                        </g>
                      </g>
                    </g>
                  </g>
                </svg>
              </span>
              <!--  <span class="app-brand-text demo menu-text fw-bolder ms-2">2asywork</span>-->
              <span class="fw-bold display-4 fs-4 fs-lg-6 fs-xxl-7 text-gradient">2asyWork</span>
            </a>

            <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
              <i class="bx bx-chevron-left bx-sm align-middle"></i>
            </a>
          </div>

          <div class="menu-inner-shadow"></div>

          <ul class="menu-inner py-1">
            <!-- Dashboard -->
            <li class="menu-item active">
              <a href="main.do" class="menu-link">
                <i class="menu-icon tf-icons bx bx-home-circle"></i>
                <div data-i18n="Analytics">홈</div>
              </a>
            </li>

            <!-- Layouts -->
            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-file"></i>
                <div data-i18n="Layouts">전자결재</div>
              </a>
              <ul class="menu-sub">
				<li class="menu-item">
                 <a href="signView.do" class="btn btn-sm btn-outline-primary" id="center" style="margin:10px; padding:5px">결재 함 바로가기 </a>
                  </a>
                </li>              
                <li class="menu-item">
                  <a href="signWaitingView.do?empName=${ loginEmp.empName }" class="menu-link">
                    <div data-i18n="Without menu">요청 결재함</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="signGoView.do?empName=${ loginEmp.empName }" class="menu-link">
                    <div data-i18n="Without navbar">결재 진행함</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="signBackView.do?empName=${ loginEmp.empName }" class="menu-link">
                    <div data-i18n="Container">반려 문서함</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="signEndView.do?empName=${ loginEmp.empName }" class="menu-link">
                    <div data-i18n="Fluid">완료 문서함</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="mySignWaitingView.do?empName=${ loginEmp.empName }" class="menu-link">
                    <div data-i18n="Blank">내 결재 대기함</div>
                  </a>
                </li>
              </ul>
            </li>

            <li class="menu-item">
              <a href="roomList.do" class="menu-link">
                <i class="menu-icon tf-icons bx bx-bookmarks"></i>
                <div>회의실 예약</div>
              </a>
            </li>
            <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-briefcase-alt-2"></i>
                <div data-i18n="Authentications">근태관리</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="work.do" class="menu-link">
                    <div data-i18n="Basic">내 근태 현황</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="vacation.do" class="menu-link">
                    <div data-i18n="Basic">내 연차 조회</div>
                  </a>
                </li>
              </ul>
            </li>
            <li class="menu-item">
              <a href="chat.do" class="menu-link">
                <i class="menu-icon tf-icons bx bx-chat"></i>
                <div data-i18n="Misc">채팅</div>
              </a>
            </li>
         
            <!-- Cards -->
            <li class="menu-item">
              <a href="schedule.do" class="menu-link">
                <i class="menu-icon tf-icons bx bx-calendar"></i>
                <div data-i18n="Basic">일정 관리</div>
              </a>
            </li>
            <!-- User interface -->
            <li class="menu-item">
              <a href="acct.do?deptCode=${loginEmp.deptCode}" class="menu-link">
                <i class="menu-icon tf-icons bx bx-credit-card"></i>
                <div data-i18n="User interface">회계 관리</div>
              </a>
            </li>

            <!-- Extended components -->
            <li class="menu-item">
              <a href="javascript:void(0)" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-envelope"></i>
                <div data-i18n="Extended UI">메일</div>
              </a>
              <ul class="menu-sub">
				<li class="menu-item">
                 <a href="mailHome.do" class="btn btn-sm btn-outline-primary" id="center" style="margin:10px; padding:5px">메일 홈 바로가기 </a>
                </li>              
                <li class="menu-item">
                  <a href="receiveMailList.do?receive=r" class="menu-link">
                    <div data-i18n="Without menu">받은 메일함</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="sendMailList.do?send=s" class="menu-link">
                    <div data-i18n="Without navbar">보낸 메일함</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="reserveMailList.do?reserve=re" class="menu-link">
                    <div data-i18n="Container">예약 메일함</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="deleteMailList.do?delete=d" class="menu-link">
                    <div data-i18n="Fluid">휴지통</div>
                  </a>
                </li>
              </ul>
            </li>

             <!-- <li class="menu-item">
              <a href="javascript:void(0)" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-group"></i>
                <div data-i18n="Extended UI">커뮤니티</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="extended-ui-perfect-scrollbar.html" class="menu-link">
                    <div data-i18n="Perfect Scrollbar">1</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="extended-ui-text-divider.html" class="menu-link">
                    <div data-i18n="Text Divider">2</div>
                  </a>
                </li>
              </ul>
            </li>

              <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-notepad"></i>
                <div data-i18n="Form Elements">공지사항</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="forms-basic-inputs.html" class="menu-link">
                    <div data-i18n="Basic Inputs">1</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="forms-input-groups.html" class="menu-link">
                    <div data-i18n="Input groups">2</div>
                  </a>
                </li>
              </ul>
            </li> -->
            
             <li class="menu-item">
              <a href="empSeeList.do" class="menu-link">
                <i class="menu-icon tf-icons bx bx-group"></i>
                <div data-i18n="Tables">직원 주소록</div>
              </a>
            </li>
            <!-- Tables -->
            <li class="menu-item">
              <a href="chartHome.do" class="menu-link">
                <i class="menu-icon tf-icons bx bx-line-chart"></i>
                <div data-i18n="Tables">통계</div>
              </a>
            </li>
           <li class="menu-item">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bxs-group"></i>
                <div data-i18n="Form Layouts">인사관리</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item">
                  <a href="empList.do" class="menu-link">
                    <div data-i18n="Vertical Form" >직원 목록</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="retiredEmpList.do" class="menu-link">
                    <div data-i18n="Horizontal Form">퇴사자 목록</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="noApvList.do" class="menu-link">
                    <div data-i18n="Horizontal Form">미승인 직원 목록</div>
                  </a>
                </li>
              </ul>
            </li>
            
          
          </ul>
        </aside>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
          <!-- Navbar -->
          

          <nav
            class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
            id="layout-navbar"
          >
            <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
              <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                <i class="bx bx-menu bx-sm"></i>
              </a>
            </div>

            <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
			
			<span class="text-primary" id="msgBox">${ topMsg }</span>

              <ul class="navbar-nav flex-row align-items-center ms-auto">
                <!-- Place this tag where you want the button to render. -->
                
                <li class="nav-item lh-1 me-3">
                  <!-- <a
                    class="github-button"
                    href="https://github.com/themeselection/sneat-html-admin-template-free"
                    data-icon="octicon-star"
                    data-size="large"
                    data-show-count="true"
                    aria-label="Star themeselection/sneat-html-admin-template-free on GitHub"
                    >Star</a
                  > -->
                  <i class='bx bx-message-rounded-dots bx-md bx-tada-hover' id="chatIcon"></i>
                  <a href="mailHome.do"><i class='bx bx-envelope bx-md' id="mailEmoji"></i></a>
                  <i class='bx bxs-help-circle bx-md bx-tada-hover'></i>
                </li>

                <!-- User -->
                <li class="nav-item navbar-dropdown dropdown-user dropdown">
                  <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                    <div class="avatar avatar-online" data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="right" data-bs-html="true" title data-bs-original-title="<i class='bx bx-user bx-xs' ></i><span>내 정보 관리</span>">
                      <img src="${pageContext.request.contextPath}/resources/emp_files/${loginEmp.changeName}" alt class="w-px-40 h-px-40 rounded-circle"/>
                    </div>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end">
                    <li>
                      <a class="dropdown-item" href="#">
                        <div class="d-flex">
                          <div class="flex-shrink-0 me-3">
                            <div class="avatar avatar-online">
                              <img src="${pageContext.request.contextPath}/resources/emp_files/${loginEmp.changeName}" alt class="w-px-40 h-px-40 rounded-circle" />
                            </div>
                          </div>
                          <div class="flex-grow-1">
                            <span class="fw-semibold d-block"><%=loginEmp.getEmpName()%></span>
                            <small class="text-muted"><%=loginEmp.getDeptName()%> <%=loginEmp.getJobName()%></small>
                            <!-- <span class="fw-semibold d-block">${loginEmp.empName}</span>
                            <small class="text-muted">${loginEmp.deptName} ${loginEmp.jobName}</small> -->
                          </div>
                        </div>
                      </a>
                    </li>
                    <li>
                      <div class="dropdown-divider"></div>
                    </li>
                    
                    <li>
                      <a href="myPage.do" class="dropdown-item" href="#">
                        <i class="bx bx-user me-2"></i>
                        <span href="myPage.do"class="align-middle">마이페이지</span>
                      </a>
                    </li>
                    <li>
                      <div class="dropdown-divider"></div>
                    </li>
                    <li>
                      <a class="dropdown-item" href="logout.do">
                        <i class="bx bx-power-off me-2"></i>
                        <span class="align-middle">로그아웃</span>
                      </a>
                    </li>
                  </ul>
                </li>
                <!--/ User -->
              </ul>
            </div>
          </nav>

          <!-- / Navbar -->

          <!-- Content wrapper -->
          <div class="content-wrapper">
          

  
  <script>
  $(function(){

		connectSocket();
	})



	var socket = null;

	function connectSocket() {
		//웹소켓 생성
	    var ws = new WebSocket("ws://localhost:8090/echo"); 
	    socket = ws;
	    //소켓 오픈
	    ws.onopen = function () {
	        console.log('Info: connection opened.');
	    	console.log(location.pathname);
	    	console.log("search : " + location.search);
	    };
	    
	    //웹소켓에서 메세지를  보내면 여기에서 받아서 뿌려줌
	    ws.onmessage = function (event) {
	    	 let mainAlert = $("div#mainAlert");
	    	 var str = event.data;
	         var msgArr = str.split(',');
	         var chatIcon = $("#chatIcon");
	         alertMsg = msgArr[0];
	         
	   
	         var resultReceiver = str.substring(16,25)
	         console.log("resultReceiver : " + resultReceiver);
	  
	         if(location.pathname != "/chat.do"){
	        	 mainAlert.css("display",'block');
	        	 mainAlert.html(alertMsg);
	        	 chatIcon.css("color","red");
	        	 
             }else if(location.search != resultReceiver){
	         console.log("str확인 : " +str)
	         
	         $('#chatAlert').css("display",'block')
	         $('#chatAlert').html(alertMsg);
             }else if(location.pathname == "/chat.do"){
	         
	         console.log("msgArr : "+msgArr)
	         $('.chat-list').append(`
						<li class="chat-item list-style-none mt-3">
						<div class="chat-img d-inline-block">
							<img
								src="${ pageContext.servletContext.contextPath }/resources/assets/img/avatars/5.png"
								alt="user" class="rounded-circle" width="45">
						</div>
						<div class="chat-content d-inline-block pl-3">
							<div class="msg p-2 d-inline-block mb-1">\${ msgArr[1]}</div>
						</div>
					</li>        			 
	 			 `);
	         
	         }
	    }
 
	    //소켓 닫음
	    ws.onclose = function (event) { 
	        console.log('Info: connection closed.');
	    };
	    //소켓 에러 표시
	    ws.onerror = function (err) { console.log('Error:', err); };
	    

	}
  
	$('#msgBox').fadeIn(1000).delay(1000).fadeOut(1000);
	
	/*상단bar 메일 이모티콘 : 읽지않은메일이 있는경우 아이콘 흔들흔들 */
	$(document).ready(function (){
		$.ajax({
			url: "unReadMailCount.do",
			type:"post",
			success:function(count){
				var emogiElement = $('#mailEmoji');
				if(count > 0){
					console.log('읽지않은메일 있음');
					/* 색상 레드로 */
					emogiElement.css("color", "red");
					
					/* 흔들흔들 기능 추가*/
					document.getElementById('mailEmoji').className += ' bx-tada';
				}
				console.log('읽지않은메일 없음');
			},
			error:function(){
				console.log("ajax 통신 실패");
			}
		})
	})
	
  </script>
      
  </body>
</html>
