<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
tr>td{
	text-align: center;
}
tr>th{
	text-align: center;
}
</style>
</head>
<body>

	<jsp:include page="../common/top.jsp" />
	
	<div class="container-xxl flex-grow-1 container-p-y">
		<div class="card">
	      	<div class="card-body">
			<button type="button" class="btn btn-primary mb-2 mx-3">목록으로</button>
			<button type="button" class="btn btn-primary mb-2">수정</button>
			<button type="button" class="btn bg-danger mb-2"><span style="color:white;">삭제</span></button>
			<hr>
	        <form id="formAccountSettings" method="POST" onsubmit="return false">
	          <!-- 공지사항 정보 영역 시작 -->
	          <div class="row">
	            <!-- 제목 영역 -->
	          	<h3 class="text-dark" style="text-align: center;">
	          	<b class="text-danger">[중요]</b>
	          	<b>어린이날 대체공휴일 휴무안내</b></h3>
	          	
	          	<hr>

	            <!-- 내용 영역 -->
	            <div class="mb-2 col-md-12" style="height: 500px; padding: 100px 0; text-align: center;">
	            	<h4>2022년 5월 6일(월)은 어린이날 대체 공휴일로 휴무임을 알려드립니다.<br><br>
					업무에 차질이 없도록 참고하시기 바랍니다.</h4>
	            </div>
	           
	           	<hr>
	           	
	           	<!-- 작성자/부서 영역 -->
	            <div class="mb-2 col-md-12 text-dark" style="text-align: center;">
	           		 <h5 class="text-dark"><b>총무부</b></h5>
	            </div>
	          </div>
	          <!-- 공지사항 정보 영역 끝 -->
         	</form> 
       		</div>
       		
	   	</div>        
	</div>
	
	<jsp:include page="../common/bottom.jsp" />  

</body>
</html>