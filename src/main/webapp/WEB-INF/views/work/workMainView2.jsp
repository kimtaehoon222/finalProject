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


<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/kjs_assets/images/favicon.svg"
	type="image/x-icon">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../common/top.jsp"/>

	<div class="container-xxl flex-grow-1 container-p-y">

		<div class="page-heading email-application">
			<div class="page-title">
				<div class="row">
					<div class="col-12 col-md-6 order-md-1 order-last">
						<h3>근태 현황</h3>
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
			<div>
				<jsp:include page="../work/workSidebarView.jsp">
				<jsp:param value="${w}" name="w"/>
				</jsp:include>
			</div>
			
			<script>

		

			
			$(function(){
				var currentDate = new Date();
				
				var year = currentDate.getFullYear();	//이번년도
				var month = currentDate.getMonth() + 1;	//이번달
				
				var empNo = "${sessionScope.loginEmp.empNo}";	//로그인유저 사번
				
				$.ajax({
					type: "POST", 
					url:"selectWorkList.do",
					dataType:"html",	//html 방식
					data: { 
							year:year, 
							month: month, 
							empNo: empNo
						},
					success : function(result){
						
						$('#workList').html(result);	//html태그 넣기
					},
					error : function(){
						
						alert("근무정보를 조회할 수 없습니다. \n관리자에게 문의하세요.");
					}
				});
			})
			
			
		$('.ab').click(function(){
			if($(this).attr('id') == 'before'){
				month = month - 1;
				if(month < 1){
					year = year - 1;
					month = 12;
				}
			}
			else{
				month = month + 1;
				if(month > 12){
					year = year + 1;
					month = 1;
				}
			}
		})
		
		
		</script>
				<!-- 근태 상세 정보 시작  -->
				<div class="content-right">
					<div class="content-wrapper">
						<div class="content-body">
							<!-- email app overlay -->
							<div class="email-app-area">

								<!-- Email list Area -->
								<div class="email-app-list-wrapper">
									<div class="email-app-list" id="workList">
									    <div class="m-auto">
											<span class="ab" id="before"><i data-feather="chevron-left" class="feather-icon" id="before"></i></span>
											<span>${year }.${month }</span>
											<span class="ab" id="after"><i data-feather="chevron-right" class="feather-icon" id="after"></i></span>
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
															<span class="date" id="${date.workDate}"><fmt:formatDate value="" type="date" pattern="dd"/></span>
														</div>
														
														<div class="col-2">
															<c:set var="st" value="${date.startTime }"/>
															<c:choose>
																<c:when test="${empty st }">
																	<span class="startTime"></span>
																</c:when>
																<c:otherwise>
																	<span class="startTime">${st }</span>
																</c:otherwise>
															</c:choose>
														</div>
														<div class="col-2">
															<c:set var="et" value="${date.endTime }"/>
															<c:choose>
																<c:when test="${empty et }">
																	<span class="endTime"></span>
																</c:when>
																<c:otherwise>
																	<span class="endTime">${et }</span>
																</c:otherwise>
															</c:choose>
														</div>
														<div class="col-2">
															<c:choose>
																<c:when test="${empty st or empty et }">
																	<span id="total${date.WNo }"></span>
																</c:when>
																<c:otherwise>
																	<span id="total${date.WNo }"></span>
																	<script>
																		$(function(){
																			var st = "${st}";	//string
																			var et = "${et}";
																			
																			//출근시간 시, 분, 초 분리
																			var start = st.split(':');
																			var h1 = start[0];
																			var m1 = start[1];
																			var s1 = start[2];
																			
																			//퇴근시간 시, 분, 초 분리
																			var end = et.split(':');
																			var h2 = end[0];
																			var m2 = end[1];
																			var s2 = end[2];
																			
																			//퇴근시간 - 출근시간 = 총 근무시간
																			var h = h2 - h1;
																			var m = m2 - m1;
																			var s = s2 - s1;
																			
																			//s2 - s1이 0보다 작으면
																			if(s < 0) {
																				m = m-1;
																				s = 60 + s;
																			}
																			if(m < 0){
																				h = h -1;
																				m = 60 + m;
																			}
																			
																			//00형태로 바꾸기
																			if(h < 10){
																				h = '0' + h;
																			}
																			if(m < 10){
																				m = '0' + m;
																			}
																			if(s < 10){
																				s = '0' + s;
																			}
																			
																			//결과
																			var total = h + "h " + m + "m " + s + "s"
																			//입력할 위치의 id
																			var wNo = "${date.WNo}";
																			var thisId = "#total" + wNo;
																			$(thisId).text(total);
																			
																		})
																	</script>
																</c:otherwise>
															</c:choose>
														</div>
													<!-- 주  상세 정보(일별) 끝 -->
													
													<!-- 주  상세 정보(일별) 시작 -->

													<!-- 주  상세 정보(일별) 끝 -->
						

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
							$(function(){
								
								$(".chevron").click(function(){
									
									var week = $(this).attr('id').substr(7, 1);
									
									if($(this).attr('class').includes('cl') == true) {
										$(this).removeClass('cl');
										$(this).addClass('op');
										
									
										$("#week" + week).addClass('d-flex')
						
										
									}
									
									else if($(this).attr('class').includes('op') == true){
										
										$(this).removeClass('op');
										$(this).addClass('cl');
										
						
										$("#week" + week).removeClass('d-flex')
				
										
									}
								})
							
								
							})
							
						</script>
						
						
	
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

	
	
	<jsp:include page="../common/bottom.jsp"/> 
</body>
</html>