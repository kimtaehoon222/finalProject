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
									 
										<!-- 근태 상세 정보 상단 시작 -->
							
									
									
										<!-- 근무 상세정보 가운데(주차, 일) 시작 -->
										<div class="email-user-list list-group ps ps--active-y">
										
						
											<!-- 이번달이 4주인지 5주인지 구분 -->
											<!-- wlist의 크기를 7로 나눠서 몫이 4이고, 나머지가 0이면 : 4주-->
											<!-- 그 외에는 5주-->
								
												<div class="row" style="border-bottom: 2px solid rgba(0,0,0,.125);">
													<!-- 주차 표시 -->
												
													
													<!-- 주 정보 시작 -->
													<!-- 헤더 표시, 접었다 펼 수 있음 -->
											
													<!-- 주 정보 끝 -->
													
													<!-- 주  상세 정보(일별) 시작 -->
													<!-- 이런식으로 일자로 표시(7일) for문 돌리면서 넣으면 될듯?-->
													
												
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