<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
#center {
	text-align: center;
	margin: auto;
	justify-content: center;
	display: flex;
}
</style>

</head>
<body>

	<jsp:include page="top.jsp" />

	<div class="container">


		<div style="margin: 50px">


			<hr>
			<p id="center">
				<b>문서번호 : 1</b>
			</p>
			<hr>
			<p id="center">
				<b>작성자 : 임현빈</b>
			</p>
			<hr>
			<p id="center">
				<b>부서 : 기획팀</b>
			</p>
			<hr>
			<p id="center">
				<b>유 형 : 결재</b>
			</p>
			<hr>
			<p id="center">
				<b>작성일 : 2022-05-31</b>
			</p>
			<hr>

			
			<p style="width: 6%; float: left;">
				&nbsp&nbsp<b> 제 목 </b>
			</p>
			<input type="text" id="title" name="title" class="mb-3"
				placeholder="제목을 입력하세요." style="width: 94%; float: right" readonly>

			<textarea name="content" id="content"
				style="width: 100%; height: 300px;" placeholder="내용을 입력하세요." readonly></textarea>

			<input type="file" id="file" name="file">

		</div>
		
		<div style="margin:-48px">
		<button type="button" class="btn btn-primary btn-sm"
			style="width: 10%; height: 30px; background-color:#0066FF" id="center"
			onclick="update()">수정</button>
			
			<br>
	
		<button type="button" class="btn btn-primary btn-sm"
			style="width: 10%; height: 30px; background-color:#DD0000" id="center"
			onclick="end()">삭제</button>
		</div>
	
	
		<div class="px-4 py-1 my-5 text-center">
			<p class="display-5 fw-bold"></p>

		</div>
	
	
	</div>
	
	
	<jsp:include page="bottom.jsp" />
	

		<script>
	
	  function update() { //수정 테스트용
		  location.href="/documentUpdate.jsp;"      
	         }   
	         
	  function end() { //삭제 테스트용
		  location.href="/documentView.jsp;"      
	         }   
	</script>
	
</body>
</html>