<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 결재 대기함</title>

<style>
#center {
	text-align: center;
	margin: auto;
	justify-content: center;
	display: flex;
}

.center {
	text-align: center;
	margin: auto;
	justify-content: center;
	display: flex;
}

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
</style>

</head>
<body>
	<jsp:include page="../common/top.jsp" />

	<div class="container">

		<div class="px-3 py-3 my-4">
			<div class="card-body">
				<h4 class="card-title" style="color: rgb(124, 127, 251)">
					<b>내 결재 대기함</b>
				</h4>
				<div class="table-responsive">
					<table id="signWaitingList" class="table" style="width: 1300px">
						<thead>
							<tr style="text-align: center">
								<th style="color: rgb(124, 127, 251)"><b>No</b></th>
								<th style="color: rgb(124, 127, 251)"><b>분류</b></th>
								<th style="color: rgb(124, 127, 251)"><b>기안문</b></th>
								<th style="color: rgb(124, 127, 251)"><b>기안부서</b></th>
								<th style="color: rgb(124, 127, 251)"><b>기안자</b></th>
								<th style="color: rgb(124, 127, 251)"><b>기안일</b></th>
								<th style="color: rgb(124, 127, 251)"><b>상세</b></th>
								<th style="color: rgb(124, 127, 251)"><b>첨부파일</b></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ list }" var="s">
								<tr style="text-align: center">
									<td>${ s.signNo }</td>
									<td>${ s.typeName }</td>
									<td style="width: 300px">${ s.signTitle }</td>
									<td>${ s.deptName }</td>
									<td>${ s.createName }</td>
									<td>${ s.createDate }</td>


									<c:if test="${ s.typeCode eq 'AA' }">
										<!-- 품의 상세보기 버튼-->

										<td>

											<button type="button" class="btn btn-sm btn-outline-primary"
												style="padding: 10px; width: 85px; float: center"
												data-bs-toggle="modal" data-bs-target="#exampleModal"
												id="selectList" onclick="snoComeOn(${s.signNo})">상세보기</button>

										</td>

									</c:if>

									<c:if test="${ s.typeCode eq 'BB' }">
										<!-- 협조 상세보기 버튼 -->

										<td><button type="button"
												class="btn btn-sm btn-outline-primary"
												style="padding: 10px; width: 85px; float: center"
												data-bs-toggle="modal" data-bs-target="#exampleModal2"
												id="selectList2" onclick="snoBBComeOn(${s.signNo})">상세보기</button>
										</td>
									</c:if>



									<c:if test="${ s.typeCode eq 'CC' }">
										<!-- 휴가원 상세보기 버튼 -->

										<td><button type="button"
												class="btn btn-sm btn-outline-primary"
												style="padding: 10px; width: 85px; float: center"
												data-bs-toggle="modal" data-bs-target="#exampleModal3"
												id="selectList3" onclick="snoCCComeOn(${s.signNo})">상세보기</button>

										</td>
									</c:if>


									<td><c:if test="${ !empty s.originName }">

											<a
												href="${ pageContext.servletContext.contextPath }/resources/sign_files/${s.changeName}"
												download="${ s.originName }">다운로드</a>

										</c:if> <c:if test="${ empty s.originName }">
		                        	첨부파일이 없습니다.
		                        </c:if></td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

			<div id="pagingArea">
				<ul class="pagination" id="center">
					<c:choose>
						<c:when test="${ pi.currentPage ne 1 }">
							<li class="page-item"><a class="page-link"
								href="signWaitingView.do?currentPage=${ pi.currentPage-1 }">이전</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><a class="page-link" href="">이전</a></li>
						</c:otherwise>
					</c:choose>

					<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
						<c:choose>
							<c:when test="${ pi.currentPage ne p }">
								<li class="page-item"><a class="page-link"
									href="signWaitingView.do?currentPage=${ p }">${ p }</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>


					<c:choose>
						<c:when test="${ pi.currentPage ne pi.maxPage }">
							<li class="page-item"><a class="page-link"
								href="signWaitingView.do?currentPage=${ pi.currentPage+1 }">다음</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><a class="page-link"
								href="signWaitingView.do?currentPage=${ pi.currentPage+1 }">다음</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>

			<br clear="both"> <br> <br> <br>
		</div>
		<br> <br>
	</div>


<!--           품의 양식                 -->


	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">

		<div> 
			<div class="modal-content" id="selectAAList">

				<br>
				<h4 id="center">
					<b>품 의</b>
				</h4>
				<p></p>
				<div id="center">
				 &nbsp&nbsp&nbsp&nbsp<b style="color:rgb(124, 127, 251)">수정하기 &nbsp<input type="checkbox" id="ckbox"/></b>
				 <input type="hidden" name="reserveYn" id="reserveYn" required>
				</div>	
				<form id="updateRRRRR" method="post" action="updateAASign.do" enctype="multipart/form-data">
					<!-- update form 시작 -->

				<!--  	<form id="updatePPPPP" method="post" action="updateP.do"> -->
						<!--여기 -->
						<!-- insert form 시작 -->


						<input type="hidden" id="updateSign" name="signNo" value="">
						<!-- 반려하기 위해 보내는 signNo -->


						<input type="hidden" id="updateP" name="signNo" value="">
						<!-- 상신하기 위해 보내는 signNo -->


						<input type="hidden" name="createName"
							value="${ loginEmp.empName }"> <input type="hidden"
							name="empNo" value="${ loginEmp.empNo }">


						<div class="modal-header">
							<h6 class="modal-title" id="exampleModalLabel">
								결재번호 : <b id="aaSignNo"></b>
							</h6>
							
						<fieldset style="width: 30%; float:right; margin:-1px" id="hideTest4" class="center">

								<label> <input type="radio" id="o" name="check"
									value="1년"  checked> 1년
								</label> &nbsp&nbsp <label> <input type="radio" id="t"
									name="check"  value="2년"> 2년
								</label>

							</fieldset>
						</div>


						<div class="col-md-12">


							<fieldset style="width: 30%; float: right; margin: 22px;">
								<table class="tftable" border="1" hight="10">
									<tr>
										<th>문서 보존 기한</th>
									</tr>

									<tr>
										<th style="background-color: white"><b id="aaExpiryDate"></b></th>
									</tr>
								</table>
							<!--  		<br>
									<pre> <b id="hideTest4">&nbsp&nbsp문서보존 : 1년 <input type="radio" id="t" name="check2" value="1년"> </b> </pre>
									<pre> <b id="hideTest4">&nbsp&nbsp문서보존 : 2년 <input type="radio" id="t" name="check2" value="2년"> </b> </pre> -->
							</fieldset>
						</div>


						<div class="col-md-4">


							<table class="tftable" border="1" hight="10" style="margin: 22px"
								id="select">

								<tr>

									<th rowspan="2" width="50px" style="background-color: #ffffff;">발신</th>
									<th><b id="aaJobName"></b></th>
									<th></th>
									<!-- 여기에 if문으로 값이 null이 아니라면 안들어가게끔 조거문 주기 -->
									<th></th>

								</tr>

								<tr>

									<th style="width: 100px; background-color: #ffffff;"><b
										id="aaCreateName"></b> <b style="color: blue"
										id="aaCreateDate"></b></th>
									<th style="width: 100px; background-color: #ffffff;"></th>
									<th style="width: 100px; background-color: #ffffff;"></th>
								</tr>
							</table>


						</div>
					<div>	
						<br> 	<b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp결재선 지정 : &nbsp<b id="aaFirstApprover"> </b>
						<br>
						
						<b id="hideTest">

						<b style="margin:22px; color:rgb(124, 127, 251)">결재선 수정 :</b><select id="selectName" name="firstApprover" class="form-label" style="height: 25px; width: 72%"></select></b>
						</b>
						
						</div>
							
						
						<br>
						
						<b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp수신처 지정 : &nbsp<b
							id="aaFinalApprover"> 
							</b>
							<br>
							
							<b id="hideTest2">
							
							<b style="margin:22px; color:rgb(124, 127, 251)">수신처 수정 :</b><select id="selectDept" name="finalApprover" class="form-label" style="height: 25px; width: 72%"></select></b>
							</b>
							
							
							
						<div class="col-md-12">


							<script> //수신처 지정 목록 조회 ajax
							$("#selectList").on('click', function () { 
								
								$.ajax({
									
									url: "selectList.do",
									
									type: "POST",
									
									dataType: "JSON",
									
									success: function(list) {
										
									var result="";
									
									$.each(list, function(index, obj) {
										
										result += '<option>' + obj.deptName + " " + obj.empName + " " + obj.jobName + '</option>';

									}) //each 닫는 괄호
									
									$("#selectDept").html(result)
									$("#selectName").html(result)
									
									}, // success 닫는 괄호
									
									error:function(e) {
										$("#selectDept").val("ajax 통신실페")
									}
								}); //ajax 닫는 괄호
								
							}); //맨 마지막 닫는 괄호
							
							
							
						/* 품의 양식 조회 해오는 ajax 시작 */
						 function snoComeOn(signNo){
							$.ajax({ //품의 내용 select 해오기

								  url: "selectAAList.do",
								
								  type: "POST",

								  data: { signNo:signNo },
								  
								  dataType: "JSON",
								  
								  success: function(result) {

									  DetailBtn(result);

								  },   //품의 양식을 조회해오기 위한  script success 닫는괄호
									
								  error:function(e) {
									console.log("AA 품의 양식 조회실패")

								  }
								
								
								  });  //품의 양식을 조회해오기 위한  script ajax 닫는괄호 
							};
							
							//품의 양식조회 뿌려주기 위한 함수 (상세)
						function DetailBtn(result)  {
								var signNo = result.signNo; //결재 번호
								var createName = result.createName; //기안자
								var createDate = result.createDate; //기안일
								var jobName = result.jobName; //기안자 직급
								var expiryDate = result.expiryDate; //문서 만료일
								var firstApprover = result.firstApprover; //1차 결재자
								var finalApprover = result.finalApprover; //최종 결재자
								var signTitle = result.signTitle; //결재 제목
								var signContent = result.signContent; //결재 내용
								var changeName = result.changeName; //파일 수정된 이름
								var originName = result.originName; //파일 원래 이름

								
								$("#aaSignNo").html(signNo);
								$("#aaCreateName").html(createName);
								$("#aaCreateDate").html(createDate);
								$("#aaJobName").html(jobName);
								$("#aaExpiryDate").html(expiryDate);
								$("#aaFinalApprover").html(finalApprover);
								$("#aaFirstApprover").html(firstApprover);
								$("#aaSignTitle").val(signTitle);
								$("#aaSignContent").val(signContent);
								$("#aaChangeName").html(changeName);
								$("#aaOriginName").val(originName); //val로 한 이유는 값이 없으면 뿌려지면 안되어서 (html의 경우 값이 없고 1개의 값만 있어도 뿌려짐)
							    $("#updateSign").val(signNo)
							    $("#updateP").val(signNo)
							    //$("#goSign").val(signNo)
							}
							
										
						</script>


						</div>
						<div class="modal-body">

							<p style="width: 7%; float: left;">
								<b> 제 목 </b>
							</p>
							
					
							<input type="text" id="aaSignTitle" name="signTitle" class="mb-3"
								placeholder="제목을 입력하세요." style="width: 91%; float: right"
								value="" readonly>
						
							<textarea name="signContent" id="aaSignContent"
								style="width: 100%; height: 210px;" placeholder="내용을 입력하세요."
								value="" readonly></textarea>


							<div class="mb-2 col-md-12">

								<br> <input type="text" style="border: 0; width: 100%"
									id="aaOriginName" value="" readonly />


							</div>
								<b id="hideTest3">
								<input type="file" id="file" name="uploadFile">
								</b>
						</div>
							
						<script>

							$(document).ready(function () { // 수정하기 체크박스 선택 시 수정 할 내역들 보이도록 
								   $("#hideTest").val(" ");  //결재선 지정
								   $("#hideTest2").val(" "); //수신처 지정
								   $("#hideTest3").val(" "); //파일첨부 button
								   $("#hideTest4").val(" "); //문서 보존
								   $("#hideTest").hide();
								   $("#hideTest2").hide();
								   $("#hideTest3").hide();
								   $("#hideTest4").hide();
								   $('#aaSignTitle').attr('readonly', true); //제목 속성 변경
								   $('#aaSignContent').attr('readonly', true); //내용 속성 변경
								   $('#signBack').attr('disabled', true); //수정 버튼 ckbox 클릭 전까지는 비활성화
								   
							   	$("#ckbox").on('click', function () {
							   		if($(this).prop('checked')){
									$("#hideTest").show();
									$("#hideTest2").show();
									$("#hideTest3").show();
									$("#hideTest4").show();
									$('#aaSignTitle').attr('readonly', false); //체크 했을때만 readonly 풀리도록
									$('#aaSignContent').attr('readonly', false); //체크 했을때만 readonly 풀리도록
									$('#signBack').attr('disabled', false); //체크 후에는 disabled 풀리도록
								   }else{
								       $("#hideTest").val(" ");
								       $("#hideTest2").val(" ");
								       $("#hideTest3").val(" ");
								       $("#hideTest4").val(" ");
								       $("#hideTest").hide();
								       $("#hideTest2").hide();
								       $("#hideTest3").hide();
								       $("#hideTest4").hide();
								       $('#aaSignTitle').attr('readonly', true); // 언체크드일 경우 readonly 속성 변경 안함
								       $('#aaSignContent').attr('readonly', true); // 언체크드일 경우 readonly 속성 변경 안함
								       $('#signBack').attr('disabled', true); //체크 후에는 disabled 풀리도록
								   }
								});
							});
		
								</script>
						

						<div class="modal-footer">
							<button type="reset" class="btn btn-secondary"
								data-bs-dismiss="modal">닫기</button>

							<button type="submit" class="btn btn-danger"
								style="background-color: #6495ED" id="signBack" disabled>수정</button>
								
								</form> <!-- 품의 updateR Form 끝 태그 -->
								
								
							<button type="submit" class="btn btn-primary" id="endSign" style="background-color: #F56E6E"  onclick="javascript: form.action='DeleteN.do';">삭제</button> <!-- form이 현재 하나이기에 액션 경로를 수정 -->


						</div>
							
											
			</div>

		</div>
	</div>




	<!--         협조 양식          -->

	<div class="modal fade" id="exampleModal2" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">


			<div class="modal-content" id="selectAAList2">

				<br>
				<h4 id="center">
					<b>협 조</b>
				</h4>

				<form id="updateRRRRR" method="post" action="updateR.do">
					<!-- update form 시작 -->


						<input type="hidden" id="updateRR" name="signNo" value="">

						<input type="hidden" name="createName"
							value="${ loginEmp.empName }"> <input type="hidden"
							name="empNo" value="${ loginEmp.empNo }">


						<div class="modal-header">
							<h6 class="modal-title" id="exampleModalLabel">
								결재번호 : <b id="bbSignNo"></b>
							</h6>
						</div>


						<div class="col-md-12">


							<fieldset style="width: 30%; float: right; margin: 22px;">
								<table class="tftable" border="1" hight="10">
									<tr>
										<th>문서 보존 기한</th>
									</tr>

									<tr>
										<th style="background-color: white"><b id="bbExpiryDate"></b></th>
									</tr>
								</table>
							</fieldset>
						</div>


						<div class="col-md-4">


							<table class="tftable" border="1" hight="10" style="margin: 22px"
								id="selectName">

								<tr>

									<th rowspan="2" width="50px" style="background-color: #ffffff;">발신</th>
									<th><b id="bbJobName"></b></th>
									<th>${loginEmp.jobName}</th>
									<!-- 여기에 if문으로 값이 null이 아니라면 안들어가게끔 조거문 주기 -->
									<th></th>

								</tr>

								<tr>

									<th style="width: 100px; background-color: #ffffff;"><b
										id="bbCreateName"></b> <b style="color: blue"
										id="bbCreateDate"></b></th>
									<th style="width: 100px; background-color: #ffffff;">${loginEmp.empName}</th>
									<th style="width: 100px; background-color: #ffffff;"></th>
								</tr>
							</table>


							<script> 
		
						/* 협조 양식 조회 해오는 ajax 시작 */
						 function snoBBComeOn(signNo){
						$.ajax({ //협조 내용 select 해오기

								  url: "selectBBList.do",
								
								  type: "POST",

								  data: { signNo:signNo },
								  
								  dataType: "JSON",
								  
								  success: function(result) {
  	
							
									  DetailBtnn(result);
							

								  },   //협조 양식을 조회해오기 위한  script success 닫는괄호
									
								  error:function(e) {
									console.log("BB 협조 양식 조회실패")

								  }
								
								
								  });  //협조 양식을 조회해오기 위한  script ajax 닫는괄호 
							};
							
								//협조 양식조회 뿌려주기 위한 함수 (상세)
						function DetailBtnn(result)  {
								var signNo = result.signNo; //결재 번호
								var createName = result.createName; //기안자
								var createDate = result.createDate; //기안일
								var jobName = result.jobName; //기안자 직급
								var expiryDate = result.expiryDate; //문서 만료일
								var finalApprover = result.finalApprover; //최종 결재자
								var signTitle = result.signTitle; //결재 제목
								var signContent = result.signContent; //결재 내용
								var changeName = result.changeName; //파일 수정된 이름
								var originName = result.originName; //파일 원래 이름
								
								$("#bbSignNo").html(signNo);
								$("#bbCreateName").html(createName);
								$("#bbCreateDate").html(createDate);
								$("#bbJobName").html(jobName);
								$("#bbExpiryDate").html(expiryDate);
								$("#bbFinalApprover").html(finalApprover);
								$("#bbSignTitle").val(signTitle);
								$("#bbSignContent").val(signContent);
								$("#bbChangeName").html(changeName);
								$("#bbOriginName").val(originName); //val로 한 이유는 값이 없으면 뿌려지면 안되어서 (html의 경우 값이 없고 1개의 값만 있어도 뿌려짐)
								$("#updateRR").val(signNo)
							}
							
										
						</script>

						</div>


						<div class="modal-body">

							<p style="width: 10%; float: left;">
								<b> 담 당 : </b>
							</p>

							<b id="bbFinalApprover"> </b> <br> <br> <b> 제 목 </b> <input
								type="text" id="bbSignTitle" name="SignTitle" class="mb-3"
								placeholder="제목을 입력하세요." style="width: 91%; float: right"
								value="" readonly>
							<p style="width: 7%; float: left;"></p>
							<textarea name="signContent" id="bbSignContent"
								style="width: 100%; height: 300px;" placeholder="내용을 입력하세요."
								readonly></textarea>



							<div class="mb-2 col-md-12">

								<br> <input type="text" style="border: 0; width: 100%"
									id="bbOriginName" value="" readonly />

							</div>


						</div>
						<div class="modal-footer">
							<button type="reset" class="btn btn-secondary"
								data-bs-dismiss="modal">닫기</button>
							<button type="submit" class="btn btn-danger"
								style="background-color: red" id="signBack">반려</button>
					</form>
					<!-- 협조 update Form 끝 태그 -->
					
							<button type="submit" class="btn btn-primary" id="endSign"  onclick="javascript: form.action='updateP.do';">상신</button> 

						</div>



			</div>
		</div>
	</div>





	<!--           휴가원 양식               -->

	<div class="modal fade" id="exampleModal3" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">


			<div class="modal-content">

				<br>
				<h4 id="center">
					<b>휴 가 원</b>
				</h4>

				<form id="updateRRRRR" method="post" action="updateR.do">
					<!-- update form 시작 -->


						<input type="hidden" id="updateRRR" name="signNo" value="">


						<input type="hidden" name="createName"
							value="${ loginEmp.empName }"> <input type="hidden"
							name="empNo" value="${ loginEmp.empNo }">


						<div class="modal-header">
							<h6 class="modal-title" id="exampleModalLabel">
								결재번호 : <b id="ccSignNo"></b>
							</h6>
						</div>


						<div class="col-md-12">

							<fieldset style="width: 30%; float: right; margin: 22px;">
								<table class="tftable" border="1" hight="10">
									<tr>
										<th>휴가 종류</th>
									</tr>

									<tr>
										<th style="background-color: white"><b id="ccVcode"></b></th>
									</tr>
								</table>
							</fieldset>
						</div>


						<div>
							<br>

						</div>

						<b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp최종 결재선 지정 : <b
							id="ccFinalApprover"></b> &nbsp<b id="ccFinalApprover"></b></b>
						<div class="col-md-12">


							<script>
						 function snoCCComeOn(signNo){
								$.ajax({ //휴가 내용 select 해오기

									  url: "selectCCList.do",
									
									  type: "POST",

									  data: { signNo:signNo },
									  
									  dataType: "JSON",
									  
									  success: function(result) {
										
										  console.log(result.firstDate)
										  console.log(result.lastDate)
										  
										  DetailBtnnn(result);
										
									  },   //휴가 양식을 조회해오기 위한  script success 닫는괄호
										
									  error:function(e) {
										console.log("CC 휴가 양식 조회실패")

									  }
									
									
									  });  //휴가 양식을 조회해오기 위한  script ajax 닫는괄호 
								};
								
								//휴가 양식조회 뿌려주기 위한 함수 (상세)
					 		function DetailBtnnn(result)  {
									var signNo = result.signNo; //결재 번호
									var createName = result.createName; //기안자
									var createDate = result.createDate; //기안일
									var jobName = result.jobName; //기안자 직급
									var vCode = result.vCode; //휴가 종류
									var finalApprover = result.finalApprover; //최종 결재자
									var signTitle = result.signTitle; //결재 제목
									var signContent = result.signContent; //결재 내용
									var firstDate = result.firstDate; //휴가 시작일
									var lastDate = result.lastDate; //휴가 종료일
									
									$("#ccSignNo").html(signNo);
									$("#ccCreateName").html(createName);
									$("#ccCreateDate").html(createDate);
									$("#ccJobName").html(jobName);
									$("#ccVcode").html(vCode);
									$("#ccFirstDate").val(firstDate);
									$("#ccLastDate").val(lastDate);
									$("#ccFinalApprover").html(finalApprover);
									$("#ccSignTitle").val(signTitle);
									$("#ccSignContent").val(signContent);					
									$("#updateRRR").val(signNo)
								}
					
											
							</script>


						</div>




						<div class="col-md-4">

							<table class="tftable" border="1" hight="10" style="margin: 22px">
								<tr>

									<th rowspan="2" width="50px" style="background-color: #ffffff;">발신</th>
									<th><b id="ccJobName"></b></th>
									<th>${ loginEmp.jobName }</th>
									<th></th>

								</tr>

								<tr>

									<th style="width: 100px; background-color: #ffffff;"><b
										id="ccCreateName"></b> <b style="color: blue"
										id="ccCreateDate"></b></th>
									<th style="width: 100px; background-color: #ffffff;">${loginEmp.empName}</th>
									<th style="width: 100px; background-color: #ffffff;"></th>
								</tr>

							</table>


						</div>


						<div style="margin: 22px">

							<p style="width: 15%; float: left;">
								<b style="color: rgb(124, 127, 251)"> 휴가 시작 :</b>
							</p>

							<input type="text" id="ccFirstDate" name="firstDate" value=""
								style="width: 84%; float: right; border: 0" readonly /> <br>

							<br>

							<p style="width: 15%; float: left;">
								<b style="color: rgb(124, 127, 251)"> 휴가 종료 :</b>
							</p>

							<input type="text" id="ccLastDate" name="LastDate" value=""
								style="width: 84%; float: right; border: 0" readonly />

						</div>

						<div class="modal-body">


							<p style="width: 7%; float: left;">
								<b> 제 목 </b>
							</p>
							<input type="text" id="ccSignTitle" name="title" class="mb-3"
								placeholder="제목을 입력하세요." style="width: 91%; float: right"
								readonly>

							<textarea name="reason" id="ccSignContent"
								style="width: 100%; height: 250px;" placeholder="사유를 입력하세요."
								readonly></textarea>
						</div>
						<div class="modal-footer">
							<button type="reset" class="btn btn-secondary"
								data-bs-dismiss="modal">닫기</button>
							<button type="submit" class="btn btn-danger"
								style="background-color: red" id="signBack">반려</button>
								
					</form>
					<!-- 휴가 update Form 끝 태그 -->
					
							<button type="submit" class="btn btn-primary" id="endSign"  onclick="javascript: form.action='updateP.do';">상신</button>


			</div>
		</div>
	</div>
	</div>




	<jsp:include page="../common/bottom.jsp" />
</body>
</html>