<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/${pageContext.request.contextPath}/resources/kjs_assets/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/kjs_assets/css/pages/email.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/kjs_assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/kjs_assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/kjs_assets/css/app.css">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/kjs_assets/images/favicon.svg"
	type="image/x-icon">
<style>
	.accordion-button.collapsed:focus {
    box-shadow: none;
	}
	.accordion-item:first-of-type .accordion-button {
	    border-top-left-radius: .375rem;
	    border-top-right-radius: .375rem;
	}
	button:focus:not(:focus-visible) {
	    outline: 0;
	}
	.accordion-button.collapsed {
	    border-radius: .375rem;
	}
	.accordion-button:focus {
	    z-index: 3;
	    border-color: rgba(249,249,255,.54);
	    outline: 0;
	    box-shadow: none;
	}
	.accordion-button:hover {
	    z-index: 2;
	}
	button:not(:disabled), [type=button]:not(:disabled), [type=reset]:not(:disabled), [type=submit]:not(:disabled) {
	    cursor: pointer;
	}
		.inner:hover{
		color: rgb(95,118,232);
		cursor: pointer;
	}
	
	#status{
		display:none;
		position:absolute;
	}
	
	.selects1:hover, .selects2:hover, .selects3:hover, .selects4:hover, .selects5:hover{
		background-color: rgba(95,118,232, 0.1);
	}
	
	.week, .selects1, .selects2, .selects3, .selects4, .selects5{
		display:none;
	}
	
	.today{
		background-color: rgba(95,118,232);
		color : white;
		border-radius : 8px;
		padding: 1px;
	}
</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body onload="printClock()">
	<jsp:include page="${pageContext.request.contextPath}/top.jsp" />

	<div class="container-xxl flex-grow-1 container-p-y">

		<div class="page-heading email-application">
			<div class="page-title">
				<div class="row">
					<div class="col-12 col-md-6 order-md-1 order-last">
						<h3>근태관리</h3>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
						</nav>
					</div>
				</div>
			</div>

			<!-- 영역 : 근태 관리 사이드 바, 오른쪽은 연차 정보-->
			<section class="section content-area-wrapper">

				<!-- 근태관리 사이드바 시작(왼쪽 영역) -->
				<div class="sidebar-left">
					<!-- sidebar start -->
					<div class="sidebar">
						<div class="sidebar-content email-app-sidebar d-flex">


							<!-- email-app-menu start -->
							<div class="email-app-menu">
								<!-- 현재날짜, 시간 시작 -->
								<div class="form-group form-group-compose">
									<c:set var="today" value="<%= new java.util.Date() %>"/>
								<p style="font-size:14px"><fmt:formatDate value="${today}" type="date" pattern="yyyy-MM-dd (E)"/></p>
								<p id="clock" style="font-size:40px"></p>
								</div>
								<!-- 현재날짜, 시간 끝 -->
								
								<div class="sidebar-menu-list ps">
									<!-- 근태관리 사이드바 시작 -->
									<div class="list-group list-group-messages">
										
											<div class="fonticon-wrap d-inline me-3">
												<div>
													<div class="d-flex" style="font-size: 12px">
														<p class="col-6" style="padding:0px;">출근시간</p>
														<p class="col-6 text-right" style="padding:0px;">미등록</p>
													</div>
													<div class="d-flex" style="font-size: 12px">
														<p class="col-6" style="padding:0px;">퇴근시간</p>
														<p class="col-6 text-right" style="padding:0px;">미등록</p>
														
													</div>
		
												</div>
												<!-- 근태 상태변경 form 시작  -->
												<form method="get" action="change.do">
													<div class="d-flex align-items-center">
									
											
													<button type="submit" class="btn btn-rounded btn-outline-primary col-6" style="margin:2px" value="1" name="status">출근하기</button>
													<button type="submit" class="btn btn-rounded btn-outline-primary col-6" style="margin:2px" value="2" name="status" disabled>퇴근하기</button>
												
													</div>
													<div class="d-flex align-items-center">
														<button type="button" id="selectStatus" class="btn btn-rounded btn-outline-primary col-12" style="margin:2px 2px 0px 2px;">근무상태변경<i data-feather="chevron-down" class="feather-icon"></i></button>
													</div>
													<div id="status" class="align-items-center" style="border: 1px solid rgb(95,118,232); border-radius: 10px; background-color:white;">
														<button type="submit" class="d-flex col-12 btn btn-outline-primary" style="border:none; border-top-left-radius: 9px; border-top-right-radius: 9px;" value="3" name="status">업무중</button>
														<button type="submit" class="d-flex col-12 btn btn-outline-primary" style="border:none;" value="5" name="status">외출중</button>
														<button type="submit" class="d-flex col-12 btn btn-outline-primary" style="border:none;" value="6" name="status">출장중</button>
													</div>
												</form>
												<!-- 근태 상태변경 form 끝 -->
											</div> 
										
					
									</div>
									<!-- 근태관리 사이드바 끝 -->
								</div>

							</div>
							<!-- email-app-menu end -->

						</div>
					</div>
					<!-- sidebar end -->
				</div>
				<!-- 근태관리 사이드바(왼쪽 영역) 끝 -->

				<!-- 연차내역(오른쪽 영역) 시작 -->
				<div class="content-right">
					<div class="content-wrapper">
						<div class="content-body">
							<!-- email app overlay -->
							<div class="email-app-area">

								<!-- Email list Area -->
								<div class="email-app-list-wrapper">
									<div class="email-app-list">
									
										<!-- 연차 내역 상단에 날짜 시작 -->
									    <div class="row">
											<div class="m-auto">
												<!--  <span>2022.06</span>-->
												<!--  <h5>2022.06</h5>-->
											</div>
										</div>
										<!-- 연차 내역 상단에 날짜 시작 -->
										
										<!-- 연차 내역  상단 시작(로그인된 유저의 정보) -->
										<div class="email-action">
												<img
												src="${ pageContext.servletContext.contextPath }/resources/assets/img/avatars/5.png"
												alt="user" class="rounded-circle" width="65">
												<div class="col-3 m-auto" style="height:100%; padding:10px 0px">
											
													<p class="text-center m-auto" style="font-size:12px">김재호 사원</p>
												</div>
												<div class="col-3 m-auto" style="height:100%; padding:10px 0px">
													<p class="text-center m-auto" style="font-size:12px">총 연차</p>
													<p class="text-center m-auto text-primary">15</p>
												</div>
												<div class="col-3 m-auto" style="height:100%; padding:10px 0px">
													<p class="text-center m-auto" style="font-size:12px">사용 연차</p>
													<p class="text-center m-auto text-primary">0</p>
												</div>
												<div class="col-3 m-auto" style="height:100%; padding:10px 0px">
													<p class="text-center m-auto" style="font-size:12px">잔여 연차</p>
													<p class="text-center m-auto text-primary">15</p>
												</div>
										

											<!-- action right start here -->
									
										</div>
										<!-- 연차 내역  상단 시작(로그인된 유저의 정보) -->

										<!-- 연차 내역 가운데 시작(상세 정보) 시작-->
										<div class="email-user-list list-group ps ps--active-y">
										<div class="dataTable-container">
											<table class="table table-striped dataTable-table" id="table1">
			                                <thead>
			                                	<br><br>
			                                	<h4>사용내역</h4>
			                                    <tr>
			                                    	<th data-sortable="" style="width: 11.8062%;"><a href="#" class="dataTable-sorter">부서명</a></th>
				                                    <th data-sortable="" style="width: 41.8502%;"><a href="#" class="dataTable-sorter">사용 기간</a></th>
				                                    <th data-sortable="" style="width: 18.8546%;"><a href="#" class="dataTable-sorter">휴가 종류</a></th
				                                    ><th data-sortable="" style="width: 16.3877%;"><a href="#" class="dataTable-sorter">일 수</a></th>
				                                    <th data-sortable="" style="width: 11.1013%;"><a href="#" class="dataTable-sorter">내용</a></th>
			                                    </tr>
			                                    
			                                    
			                                </thead>
			                                <tbody>
				                                <tr>
					                                <td>인사과</td>
					                                <td>2022.05.13~2022.05.14</td>
					                                <td>연차</td>
					                                <td>1</td>
					                                <td>병원진료</td>
					                            </tr>
					                            <tr>
					                                <td>인사과</td>
					                                <td>2022.05.13~2022.05.14</td>
					                                <td>연차</td>
					                                <td>1</td>
					                                <td>병원진료</td>
					                            </tr>
				                           </tbody>
			                            </table>
                           			 </div>
										</div>
									<!-- 연차 내역 가운데 시작(상세 정보) 시작-->
									</div>
								</div>
								<!--/ Email list Area -->

							</div>
						</div>
					</div>
				</div>
				<!-- 연차내역(오른쪽 영역) 끝 -->
			</section>
		</div>
	</div>


 <script>
		$(function(){
			$("#status").css("z-index","1")
			$(".list-group").css("z-index","0")
			$(".card-title").css("z-index","0")
			
			$("#selectStatus").click(function(){
				if($("#status").css("display") == "none") {
					$("#status").show();
					
					var width = $("#selectStatus").css("width");
					
					$("#status").css("width", width)
				}
				
				else {
					$("#status").hide();
				}
			})
			
		})
		
		// 사이드바 시간표현
		function printClock() {
		    //출력 위치
		    var clock = document.getElementById("clock");
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
			
		    if(currentHours >= 18 && currentMinute >= 00 && currentSeconds >= 00){// 퇴근시간 18시 이상이면 빨간색으로 색 변경
		    	currentHours = '<span style="color:#de1951;">'+currentHours+'</span>'
		    	currentMinute = '<span style="color:#de1951;">'+currentMinute+'</span>'
		    	currentSeconds = '<span style="color:#de1951;">'+currentSeconds+'</span>'
		     }

		    
		    clock.innerHTML = currentHours+":"+currentMinute+":"+currentSeconds; //날짜를 출력해 줌
		    
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
	</script>


	<script
		src="${pageContext.request.contextPath}/resources/kjs_assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/kjs_assets/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/kjs_assets/js/main.js"></script>
<script
		src="${ pageContext.servletContext.contextPath }/resources/kth_assets/libs/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap tether Core JavaScript -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/kth_assets/libs/popper.js/dist/umd/popper.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/kth_assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- apps -->
	<!-- apps -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/kth_dist/js/app-style-switcher.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/kth_dist/js/feather.min.js"></script>
	<!-- slimscrollbar scrollbar JavaScript -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/kth_assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/kth_assets/extra-libs/sparkline/sparkline.js"></script>
	<!--Wave Effects -->
	<!-- themejs -->
	<!--Menu sidebar -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/kth_dist/js/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/kth_dist/js/custom.min.js"></script>
	<!--  -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/summernote/summernote-lite.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/summernote/lang/summernote-ko-KR.js"></script>

	<jsp:include page="${pageContext.request.contextPath}/bottom.jsp" />
</body>
</html>