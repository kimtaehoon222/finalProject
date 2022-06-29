<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    <title>Dashboard - Analytics | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/img/favicon/favicon.ico" />

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
   tr:hover{
   cursor: pointer;
   background-color: #696cff;
   color: white;
   }
  
  </style>
  </head>

  <body>
  			
  			<jsp:include page="common/top.jsp"/>
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <div class="row">
                <div class="col-lg-8 mb-4 order-0">
                  <div class="card">
                    <div class="d-flex align-items-end row">
                      <div class="col-sm-7">
                        <div class="card-body">
                          <h5 class="card-title text-primary">${loginEmp.empName }</h5>
                          <p class="mb-4">
                            You have done <span class="fw-bold">72%</span> more sales today. Check your new badge in
                            your profile.
                          </p>

                          <a href="javascript:;" class="btn btn-sm btn-outline-primary">View Badges</a>
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

                <div class="col-12 col-lg-8 order-2 order-md-3 order-lg-2 mb-4">
                  <div class="card">
                    <div class="row row-bordered g-0">
                      <div class="col-md-8">
                        <h5 class="card-header m-0 me-2 pb-3">Total Revenue</h5>
                        <div id="totalRevenueChart" class="px-2"></div>
                      </div>
                      <div class="col-md-4">
                        <div class="card-body">
                          <div class="text-center">
                            <div class="dropdown">
                              <button
                                class="btn btn-sm btn-outline-primary dropdown-toggle"
                                type="button"
                                id="growthReportId"
                                data-bs-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false"
                              >
                                2022
                              </button>
                              <div class="dropdown-menu dropdown-menu-end" aria-labelledby="growthReportId">
                                <a class="dropdown-item" href="javascript:void(0);">2021</a>
                                <a class="dropdown-item" href="javascript:void(0);">2020</a>
                                <a class="dropdown-item" href="javascript:void(0);">2019</a>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div id="growthChart"></div>
                        <div class="text-center fw-semibold pt-3 mb-2">62% Company Growth</div>

                        <div class="d-flex px-xxl-4 px-lg-2 p-4 gap-xxl-3 gap-lg-1 gap-3 justify-content-between">
                          <div class="d-flex">
                            <div class="me-2">
                              <span class="badge bg-label-primary p-2"><i class="bx bx-dollar text-primary"></i></span>
                            </div>
                            <div class="d-flex flex-column">
                              <small>2022</small>
                              <h6 class="mb-0">$32.5k</h6>
                            </div>
                          </div>
                          <div class="d-flex">
                            <div class="me-2">
                              <span class="badge bg-label-info p-2"><i class="bx bx-wallet text-info"></i></span>
                            </div>
                            <div class="d-flex flex-column">
                              <small>2021</small>
                              <h6 class="mb-0">$41.2k</h6>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

				<!-- 두 번째 행 시작 -->
                <div class="col-12 col-md-8 col-lg-4 order-3 order-md-2">
                  <div class="row">
                    <div class="col-6 mb-4">
                      <div class="card">
                        <div class="card-body">
                          <div class="card-title d-flex align-items-start justify-content-between">
                            <div class="avatar flex-shrink-0">
                              <img src="${pageContext.request.contextPath}/resources/assets/img/icons/unicons/paypal.png" alt="Credit Card" class="rounded" />
                            </div>
                            <div class="dropdown">
                              <button
                                class="btn p-0"
                                type="button"
                                id="cardOpt4"
                                data-bs-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false"
                              >
                                <i class="bx bx-dots-vertical-rounded"></i>
                              </button>
                              <div class="dropdown-menu dropdown-menu-end" aria-labelledby="cardOpt4">
                                <a class="dropdown-item" href="javascript:void(0);">View More</a>
                                <a class="dropdown-item" href="javascript:void(0);">Delete</a>
                              </div>
                            </div>
                          </div>
                          <span class="d-block mb-1">Payments</span>
                          <h3 class="card-title text-nowrap mb-2">$2,456</h3>
                          <small class="text-danger fw-semibold"><i class="bx bx-down-arrow-alt"></i> -14.82%</small>
                        </div>
                      </div>
                    </div>
                    
                    <div class="col-6 mb-4">
                      <div class="card">
                        <div class="card-body">
                          <div class="card-title d-flex align-items-start justify-content-between">
                            <div class="avatar flex-shrink-0">
                              <img src="${pageContext.request.contextPath}/resources/assets/img/icons/unicons/cc-primary.png" alt="Credit Card" class="rounded" />
                            </div>
                            <div class="dropdown">
                              <button
                                class="btn p-0"
                                type="button"
                                id="cardOpt1"
                                data-bs-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false"
                              >
                                <i class="bx bx-dots-vertical-rounded"></i>
                              </button>
                              <div class="dropdown-menu" aria-labelledby="cardOpt1">
                                <a class="dropdown-item" href="javascript:void(0);">View More</a>
                                <a class="dropdown-item" href="javascript:void(0);">Delete</a>
                              </div>
                            </div>
                          </div>
                          <span class="fw-semibold d-block mb-1">Transactions</span>
                          <h3 class="card-title mb-2">$14,857</h3>
                          <small class="text-success fw-semibold"><i class="bx bx-up-arrow-alt"></i> +28.14%</small>
                        </div>
                      </div>
                    </div>
                    <!-- </div>
    <div class="row"> -->
    
    				<!-- 날씨 -->
                    <div class="col-12 mb-4">
                      <div class="card">
                        <div class="card-body">
                          <div class="">
                            <div class="">
                              <div class="card-title">
                                <h5 class="mb-3 text-primary"><b>오늘의 날씨</b></h5>
                                <!-- <span class="badge bg-label-warning rounded-pill">Year 2022</span>  -->
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
                <!--  -->
              </div>
              <div class="row">
              
                <!-- 갤러리 시작 -->
                <div class="col-md-6 col-lg-4 col-xl-4 order-0 mb-4">
                  <div class="card h-100">
                    <div class="card-header d-flex align-items-center justify-content-between pb-0">
                      <div class="card-title mb-0">
                        <h4 class="m-0 me-2 text-primary mb-3">Last Week</h4>
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
                        <h4 class="m-0 me-2 text-primary mb-3">공지사항</h4>
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
                             <tr>
                               <td><span class="favorite badge bg-label-danger">중요</span></td>
                               <td><span class="pl-2">2023년도 건강검진 안내</span></td>
                               <td>2022-07-04</td>
                             </tr>
                             <tr>
                               <td><span class="favorite badge bg-label-secondary">일반</span></td>
                               <td><span class="pl-2">7월 구내식당 메뉴안내</span></td>
                               <td>2022-06-30</td>
                             </tr>
                             <tr>
                               <td><span class="favorite badge bg-label-secondary">일반</span></td>
                               <td><span class="pl-2">워크샵 일정안내</span></td>
                               <td>2022-06-15</td>
                             </tr>
                             <tr>
                               <td><span class="favorite badge bg-label-secondary">일반</span></td>
                               <td><span class="pl-2">대체공휴일 휴무안내</span></td>
                               <td>2022-06-01</td>
                             </tr>
                             <tr>
                               <td><span class="favorite badge bg-label-secondary">일반</span></td>
                               <td><span class="pl-2">성희롱 예방 교육 자료</span></td>
                               <td>2022-04-01</td>
                             </tr>
                             <tr>
                               <td><span class="favorite badge bg-label-danger">일반</span></td>
                               <td><span class="pl-2">신입사원 필독</span></td>
                               <td>2022-03-05</td>
                             </tr>
                             <tr>
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
                  <div class="card h-100">
                    <div class="card-header d-flex align-items-center justify-content-between">
                      <h5 class="card-title m-0 me-2">Transactions</h5>
                      <div class="dropdown">
                        <button
                          class="btn p-0"
                          type="button"
                          id="transactionID"
                          data-bs-toggle="dropdown"
                          aria-haspopup="true"
                          aria-expanded="false"
                        >
                          <i class="bx bx-dots-vertical-rounded"></i>
                        </button>
                        <div class="dropdown-menu dropdown-menu-end" aria-labelledby="transactionID">
                          <a class="dropdown-item" href="javascript:void(0);">Last 28 Days</a>
                          <a class="dropdown-item" href="javascript:void(0);">Last Month</a>
                          <a class="dropdown-item" href="javascript:void(0);">Last Year</a>
                        </div>
                      </div>
                    </div>
                    <div class="card-body">
                      <ul class="p-0 m-0">
                        <li class="d-flex mb-4 pb-1">
                          <div class="avatar flex-shrink-0 me-3">
                            <img src="${pageContext.request.contextPath}/resources/assets/img/icons/unicons/paypal.png" alt="User" class="rounded" />
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <small class="text-muted d-block mb-1">Paypal</small>
                              <h6 class="mb-0">Send money</h6>
                            </div>
                            <div class="user-progress d-flex align-items-center gap-1">
                              <h6 class="mb-0">+82.6</h6>
                              <span class="text-muted">USD</span>
                            </div>
                          </div>
                        </li>
                        <li class="d-flex mb-4 pb-1">
                          <div class="avatar flex-shrink-0 me-3">
                            <img src="${pageContext.request.contextPath}/resources/assets/img/icons/unicons/wallet.png" alt="User" class="rounded" />
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <small class="text-muted d-block mb-1">Wallet</small>
                              <h6 class="mb-0">Mac'D</h6>
                            </div>
                            <div class="user-progress d-flex align-items-center gap-1">
                              <h6 class="mb-0">+270.69</h6>
                              <span class="text-muted">USD</span>
                            </div>
                          </div>
                        </li>
                        <li class="d-flex mb-4 pb-1">
                          <div class="avatar flex-shrink-0 me-3">
                            <img src="${pageContext.request.contextPath}/resources/assets/img/icons/unicons/chart.png" alt="User" class="rounded" />
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <small class="text-muted d-block mb-1">Transfer</small>
                              <h6 class="mb-0">Refund</h6>
                            </div>
                            <div class="user-progress d-flex align-items-center gap-1">
                              <h6 class="mb-0">+637.91</h6>
                              <span class="text-muted">USD</span>
                            </div>
                          </div>
                        </li>
                        <li class="d-flex mb-4 pb-1">
                          <div class="avatar flex-shrink-0 me-3">
                            <img src="${pageContext.request.contextPath}/resources/assets/img/icons/unicons/cc-success.png" alt="User" class="rounded" />
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <small class="text-muted d-block mb-1">Credit Card</small>
                              <h6 class="mb-0">Ordered Food</h6>
                            </div>
                            <div class="user-progress d-flex align-items-center gap-1">
                              <h6 class="mb-0">-838.71</h6>
                              <span class="text-muted">USD</span>
                            </div>
                          </div>
                        </li>
                        <li class="d-flex mb-4 pb-1">
                          <div class="avatar flex-shrink-0 me-3">
                            <img src="${pageContext.request.contextPath}/resources/assets/img/icons/unicons/wallet.png" alt="User" class="rounded" />
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <small class="text-muted d-block mb-1">Wallet</small>
                              <h6 class="mb-0">Starbucks</h6>
                            </div>
                            <div class="user-progress d-flex align-items-center gap-1">
                              <h6 class="mb-0">+203.33</h6>
                              <span class="text-muted">USD</span>
                            </div>
                          </div>
                        </li>
                        <li class="d-flex">
                          <div class="avatar flex-shrink-0 me-3">
                            <img src="${pageContext.request.contextPath}/resources/assets/img/icons/unicons/cc-warning.png" alt="User" class="rounded" />
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <small class="text-muted d-block mb-1">Mastercard</small>
                              <h6 class="mb-0">Ordered Food</h6>
                            </div>
                            <div class="user-progress d-flex align-items-center gap-1">
                              <h6 class="mb-0">-92.45</h6>
                              <span class="text-muted">USD</span>
                            </div>
                          </div>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
                <!--/ Transactions -->
              </div>
            </div>
            <!-- / Content -->

            <!-- Footer -->
            <footer class="content-footer footer bg-footer-theme">
              <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                <div class="mb-2 mb-md-0">
                  Â©
                  <script>
                    document.write(new Date().getFullYear());
                  </script>
                  , made with â¤ï¸ by
                  <a href="https://themeselection.com" target="_blank" class="footer-link fw-bolder">ThemeSelection</a>
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
					      var $Temp = Math.floor(data.main.temp) + 'º';
					      var $city = data.name;
			
					      $('.CurrIcon').append('<i class="' + weatherIcon[$Icon] +'"></i>');
					      $('.CurrTemp').prepend($Temp);
					      $('.City').append($city).append(',<br>SouthKorea');
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
