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
	<title>scheduleDetail</title>
</head>
<body>
<!--  class="modal fade"  -->
	<form id="sked-insert-modal" tabindex="-1" aria-hidden="true" action="schedule.html" method="POST">
	<div class="modal-dialog modal-l" role="document">
		<div class="modal-content">
		    <!-- 모달 헤더 -->
		    <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel4">일정 등록</h5>
		    </div>
			<!-- 모달 바디 -->
			<div class="modal-body">
				<!-- 1번줄 -->
				<div class="row">
				<!-- 카테고리 -->
				    <div class="col mb-3">
				    <label for="sked_code" class="form-label">카테고리</label>
				        <!-- <input type="text" id="sked_code" class="form-control" placeholder="xxxx@xxx.xx" /> -->
				        <select id="sked_code" name="sked_code" class="form-select" autofocus required>
				            <option value="P">개인</option>
				            <option value="D">부서</option>
				        </select>
				    </div>
				    <!-- 색상 -->
				    <div class="col mb-3">
				        <label for="sked_color" class="form-label">색상</label>
				        <!-- <input type="text" id="sked_color" class="form-control" placeholder="DD / MM / YY" /> -->
				        <div class="form-control color_radio">
				            <div class="form-check form-check-inline">
				                <input class="form-check-input" type="radio" name="sked_color" id="color_pink" value="c1" required />
				            </div>
				            <div class="form-check form-check-inline">
				                <input class="form-check-input" type="radio" name="sked_color" id="color_blue" value="c2" />
				            </div>
				            <div class="form-check form-check-inline">
				                <input class="form-check-input" type="radio" name="sked_color" id="color_yellow" value="c3" />
				            </div>
				            <div class="form-check form-check-inline">
				                <input class="form-check-input" type="radio" name="sked_color" id="color_purple" value="c4" />
				            </div>
				            <div class="form-check form-check-inline">
				                <input class="form-check-input" type="radio" name="sked_color" id="color_red" value="c5" />
				            </div>
				        </div>
				    </div>
				</div>
				<!-- 2번줄 -->
				<div class="row">
				    <div class="col mb-3">
				        <label for="sked_title" class="form-label">제목</label>
				        <input type="text" id="sked_title" class="form-control" placeholder="제목을 입력하세요." required/>
				    </div>
				</div>
				<!-- 3번줄 -->
				<div class="row" id="line3">
				<!-- 시작 날짜 -->
				    <div class="col mb-3">
				        <label for="start_date" class="form-label">날짜</label>
				        <input id="start_date" type="date" class="form-control" required>
				        <label for="end_date" class="form-label">종료날짜</label>
				        <input id="end_date" type="date" class="form-control">
				    </div>
				    <!--시간 -->
				    <div class="col mb-3">
				        <div class="row">
				            <label for="start_time" class="form-label">시작 시간</label>
				            <input id="start_time" type="time" class="form-control"/>
				            <label for="fin_time" class="form-label">종료 시간</label>
				            <input id="fin_time" type="time" class="form-control"/>
				        </div>
				    </div>
				</div>
				<!-- 4번줄 -->
				<div class="row">
				    <div class="col mb-3">
				        <label for="sked_content" class="form-label">내용</label>
				        <input type="text" id="sked_content" class="form-control" placeholder="내용을 입력하세요." required/>
				    </div>
				</div>
				<!-- 5번줄 -->
				<div class="row">
				    <div class="col mb-3">
				        <label for="sked_place" class="form-label">장소</label>
				        <input type="text" id="sked_place" class="form-control" placeholder="장소 입력"/>
				    </div>
				</div>
				<!-- 6번줄 -->
				<div class="row">
				    <div class="col mb-3">
				        <label for="sked_meno" class="form-label">메모</label>
				        <textarea id="sked_meno" class="form-control" placeholder="메모 입력"></textarea>
				        <!-- <input type="text" id="nameExLarge" class="form-control" placeholder="Enter Name" /> -->
				    </div>
				    
				</div>
			</div>
			<!-- 모달 풋터 -->
			<div class="modal-footer detail_footer">
			    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
			        닫기
			    </button>
			    <button type="submit" class="btn btn-primary" id="sked_update_btn">수정</button>
			    <button type="button" class="btn btn-danger" id="sked_delete_btn">삭제</button>
			</div>
		</div>
	</div>
	</form>
	
	<script src='jje_schedule.js'></script>
	
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