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
	href="${pageContext.request.contextPath}/resources/kjs_assets/css/bootstrap.css">
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
	<jsp:include page="top.jsp" />

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

			<!-- 영역 :왼쪽 근태관리 사이드 바  ,  오른쪽 근태 상세 정보 -->
			<section class="section content-area-wrapper">

				<!-- 사이드 바 시작 -->
				<div class="sidebar-left">
					<!-- sidebar start -->
					<div class="sidebar">
						<div class="sidebar-content email-app-sidebar d-flex">


							<!-- email-app-menu start -->
							<div class="email-app-menu">
								<div class="form-group form-group-compose">
									<c:set var="today" value="<%= new java.util.Date() %>"/>
								<p style="font-size:14px"><fmt:formatDate value="${today}" type="date" pattern="yyyy-MM-dd (E)"/></p>
								<p id="clock" style="font-size:40px">12:00:00</p>
								</div>

								<div class="sidebar-menu-list ps">
									<!-- 메일 사이드바 시작 -->
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
													<div class="d-flex align-items-center">
													
													
													<!-- choose when으로 출근시간이 있으면 출근버튼 비활성화 -->
													<!-- 출근,퇴근시간이 없으면 퇴근버튼 비활성화 -->
													<!-- 출근,퇴근시간이 있으면 출근,퇴근버튼 비활성화 -->
													<!-- disabled 속성 넣음.-->
													<button type="submit" class="btn btn-rounded btn-outline-primary col-6" style="margin:2px" value="1" name="status">출근하기</button>
													<button type="submit" class="btn btn-rounded btn-outline-primary col-6" style="margin:2px" value="2" name="status" disabled>퇴근하기</button>
												
													</div>
													<div class="d-flex align-items-center">
														<button type="button" id="selectStatus" class="btn btn-rounded btn-outline-primary col-12" style="margin:2px 2px 0px 2px;">근무상태변경<i data-feather="chevron-down" class="feather-icon"></i></button>
													</div>
													<div id="status" class="align-items-center" style="border: 1px solid rgb(95,118,232); border-radius: 10px; background-color:white;">
														<button type="submit" class="d-flex col-12 btn btn-outline-primary" style="border:none; border-top-left-radius: 9px; border-top-right-radius: 9px;" value="3" name="status">업무중</button>
														<button type="submit" class="d-flex col-12 btn btn-outline-primary" style="border:none;" value="4" name="status">외출중</button>
														<button type="submit" class="d-flex col-12 btn btn-outline-primary" style="border:none;" value="5" name="status">출장중</button>
													</div>
											</div> 
										
					
									</div>
									<!-- 메일 사이드바 끝 -->
								</div>

							</div>
							<!-- email-app-menu end -->

						</div>
					</div>
					<!-- sidebar end -->
				</div>
				<!-- 근태 사이드 바 끝 -->

				<!-- 근태 상세 정보 시작  -->
				<div class="content-right">
					<div class="content-wrapper">
						<div class="content-body">
							<!-- email app overlay -->
							<div class="email-app-area">

								<!-- Email list Area -->
								<div class="email-app-list-wrapper">
									<div class="email-app-list">
						    <div class="m-auto">
								<span><i data-feather="chevron-left" class="feather-icon" id="before"></i></span>
								<span>2022.06</span>
								<span><i data-feather="chevron-right" class="feather-icon" id="after"></i></span>
							</div>
										<!-- 근태 상세 정보 상단 시작 -->
								<div class="email-action">
									<div class="col-2 m-auto" style="height:100%; padding:10px 0px">
										<p class="text-center m-auto" style="font-size:12px">이번주 누적</p>
										<p class="text-center m-auto text-primary">3h 27m 32s</p>
									</div>
									<div class="col-2 m-auto" style="height:100%; padding:10px 0px">
									<p class="text-center m-auto" style="font-size:12px">이번주 초과</p>
										<p class="text-center m-auto text-primary">3h 27m 32s</p>
									</div>
									<div class="col-2 m-auto" style="height:100%; padding:10px 0px">
										<p class="text-center m-auto" style="font-size:12px">이번주 잔여</p>
										<p class="text-center m-auto text-primary">3h 27m 32s</p>
									</div>
									<div class="col-2 m-auto" style="height:100%; padding:10px 0px">
										<p class="text-center m-auto" style="font-size:12px">이번달 누적</p>
										<p class="text-center m-auto">3h 27m 32s</p>
									</div>
									<div class="col-2 m-auto" style="height:100%; padding:10px 0px">
										<p class="text-center m-auto" style="font-size:12px">이번달 연장</p>
										<p class="text-center m-auto">3h 27m 32s</p>
									</div>
											<!-- 근태 상세 정보  상단 끝 -->
								</div>
									
										<br>
										<!-- 근무 상세정보 가운데(주차, 일) 시작 -->
										<div class="email-user-list list-group ps ps--active-y">
											<!-- 메일 리스트 시작 -->
											<c:set var="begin" value="0"/>
											<c:set var="end" value="6"/>
						
											<!-- 이번달이 4주인지 5주인지 구분 -->
											<!-- wlist의 크기를 7로 나눠서 몫이 4이고, 나머지가 0이면 : 4주-->
											<!-- 그 외에는 5주-->
											<c:choose>
												<c:when test="${wlist.size() / 7 == 4 && wlist.size() % 7 == 0}">
													<c:set var="weekNum" value="4"/>
												</c:when>
												<c:otherwise>
													<c:set var="weekNum" value="5"/>
												</c:otherwise>
											</c:choose>
											<c:forEach var="week" begin ="1" end ="${weekNum }">
												<div class="row" style="border-bottom: 2px solid rgba(0,0,0,.125);">
													<!-- 주차 표시 -->
													<div class="d-flex col-12" style="padding: 0px 10px; border-bottom: 2px solid rgba(0,0,0,.125);">
														<div class="text-left col-2">
															<!-- 접었다 펼때 아이콘 바뀜 -->
															<h5 class="chevron cl" id="chevron${week }"><i data-feather="chevron-down" class="feather-icon inner"></i>&nbsp;&nbsp;${week }주차</h5>
														</div>
														<!-- <div class="text-right col-10">
															<span>누적 근무시간 00h 00m 00s (초과 근무시간 00h 00m 00s)</span>
														</div> -->
													</div>
													
													<!-- 주 정보 시작 -->
													<!-- 헤더 표시, 접었다 펼 수 있음 -->
													<div class="col-12 week" id="week${week }" style="border-bottom: 1px solid rgba(0,0,0,.125);">
														<div class="col-1 text-center">
															<span>일차</span>
															
														</div>
														<div class="col-2">
															<span>업무시작</span>
										
														</div>
														<div class="col-2">
															<span>업무종료</span>
														
														</div>
														<div class="col-2">
															<span>총 근무시간</span>
													
														</div>
													</div>
													<!-- 주 정보 끝 -->
													
													<!-- 주  상세 정보(일별) 시작 -->
													<!-- 이런식으로 일자로 표시(7일) for문 돌리면서 넣으면 될듯?-->
													<div class="col-12 selects${week }">
														  <div class="col-1 text-center">
															<span class="date" id="${date.WDate}"><fmt:formatDate value="" type="date" pattern="dd"/>1일</span>
														</div>
														
														<div class="col-2">
															<span class="startTime">09:00:00</span>			
														</div>
														<div class="col-2">
															<span class="endTime">18:00:00</span>
														</div>
														<div class="col-2">
															<span id="total${date.WNo }">09h 00m 00s</span>
														</div>
													</div>
													<!-- 주  상세 정보(일별) 끝 -->
													
													<!-- 주  상세 정보(일별) 시작 -->
													<div class="col-12 selects${week }">
														  <div class="col-1 text-center">
															<span class="date" id="${date.WDate}"><fmt:formatDate value="" type="date" pattern="dd"/>1일</span>
														</div>
														
														<div class="col-2">
															<span class="startTime">09:00:00</span>			
														</div>
														<div class="col-2">
															<span class="endTime">18:00:00</span>
														</div>
														<div class="col-2">
															<span id="total${date.WNo }">09h 00m 00s</span>
														</div>
													</div>
													<!-- 주  상세 정보(일별) 끝 -->
						
													</c:forEach>
													<c:set var="begin" value="${begin+7 }"/>
													<c:set var="end" value="${end+7 }"/>
											</div>
											<!-- 근무 상세정보 가운데(주차, 일) 끝 -->
											<br>

								

											<!-- no result when nothing to show on list -->
											<div class="no-results">
												<i class="bx bx-error-circle font-large-2"></i>
												<h5>No Items Found</h5>
											</div>
											<div class="ps__rail-x" style="left: 0px; bottom: 0px;">
												<div class="ps__thumb-x" tabindex="0"
													style="left: 0px; width: 0px;"></div>
											</div>
											<div class="ps__rail-y"
												style="top: 0px; height: 733px; right: 0px;">
												<div class="ps__thumb-y" tabindex="0"
													style="top: 0px; height: 567px;"></div>
											</div>
										</div>
										
									</div>
								</div>
								<!--/ Email list Area -->

							</div>
						</div>
					</div>
					<!-- 근태 상세정보 끝 -->
				</div>
			</section>
		</div>
	</div>


 <script>
 		//사이드 바 상태 변경
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
	
	
	<script>
		//주 차(일) 상세 보기
		$(function(){
			
			$(".chevron").click(function(){
				
				var week = $(this).attr('id').substr(7, 1);
				
				if($(this).attr('class').includes('cl') == true) {
					$(this).removeClass('cl');
					$(this).addClass('op');
					
					//헤더 클래스에 d-flex추가
					//내용 클래스에 d-flex추가
					$("#week" + week).addClass('d-flex')
					$(".selects" + week).addClass('d-flex')
					
				}
				
				else if($(this).attr('class').includes('op') == true){
					
					$(this).removeClass('op');
					$(this).addClass('cl');
					
					//헤더 클래스에 d-flex추가
					//내용 클래스에 d-flex추가 
					$("#week" + week).removeClass('d-flex')
					$(".selects" + week).removeClass('d-flex')
					
				}
			})
			
			
		})
		
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
	
	<jsp:include page="bottom.jsp" />
</body>
</html>