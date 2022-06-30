<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
tr>td{
	text-align: center;
}
tr>th{
	text-align: center;
}
</style>
</head>
<body>

	<jsp:include page="../common/top.jsp" />
	
	<div class="container-xxl flex-grow-1 container-p-y">
	  <div class="card">
	  <h3 class="card-header text-primary">Notice</h3>
	  <div class="table-responsive text-nowrap px-2">
	  <button type="button" class="btn btn-primary mb-2 mx-3">작성하기</button>
		
	    <table class="table">
	      <thead>
	        <tr>
	          <th>구분</th>
	          <th>제목</th>
	          <th>작성자</th>
	          <th>작성날짜</th>
	        </tr>
	      </thead>
	      <!-- 공지사항 리스트 시작 -->
	      <tbody class="table-border-bottom-0">
	        <tr>
	          <td>1&nbsp;&nbsp;<span class="badge bg-label-danger me-1">중요</span></td>
	          <td><strong>2022년도 건강검진 안내</strong></td>
	          <td>김지수</td>
	          <td>2022-03-01</td>
	        </tr>
	        <tr>
	          <td>2&nbsp;&nbsp;<span class="badge me-1">일반</span></td>
	          <td><strong>6월 구내식당 메뉴안내</strong></td>
	          <td>김지수</td>
	          <td>2022-06-01</td>
	        </tr>
	        <tr>
	          <td>3&nbsp;&nbsp;<span class="badge me-1">일반</span></td>
	          <td><strong>신입사원 필독</strong></td>
	          <td>김지수</td>
	          <td>2022-05-25</td>
	        </tr>
	        <tr>
	          <td>4&nbsp;&nbsp;<span class="badge me-1">일반</span></td>
	          <td><strong>어린이날 대체공휴일 휴무안내</strong></td>
	          <td>김지수</td>
	          <td>2022-04-28</td>
	        </tr>
	        <tr>
	          <td>5&nbsp;&nbsp;<span class="badge me-1">일반</span></td>
	          <td><strong>성희롱 예방 교육 자료</strong></td>
	          <td>김지수</td>
	          <td>2022-04-24</td>
	        </tr>
	        <tr>
	          <td>6&nbsp;&nbsp;<span class="badge me-1">일반</span></td>
	          <td><strong>6월 구내식당 메뉴안내</strong></td>
	          <td>김지수</td>
	          <td>2022-04-24</td>
	        </tr>
	        <tr>
	          <td>7&nbsp;&nbsp;<span class="badge me-1">일반</span></td>
	          <td><strong>신입사원 필독</strong></td>
	          <td>김지수</td>
	          <td>2022-04-24</td>
	        </tr>
	        <tr>
	          <td>8&nbsp;&nbsp;<span class="badge me-1">일반</span></td>
	          <td><strong>6월 구내식당 메뉴안내</strong></td>
	          <td>김지수</td>
	          <td>2022-04-24</td>
	        </tr>
	        <tr>
	          <td>9&nbsp;&nbsp;<span class="badge me-1">일반</span></td>
	          <td><strong>신입사원 필독</strong></td>
	          <td>김지수</td>
	          <td>2022-04-24</td>
	        </tr>
	        <tr>
	          <td>10&nbsp;&nbsp;<span class="badge me-1">일반</span></td>
	          <td><strong>6월 구내식당 메뉴안내</strong></td>
	          <td>김지수</td>
	          <td>2022-04-24</td>
	        </tr>
	      </tbody>
	    </table>
    	<!-- 페이징 영역 -->
	    <ul class="pagination justify-content-center mt-3 mb-3">
          <li class="page-item prev">
            <a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevrons-left"></i></a>
          </li>
          <li class="page-item">
            <a class="page-link" href="javascript:void(0);">1</a>
          </li>
          <li class="page-item">
            <a class="page-link" href="javascript:void(0);">2</a>
          </li>
          <li class="page-item active">
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
        <!-- 페이징 영역 -->
	  </div>
	</div>
      	
    </div>        
	
	<jsp:include page="../common/bottom.jsp" />  

</body>
</html>