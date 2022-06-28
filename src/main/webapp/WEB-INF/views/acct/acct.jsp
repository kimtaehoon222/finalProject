<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath(); //컨텍스트 페스 선언
%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sked_detail</title>
</head>
<body>
	<jsp:include page="../common/top.jsp"/>
	
	<!----------------------------------------------------------------------------------------------------------->
	<link href='${pageContext.request.contextPath}/resources/jje_css/jje_acct.css' rel='stylesheet' />
	<div class="container-xxl flex-grow-1 container-p-y">
	
	    <div class="row" style="display: flex; justify-content: space-between; margin-right:10px;">
	        
	      <div class="container c0">
	        <!-- 카드 잔액 정보 -->
	        <div class="i0 container c1">
	          <div class="i1-1"><h5><b>xx부<br>법인카드</b><hr style="margin: 5px 0;"></h5></div>
	          <div class="i1-2"><img src="${pageContext.request.contextPath}/resources/assets/img/logo/W.png" style="width: 100%; height: 84.37%;"></div>
	          <div class="i1-3"><small>결제 건 수</small><br><b>0건</b></div>
	          <div class="i1-4"><small>사용금액 / 한도</small><br><b>0,000,000 원 / 5,000,000 원</b></div>
	        </div>
	        <!-- 카드정보 -->
	        <div class="i0 container c2">
	          <div class="i2-1"><h5 style="margin: 0 0 5px 0;"><b>카드정보</b></h5></div>
	          <div class="i2-2"><img src="${pageContext.request.contextPath}/resources/assets/img/elements/card.png" style="width: 100%; height: 100%;"></div>
	          <div class="i2-3">카드 이름</div>
	          <div class="i2-4">
	            <table class="c_table">
	              <hr style="margin: 5px 0;">
	              <tr>
	                <th>브랜드</th>
	                <td>MASTER</td>
	              </tr>
	              <tr>
	                <th>카드번호</th>
	                <td><small>1234-00**-****-1234</small></td>
	              </tr>
	              <tr>
	                <th>유효기간</th>
	                <td>12/25</td>
	              </tr>
	              <tr>
	                <th>CVV/CVC</th>
	                <td>****</td>
	              </tr>
	            </table>
	          </div>
	        </div>
	        <!-- 검색조건 -->
	        <div class="i0 container c3-1">
	          <h5 class="fw-bold" style="margin: 5px 0;">검색조건<hr style="margin: 5px 0;"></h5>
	          
	          <form class="container c3-2" action="javascript:void(0)"><!-- action="statSearch.do"  method="post" onsubmit="return checkValue();" -->
	            <div class="i3-1">
	              <b>기간</b>
	            </div>
	            <div class="i3-2">
	              <input id="start_date" type="date" class="form-control" name="startDate" required>
	              <input id="end_date" type="date" class="form-control" name="endDate" required>
	            </div>
	            <div class="i3-3">
	              <b>금액</b>
	            </div>
	            <div class="i3-4">
	              <input id="m_range" type="range" class="form-range" min="0" max="1000000" step="10000" name="amount" value="0" onchange="SetValue(this)" required>
	              <input type="text" value="0" id="m_no" class="form-control" readOnly>
	            </div>
	            <div class="i3-5">
	              <b>단어</b>
	            </div>
	            <div class="i3-6">
	              <input type="text" class="form-control" name="keyWord">
	            </div>
	            <div class="i3-7">
	              <b>사용자</b>
	            </div>
	            <div class="i3-8">
	              <input type="text" class="form-control" name="empName">
	            </div>
	            <div class="i3-9"><button type="submit" class="btn btn-primary" onclick="checkValue()">검색</button></div>
	            
	          </form>
	          <script>
          		/*숫자 출력*/
				function SetValue(e){
					$("#m_no").val(e.value);
				}
				
          		/*검색 값 검사*/
				function checkValue(){
					var startD = $("#start_date").val();
					var endD = $("#end_date").val();
					var empName = $("input[name=empName]").val();
					var keyWord = $("input[name=keyWord]").val();
					
					/*날짜검사*/
					if(endD && startD){
						if(endD < startD){
							alert("시작일이 종료일보다 클 수 없습니다.");
							$("#end_date").focus();
	
							return false;
						}
					}else{
						return false;
					}

					/*이름검사*/
					if(empName){
						var chkName = /^[가-힣]{2,6}$/;
	                	if(!chkName.test(empName)){
							alert("이름은 두글자 이상의 한글로 입력하십시오.");
							$("input[name=empName]").focus();
							return false;
	                	}
					}
					
					toAjax(startD, endD, empName, keyWord, 1);
					
				}
          		
          		/*검색 ajax호출*/
          		function toAjax(startD, endD, empName, keyWord, currentNo){
          			
                    var startD = startD;		//시작일
                    var endD = endD;			//종료일
                    var empName = empName;		//이름
          			var keyWord = keyWord;		//검색어
          			var currentNo = currentNo;	//검색어
          			
          			console.log(startD, endD, empName, keyWord, currentNo);
          			
          			$.ajax({ 
        				url: "searchStat.do",
        				data: {
        					currentPage : currentNo,
        					keyWord : keyWord,
        					empName : empName,
        					startDate : startD,
        					endDate : endD
        				},
        				type: "GET",
        				dataType : "json",
        				success : function(result){
        					
        					var list="";
        					
        					/*결과물 반복문*/
        					$.each(result, function(i){
        						
								/*html 태그 추가*/
        						list += "<tr>"
                                + "<td>" + result[i].statNo + "</td>"
                                + "<td>" + result[i].empName + "</td>"
                                + "<td>" + result[i].transactionDate + "</td>"
                                + "<td>" + result[i].amount + "</td>"
                                + "<td>" + result[i].storeName + "</td>"
                                + "<td>" + result[i].paymentStatus + "</td>"
                                + "<td><button type='button' class='btn btn-primary detail_btn'>확인</button></td>"
                              	+ "</tr>"
    	 					});
        					
        					$("#resultTable").html(list);	//화면에 출력
        					
        					var pi = result[0].pi;
        					
        					/*console.log("currentPage : " + pi.currentPage);
        					console.log("startPage : " + pi.startPage);
        					console.log("endPage : " + pi.endPage);
        					console.log("maxPage : " + pi.maxPage);*/

        					var pageSet="";
        					
        					var clickFunctionP = "toAjax(" + '"' + startD + '"' + "," + '"' + endD + '"' + "," + '"' + empName + '"' + "," + '"' + keyWord + '"' + "," + (pi.currentPage-1) + ")"
        					var clickFunctionN = "toAjax(" + '"' + startD + '"' + "," + '"' + endD + '"' + "," + '"' + empName + '"' + "," + '"' + keyWord + '"' + "," + (pi.currentPage+1) + ")"
        					/*currentPage가 1이 아닐 때*/
        					if(pi.currentPage != 1){
        						$("#prevLi").removeClass('disabled'); 			//prev버튼에 클래스 제거(클릭가능)
        						$("#prevA").attr('onclick', clickFunctionP); 	//a태그 onclick 추가
        					}else{
        						$("#prevLi").addClass('disabled');
        					}
        					
        					/*페이지 수 만큼 반복해서 추가*/
        					for(var p = pi.startPage ; p <= pi.endPage ; p++ ){
        						if(pi.currentPage != p){
        							pageSet += "<li class='page-item'>"
	            							+ "<div class='page-link' href='javascript:void(0);' onclick='toAjax(" + '"' + startD + '"' + "," + '"' + endD + '"' + "," + '"' + empName + '"' + "," + '"' + keyWord + '"' + "," + p + ")'>"
	            							+ p
	            							+ "</div>"
	            							+ "</li>"
        						}else{
        							pageSet += "<li class='page-item disabled'>"
        									+ "<div class='page-link' href='javascript:void(0);'>"
	            							+ p
	            							+ "</div>"
	            							+ "</li>"
        						}
        					}
        					
        					$("#navList").html(pageSet);	//화면에 출력
        					
        					/*currentPage가 끝페이지가 아닐 때*/
        					if(pi.currentPage != pi.maxPage){
        						$("#nextLi").removeClass('disabled'); 			//next버튼에 클래스 제거(클릭가능)
        						$("#nextA").attr('onclick', clickFunctionN); 	//a태그 onclick 추가
        					}else{
        						$("#nextLi").addClass('disabled');
        					}

        				},
        				error : function(result){
        				 alert('데이터 로딩 실패');
        				}
		   			});
          		}
			  </script>
	        </div>
	        <!-- 카드사용내역조회 -->
	        <div class="i0 container c4  mb-4">
	          <!-- 제목 -->
	          <div class="i4-1"><h4><b>카드사용내역조회</b></h4></div>
	
	          <!-- 등록버튼 -->
	          <div class="i4-2">
	            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#stat-insert-modal" id="insert_btn">등록</button>
	          </div>
	          
	          <!-- 내역 -->
	          <div class="i4-3">
	            <table class="table table-striped a_table" id="resultTable">
	              <thead>
	                <tr>
	                  <th>NO.</th>
	                  <th>사용자</th>
	                  <th>사용일시</th>
	                  <th>승인금액</th>
	                  <th>가맹점</th>
	                  <th>승인</th>
	                  <th>상세</th>
	                </tr>
	              </thead>
	              <tbody>
	                <c:forEach items="${cardList}" var="c">
	                    <tr>
	                        <td>${ c.statNo }</td>
	                        <td>${ c.empName }</td>
	                        <td>${ c.transactionDate }</td>
	                        <td>${ c.amount }</td>
	                        <td>${ c.storeName }</td>
	                        <td>${ c.paymentStatus }</td>
	                        <td><button type="button" class="btn btn-primary detail_btn">확인</button></td>
	                    </tr>
                    </c:forEach>
	              </tbody>
	            </table>
	          </div>
	
	          <!-- 페이지네이션 -->
	          <div class="i4-4">
				<nav aria-label="Page navigation">
					<ul class="pagination" style="justify-content: center;">
						<!-- prev -->
						<c:choose>
							<c:when test="${ pi.currentPage ne 1 }">
								<li class="page-item prev" id="prevLi">
									<a class="page-link" href="acct.do?deptCode=${loginEmp.deptCode}&currentPage=${ pi.currentPage-1 }" id="prevA">
										<i class="tf-icon bx bx-chevron-left"></i>
									</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item prev disabled" id="prevLi">
									<a class="page-link" href="" id="prevA">
										<i class="tf-icon bx bx-chevron-left"></i>
									</a>
								</li>
							</c:otherwise>
						</c:choose>
						<!-- / prev -->
						
						<li id='navList' style="display: none; margin-left:3px;"></li>
						<!-- num -->
						<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
							<c:choose>
								<c:when test="${ pi.currentPage ne p }">
									<li class="page-item">
										<a class="page-link" href="acct.do?deptCode=${loginEmp.deptCode}&currentPage=${ p }">
											${ p }
										</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="page-item disabled">
										<a class="page-link" href="">
											${ p }
										</a>
									</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<!-- num -->
						
						<!-- next -->
						<c:choose>
							<c:when test="${ pi.currentPage ne pi.maxPage }">
								<li class="page-item next" id="nextLi">
									<a class="page-link" href="acct.do?deptCode=${loginEmp.deptCode}&currentPage=${ pi.currentPage+1 }" id="nextA">
										<i class="tf-icon bx bx-chevron-right"></i>
									</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item next disabled" id="nextLi">
									<a class="page-link" href="" id="nextA">
										<i class="tf-icon bx bx-chevron-right"></i>
									</a>
								</li>
							</c:otherwise>
						</c:choose>
						<!-- / next -->
					</ul>
				</nav>
	          </div>
	          <!-- 페이지네이션 -->
	
	        </div>
	        <!-- 카드사용내역조회 -->
			
	      </div>
	    </div>
	</div>
	<!----------------------------------------------------------------------------------------------------------->
	<!-------------------모달------------------->
	<!-- 등록 -->
	<form class="modal fade" id="stat-insert-modal" tabindex="-1" aria-hidden="true" action="insertStat.do"  enctype="multipart/form-data" method="POST">
	  <div class="modal-dialog modal-l" role="document">
	    <div class="modal-content">
	        <!-- 모달 헤더 -->
	        <div class="modal-header">
	            <h5 class="modal-title" id="exampleModalLabel4">사용 내역 등록</h5>
	        </div>
	        <!-- 모달 바디 -->
	        <div class="modal-body">
	        
	          <!-- 1번줄 -->
	          <div class="row">
	            <!-- 사용자 -->
	              <div class="col mb-3">
	                <input id="emp_no" type="hidden" class="form-control" value="${loginEmp.empNo}" name="empNo"/>
	                <label for="emp_name" class="form-label">사용자</label>
	                <input id="emp_name" type="text" class="form-control" value="${loginEmp.empName}" name="empName" readOnly required/>
	              </div>
	          </div>
	          
	          <!-- 2번줄 -->
	          <div class="row">
	            <!-- 처리상태 -->
	            <div class="col mb-3">
	              <label for="payment_status" class="form-label">처리상태</label>
	              <select id="payment_status" class="form-select" name="paymentStatus" autofocus required>
	                <option value="A">승인</option>
	                <option value="C">취소</option>
	              </select>
	            </div>
	            
	            <!-- 승인금액 -->
	            <div class="col mb-3">
	              <label for="amount" class="form-label">승인 금액</label>
	              <input id="amount" type="text" class="form-control" name="amount" autofocus required/>
	            </div>
	          </div>
	          
	          <!-- 3번줄 -->
	          <div class="row">
	          	<!-- 사용일시 -->
	              <div class="col mb-3">
	                <label for="transaction_date" class="form-label">사용일시</label>
	                <input id="transaction_date" type="date" class="form-control" name="transactionDate" required>
	              </div>
	              
                <!-- 가맹점 -->
                <div class="col mb-3">
              	  <label for="store_name" class="form-label">가맹점</label>
              	  <input id="store_name" type="text" class="form-control" name="storeName" autofocus required/>
                </div>
	          </div>
	          
	          <!-- 4번줄 -->
	          <div class="row" id="line3">
	            <!-- 시작 날짜 -->
	            <div class="col mb-6">
	                <label for="bill_file" class="form-label">영수증 첨부</label>
	                <input id="bill_file" class="form-control" type="file" name="uploadFile">
	            </div>
	          </div>
	          
	          <!-- 5번줄 -->
	          <div class="row">
	              <div class="col mb-3">
	                  <label for="stas_meno" class="form-label">메모</label>
	                  <textarea id="stas_meno" class="form-control" placeholder="메모 입력" name="statMemo"></textarea>
	              </div>
	          </div>
	          
	        </div>
	        
	        <!-- 모달 풋터 -->
	        <div class="modal-footer">
	            <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
	               	 취소
	            </button>
	            <button type="submit" class="btn btn-primary" id="stat_insert_btn">등록</button>
	        </div>
	    </div>
	  </div>
	</form>
	<!-- / 등록 -->
	
	<!-- 상세조회 -->
	<form class="modal fade" id="stat-detail-modal" tabindex="-1" aria-hidden="true" action="updateStat.do" enctype="multipart/form-data" method="POST">
	  <div class="modal-dialog modal-l" role="document">
	    <div class="modal-content">
	        <!-- 모달 헤더 -->
	        <div class="modal-header">
	            <h5 class="modal-title" id="exampleModalLabel4">사용 내역 등록</h5>
	        </div>
	        <!-- 모달 바디 -->
	        <div class="modal-body">
	        
              <input id="detail_stat_no" type="hidden" name="statNo"/>
              <input id="detail_emp_no" type="hidden" name="empNo"/>
              
	          <!-- 1번줄 -->
	          <div class="row">
	            <!-- 사용자 -->
	              <div class="col mb-3">
	                
	                <label for="detail_emp_name" class="form-label">사용자</label>
	                <input id="detail_emp_name" type="text" class="form-control" name="empName" readOnly required/>
	              </div>
	          </div>
	          
	          <!-- 2번줄 -->
	          <div class="row">
	            <!-- 처리상태 -->
	            <div class="col mb-3">
	              <label for="detail_payment_status" class="form-label">처리상태</label>
	              <select id="detail_payment_status" class="form-select" name="paymentStatus" autofocus required>
	                <option value="A">승인</option>
	                <option value="C">취소</option>
	              </select>
	            </div>
	            
	            <!-- 승인금액 -->
	            <div class="col mb-3">
	              <label for="detail_amount" class="form-label">승인 금액</label>
	              <input id="detail_amount" type="text" class="form-control" name="amount" autofocus required/>
	            </div>
	          </div>
	          
	          <!-- 3번줄 -->
	          <div class="row">
	          	<!-- 사용일시 -->
	              <div class="col mb-3">
	                <label for="detail_transaction_date" class="form-label">사용일시</label>
	                <input id="detail_transaction_date" type="date" class="form-control" name="transactionDate" required>
	              </div>
	              
                <!-- 가맹점 -->
                <div class="col mb-3">
              	  <label for="detail_store_name" class="form-label">가맹점</label>
              	  <input id="detail_store_name" type="text" class="form-control" name="storeName" autofocus required/>
                </div>
	          </div>
	          
	          <!-- 4번줄 -->
	          <div class="row" id="line3">
	            <!-- 첨부파일 -->
	            <div class="col mb-6">
	                <label for="detail_bill_file" class="form-label">영수증 첨부</label>
                    <input id="detail_bill_file" class="form-control" type="file" name="reUploadFile">
                    <br>
                    <p id="test"></p>
	            </div>
	          </div>
	          
	          <!-- 5번줄 -->
	          <div class="row">
	              <div class="col mb-3">
	                  <label for="detail_stas_meno" class="form-label">메모</label>
	                  <textarea id="detail_stas_meno" class="form-control" placeholder="메모 입력" name="statMemo"></textarea>
	              </div>
	          </div>
	          
	        </div>
	        
	        <!-- 모달 풋터 -->
	        <div class="modal-footer">
	            <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">닫기</button>
	            <button type="submit" class="btn btn-primary" id="stat_update_btn">수정</button>
	            <button type="button" class="btn btn-danger" id="stat_delete_btn" onclick="deleteStat()">삭제</button>
	        </div>
	    </div>
	  </div>
	</form>
	<!-- / 상세조회 -->
	<button data-bs-toggle="modal" data-bs-target="#stat-detail-modal" id="stat_detail_btn" style="display:none;"></button>
	<!-------------------모달------------------->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script><!-- jQuery library -->
	<script>
			
		/*상세조회*/
		$(function(){
			$(".detail_btn").click(function(){
				var stat_no = $(this).parent().siblings().eq(0).text();
      			console.log(stat_no);
      			
      			/*상세조회 ajax*/
      			$.ajax({ 
					url: "statDetail.do",
					data: {
					 		statNo: stat_no
					},
					type: "GET",
					dataType : "json",
					success : function(result){
						
						$("#detail_stat_no").val(result.statNo);
						$("#detail_emp_no").val(result.empNo);
						
						$("#detail_emp_name").val(result.empName);
						$("#detail_payment_status").val(result.paymentStatus);
						$("#detail_amount").val(result.amount);
						$("#detail_transaction_date").val(result.transactionDate);
						$("#detail_store_name").val(result.storeName);
						$("#detail_stas_meno").val(result.statMemo);
						
						/*첨부파일*/
						var originName = result.originName;
						var changeName = result.changeName
						var filePath = result.filePath;
						
						var attc = "";
						
						if(originName){
							attc += '<a href="${pageContext.request.contextPath}/resources/acct_files/' + changeName + '" download="'+originName+'"> 현재 업로드된 파일 : '+originName+'</a>' 
								+'<input type="hidden" name="changeName" value=' + changeName + '></input>'
								+'<input type="hidden" name="originName" value='+originName+'></input>';
						}else{
							attc = "첨부파일이 없습니다.";
						}
						
						$("#test").html(attc);
	
					},
					error : function(result){
					 alert('데이터 로딩 실패');
					}
			   });
      			//$("input[name=storeName]").val(stat_no);
				
      			$("#stat_detail_btn").click();
			});
		});
		
		/*내역삭제*/
		function deleteStat(){
			location.href = "deleteStat.do?statNo="+$('#detail_stat_no').val()+"&changeName="+$('input[name=changeName]').val();
		}
	</script>
	<jsp:include page="../common/bottom.jsp"/>
</body>
</html>