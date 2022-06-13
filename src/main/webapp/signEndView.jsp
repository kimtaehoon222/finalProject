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
	
	<div class="px-3 py-3 my-4">
			<div class="card-body">
				<h4 class="card-title" style="color: rgb(124, 127, 251)">
					<b>완료 문서함</b>
				</h4>
				<div class="table-responsive">
					<table class="table" style="width: 1300px">
						<thead>
							<tr>
								<th>No</th>
								<th>문서 보존기한</th>
								<th>문서제목</th>
								<th>기안자</th>
								<th>기안부서</th>
								<th>기안일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>1년</td>
								<td style="width: 300px">2/4분기 매출 보고</td>
								<td>김태훈</td>
								<td>총무팀</td>
								<td>2022-06-09</td>
							</tr>


						</tbody>
					</table>
				</div>
			</div>
		</div>	
		
		</div>
	<jsp:include page="bottom.jsp" />
</body>
</html>