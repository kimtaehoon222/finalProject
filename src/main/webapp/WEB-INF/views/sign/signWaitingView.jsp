<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
					<b>요청 결재함</b>
				</h4>
				<div class="table-responsive">
					<table id="signWaitingList" class="table" style="width: 1300px">
						<thead>
							<tr>
								<th style="color: rgb(124, 127, 251)"><b>No</b></th>
								<th style="color: rgb(124, 127, 251)"><b>분류</b></th>
								<th style="color: rgb(124, 127, 251)"><b>기안문</b></th>
								<th style="color: rgb(124, 127, 251)"><b>기안부서</b></th>
								<th style="color: rgb(124, 127, 251)"><b>기안자</b></th>
								<th style="color: rgb(124, 127, 251)"><b>기안일</b></th>
								<th style="color: rgb(124, 127, 251)"><b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp상세</b></th>
							</tr>
						</thead>
						<tbody>
						  <c:forEach items="${ list }" var="s">
							<tr>
								<td>${ s.signNo }</td>
								<td>${ s.typeName }</td>
								<td style="width: 300px">${ s.signContent }</td>
								<td>${ s.deptName }</td>
								<td>${ s.createName }</td>
								<td>${ s.createDate }</td>
								<td><button type="button" class="btn btn-sm btn-outline-primary"
									style="padding: 10px; width: 85px; float: left"
									data-bs-toggle="modal" data-bs-target="#exampleModal"
									id="selectList" onclick="snoComeOn(${s.signNo})">상세보기</button> </td>
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
                			<li class="page-item"><a class="page-link" href="signWaitingView.do?currentPage=${ pi.currentPage-1 }">이전</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="">이전</a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
	                		<c:when test="${ pi.currentPage ne p }">
                    			<li class="page-item"><a class="page-link" href="signWaitingView.do?currentPage=${ p }">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    
                    
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<li class="page-item"><a class="page-link" href="signWaitingView.do?currentPage=${ pi.currentPage+1 }">다음</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="signWaitingView.do?currentPage=${ pi.currentPage+1 }">다음</a></li>
                		</c:otherwise>
                	</c:choose>
                </ul>
            </div>
           
            <br clear="both"><br>
            
			
            <br><br>
        </div>
        <br><br>
    </div>
			

	<!--           품의 양식                 -->
	
	
				
	<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">


				<div class="modal-content" id="selectAAList">

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
							<h6 class="modal-title" id="exampleModalLabel">결재번호 : <input type="text" id="aaSignNo" value="" style="border:0px" readonly/></h6>
						</div>


						<div class="col-md-12">

	
							<fieldset style="width: 30%; float: right; margin: 22px;">
							<table class="tftable" border="1" hight="10">
								<tr>
									<th>문서 보존 기한</th>
								</tr>
								
								<tr>
								<th style="background-color:white"><input type="text" id="aaExpiryDate" value="" style="border:0px; text-align:center;" readonly/></th>
								</tr>
							</table>
							</fieldset>
						</div>


						<div class="col-md-4">


							<table class="tftable" border="1" hight="10" style="margin: 22px"
								id="selectName">

								<tr>

									<th rowspan="2" width="50px" style="background-color: #ffffff;">발신</th>
									<th></th>
									<th>${loginEmp.jobName}</th> <!-- 여기에 if문으로 값이 null이 아니라면 안들어가게끔 조거문 주기 -->
									<th></th>

								</tr>

								<tr>

									<th style="width: 100px; background-color: #ffffff;">
									</th>
									<th style="width: 100px; background-color: #ffffff;">${loginEmp.empName}</th>
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
										
									  console.log("signNo : " +result.signNo)
									  console.log("createName : " +result.createName)
									  console.log("createDate : " +result.createDate)
									  console.log("jobName : " +result.jobName)
									  console.log("expiryDate : " +result.expiryDate)
									  console.log("finalApprover : " +result.finalApprover)
									  console.log("signTitle : " +result.signTitle)
									  console.log("signContent : " +result.signContent)
									  console.log("changeName : " +result.changeName)
									  
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
								var createName = result.createDate; //기안자
								var createDate = result.jobName; //기안일
								var jobName = result.jobName; //기안자 직급
								var expiryDate = result.expiryDate; //문서 만료일
								var finalApprover = result.finalApprover; //최종 결재자
								var signTitle = result.signTitle; //결재 제목
								var signContent = result.signContent; //결재 내용
								var changeName = result.changeName; //파일 수정된 이름
								
								$("#aaSignNo").val(signNo);
								$("#aaCreateName").val(createName);
								$("#aaCreateDate").val(createDate);
								$("#aaJobName").val(jobName);
								$("#aaExpiryDate").val(expiryDate);
								$("#aaFinalApprover").val(finalApprover);
								$("#aaSignTitle").val(signTitle);
								$("#aaSignContent").val(signContent);
								$("#aaChangeName").val(changeName);
								
					
							}
							
				
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

						<!--  	<input type="file" id="file" name="uploadFile"> -->
							<b></b> <!-- file 이름 읽어오게끔 -->
						
							

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
	
	

	<jsp:include page="../common/bottom.jsp" />
</body>
</html>