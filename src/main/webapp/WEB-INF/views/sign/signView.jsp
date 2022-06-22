<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>


<title>결재함</title>
<style>
.tftable {
	font-size: 12px;
	color: #333333;
	width: 100%;
	border-width: 1px;
	border-color: #a9a9a9;
	border-collapse: collapse;
}

.tftable th {
	font-size: 12px;
	background-color: #EEEEEE;
	border-width: 1px;
	padding: 2px;
	border-style: solid;
	border-color: #a9a9a9;
}

.tftable tr {
	background-color: #ffffff;
	text-align: center;
}

.tftable td {
	font-size: 12px;
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #a9a9a9;
}

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

.btn-close {
	float: right;
}
</style>
</head>
<body>

	<jsp:include page="../common/top.jsp" />

	<div class="container">
		<br> <br>
		<h2 style="color: rgb(124, 127, 251)">
			<b>결재함</b>
		</h2>
		<div class="col-md-12" id="center">
			<!-- Button trigger modal -->
			<button type="button" class="btn btn-sm btn-outline-primary"
				style="padding: 10px; width: 150px; float: left; margin: 20px"
				data-bs-toggle="modal" data-bs-target="#exampleModal2"
				id="selectListt">
				<b>새 결재 (협조)</b>
			</button>


			<!-- Button trigger modal -->
			<button type="button" class="btn btn-sm btn-outline-primary"
				style="padding: 10px; width: 150px; float: left; margin: 20px"
				data-bs-toggle="modal" data-bs-target="#exampleModal"
				id="selectList">
				<b>새 결재 (품의)</b>
			</button>

			<!-- Button trigger modal -->
			<button type="button" class="btn btn-sm btn-outline-primary"
				style="padding: 10px; width: 150px; float: left; margin: 20px"
				data-bs-toggle="modal" data-bs-target="#exampleModal3"
				id="selectListtt">
				<b>새 결재 (휴가원)</b>
			</button>
		</div>


		<!--                                  품의                                ko                              -->
		<!-- main modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">


				<div class="modal-content">

					<br>
					<h4 id="center">
						<b>품 의</b>
					</h4>

					<form id="insertSign" method="post" action="insertSign.do"
						enctype="multipart/form-data">

						<input type="hidden" name="createName"
							value="${ loginEmp.empName }"> <input type="hidden"
							name="empNo" value="${ loginEmp.empNo }">



						<div class="modal-header">
							<h6 class="modal-title" id="exampleModalLabel">결재번호 :</h6>
						</div>

						<div>
							<br> <b style="margin: 22px; color: rgb(124, 127, 251)">결재선
								지정</b>
						</div>

						<div class="col-md-12">

							<select id="selectName" name="firstApprover" class="form-label"
								style="margin: 22px; height: 25px">

								<!-- selectList 뿌려지는 곳 -->

							</select>

							<script>
							$("#selectList").on('click', function () { //결재선 지정 목록 조회
								
								$.ajax({
									
									url: "selectList.do",
									
									type: "POST",
									
									dataType: "JSON",
									
									success: function(list) {
									
										console.log(list)	
										
									var result="";
									
									$.each(list, function(index, obj) {
										
										result += '<option>' + obj.deptName + " " + obj.empName + " " + obj.jobName + '</option>';

									}) //each 닫는 괄호
									
									$("#selectName").html(result)
									
									}, // success 닫는 괄호
									
									error:function(e) {
										$("#selectName").val("ajax 통신실페")
									}
								}); //ajax 닫는 괄호
								
							}); //맨 마지막 닫는 괄호
						
						</script>


							<fieldset style="width: 30%; float: right; margin: 22px;">
								<p>
									<b>문서 보존 기한</b>
								</p>

								<label> <input type="radio" id="o" name="check"
									value="1년" checked> 1년
								</label> &nbsp&nbsp <label> <input type="radio" id="t"
									name="check" value="2년"> 2년
								</label>

							</fieldset>
						</div>


						<div class="col-md-4">


							<table class="tftable" border="1" hight="10" style="margin: 22px"
								id="selectName">

								<tr>

									<th rowspan="2" width="50px" style="background-color: #ffffff;">발신</th>
									<th>${loginEmp.jobName}</th>
									<th></th>
									<th></th>

								</tr>

								<tr>

									<th style="width: 100px; background-color: #ffffff;">${loginEmp.empName}
									</th>
									<th style="width: 100px; background-color: #ffffff;"></th>
									<th style="width: 100px; background-color: #ffffff;"></th>
								</tr>
							</table>


						</div>
						<b style="color: rgb(124, 127, 251)">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp수신처
							지정</b> 
						<div class="col-md-12">
							<select id="selectDept" name="finalApprover"
							class="form-label"
							style="margin: 22px; height: 25px; width: 150px">

						</select>

						<script>
							$("#selectList").on('click', function () { //수신처 지정 목록 조회
								
								$.ajax({
									
									url: "selectList.do",
									
									type: "POST",
									
									dataType: "JSON",
									
									success: function(list) {
									
										console.log(list)	
										
									var result="";
									
									$.each(list, function(index, obj) {
										
										result += '<option>' + obj.deptName + " " + obj.empName + " " + obj.jobName + '</option>';

									}) //each 닫는 괄호
									
									$("#selectDept").html(result)
									
									}, // success 닫는 괄호
									
									error:function(e) {
										$("#selectDept").val("ajax 통신실페")
									}
								}); //ajax 닫는 괄호
								
							}); //맨 마지막 닫는 괄호
						
						</script>
						</div>
						<div class="modal-body">

							<p style="width: 7%; float: left;">
								<b> 제 목 </b>
							</p>
							<input type="text" id="signTitle" name="signTitle" class="mb-3"
								placeholder="제목을 입력하세요." style="width: 91%; float: right"
								value="${signTitle}">

							<textarea name="signContent" id="signContent"
								style="width: 100%; height: 270px;" placeholder="내용을 입력하세요."
								value="${signContent}"></textarea>

							<input type="file" id="file" name="uploadFile">

						</div>
						<div class="modal-footer">
							<button type="reset" class="btn btn-secondary"
								data-bs-dismiss="modal">닫기</button>
							<button type="submit" class="btn btn-primary" id="endSign">상신</button>

						</div>

					</form>
					<!-- insert Form 끝 태그 -->

				</div>
			</div>
		</div>


		<!--                        협조 											-->
		<div class="modal fade" id="exampleModal2" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">


				<div class="modal-content">

					<br>
					<h4 id="center">
						<b>협 조</b>
					</h4>

					<form id="insertHelp" method="post" action="insertHelp.do"
						enctype="multipart/form-data">

						<input type="hidden" name="createName"
							value="${ loginEmp.empName }"> <input type="hidden"
							name="empNo" value="${ loginEmp.empNo }">

						<div class="modal-header">
							<h6 class="modal-title" id="exampleModalLabel">결재번호 :</h6>
						</div>

						<br> <b style="margin: 22px; color: rgb(124, 127, 251)">결재선
							지정</b>

						<div class="col-md-12">

							<select id="selectNamee" name="firstApprover" class="form-label"
								style="margin: 22px; height: 25px">

								<!-- selectList 뿌려지는 곳 -->

							</select>

							<script>
							$("#selectListt").on('click', function () { //결재선 지정 목록 조회
								
								$.ajax({
									
									url: "selectList.do",
									
									type: "POST",
									
									dataType: "JSON",
									
									success: function(list) {
									
										console.log(list)	
										
									var result="";
									
									$.each(list, function(index, obj) {
										
										result += '<option>' + obj.deptName + " " + obj.empName + " " + obj.jobName + '</option>';

									}) //each 닫는 괄호
									
									$("#selectNamee").html(result)
									
									}, // success 닫는 괄호
									
									error:function(e) {
										$("#selectNamee").val("ajax 통신실페")
									}
								}); //ajax 닫는 괄호
								
							}); //맨 마지막 닫는 괄호
						
						</script>

							<fieldset style="width: 30%; float: right; margin: 22px;">
							<p>
								<b>문서 보존 기한</b>
							</p>

						<label>	<input type="radio" id="o" name="check" value="1년" checked> 
								1년</label> &nbsp&nbsp <label> <input type="radio" id="t"
								name="check" value="2년"> 2년</label>

						</fieldset>
						</div>




						<div class="col-md-4">

							<table class="tftable" border="1" hight="10" style="margin: 22px">
								<tr>

									<th rowspan="2" width="50px" style="background-color: #ffffff;">발신</th>
									<th>${loginEmp.jobName}</th>
									<th></th>
									<th></th>

								</tr>

								<tr>

									<th style="width: 100px; background-color: #ffffff;">${loginEmp.empName}
									</th>
									<th style="width: 100px; background-color: #ffffff;"></th>
									<th style="width: 100px; background-color: #ffffff;"></th>
								</tr>

							</table>

						</div>

						<div class="modal-body">

							<p style="width: 7%; float: left;">
								<b> 담 당 </b>
							</p>
							<select id="selectDeptt" name="finalApprover" class="form-label"
								style="width: 91%; height: 28.94px; float: right">

							</select>
							
							<input type="text" id="title" name="signTitle" class="mb-3"
								placeholder="제목을 입력하세요." style="width: 91%; float: right">
							<p style="width: 7%; float: left;">
								<b> 제 목 </b>
							</p>
							<textarea name="signContent" id="content"
								style="width: 100%; height: 300px;" placeholder="내용을 입력하세요."></textarea>

							<input type="file" id="file" name="uploadFile">
							
							<script>
							$("#selectListt").on('click', function () { //담당자 목록 조회
								
								$.ajax({
									
									url: "selectList.do",
									
									type: "POST",
									
									dataType: "JSON",
									
									success: function(list) {
									
										console.log(list)	
										
									var result="";
									
									$.each(list, function(index, obj) {
										
										result += '<option>' + obj.deptName + " " + obj.empName + " " + obj.jobName + '</option>';
										
									}) //each 닫는 괄호
									
									$("#selectDeptt").html(result)
									
									}, // success 닫는 괄호
									
									error:function(e) {
										$("#selectDeptt").val("ajax 통신실페")
									}
								}); //ajax 닫는 괄호
								
							}); //맨 마지막 닫는 괄호
						
						</script>
						
						</div>
		
					
					<div class="modal-footer">
						<button type="reset" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
						<button type="submit" class="btn btn-primary">상신</button>

					</div>
					
					</form><!-- insertHelp 끝나는 form -->
				</div>
			</div>
		</div>



		<!--                                  휴가원                                                                   -->
		
		
		
		<div class="modal fade" id="exampleModal3" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">


				<div class="modal-content">

					<br>
					<h4 id="center">
						<b>휴 가 원</b>
					</h4>
					
					<form id="insertDay" method="post" action="insertDay.do" enctype="multipart/form-data">
						
						<input type="hidden" name="createName"
							value="${ loginEmp.empName }"> <input type="hidden"
							name="empNo" value="${ loginEmp.empNo }">
						
						
					<div class="modal-header">
						<h6 class="modal-title" id="exampleModalLabel">결재번호 : </h6>
					</div>
					
					<div>
						<br>
						<b style="margin:22px; color:rgb(124, 127, 251)">1차 결재선 지정</b>
					</div>
					
					
					
					<div class="col-md-12">
						
							<fieldset style="width: 30%; float: right; margin: 22px;">
							<p>
								<b id="center">휴가 종류</b>
							</p>

							&nbsp<input type="radio" id="huey" name="vNo" value="Y" checked>
							<label for="huey">'Y'=연차</label> &nbsp&nbsp <input type="radio"
								id="dewey" name="vNo" value="H"> <label
								for="dewey">'H'= 반차</label>

						</fieldset>
						
						
						<select id="selectNameee" name="firstApprover" class="form-label" style="margin:22px; height:25px"> <!-- 1차 결재선 -->
						
							<!-- selectList 뿌려지는 곳 -->
							
						</select>
						
						<div>
						<br>
						<b style="margin:22px; color:rgb(124, 127, 251)">최종 결재선 지정</b>
					</div>
						
						<select id="selectNameeee" name="finalApprover" class="form-label" style="margin:22px; height:25px"> <!-- 최종 결재선 -->
						
							<!-- selectList 뿌려지는 곳 -->
							
						</select>
						
						<script>
							$("#selectListtt").on('click', function () { //1차 결재선 지정 목록 조회
								
								$.ajax({
									
									url: "selectList.do",
									
									type: "POST",
									
									dataType: "JSON",
									
									success: function(list) {
									
										console.log(list)	
										
									var result="";
									
									$.each(list, function(index, obj) {
										
										result += '<option>' + obj.deptName + " " + obj.empName + " " + obj.jobName + '</option>';

									}) //each 닫는 괄호
									
									$("#selectNameee").html(result)
									
									}, // success 닫는 괄호
									
									error:function(e) {
										$("#selectNameee").val("ajax 통신실페")
									}
								}); //ajax 닫는 괄호
								
							}); //맨 마지막 닫는 괄호
						
						</script>
						
						<script>
							$("#selectListtt").on('click', function () { //최종 결재선 지정 목록 조회
								
								$.ajax({
									
									url: "selectList.do",
									
									type: "POST",
									
									dataType: "JSON",
									
									success: function(list) {
									
										console.log(list)	
										
									var result="";
									
									$.each(list, function(index, obj) {
										
										result += '<option>' + obj.deptName + " " + obj.empName + " " + obj.jobName + '</option>';

									}) //each 닫는 괄호
									
									$("#selectNameeee").html(result)
									
									}, // success 닫는 괄호
									
									error:function(e) {
										$("#selectNameeee").val("ajax 통신실페")
									}
								}); //ajax 닫는 괄호
								
							}); //맨 마지막 닫는 괄호
						
						</script>
						
					
					</div>




					<div class="col-md-4">

						<table class="tftable" border="1" hight="10" style="margin: 22px">
							<tr>

								<th rowspan="2" width="50px" style="background-color: #ffffff;">발신</th>
								<th>${ loginEmp.jobName }</th>
								<th></th>
								<th></th>

							</tr>

							<tr>

								<th style="width: 100px; background-color: #ffffff;">${loginEmp.empName}
									</th>
								<th style="width: 100px; background-color: #ffffff;"></th>
								<th style="width: 100px; background-color: #ffffff;"></th>
							</tr>

						</table>


					</div>

				<!--  	<form method="post" style="margin: 22px"> -->
				<div style="margin: 22px">
						<label for="dateIn">휴가 시작일 : </label>
						<!--포커싱이 어디로 향하는지가 for-->
						<input type="date" name="firstDate" id="dateIn"><br>

						<br> <label for="dateIn">휴가 종료일 : </label>
						<!--포커싱이 어디로 향하는지가 for-->
						<input type="date" name="lastDate" id="dateInn"><br>
				<!--  	</form> -->
					
					</div>
					
					<div class="modal-body">


						<p style="width: 7%; float: left;">
							<b> 제 목 </b>
						</p>
						<input type="text" id="title" name="title" class="mb-3"
							placeholder="제목을 입력하세요." style="width: 91%; float: right">

						<textarea name="reason" id="reason"
							style="width: 100%; height: 110px;" placeholder="사유를 입력하세요."></textarea>
					</div>
					<div class="modal-footer">
						<button type="reset" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
						<button type="submit" class="btn btn-primary">상신</button>
				
					</form> <!-- insertDay form 끝 태그 -->

					</div>
				</div>
			</div>
		</div>


		<div class="px-3 py-3 my-4">
			<div class="card-body">
				<h4 class="card-title" style="color: rgb(124, 127, 251)">
					<b>요청 결재함</b>
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


		<div class="px-4 py-1 my-5 text-center">
			<p class="display-5 fw-bold"></p>

		</div>



	</div>


	<jsp:include page="../common/bottom.jsp" />


</body>
</html>




