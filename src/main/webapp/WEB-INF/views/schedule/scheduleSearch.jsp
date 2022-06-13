<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>
	
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
	
	<!-- Page CSS -->
	
	<!-- Helpers -->
	<script src="${pageContext.request.contextPath}/resources/assets/vendor/js/helpers.js"></script>
	
	<!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
	<!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/config.js"></script>
	<link href='${pageContext.request.contextPath}/resources/jje_css/jje_schedule.css' rel='stylesheet' />
	<title>scheduleSearch</title>
</head>
<body>
<!-- Bordered Table -->
	<div class="card">
	    <h5 class="card-header">검색 결과</h5>
	    <div class="card-body">
	      <div class="table-responsive text-nowrap">
	        <table class="table table-bordered table-striped">
	          <thead>
	            <tr>
	              <th>날짜</th>
	              <th>시간</th>
	              <th>제목</th>
	              <th>내용</th>
	              <th>종류</th>
	            </tr>
	          </thead>
	          <tbody>
	            <!-- 일정 목록 -->
	          <tr>
	            <td>06/10</td>
	            <td> 14:00~16:00</td>
	            <td>비온다</td>
	            <td>비가오고있어요</td>
	            <td>개인일정</td>
	          </tr>
	
	          <tr>
	            <td>06/11</td>
	            <td> 14:00~16:00</td>
	            <td>비온다</td>
	            <td>비가오고있어요</td>
	            <td>개인일정</td>
	          </tr>
	
	          <tr>
	            <td>06/12</td>
	            <td> 14:00~16:00</td>
	            <td>비온다</td>
	            <td>비가오고있어요</td>
	            <td>개인일정</td>
	          </tr>
	
	          <tr>
	            <td>06/13</td>
	            <td> 14:00~16:00</td>
	            <td>비온다</td>
	            <td>비가오고있어요</td>
	            <td>개인일정</td>
	          </tr>
	
	        </tbody>
	      </table>
	    </div>
	  </div>
	</div>
	<!--/ Bordered Table -->

	<script src='${pageContext.request.contextPath}/resources/jje_css/jje_schedule.js'></script>
	
	<!-- Core JS -->
	<!-- build:js assets/vendor/js/core.js -->
	<script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/jquery/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/popper/popper.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/vendor/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
	
	<script src="${pageContext.request.contextPath}/resources/assets/vendor/js/menu.js"></script>
	<!-- endbuild -->
	
	<!-- Vendors JS -->
	<script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
	
	<!-- Main JS -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
	
	<!-- Page JS -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/extended-ui-perfect-scrollbar.js"></script>
	
	<!-- Place this tag in your head or just before your close body tag. -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>