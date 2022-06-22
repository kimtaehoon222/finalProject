<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>
<title></title>
	<!-- Favicon -->
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/img/favicon/favicon.ico" />
	
	<!-- Fonts -->
	<link rel="preconnect" href="https://fonts.googleapis.com" />
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
	<link
	  href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	  rel="stylesheet"
	/>
	
	<!-- Icons. Uncomment required icon fonts -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/fonts/boxicons.css" />
	
	<!-- Core CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/css/core.css" class="template-customizer-core-css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/demo.css" />
	
	<!-- Vendors CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/apex-charts/apex-charts.css" />
	
	<!-- Helpers -->
	<script src="${pageContext.request.contextPath}/resources/assets/vendor/js/helpers.js"></script>
	
	<!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
	<!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/config.js"></script>
<style>
.listArea{
	border:1px solid grey;
	text-align:center;
}	
.listArea td, .listArea th{
	border:1px solid grey;
	text-align:center;
}
</style>
<head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
  google.charts.load('current', {'packages':['corechart']});
  google.charts.setOnLoadCallback(drawVisualization);

  function drawVisualization() {
    // Some raw data (not necessarily accurate)
     var data = google.visualization.arrayToDataTable([
          ['Month', '기획팀', '영업팀', '회계팀', '경영지원팀', '생산팀', '월전체평균'],
          ['2022/01',  165,      938,         522,             998,           450,      614.6],
          ['2022/02',  135,      1120,        599,             1268,          288,      682],
          ['2022/03',  157,      1167,        587,             807,           397,      623],
          ['2022/04',  139,      1110,        615,             968,           215,      609.4],
          ['2022/05',  136,      691,         629,             1026,          366,      569.6]
        ]);

        var options = {
          title : '2022년도 부서별 게시글 수 현황',
          vAxis: {title: '게시글 수'},
          hAxis: {title: 'Month'},
          seriesType: 'bars',
          series: {5: {type: 'line'}}
        };

    var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
    chart.draw(data, options);
  }
</script>
</head>

<body>
  			
	<jsp:include page="../common/top.jsp"/>
	
    <!-- 내용 시작-->
    <div class="container-xxl flex-grow-1 container-p-y">
    
    <!-- 첫번째 행 시작 -->
    <div class="row">
     <!-- 통계 항목 선택 영역 시작 -->
     <div class="col-lg-12 mb-4">
       <div class="card">
          <div class="card-body">
            <h5 class="card-title text-primary"><b>통계항목 선택</b></h5>
            <div class="row">
           	    <!-- 조회 항목 선택 -->
           	    <div class="mb-3 col-md-3">
                <label class="form-label" for="country">카테고리</label>
                <select id="category" class="select2 form-select">
                  <option value="mail">메일</option>
                  <option value="sign">결재</option>
                  <option value="work">근태</option>
                  <option value="person">인사</option>
                  <option value="account">회계</option>
                </select>
                </div>
            	<!-- 조회 연도 선택 -->
	            <div class="mb-3 col-md-3">
	              <label class="form-label" for="country">조회연도</label>
	              <select id="year" class="select2 form-select">
	                <option value="allYear">전체</option>
	                <option value="2022">2022</option>
	                <option value="2021">2021</option>
	                <option value="2020">2020</option>
	              </select>
	            </div>
	            
	            <!-- 조회 월 선택 -->
	            <div class="mb-3 col-md-3">
	              <label class="form-label" for="country">조회월</label>
	              <select id="month" class="select2 form-select">
	                <option value="allMonth">전체</option>
	                <option value="01">01</option>
	                <option value="02">02</option>
	                <option value="03">03</option>
	                <option value="04">04</option>
	                <option value="05">05</option>
	                <option value="06">06</option>
	                <option value="07">07</option>
	                <option value="08">08</option>
	                <option value="09">09</option>
	                <option value="10">10</option>
	                <option value="11">11</option>
	                <option value="12">12</option>
	              </select>
	            </div>
	            <div class="mb-3 col-md-3">
	              <label class="form-label" for="country">조회항목</label>
	              <select id="type" class="select2 form-select">
	                <option value="toMails">메일 수신 현황</option>
	                <option value="fromMails">메일 발신 현황</option>
	              </select>
	            </div>
            </div>
            <button class="btn btn-sm btn-outline-primary" id="getChartResult">결과 보기</button>
          </div>
       </div>
     </div>
     <!-- 통계 항목 선택 영역 끝 -->
    </div>
    <!-- 첫번째 행 끝-->
     
    <!-- 두번째 행 시작 -->
    <div class="row">
      <!-- 통계 결과 리스트형 시작 -->
      <div class="col-lg-12 mb-4">
        <div class="card">
           <div class="card-body">
            <h5 class="card-title text-primary"><b>통계결과 List</b></h5>
 			<table class="listArea" align="center">
			<thead>
				<tr>
					<th width="200">월</th>
					<th width="200">인사관리부</th>
					<th width="200">회계관리부</th>
					<th width="200">마케팅부</th>
					<th width="200">자재관리부</th>
					<th width="200">기획영업부</th>
					<th width="200">경영관리부</th>
					<th width="200">기술개발부</th>
				</tr>
			</thead>
			<tbody id="resultList">
				<!-- 한 행 시작 -->
				
			</tbody>
		</table>
           </div>
        </div>
      </div>
      <!-- 통계 결과 리스트형 끝 -->

     </div>
     <!-- 첫번째 행 끝-->
     
    <!-- 세번째 행 시작 -->
    <div class="row">
     <div class="col-12 col-lg-12 mb-4">
       <div class="card">
           <div class="col-md-12">
             <h5 class="card-body m-0 me-2 pb-3 text-primary"><b>통계결과 Graph</b></h5>
             <!-- <div id="totalRevenueChart" class="px-2"></div>  -->
             <div id="chart_div" style="width: 900px; height: 500px;"></div>
           </div>
       </div>
     </div>
     <!--/ Total Revenue -->
    </div>
    <!-- 두번째 행 끝 -->
			 
	</div>
    <!-- 내용 끝-->     	 

	<script type="text/javascript">
	 $(function () {
		$('#getChartResult').click(function () {
			
			var category = document.getElementById("category").value;
			var year = document.getElementById("year").value;
			var month = document.getElementById("month").value;
			var type = document.getElementById("type").value;
			
			$.ajax({
				url: "chartList.do",	
				data:{
					category : category,
					year : year,
					month : month,
					type : type
				},
				type: "post",
				success: function(list) {
					
					console.log('성공');
					console.log(list);
					
					var result = "";
					const element = document.getElementById('resultList');
					console.log(element);
					
 					$.each(list, function(i) {
						result += '<tr>'
							   + '<td>' + ${list[i].groupBy} + '</td>'
							   + '<td>' + ${list[i].departD1} + '</td>'
							   + '<td>' + ${list[i].departD2} + '</td>'
							   + '<td>' + ${list[i].departD3} + '</td>'
							   + '<td>' + ${list[i].departD4} + '</td>'
							   + '<td>' + ${list[i].departD5} + '</td>'
							   + '<td>' + ${list[i].departD6} + '</td>'
							   + '<td>' + ${list[i].departD7} + '</td>'
							   + '</tr>'
 					})
					
					/*결과 출력*/ 
					element.innerHtml(result);
				},
				
				error: function(list) {
					element.html('실패');
				}
			})
		})
	})
	
	</script>


	<jsp:include page="../common/bottom.jsp"/>
	
  </body>
</html>
