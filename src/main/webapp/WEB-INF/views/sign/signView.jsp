<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
#center {
	text-align: center;
	margin: auto;
	justify-content: center;
	display: flex;
}

.badge-gradient-success {<!--
	초록 --> background: -webkit-gradient(linear, left top, right top, from(#84d9d2),
		to(#07cdae));
	background: linear-gradient(90deg, #84d9d2, #07cdae);
	color: #fff;
}

.badge-gradient-warning {<!--
	노랑 --> background: -webkit-gradient(linear, left top, right top, from(#f6e384),
		to(#ffd500));
	background: linear-gradient(90deg, #f6e384, #ffd500);
	color: #fff;
}

.badge-gradient-info {<!--
	파랑 --> background: -webkit-gradient(linear, left top, right top, from(#90caf9),
		color-stop(99%, #047edf));
	background: linear-gradient(90deg, #90caf9, #047edf 99%);
	color: #fff;
}

.badge-gradient-danger {<!--
	복숭아색 --> background: -webkit-gradient(linear, left top, right top, from(#ffbf96),
		to(#fe7096));
	background: linear-gradient(90deg, #ffbf96, #fe7096);
	color: #fff;
}
</style>
</head>
<body>

	<jsp:include page="top.jsp" />
	<div class="container">
		<br> <br>
		<h2 style="color: rgb(124, 127, 251)">
			<b>결재함</b>
		</h2>

		<!-- Button trigger modal -->
		<button type="button" class="btn btn-sm btn-outline-primary" id="center" style="padding: 10px; width: 300px" data-bs-toggle="modal"
			data-bs-target="#exampleModal"><b>새 결재 진행</b></button>

		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header" >
						<button type="button" class="btn btn-primary" style="float:right">상신</button>
						<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">...</div>
					<div class="modal-footer">
					<!--  	<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button> -->
						
					</div>
				</div>
			</div>
		</div>

		<div class="px-3 py-3 my-4">
			<div class="card-body">
				<h4 class="card-title" style="color: rgb(124, 127, 251)">
					<b>요청 대기함</b>
				</h4>
				<div class="table-responsive">
					<table class="table" style="width: 1300px">
						<thead>
							<tr>
								<th>No</th>
								<th>분류</th>
								<th>기안문</th>
								<th>상태</th>
								<th>기안자</th>
								<th>기안일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>결재</td>
								<td style="width: 300px">2/4분기 매출 보고</td>
								<td><label class="badge badge-gradient-success">요청</label></td>
								<td>김지수</td>
								<td>2022-06-09</td>
							</tr>


						</tbody>
					</table>
				</div>

				<br>

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
								<th>상태</th>
								<th>기안자</th>
								<th>기안일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>협조</td>
								<td style="width: 300px">교육비 지급 요청의 건</td>
								<td><label class="badge badge-gradient-success">진행</label></td>
								<td>김태훈</td>
								<td>2022-06-02</td>
							</tr>

							<tr>
								<td>2</td>
								<td>협조</td>
								<td style="width: 300px">물품 구매 요청의 건</td>
								<td><label class="badge badge-gradient-success">대기</label></td>
								<td>임현빈</td>
								<td>2022-05-30</td>
							</tr>
						</tbody>
					</table>
				</div>

				<br>

				<h4 class="card-title" style="color: rgb(124, 127, 251)">
					<b>반려 문서함</b>
				</h4>
				<div class="table-responsive">
					<table class="table" style="width: 1300px">
						<thead>
							<tr>
								<th>No</th>
								<th>분류</th>
								<th>기안문</th>
								<th>상태</th>
								<th>기안자</th>
								<th>기안일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>결재</td>
								<td style="width: 300px">대표는 보아라</td>
								<td><label class="badge badge-gradient-danger">반려</label></td>
								<td>임현빈</td>
								<td>2022-05-05</td>
							</tr>

							<tr>
								<td>2</td>
								<td>협조</td>
								<td style="width: 300px">잘부탁드립니다.</td>
								<td><label class="badge badge-gradient-danger">반려</label></td>
								<td>전재은</td>
								<td>2022-05-03</td>
							</tr>

							<tr>
								<td>3</td>
								<td>결재</td>
								<td style="width: 300px">어제 매출 UP~</td>
								<td><label class="badge badge-gradient-danger">반려</label></td>
								<td>김지수</td>
								<td>2022-05-01</td>
							</tr>
						</tbody>
					</table>
				</div>

				<br>

				<h4 class="card-title" style="color: rgb(124, 127, 251)">
					<b>완료 문서함</b>
				</h4>
				<div class="table-responsive">
					<table class="table" style="width: 1300px">
						<thead>
							<tr>
								<th>No</th>
								<th>분류</th>
								<th>기안문</th>
								<th>상태</th>
								<th>기안자</th>
								<th>기안일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>결재</td>
								<td style="width: 300px">1분기 물품 구매 현황</td>
								<td><label class="badge badge-gradient-info">완료</label></td>
								<td>임현빈</td>
								<td>2022-05-31</td>
							</tr>

						</tbody>
					</table>
				</div>

			</div>
		</div>

	</div>

	<div class="px-4 py-1 my-5 text-center">
		<p class="display-5 fw-bold"></p>

	</div>
	</div>

	<jsp:include page="bottom.jsp" />

	<script>
	 
	</script>
</body>
</html>