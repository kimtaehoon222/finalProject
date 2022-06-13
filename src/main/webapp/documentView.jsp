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
		
	#centerTest { <!-- 임시 -->
	text-align: center;
	margin: auto;
	justify-content: center;
	display: flex;
</style>

</head>
<body>
	<jsp:include page="top.jsp" />
	
		<div class="container">
	
	<div class="px-3 py-3 my-4">
			<div class="card-body">
				<h4 class="card-title" style="color: rgb(124, 127, 251)">
					<b>문서 양식 보관함</b>
				</h4>
				<div class="table-responsive">
					<table class="table" style="width: 1300px">
						<thead>
							<tr>
								<th>No</th>
								<th>유형</th>
								<th>문서제목</th>
								<th>작성자</th>
								<th>부서</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>결재</td>
								<td style="width: 300px">매출 보고 양식</td>
								<td>김재호</td>
								<td>기획팀</td>
								<td>2022-06-12</td>
							</tr>

						</tbody>
					</table>
				</div>
			</div>
		</div>	
		
		<button type="button" class="btn btn-primary btn-sm"
							style="width: 10%; height: 30px;" id="center" onclick="insert()"> 등록하기 </button>
		</div>
		
		<button type="button" class="btn btn-primary btn-sm"
							style="width: 10%; height: 30px;" id="centerTest" onclick="detailTest()"> 상세보기(임시) </button>
	
		
	<jsp:include page="bottom.jsp" />
	
	<script>
	
	  function detailTest() { //상세 테스트용
		  location.href="/documentDetail.jsp;"      
	         }   
	  
	  function insert() { //상세 테스트용
		  location.href="/documentInsert.jsp;"      
	         }   
	         
	</script>
	
</body>
</html>