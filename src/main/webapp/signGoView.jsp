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
					<b>결재 진행함</b>
				</h4>
				<div class="table-responsive">
					<table class="table" style="width: 1300px">
						<thead>
							<tr>
								<th>No</th>
								<th>분류</th>
								<th>기안문</th>
								<th>기안부서</th>
								<th>기안자</th>
								<th>1차 승인일</th>
								<th>기안일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>결재</td>
								<td style="width: 300px">2/4분기 매출 보고</td>
								<td>총무팀</td>
								<td>전재은</td>
								<td>2022-06-12</td>
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