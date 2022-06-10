<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="16x16"
	href="${ pageContext.servletContext.contextPath }/resources/kth_assets/images/favicon.png">
<!-- Custom CSS -->
<link
	href="${ pageContext.servletContext.contextPath }/resources/kth_dist/css/style.min.css"
	rel="stylesheet">


<title>근태 현황</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
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
</head>
<body onload="printClock()">
	<!-- ============================================================== -->
	<!-- Preloader - style you can find in spinners.css -->
	<!-- ============================================================== -->
	<div class="preloader">
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- Main wrapper - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<div id="main-wrapper" data-theme="light" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed"
		data-boxed-layout="full">
		<!-- ============================================================== -->
		<!-- Topbar header - style you can find in pages.scss -->
		<jsp:include page="top.jsp" />

		<!-- ============================================================== -->
		<!-- End Topbar header -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Left Sidebar - style you can find in sidebar.scss  -->


		<!-- ============================================================== -->
		<!-- End Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper" style=" background-color: white;">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid" style="height: 100%">
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
				
				<div class="row" style="height: 100%;">
					<!-- 근태관리 사이드바 -->
					<div class="col-2" style="border-right: 1px solid rgba(0,0,0,.125);">
						<jsp:include page="workSidebar.jsp" >
							<jsp:param value="${w}" name="w"/>
						</jsp:include>
					</div>
					
					<!------------------------------------------------------>
					
					<div class="col-10" id="workList">
						<h3>근태 현황</h3>
						<div class="row">
							<div class="m-auto">
								<span><i data-feather="chevron-left" class="feather-icon" id="before"></i></span>
								<span>6월 9일</span>
								<span><i data-feather="chevron-right" class="feather-icon" id="after"></i></span>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12 m-auto">
								<div class="d-flex col-12 m-auto" style="border: 1px solid rgba(0,0,0,.125); background-color: white">
									<!-- 이번주 근무현황 -->
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
								</div>
							</div>
						</div>
						<br><br>
						


							<div class="row" style="border-bottom: 2px solid rgba(0,0,0,.125);">
								<!-- 주차 표시 -->
								<div class="d-flex col-12" style="padding: 0px 10px; border-bottom: 2px solid rgba(0,0,0,.125);">
									<div class="text-left col-2">
										<!-- 접었다 펼때 아이콘 바뀜 -->
										<h5 class="chevron cl" id="chevron"><i data-feather="chevron-down" class="feather-icon inner"></i>&nbsp;&nbsp;${week }주차</h5>
									</div>
									<!-- <div class="text-right col-10">
										<span>누적 근무시간 00h 00m 00s (초과 근무시간 00h 00m 00s)</span>
									</div> -->
								</div>
								
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
								
								
								<!-- 일자 표시 (7일) -->
							
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
												<span id="total${date.WNo }">00h 00m 00s</span>
									</div>
									

								</div>

								<c:set var="begin" value=""/>
								<c:set var="end" value=""/>
							</div>
							<br>

						
						<script>
		
						</script>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- ============================================================== -->
	<!-- End PAge Content -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- Right sidebar -->
	<!-- ============================================================== -->
	<!-- .right-sidebar -->
	<!-- ============================================================== -->
	<!-- End Right sidebar -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- End Container fluid  -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- footer -->
	<!-- ============================================================== -->
		<jsp:include page="bottom.jsp" />
	<!-- ============================================================== -->
	<!-- End footer -->
	<!-- ============================================================== -->

	<!-- ============================================================== -->
	<!-- End Wrapper -->
	<!-- ============================================================== -->
	<!-- End Wrapper -->
	<!-- ============================================================== -->
	<!-- All Jquery -->
	<!-- ============================================================== -->

	
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
	

</body>
</html>