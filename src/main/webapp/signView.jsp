<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>



<title>Insert title here</title>
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

	<jsp:include page="top.jsp" />

	<div class="container">
		<br> <br>
		<h2 style="color: rgb(124, 127, 251)">
			<b>결재함</b>
		</h2>
		<div class="col-md-12" id="center">
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-sm btn-outline-primary"
			style="padding: 10px; width: 150px; float:left; margin:20px"
			data-bs-toggle="modal" data-bs-target="#exampleModal2">
			<b>새 결재 (협조)</b>
		</button>
		
		
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-sm btn-outline-primary"
			style="padding: 10px; width: 150px; float:left; margin:20px"
			data-bs-toggle="modal" data-bs-target="#exampleModal">
			<b>새 결재 (품의)</b>
		</button>
		
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-sm btn-outline-primary"
			style="padding: 10px; width: 150px; float:left; margin:20px"
			data-bs-toggle="modal" data-bs-target="#exampleModal3">
			<b>새 결재 (휴가원)</b>
		</button>
	</div>
	
<!-- submodal 1 품의 -->		
<div class="modal" tabindex="-1" id="submodal">
  <div class="modal-dialog">
    <div class="modal-content">
    	<br><br><br><br><br>
					<h3 id="center"  style="margin:-50px">
						<b>결재선 지정</b>
					</h3>
      <div class="modal-header">

      </div>
      <div class="modal-body" style="margin:80px">
      	<pre style="color:red"><u>최대 2명 지정 가능</u></pre>

		<hr>
		
        <p style="color:rgb(124, 127, 251)"><b>총무팀</b></p>
			
        <p>홍길동 과장 &nbsp<input type="checkbox"name="ch">
         	&nbsp홍길은 차장 &nbsp<input type="checkbox"name="ch">
         	&nbsp홍길금 부장 &nbsp<input type="checkbox"name="ch"><p>
         
         <hr>
         
         <p style="color:rgb(124, 127, 251)"><b>인사팀</b></p>	
          
           <p>청길동 과장 &nbsp<input type="checkbox"name="ch">
         	&nbsp청길은 차장 &nbsp<input type="checkbox"name="ch">
         	&nbsp청길금 부장 &nbsp<input type="checkbox"name="ch"><p>
         	
         <hr>
         	
          <p style="color:rgb(124, 127, 251)"><b>기획팀</b></p>
          	
          	<p>고길동 과장 &nbsp<input type="checkbox"name="ch">
         	&nbsp고길은 차장 &nbsp<input type="checkbox"name="ch">
         	&nbsp고길금 부장 &nbsp<input type="checkbox"name="ch"><p>
          
          <hr>	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">저장</button> <!-- 저장 누르면 다시 품의로 이동되도록 설정 -->
      </div>
    </div>
  </div>
</div>

<!-- submodal 2 품의-->		
<div class="modal" tabindex="-1" id="submodal2">
  <div class="modal-dialog">
    <div class="modal-content">
    	<br><br><br><br><br>
					<h3 id="center"  style="margin:-50px">
						<b>수신처 지정</b>
					</h3>
      <div class="modal-header">

      </div>
      <div class="modal-body" style="margin:80px">
      	<pre style="color:red"><u>최대 1명 지정 가능</u></pre>

		<hr>
		
        <p style="color:rgb(124, 127, 251)"><b>총무팀</b></p>
			
        <p>홍길동 과장 &nbsp<input type="checkbox"name="ch">
         	&nbsp홍길은 차장 &nbsp<input type="checkbox"name="ch">
         	&nbsp홍길금 부장 &nbsp<input type="checkbox"name="ch"><p>
         
         <hr>
         
         <p style="color:rgb(124, 127, 251)"><b>인사팀</b></p>	
          
           <p>청길동 과장 &nbsp<input type="checkbox"name="ch">
         	&nbsp청길은 차장 &nbsp<input type="checkbox"name="ch">
         	&nbsp청길금 부장 &nbsp<input type="checkbox"name="ch"><p>
         	
         <hr>
         	
          <p style="color:rgb(124, 127, 251)"><b>기획팀</b></p>
          	
          	<p>고길동 과장 &nbsp<input type="checkbox"name="ch">
         	&nbsp고길은 차장 &nbsp<input type="checkbox"name="ch">
         	&nbsp고길금 부장 &nbsp<input type="checkbox"name="ch"><p>
          
          <hr>	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">저장</button>
      </div>
    </div>
  </div>
</div>


<!-- submodal 3 협조 -->		
<div class="modal" tabindex="-1" id="submodal3">
  <div class="modal-dialog">
    <div class="modal-content">
    	<br><br><br><br><br>
					<h3 id="center"  style="margin:-50px">
						<b>결재선 지정</b>
					</h3>
      <div class="modal-header">

      </div>
      <div class="modal-body" style="margin:80px">
      	<pre style="color:red"><u>최대 2명 지정 가능</u></pre>

		<hr>
		
        <p style="color:rgb(124, 127, 251)"><b>총무팀</b></p>
			
        <p>홍길동 과장 &nbsp<input type="checkbox"name="ch">
         	&nbsp홍길은 차장 &nbsp<input type="checkbox"name="ch">
         	&nbsp홍길금 부장 &nbsp<input type="checkbox"name="ch"><p>
         
         <hr>
         
         <p style="color:rgb(124, 127, 251)"><b>인사팀</b></p>	
          
           <p>청길동 과장 &nbsp<input type="checkbox"name="ch">
         	&nbsp청길은 차장 &nbsp<input type="checkbox"name="ch">
         	&nbsp청길금 부장 &nbsp<input type="checkbox"name="ch"><p>
         	
         <hr>
         	
          <p style="color:rgb(124, 127, 251)"><b>기획팀</b></p>
          	
          	<p>고길동 과장 &nbsp<input type="checkbox"name="ch">
         	&nbsp고길은 차장 &nbsp<input type="checkbox"name="ch">
         	&nbsp고길금 부장 &nbsp<input type="checkbox"name="ch"><p>
          
          <hr>	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal2">저장</button> <!-- 저장 누르면 다시 협조로 이동되도록 설정 -->
      </div>
    </div>
  </div>
</div>
		

<!-- submodal 4 휴가원 -->		
<div class="modal" tabindex="-1" id="submodal4">
  <div class="modal-dialog">
    <div class="modal-content">
    	<br><br><br><br><br>
					<h3 id="center"  style="margin:-50px">
						<b>결재선 지정</b>
					</h3>
      <div class="modal-header">

      </div>
      <div class="modal-body" style="margin:80px">
      	<pre style="color:red"><u>최대 2명 지정 가능</u></pre>

		<hr>
		
        <p style="color:rgb(124, 127, 251)"><b>총무팀</b></p>
			
        <p>홍길동 과장 &nbsp<input type="checkbox"name="ch">
         	&nbsp홍길은 차장 &nbsp<input type="checkbox"name="ch">
         	&nbsp홍길금 부장 &nbsp<input type="checkbox"name="ch"><p>
         
         <hr>
         
         <p style="color:rgb(124, 127, 251)"><b>인사팀</b></p>	
          
           <p>청길동 과장 &nbsp<input type="checkbox"name="ch">
         	&nbsp청길은 차장 &nbsp<input type="checkbox"name="ch">
         	&nbsp청길금 부장 &nbsp<input type="checkbox"name="ch"><p>
         	
         <hr>
         	
          <p style="color:rgb(124, 127, 251)"><b>기획팀</b></p>
          	
          	<p>고길동 과장 &nbsp<input type="checkbox"name="ch">
         	&nbsp고길은 차장 &nbsp<input type="checkbox"name="ch">
         	&nbsp고길금 부장 &nbsp<input type="checkbox"name="ch"><p>
          
          <hr>	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal3">저장</button> <!-- 저장 누르면 다시 휴가원으로 이동되도록 설정 -->
      </div>
    </div>
  </div>
</div>

		
		<!--                                  품의                                                                   -->
		<!-- main modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">


				<div class="modal-content">

					<br>
					<h4 id="center">
						<b>품 의</b>
					</h4>

					<div class="modal-header">
						<h6 class="modal-title" id="exampleModalLabel">문서번호 : 5</h6>
					</div>

					<div class="col-md-12">

						<button type="button" class="btn btn-primary btn-sm"
							style="width: 30%; height: 30px; float: left; margin: 22px;" data-bs-toggle="modal" data-bs-target="#submodal">결재선
							지정 </button>
 
						<fieldset style="width: 30%; float: right; margin: 22px;">
							<p>
								<b>문서 보존 기한</b>
							</p>

							<input type="radio" id="huey" name="drone" checked> <label
								for="huey">1년</label> &nbsp&nbsp <input type="radio" id="dewey"
								name="drone" value="dewey"> <label for="dewey">2년</label>

						</fieldset>
					</div>




					<div class="col-md-4">

						<table class="tftable" border="1" hight="10" style="margin: 22px">
							<tr>

								<th rowspan="2" width="50px" style="background-color: #ffffff;">발신</th>
								<th>대리</th>
								<th></th>
								<th></th>

							</tr>

							<tr>

								<th style="width: 100px; background-color: #ffffff;">임현빈
									22.06.10</th>
								<th style="width: 100px; background-color: #ffffff;"></th>
								<th style="width: 100px; background-color: #ffffff;"></th>
							</tr>

						</table>


					</div>
					
						<button type="button" class="btn btn-primary btn-sm"
							style="width: 20%; background-color: #ffffff; color: black" id="center"
							data-bs-toggle="modal" data-bs-target="#submodal2">수신처</button>
							
					<div class="modal-body">
						
						<p style="width: 7%; float: left;">
							<b> 제 목 </b>
						</p>
						<input type="text" id="title" name="title" class="mb-3"
							placeholder="제목을 입력하세요." style="width: 91%; float: right">

						<textarea name="content" id="content"
							style="width: 100%; height: 300px;" placeholder="내용을 입력하세요."></textarea>

						<input type="file" id="file" name="file" >

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary">상신</button>
					</div>
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

					<div class="modal-header">
						<h6 class="modal-title" id="exampleModalLabel">문서번호 : 5</h6>
					</div>

					<div class="col-md-12">

						<button type="button" class="btn btn-primary btn-sm"
							style="width: 30%; height: 30px; float: left; margin: 22px;" data-bs-toggle="modal" data-bs-target="#submodal3">결재선
							지정 </button>
 
						<fieldset style="width: 30%; float: right; margin: 22px;">
							<p>
								<b>문서 보존 기한</b>
							</p>

							<input type="radio" id="huey" name="drone" checked> <label
								for="huey">1년</label> &nbsp&nbsp <input type="radio" id="dewey"
								name="drone" value="dewey"> <label for="dewey">2년</label>

						</fieldset>
					</div>




					<div class="col-md-4">

						<table class="tftable" border="1" hight="10" style="margin: 22px">
							<tr>

								<th rowspan="2" width="50px" style="background-color: #ffffff;">발신</th>
								<th>대리</th>
								<th></th>
								<th></th>

							</tr>

							<tr>

								<th style="width: 100px; background-color: #ffffff;">임현빈
									22.06.10</th>
								<th style="width: 100px; background-color: #ffffff;"></th>
								<th style="width: 100px; background-color: #ffffff;"></th>
							</tr>

						</table>


					</div>
					
						
							
					<div class="modal-body">
						
						<p style="width: 7%; float: left;">
							<b> 담 당 </b>
						</p>
						<input type="text" id="title" name="title" class="mb-3"
							placeholder="담당자를 지정해주세요." style="width: 91%; float: right">
						
						<p style="width: 7%; float: left;">
							<b> 제 목 </b>
						</p>
						<input type="text" id="title" name="title" class="mb-3"
							placeholder="제목을 입력하세요." style="width: 91%; float: right">

						<textarea name="content" id="content"
							style="width: 100%; height: 300px;" placeholder="내용을 입력하세요."></textarea>

						<input type="file" id="file" name="file" >

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary">상신</button>
					</div>
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

					<div class="modal-header">
						<h6 class="modal-title" id="exampleModalLabel">문서번호 : 5</h6>
					</div>

					<div class="col-md-12">

						<button type="button" class="btn btn-primary btn-sm"
							style="width: 30%; height: 30px; float: left; margin: 22px;" data-bs-toggle="modal" data-bs-target="#submodal4">결재선
							지정 </button>
							
							
 						<fieldset style="width: 30%; float: right; margin: 22px;">
							<p>
								<b id="center">휴가 종류</b>
							</p>

							&nbsp<input type="radio" id="huey" name="drone" checked> <label
								for="huey">'Y'=연차</label> &nbsp&nbsp <input type="radio" id="dewey"
								name="drone" value="dewey"> <label for="dewey">'H'= 반차</label>

						</fieldset>
				
					</div>




					<div class="col-md-4">

						<table class="tftable" border="1" hight="10" style="margin: 22px">
							<tr>

								<th rowspan="2" width="50px" style="background-color: #ffffff;">발신</th>
								<th>대리</th>
								<th></th>
								<th></th>

							</tr>

							<tr>

								<th style="width: 100px; background-color: #ffffff;">임현빈
									22.06.10</th>
								<th style="width: 100px; background-color: #ffffff;"></th>
								<th style="width: 100px; background-color: #ffffff;"></th>
							</tr>

						</table>


					</div>
					
					 <form method="post" style="margin:22px">
        <label for = "dateIn">휴가 시작일 : </label> <!--포커싱이 어디로 향하는지가 for-->
        <input type = "date" name="dateInput" id="dateIn"><br>
        		
        		<br>
        		
            <label for = "dateIn">휴가 종료일 : </label> <!--포커싱이 어디로 향하는지가 for-->
        <input type = "date" name="dateInput" id="dateIn"><br>
        </form>
							
					<div class="modal-body">
						
						
						<p style="width: 7%; float: left;">
							<b> 제 목 </b>
						</p>
						<input type="text" id="title" name="title" class="mb-3"
							placeholder="제목을 입력하세요." style="width: 91%; float: right">

						<textarea name="content" id="content"
							style="width: 100%; height: 150px;" placeholder="사유를 입력하세요."></textarea>


					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary">상신</button>
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

	
<script>

       
</script>
	
	<jsp:include page="bottom.jsp" />


</body>
</html>




