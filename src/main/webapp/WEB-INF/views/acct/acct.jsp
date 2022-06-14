<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath(); //컨텍스트 페스 선언
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sked_detail</title>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath}/top.jsp"/>
	
	<!----------------------------------------------------------------------------------------------------------->
	<link href='${pageContext.request.contextPath}/resources/jje_css/jje_acct.css' rel='stylesheet' />
	<div class="container-xxl flex-grow-1 container-p-y">
	
	    <div class="row" style="display: flex; justify-content: space-between;">
	        
	      <div class="container c0">
	        <!-- 카드 잔액 정보 -->
	        <div class="i0 container c1">
	          <div class="i1-1"><h5><b>xx부<br>법인카드</b><hr style="margin: 5px 0;"></h5></div>
	          <div class="i1-2"><img src="${pageContext.request.contextPath}/resources/assets/img/logo/W.png" style="width: 120px; height: 120px;"></div>
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
	          
	          <form action="" method="post" class="container c3-2">
	            <div class="i3-1">
	              <b>검색기간</b>
	            </div>
	            <div class="i3-2">
	              <input id="start_date" type="date" class="form-control" required>
	              <input id="end_date" type="date" class="form-control" required>
	            </div>
	            <div class="i3-3">
	              <b>검색 금액</b>
	            </div>
	            <div class="i3-4">
	              <input id="m_range" type="range" class="form-range" min="0" max="10000000" step="100000" required>
	              <input class="form-control" value="0">
	            </div>
	            <div class="i3-5">
	              <b>검색 단어</b>
	            </div>
	            <div class="i3-6">
	              <input type="text" class="form-control">
	            </div>
	            <div class="i3-7">
	              <b>사용자</b>
	            </div>
	            <div class="i3-8">
	              <input type="text" class="form-control">
	            </div>
	            <div class="i3-9"><button type="submit" class="btn btn-primary">검색</button></div>
	            
	          </form>
	        </div>
	        <!-- 카드사용내역조회 -->
	        <div class="i0 container c4">
	          <!-- 제목 -->
	          <div class="i4-1"><h4><b>카드사용내역조회</b></h4></div>
	
	          <!-- 등록버튼 -->
	          <div class="i4-2">
	            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#stat-insert-modal" id="insert_btn">등록</button>
	          </div>
	
	          <!-- 내역 -->
	          <div class="i4-3">
	            <table class="table table-striped a_table">
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
	                <tr style="text-align:center;">
	                  <td>15</td>
	                  <td>김땡땡 과장</td>
	                  <td>2022-05-29</td>
	                  <td>4,000</td>
	                  <td>우체국</td>
	                  <td>승인</td>
	                  <td><button type="button" class="btn btn-primary detail_btn" data-bs-toggle="modal" data-bs-target="#stat-detail-modal">확인</button></td>
	                </tr>
	                <tr style="text-align:center;">
	                  <td>14</td>
	                  <td>김땡땡 과장</td>
	                  <td>2022-05-29</td>
	                  <td>4,000</td>
	                  <td>우체국</td>
	                  <td>승인</td>
	                  <td><button type="button" class="btn btn-primary detail_btn" data-bs-toggle="modal" data-bs-target="#stat-detail-modal">확인</button></td>
	                </tr>
	                <tr style="text-align:center;">
	                  <td>13</td>
	                  <td>김땡땡 과장</td>
	                  <td>2022-05-29</td>
	                  <td>4,000</td>
	                  <td>우체국</td>
	                  <td>승인</td>
	                  <td><button type="button" class="btn btn-primary detail_btn" data-bs-toggle="modal" data-bs-target="#stat-detail-modal">확인</button></td>
	                </tr>
	                <tr style="text-align:center;">
	                  <td>12</td>
	                  <td>김땡땡 과장</td>
	                  <td>2022-05-29</td>
	                  <td>4,000</td>
	                  <td>우체국</td>
	                  <td>승인</td>
	                  <td><button type="button" class="btn btn-primary detail_btn" data-bs-toggle="modal" data-bs-target="#stat-detail-modal">확인</button></td>
	                </tr>
	                <tr style="text-align:center;">
	                  <td>11</td>
	                  <td>김땡땡 과장</td>
	                  <td>2022-05-29</td>
	                  <td>4,000</td>
	                  <td>우체국</td>
	                  <td>승인</td>
	                  <td><button type="button" class="btn btn-primary detail_btn" data-bs-toggle="modal" data-bs-target="#stat-detail-modal">확인</button></td>
	                </tr>
	              </tbody>
	            </table>
	          </div>
	
	          <!-- 페이지네이션 -->
	          <div class="i4-4">
	            <nav aria-label="Page navigation">
	              <ul class="pagination pagination-sm justify-content-center">
	                <li class="page-item prev">
	                  <a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevrons-left"></i></a>
	                </li>
	                <li class="page-item active">
	                  <a class="page-link" href="javascript:void(0);">1</a>
	                </li>
	                <li class="page-item">
	                  <a class="page-link" href="javascript:void(0);">2</a>
	                </li>
	                <li class="page-item">
	                  <a class="page-link" href="javascript:void(0);">3</a>
	                </li>
	                <li class="page-item">
	                  <a class="page-link" href="javascript:void(0);">4</a>
	                </li>
	                <li class="page-item">
	                  <a class="page-link" href="javascript:void(0);">5</a>
	                </li>
	                <li class="page-item next">
	                  <a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevrons-right"></i></a>
	                </li>
	              </ul>
	            </nav>
	          </div>
	          <!-- 페이지네이션 -->
	
	        </div>
	        <!-- 카드사용내역조회 -->
			<!-------------------모달------------------->
			<!-- 등록 -->
			<form class="modal fade" id="stat-insert-modal" tabindex="-1" aria-hidden="true" action="schedule.html" method="POST">
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
			            <!-- 카테고리 -->
			              <div class="col mb-3">
			                <label for="emp_no" class="form-label">사용자</label>
			                <input id="emp_no" type="text" class="form-control" autofocus required/>
			              </div>
			          </div>
			          <!-- 2번줄 -->
			          <div class="row">
			            <!-- 사용일시 -->
			            <div class="col mb-3">
			              <label for="payment_status" class="form-label">처리상태</label>
			              <select id="payment_status" name="payment_status" class="form-select" autofocus required>
			                <option value="A">승인</option>
			                <option value="C">취소</option>
			              </select>
			            </div>
			            <!-- 가맹점 -->
			            <div class="col mb-3">
			              <label for="" class="form-label">승인 금액</label>
			              <input id="" type="text" class="form-control" autofocus required/>
			            </div>
			          </div>
			          <!-- 3번줄 -->
			          <div class="row">
			              <div class="col mb-3">
			                <label for="transaction_date" class="form-label">사용일시</label>
			                <input id="transaction_date" type="date" class="form-control" required>
			              </div>
			          </div>
			          <!-- 4번줄 -->
			          <div class="row" id="line3">
			            <!-- 시작 날짜 -->
			            <div class="col mb-6">
			                <label for="bill_file" class="form-label">영수증 첨부</label>
			                <input id="bill_file" class="form-control" type="file" id="formFile">
			            </div>
			          </div>
			          <!-- 5번줄 -->
			          <div class="row">
			              <div class="col mb-3">
			                  <label for="stas_meno" class="form-label">메모</label>
			                  <textarea id="stas_meno" class="form-control" placeholder="메모 입력"></textarea>
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
			
			<form class="modal fade" id="stat-detail-modal" tabindex="-1" aria-hidden="true" action="schedule.html" method="POST">
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
			            <!-- 카테고리 -->
			              <div class="col mb-3">
			                <label for="emp_no" class="form-label">사용자</label>
			                <input id="emp_no" type="text" class="form-control" autofocus required/>
			              </div>
			          </div>
			          <!-- 2번줄 -->
			          <div class="row">
			            <!-- 사용일시 -->
			            <div class="col mb-3">
			              <label for="payment_status" class="form-label">처리상태</label>
			              <select id="payment_status" name="payment_status" class="form-select" autofocus required>
			                <option value="A">승인</option>
			                <option value="C">취소</option>
			              </select>
			            </div>
			            <!-- 가맹점 -->
			            <div class="col mb-3">
			              <label for="" class="form-label">승인 금액</label>
			              <input id="" type="text" class="form-control" autofocus required/>
			            </div>
			          </div>
			          <!-- 3번줄 -->
			          <div class="row">
			              <div class="col mb-3">
			                <label for="transaction_date" class="form-label">사용일시</label>
			                <input id="transaction_date" type="date" class="form-control" required>
			              </div>
			          </div>
			          <!-- 4번줄 -->
			          <div class="row" id="line3">
			            <!-- 시작 날짜 -->
			            <div class="col mb-6">
			                <label for="bill_file" class="form-label">영수증 첨부</label>
			                <input id="bill_file" class="form-control" type="file" id="formFile">
			            </div>
			          </div>
			          <!-- 5번줄 -->
			          <div class="row">
			              <div class="col mb-3">
			                  <label for="stas_meno" class="form-label">메모</label>
			                  <textarea id="stas_meno" class="form-control" placeholder="메모 입력"></textarea>
			              </div>
			          </div>
			        </div>
			        <!-- 모달 풋터 -->
			        <div class="modal-footer">
			          <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
			            닫기
			          </button>
			          <button type="submit" class="btn btn-primary" id="stat_update_btn">수정</button>
			          <button type="button" class="btn btn-danger" id="stat_delete_btn">삭제</button>
			        </div>
			    </div>
			</form>
			<!-------------------모달------------------->
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script><!-- jQuery library -->
			 <script>
				$(function(){
					$(".detail_btn").click(function(){
						var stat_no = $(this).parent().siblings().eq(0).text();
	         			console.log(stat_no);
					});
				});
			 </script>
	      </div>
	    </div>
	</div>
	<!----------------------------------------------------------------------------------------------------------->
	
	<jsp:include page="${pageContext.request.contextPath}/bottom.jsp"/>
</body>
</html>