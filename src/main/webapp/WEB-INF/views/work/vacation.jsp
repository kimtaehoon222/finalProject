<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>    
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
<!-- summernote -->
<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/resources/summernote/summernote-lite.css">

<title>연차 조회</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
	.inner:hover{
		color: rgb(95,118,232);
	}
	
	#status{
		display:none;
		position:absolute;
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
					
					<div class="col-10">
						<h3>연차 내역</h3>
						<div class="row">
							<div class="m-auto">
								<span>2022.06</span>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12 m-auto">
								<div class="d-flex col-11 m-auto" style="border: 1px solid rgba(0,0,0,.125); background-color: white">
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
								</div>
							</div>
						</div>
						<br><br>
						
						<!-- 연차 사용 내역 -->
						<div class="row" style="border-bottom: 2px solid rgba(0,0,0,.125);">
						
							<div class="d-flex col-12" style="padding: 0px 10px; border-bottom: 2px solid rgba(0,0,0,.125);">
								<div class="text-left col-2">
									<h5>사용내역</h5>
								</div>
							</div>
							
							<!-- 헤더 표시 -->
							<div class="d-flex col-12" style="border-bottom: 1px solid rgba(0,0,0,.125);">

								<div class="col-2">
									<span>부서명</span>
								</div>
								<div class="col-2">
									<span>휴가종류</span>
								</div>
								<div class="col-3">
									<span>연차 사용기간</span>
								</div>
								<div class="col-2">
									<span>사용 연차</span>
								</div>
								<div class="col-2">
									<span>내용</span>
								</div>
							</div>
							<!-- 이런식으로 사용 내역 넣을 거임.(for문을 돌리면서 넣으면 될 듯) -->
							<div class="d-flex col-12">
										<div class="col-2">
											<span>인사부</span>
										</div>
										<div class="col-2">
											<span>연차</span>
										</div>
										<div class="col-3">
											<span>2022.05.13~2022.05.14</span>
										</div>
										<div class="col-2">
											<span>1</span>
										</div>
										<div class="col-2">
											<span>병원진료</span>
										</div>


							</div>
										<div class="d-flex col-12">
										<div class="col-2">
											<span>인사부</span>
										</div>
										<div class="col-2">
											<span>연차</span>
										</div>
										<div class="col-3">
											<span>2022.05.13~2022.05.14</span>
										</div>
										<div class="col-2">
											<span>1</span>
										</div>
										<div class="col-2">
											<span>병원진료</span>
										</div>


							</div>
						
					
						</div>

						
					
							
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
	<script
		src="${ pageContext.servletContext.contextPath }/resources/summernote/summernote-lite.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/summernote/lang/summernote-ko-KR.js"></script>

</body>
</html>