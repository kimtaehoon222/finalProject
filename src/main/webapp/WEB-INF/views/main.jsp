<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
  data-assets-path="${pageContext.request.contextPath}/assets/"
  data-template="vertical-menu-template-free"
>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>2asy Work</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/img/logo/W.png" /> 
    
    <meta name="description" content="" />

    <!-- Favicon -->
    <!-- <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/img/favicon/favicon.ico" /> -->

	<!-- 파비콘 넣기!!!! -->
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/img/logo/W.png" /> 
	
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/apex-charts/apex-charts.css" />

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/config.js"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.15.2/js/all.js" integrity="sha384-vuFJ2JiSdUpXLKGK+tDteQZBqNlMwAjhZ3TvPaDfN9QmbPb7Q8qUpbSNapQev3YF" crossorigin="anonymous"></script>
  
  <style type="text/css">
   .hoverOk:hover{
   cursor: pointer;
   background-color: #696cff;
   color: white;
   }
   
   #center {
	text-align: center;
	margin: auto;
	justify-content: center;
	display: flex;
}
  
  .badge-gradient-success {<!--
	초록 --> background: -webkit-gradient(linear, left top, right top, from(#84d9d2),
		to(#07cdae));
	background: linear-gradient(90deg, #84d9d2, #07cdae);
	color: #fff;
}

.badge-gradient-warning {<!--
	노랑 --> background: -webkit-gradient(linear, left top, right top, from(#f6e384),
		to(#ffd500));
	background: linear-gradient(90deg, #f6e384, #ffd500);
	color: #fff;
}

.badge-gradient-info {<!--
	파랑 --> background: -webkit-gradient(linear, left top, right top, from(#90caf9),
		color-stop(99%, #047edf));
	background: linear-gradient(90deg, #90caf9, #047edf 99%);
	color: #fff;
}

.badge-gradient-danger {<!--
	복숭아색 --> background: -webkit-gradient(linear, left top, right top, from(#ffbf96),
		to(#fe7096));
	background: linear-gradient(90deg, #ffbf96, #fe7096);
	color: #fff;
}
	
  .jisu{
  	border: none;
  }	
  .mailCnt::-webkit-scrollbar {
    width: 8px;  /* 스크롤바의 너비 */
}

.mailCnt::-webkit-scrollbar-thumb {
    height: 30%; /* 스크롤바의 길이 */
    background: #696cff; /* 스크롤바의 색상 */
    
    border-radius: 10px;
}

.mailCnt::-webkit-scrollbar-track {
    background: rgba(33, 122, 244, .1);  /*스크롤바 뒷 배경 색상*/
}
  </style>
  </head>

  <body>
  			
  			<jsp:include page="common/top.jsp"/>
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <div class="row">
                <div class="col-lg-8 mb-4 order-0">
                  <div class="card" style="height:100%">
                    <div class="d-flex align-items-end row">
                      <div class="col-sm-7">
                        <div class="card-body">
                          <h5 class="card-title text-primary"><b>${loginEmp.empName }</b></h5>
                          <p class="mb-3">
                                                         빛나는 당신의 <span class="fw-bold">미래를&nbsp;</span>응원합니다.<br><span class="text-info">-Easy Work-</span>
                          </p>

                          <a href="myPage.do" class="btn btn-sm btn-outline-primary">마이페이지로 이동</a>
                        </div>
                      </div>
                      <div class="col-sm-5 text-center text-sm-left">
                        <div class="card-body pb-0 px-0 px-md-4">
                          <c:if test="${ loginEmp.gender == 'F' }">
                          <img
                            src="${pageContext.request.contextPath}/resources/assets/img/illustrations/woman-with-laptop-light.jpg"
                            height="140"
                            alt="View Badge User"
                          />
                          </c:if>
                          <c:if test="${ loginEmp.gender == 'M' }">
                          	<img
                            src="${pageContext.request.contextPath}/resources/assets/img/illustrations/man-with-laptop-light.png"
                            height="140"
                            alt="View Badge User"
                          />
                          </c:if>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                
                <!-- 첫 번째 행 시작 -->
                <div class="col-lg-4 col-md-4 order-1">
                  <div class="row">
                    <!-- 읽지않은메일 -->
                    <div class="col-lg-6 col-md-12 col-6 mb-4">
                      <div class="card">
                        <div class="card-body">
                          <div class="card-title d-flex align-items-start justify-content-between">
                            <div class="avatar flex-shrink-0">
                              <i class="bx bx-envelope bx-md bx-tada-hover" style="color:#696cff;"></i>
                            </div>
                            <div class="dropdown">
                              <button class="btn p-0" type="button" id="cardOpt3" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="bx bx-dots-vertical-rounded"></i>
                              </button>
                              <div class="dropdown-menu dropdown-menu-end" aria-labelledby="cardOpt3">
                                <a class="dropdown-item" href="receiveMailList.do?receive=r">받은 메일함</a>
                                <a class="dropdown-item" href="sendMailList.do?send=s">보낸 메일함</a>
                                <a class="dropdown-item" href="reserveMailList.do?reserve=re">예약 메일함</a>
                                <a class="dropdown-item" href="deleteMailList.do?delete=d">휴지통</a>
                              </div>
                            </div>
                          </div>
                          <span class="fw-semibold d-block mb-1">미확인 메일</span>
                          <h3 class="card-title mb-2 text-danger">${ mailCount }</h3>
                          <small><a href="mailHome.do" class="text-primary fw-semibold">>mail home</a></small>
                        </div>
                      </div>
                    </div>
                    
                    <!-- 시계 -->
                    <div class="col-lg-6 col-md-12 col-6 mb-4">
                      <div class="card">
                        <div class="card-body">
                          <div class="card-title d-flex align-items-start justify-content-between">
                            <div class="avatar flex-shrink-0">
                              <img
                                src="${pageContext.request.contextPath}/resources/assets/img/icons/unicons/chart.png"
                                alt="Credit Card"
                                class="rounded"
                              />
                            </div>
                           
                          </div>
                          <p id="mainDate" style="font-size:15px"></p>
                          <p id="mainClock" style="font-size:23px"></p>
                        </div>
                      </div>
                    </div>
                    
                  </div>
                </div>
                <!-- 첫 번째 행 끝 -->

				<!-- 결재현황 시작 -->
                <div class="col-12 col-lg-4 order-2 order-md-3 order-lg-2 mb-4">
                  <div class="card" style="height:386.11px">
                  <div class="card-body" style="height:386.11px">
	     
              		<h5 class="card-title text-primary"><b>전자결재</b></h5>
                	<hr>
					
					<!-- 위쪽 행 -->
					<div class="row mb-4">
                    <div class="col-lg-6 col-md-12 col-6 mb-0">
                      <div class="card bg-light">
                        <div class="card-body" style="text-align: center;">
                          <!-- <button class="btn btn-primary mb-2" style="width:100%;">요청</button> -->
                          <a href="#"><label class="badge badge-gradient-success mb-2" style="width:100%;">요청</label></a>
                          <h2 class="card-title mb-0 mt-2">${ countW }</h2>
                        </div>
                      </div>
                    </div>
                     <div class="col-lg-6 col-md-12 col-6 mb-0">
                      <div class="card">
                        <div class="card-body" style="text-align: center;">
                          <!-- <button class="badge badge-gradient-warning mb-2" style="width:100%;">진행</button> -->
                          <a href="#"><label class="badge badge-gradient-warning mb-2" style="width:100%;">진행</label></a>
                          <h2 class="card-title mb-0 mt-2">${ countP }</h2>
                        </div>
                      </div>
                    </div>
                  </div>	
                  
                 <!-- 아래쪽 행 -->                	
                 <div class="row mb-2">
                    <div class="col-lg-6 col-md-12 col-6 mb-0">
                      <div class="card">
                        <div class="card-body" style="text-align: center;">
                          <!-- <button class="btn btn-primary mb-2" style="width:100%;">반려</button> -->
                          <a href="#"><label class="badge badge-gradient-danger mb-2" style="width:100%;">반려</label></a>
                          <h2 class="card-title mb-0 mt-2">${ countR }</h2>
                        </div>
                      </div>
                    </div>
                     <div class="col-lg-6 col-md-12 col-6 mb-0">
                      <div class="card">
                        <div class="card-body" style="text-align: center;">
                          <!-- <button class="btn btn-primary mb-2" style="width:100%;">완료(부서)</button> -->
                          <a href="#"><label class="badge badge-gradient-info mb-2" style="width:100%;">완료(${loginEmp.deptName })</label></a>
                          <h2 class="card-title mb-0 mt-2">${ countA }</h2>
                        </div>
                      </div>
                    </div>
                  </div>	
                 			 
	               <small><a href="signView.do" class="text-primary fw-semibold" style="float:right;">>결재함 바로가기</a></small>
				   </div> 
	               </div>
				 </div>
				 <!-- 결재현황 끝 -->				
				
				<!-- 이번달 입사자 시작 -->			
                <div class="col-12 col-md-8 col-lg-4 order-3 order-md-2">
                  <div class="">
                  	<div class="col-12 mb-4">
	                  	<div class="card mb-4">
	                  		<div class="card-body">
	                  			<div class="card-title">
	                  			<h5><i class='bx bx-laugh'></i><b class="text-primary">&nbsp;이번 달 입사자</b></h5>
	                  			<!-- 스크롤바 영역 --> 
	                  			<div id="vertical-example" style="height: 290px;">
		                  			<table class="table kim">
		                                <tbody>
			                                <c:forEach items="${empList}" var="e">
			                                    <tr>
				                                    <!-- <td class="text-primary jisu">●</td> -->
				                                    <td class="jisu"><img  data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" data-bs-original-title="${e.jobName }"
				                                    src="${pageContext.request.contextPath}/resources/emp_files/${e.changeName}" alt="avatar" class="rounded-circle" style="width: 45px; height:45px;  border-radius: 70%;  overflow: hidden;"></td>
				                                    <td class="jisu">${e.empName}</td>
				                                    <td class="jisu"><span class="badge bg-label-primary me-1">${e.deptName}</span></td>
			                                    </tr>
			                                 </c:forEach> 
		                                </tbody>
	                            	</table>
	           					</div> 
	                  			</div>
	                  		</div>
	                  	</div>
                  	</div>
                   </div>
                  </div> 
                  <!-- 이번달 입사자 끝 -->
                
                <div class="col-12 col-md-8 col-lg-4 order-3 order-md-2">
                <!-- 날씨 -->
    			<div class="row h-100">  
    			
    				<!-- 채팅 -->
    			      <div class="col-lg-6 col-md-12 col-6 mb-4">
                      <div class="card">
                      <!-- 여기서 구현 -->
                        <div class="card-body" style="width: 220px; height: 180px;">
                          <div class="card-title d-flex align-items-start justify-content-between">
                            <div class="avatar flex-shrink-0">
                               <i class='bx bx-message-rounded-dots bx-md bx-tada-hover' id="chatIcon"></i>
                            </div>

                          </div>
                            <h4><b>이지톡</b></h4>
                            <a class="btn btn-primary" style="color:white; width: 150px" href="chat.do">채팅하러가기</a>
                        </div>
                      </div>
                    </div>
                    
                    <!-- 근태 -->
                    <div class="col-lg-6 col-md-12 col-6 mb-4">
                      <div class="card">
                      <!-- 여기서 구현 -->
                        <div class="card-body" style="width: 220px; height: 180px;">
                          <div class="card-title d-flex align-items-start justify-content-between">
                            <div class="avatar flex-shrink-0">
                              <i class="menu-icon tf-icons bx bx-briefcase-alt-2 bx-md  "></i>
        
                            </div>

                          </div>   
                          <h4><b>나의 근태관리 </b></h4>  
                          <a class="btn btn-primary" style="color:white; width: 150px" href="work.do">바로가기</a>
                        </div>
                      </div>
                    </div>
                    
                    
                   <div class="col-12 mb-4">
                      <div class="card" style="height: 180px;">
                        <div class="card-body">
                          <div class="">
                            <div class="">
                              <div class="card-title">
                                <h5 class="mb-3 text-primary"><b>오늘의 날씨</b></h5>
                              </div>
                              <div class="weather row">
	                                <div class="CurrIcon col-md-4"></div>
	                                <div class="col-md-3"><h2 class="CurrTemp text-primary"></h2></div>
	                                <div class="col-md-5"><h4 class="City"></h4></div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
               
              </div> 
            
              
              <div class="row">
            
                <!-- 갤러리 시작 -->
                <div class="col-md-6 col-lg-4 col-xl-4 order-0 mb-4">
                  <div class="card h-100">
                    <div class="card-header d-flex align-items-center justify-content-between pb-0">
                      <div class="card-title mb-0">
                        <h5 class="m-0 me-2 text-primary mb-3"><b>지난주 이슈</b></h5>
                      </div>
                      
                    </div>
                    <div class="card-body">
                      <div class="d-flex justify-content-between align-items-center mb-3">
                        <div class="d-flex flex-column align-items-center gap-1">
                          <div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
					      <ol class="carousel-indicators">
					        <li data-bs-target="#carouselExample" data-bs-slide-to="0" class=""></li>
					        <li data-bs-target="#carouselExample" data-bs-slide-to="1" class=""></li>
					        <li data-bs-target="#carouselExample" data-bs-slide-to="2" class="active" aria-current="true"></li>
					      </ol>
					      <div class="carousel-inner">
					        <div class="carousel-item">
					          <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/assets/img/elements/31.jpg" alt="First slide">
					          <div class="carousel-caption d-none d-md-block">
					            <h3></h3>
					            <p></p>
					          </div>
					        </div>
					        <div class="carousel-item">
					          <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/assets/img/elements/32.jpg" alt="Second slide">
					          <div class="carousel-caption d-none d-md-block">
					            <h3></h3>
					            <p></p>
					          </div>
					        </div>
					        <div class="carousel-item active">
					          <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/assets/img/elements/33.jpg" alt="Third slide">
					          <div class="carousel-caption d-none d-md-block">
					            <h3></h3>
					            <p></p>
					          </div>
					        </div>
					      </div>
					      <a class="carousel-control-prev" href="#carouselExample" role="button" data-bs-slide="prev">
					        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					        <span class="visually-hidden">Previous</span>
					      </a>
					      <a class="carousel-control-next" href="#carouselExample" role="button" data-bs-slide="next">
					        <span class="carousel-control-next-icon" aria-hidden="true"></span>
					        <span class="visually-hidden">Next</span>
					      </a>
					    </div>
                        </div>
                      </div>
                      <div class="d-flex justify-content-between align-items-center mb-2">
                      		<h5>지난 주 워크샵 사진</h5>
                      </div>
                      <div class="d-flex justify-content-between align-items-center mb-3">
                      		 이지워크(Easy Work)는 제주도에서 이달 9일~10일
                      		'2022년 상반기 워크샵'을 진행했습니다.<br>
							 이번 워크샵은 전 부서의 전 임직원이 참여했고
							 회사의 단합을 위해 레저 및 컨퍼런스 등 다양한 일정으로 진행했습니다.
                      </div>
                    </div>
                  </div>
                </div>
                <!-- 갤러리 끝 -->

                <!-- Expense Overview -->
                <div class="col-md-6 col-lg-4 order-1 mb-4">
                  <div class="card h-100">
                    <div class="card-header">
                     	<div class="card-title mb-0">
                        <h5 class="m-0 me-2 text-primary mb-3"><b>공지사항</b></h5>
                      </div>
                    </div>
                    <div class="card-body px-2">
                      <div class="tab-content p-0">
                        <div class="tab-pane fade show active" id="navs-tabs-line-card-income" role="tabpanel">
                          <table class="table" style="text-align: center;">
	                        <thead>
	                          <tr>
	                            <th>분류</th>
	                            <th>제목</th>
	                            <th>등록일</th>
	                          </tr>
	                        </thead>
	                        <tbody>
                             <tr class="hoverOk">
                               <td><span class="favorite badge bg-label-danger">중요</span></td>
                               <td><span class="pl-2">2023년도 건강검진 안내</span></td>
                               <td>2022-07-04</td>
                             </tr>
                             <tr class="hoverOk">
                               <td><span class="favorite badge bg-label-secondary">일반</span></td>
                               <td><span class="pl-2">7월 구내식당 메뉴안내</span></td>
                               <td>2022-06-30</td>
                             </tr>
                             <tr class="hoverOk">
                               <td><span class="favorite badge bg-label-secondary">일반</span></td>
                               <td><span class="pl-2">워크샵 일정안내</span></td>
                               <td>2022-06-15</td>
                             </tr>
                             <tr class="hoverOk">
                               <td><span class="favorite badge bg-label-secondary">일반</span></td>
                               <td><span class="pl-2">대체공휴일 휴무안내</span></td>
                               <td>2022-06-01</td>
                             </tr>
                             <tr class="hoverOk">
                               <td><span class="favorite badge bg-label-secondary">일반</span></td>
                               <td><span class="pl-2">성희롱 예방 교육 자료</span></td>
                               <td>2022-04-01</td>
                             </tr>
                             <tr class="hoverOk">
                               <td><span class="favorite badge bg-label-danger">일반</span></td>
                               <td><span class="pl-2">신입사원 필독</span></td>
                               <td>2022-03-05</td>
                             </tr>
                             <tr class="hoverOk">
                               <td><span class="favorite badge bg-label-secondary">일반</span></td>
                               <td><span class="pl-2">회사 소개자료 공유</span></td>
                               <td>2022-02-02</td>
                             </tr>
	                        </tbody>
	                      </table>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--/ Expense Overview -->

                <!-- Transactions -->
                <div class="col-md-6 col-lg-4 order-2 mb-4">
                  	<!------ 일정 ------>
					<div class="card overflow-hidden" style="height: 510px">
						<h5 class="card-header" style="text-align: center" >
							<a href="schedule.do" style="color: #566a7f"><!--  data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="top" data-bs-html="true" title data-bs-original-title="</i><span>일정 관리 이동</span>" -->
								<i class="menu-icon tf-icons bx bx-calendar bx-tada-hover"></i>
								<b style="color:#696cff">오늘 일정 목록</b>
							</a>
						</h5>
						<div class="card-body mailCnt" style="overflow: auto;">
							<c:forEach items="${skedList}" var="s">
								<div class="c1_list t_list mb-2" style="background-color:${s.rgbCode};">
									<div class="t_header">
										<div class="me-auto fw-bold">${s.skedTitle}</div>
									</div>
									<div class="t_list_cont">${s.skedContent}</div>
									<div class="t_list_time">${s.skedStartTime} ~ ${s.skedEndTime}</div>
								</div>
							</c:forEach>
						</div>
					</div>
                    <style>
                    	.card-header{ padding: 1rem 1rem; }
						.t_list{
						    font-size: 0.9375rem;
						    pointer-events: auto;
						    color: black;
						    background-clip: padding-box;
						    border: 0 solid rgba(67, 89, 113, 0.1);
						    box-shadow: 0 0.25rem 1rem rgba(161, 172, 184, 0.45);
						    border-radius: 0.5rem;
						}
						.t_header{color: black; padding:1.25rem; padding-bottom: 0.75rem;}
						.t_list_cont { padding: 0 1.25rem; word-wrap: break-word;}
						.t_list_time{padding:1.25rem; padding-top: 0; word-wrap: break-word;}
                    </style>
                    <!------ / 일정 ------>
                </div>
                <!--/ Transactions -->
              </div>
            </div>
            <!-- / Content -->

            <!-- Footer -->
            <footer class="content-footer footer bg-footer-theme">
              <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                <div class="mb-2 mb-md-0">
                  
                  <script>
                    //document.write(new Date().getFullYear());
                  </script>
                  Copyright © 2022 EASYWORK GROUPWARE All Right Reserved
                  <a href="main.do" target="_blank" class="footer-link fw-bolder text-primary">EASYWORK</a>
                </div>

              </div>
            </footer>
            <!-- / Footer -->
			
			<script type="text/javascript">
				/* 날씨 가져오기 */
			    $(document).ready(function() {
			      let weatherIcon = {
			        '01' : 'fas fa-5x fa-sun',
			        '02' : 'fas fa-5x fa-cloud-sun',
			        '03' : 'fas fa-5x fa-cloud',
			        '04' : 'fas fa-5x fa-cloud-meatball',
			        '09' : 'fas fa-5x fa-cloud-sun-rain',
			        '10' : 'fas fa-5x fa-cloud-showers-heavy',
			        '11' : 'fas fa-5x fa-poo-storm',
			        '13' : 'far fa-5x fa-snowflake',
			        '50' : 'fas fa-5x fa-smog'
			      };
	
				    $.ajax({
					    url:'http://api.openweathermap.org/data/2.5/weather?q=Seoul&APPID=c3b23636376dacd84cd5e11612108a86&units=metric',
					    dataType:'json',
					    type:'GET',
					    success:function(data){
					    console.log(data)
					      var $Icon = (data.weather[0].icon).substr(0,2);
					      var $Temp = Math.floor(data.main.temp) + 'ºC';
					      var $city = data.name;
			
					      $('.CurrIcon').append('<i class="' + weatherIcon[$Icon] +'"></i>');
					      $('.CurrTemp').prepend($Temp);
					      $('.City').append($city).append(',<br><span class="mt-1">SouthKorea</span>');
					      }
					    })
				    });
				
				
				
				/* 시간 스크립트*/
				function printClock() {
				    //출력 위치
				    var clock = document.getElementById("mainClock");
				    
				    var date = document.getElementById("mainDate");
				    //현재 시간을 currentDate에 담음
				    var currentDate = new Date();	
				    //현재 날짜를 calendar에 담음
				    var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate()
					//시간
				    var currentHours = addZeros(currentDate.getHours(),2); 
					//분
				    var currentMinute = addZeros(currentDate.getMinutes() ,2);
					//초
				    var currentSeconds =  addZeros(currentDate.getSeconds(),2);
					
					var nowYear = currentDate.getFullYear();
					
				
					var month = currentDate.getMonth();
				
					
					var clockDate = currentDate.getDate();
				
					
					var day = currentDate.getDay();
				
				    
					var week = ['일', '월', '화', '수', '목', '금', '토'];
					
					
				    
				    clock.innerHTML = currentHours+":"+currentMinute+":"+currentSeconds; //날짜를 출력해 줌
				    date.innerHTML = nowYear+"- "+(month+1)+"- "+ clockDate+" (" +week[day]+")"
				    
				    setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
				    
				    function addZeros(num, digit) { // 자릿수 맞춰주기
					  	var zero = '';
					  	num = num.toString();
					  	if (num.length < digit) {
						  	for (i = 0; i < digit - num.length; i++) {
						  		zero += '0';
						  	}
					  	}
					  	return zero + num;
					}
				}
				
				$(document).ready(function(){
					printClock();
				});
			  </script>
			
         	<jsp:include page="common/bottom.jsp"/> 
  </body>
</html>
