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
                          <h5 class="card-title text-primary">김재호</h5>
                          <p class="mb-4">
                            You have done <span class="fw-bold">72%</span> more sales today. Check your new badge in
                            your profile.
                          </p>

                          <a href="javascript:;" class="btn btn-sm btn-outline-primary">View Badges</a>
                        </div>
                      </div>
                      <div class="col-sm-5 text-center text-sm-left">
                        <div class="card-body pb-0 px-0 px-md-4">
                          <img
                            src="${pageContext.request.contextPath}/resources/assets/img/illustrations/man-with-laptop-light.png"
                            height="140"
                            alt="View Badge User"
                            data-app-dark-img="illustrations/man-with-laptop-dark.png"
                            data-app-light-img="illustrations/man-with-laptop-light.png"
                          />
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
                  	<div class="col-12 mb-4">
	                  	<div class="card">
	                  		<div class="card-body">
	                  			<div class="card-title">
	                  			</div>
	                  		</div>
	                  	</div>
                  	</div>
                   </div>
                   
                   
    			<div class="row">
    
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
                <!-- Order Statistics -->
                <div class="col-md-6 col-lg-4 col-xl-4 order-0 mb-4">
                  <div class="card h-100">
                    <div class="card-header d-flex align-items-center justify-content-between pb-0">
                      <div class="card-title mb-0">
                        <h5 class="m-0 me-2">Order Statistics</h5>
                        <small class="text-muted">42.82k Total Sales</small>
                      </div>
                      <div class="dropdown">
                        <button
                          class="btn p-0"
                          type="button"
                          id="orederStatistics"
                          data-bs-toggle="dropdown"
                          aria-haspopup="true"
                          aria-expanded="false"
                        >
                          <i class="bx bx-dots-vertical-rounded"></i>
                        </button>
                        <div class="dropdown-menu dropdown-menu-end" aria-labelledby="orederStatistics">
                          <a class="dropdown-item" href="javascript:void(0);">Select All</a>
                          <a class="dropdown-item" href="javascript:void(0);">Refresh</a>
                          <a class="dropdown-item" href="javascript:void(0);">Share</a>
                        </div>
                      </div>
                    </div>
                    <div class="card-body">
                      <div class="d-flex justify-content-between align-items-center mb-3">
                        <div class="d-flex flex-column align-items-center gap-1">
                          <h2 class="mb-2">8,258</h2>
                          <span>Total Orders</span>
                        </div>
                        <div id="orderStatisticsChart"></div>
                      </div>
                      <ul class="p-0 m-0">
                        <li class="d-flex mb-4 pb-1">
                          <div class="avatar flex-shrink-0 me-3">
                            <span class="avatar-initial rounded bg-label-primary"
                              ><i class="bx bx-mobile-alt"></i
                            ></span>
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <h6 class="mb-0">Electronic</h6>
                              <small class="text-muted">Mobile, Earbuds, TV</small>
                            </div>
                            <div class="user-progress">
                              <small class="fw-semibold">82.5k</small>
                            </div>
                          </div>
                        </li>
                        <li class="d-flex mb-4 pb-1">
                          <div class="avatar flex-shrink-0 me-3">
                            <span class="avatar-initial rounded bg-label-success"><i class="bx bx-closet"></i></span>
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <h6 class="mb-0">Fashion</h6>
                              <small class="text-muted">T-shirt, Jeans, Shoes</small>
                            </div>
                            <div class="user-progress">
                              <small class="fw-semibold">23.8k</small>
                            </div>
                          </div>
                        </li>
                        <li class="d-flex mb-4 pb-1">
                          <div class="avatar flex-shrink-0 me-3">
                            <span class="avatar-initial rounded bg-label-info"><i class="bx bx-home-alt"></i></span>
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <h6 class="mb-0">Decor</h6>
                              <small class="text-muted">Fine Art, Dining</small>
                            </div>
                            <div class="user-progress">
                              <small class="fw-semibold">849k</small>
                            </div>
                          </div>
                        </li>
                        <li class="d-flex">
                          <div class="avatar flex-shrink-0 me-3">
                            <span class="avatar-initial rounded bg-label-secondary"
                              ><i class="bx bx-football"></i
                            ></span>
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <h6 class="mb-0">Sports</h6>
                              <small class="text-muted">Football, Cricket Kit</small>
                            </div>
                            <div class="user-progress">
                              <small class="fw-semibold">99</small>
                            </div>
                          </div>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
                <!--/ Order Statistics -->

                <!-- Expense Overview -->
                <div class="col-md-6 col-lg-4 order-1 mb-4">
                  <div class="card h-100">
                    <div class="card-header">
                      <ul class="nav nav-pills" role="tablist">
                        <li class="nav-item">
                          <button
                            type="button"
                            class="nav-link active"
                            role="tab"
                            data-bs-toggle="tab"
                            data-bs-target="#navs-tabs-line-card-income"
                            aria-controls="navs-tabs-line-card-income"
                            aria-selected="true"
                          >
                            Income
                          </button>
                        </li>
                        <li class="nav-item">
                          <button type="button" class="nav-link" role="tab">Expenses</button>
                        </li>
                        <li class="nav-item">
                          <button type="button" class="nav-link" role="tab">Profit</button>
                        </li>
                      </ul>
                    </div>
                    <div class="card-body px-0">
                      <div class="tab-content p-0">
                        <div class="tab-pane fade show active" id="navs-tabs-line-card-income" role="tabpanel">
                          <div class="d-flex p-4 pt-3">
                            <div class="avatar flex-shrink-0 me-3">
                              <img src="${pageContext.request.contextPath}/resources/assets/img/icons/unicons/wallet.png" alt="User" />
                            </div>
                            <div>
                              <small class="text-muted d-block">Total Balance</small>
                              <div class="d-flex align-items-center">
                                <h6 class="mb-0 me-1">$459.10</h6>
                                <small class="text-success fw-semibold">
                                  <i class="bx bx-chevron-up"></i>
                                  42.9%
                                </small>
                              </div>
                            </div>
                          </div>
                          <div id="incomeChart"></div>
                          <div class="d-flex justify-content-center pt-4 gap-2">
                            <div class="flex-shrink-0">
                              <div id="expensesOfWeek"></div>
                            </div>
                            <div>
                              <p class="mb-n1 mt-1">Expenses This Week</p>
                              <small class="text-muted">$39 less than last week</small>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--/ Expense Overview -->

                <!-- Transactions -->
                <div class="col-md-6 col-lg-4 order-2 mb-4">
                  	<!------ 일정 ------>
					<div class="card h-100 overflow-hidden" style="height: 185px">
						<h5 class="card-header" style="text-align: center;">
							<a href="schedule.do" style="color: #566a7f"><!--  data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="top" data-bs-html="true" title data-bs-original-title="</i><span>일정 관리 이동</span>" -->
								<i class="menu-icon tf-icons bx bx-calendar bx-tada-hover"></i>
								<b>오늘 일정 목록</b>
							</a>
						</h5>
						<div class="card-body" id="vertical-example">
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
