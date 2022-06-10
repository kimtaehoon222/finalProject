<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta
name="viewport"
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

<!-- Page CSS -->

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
  			
	<jsp:include page="top.jsp"/>
	
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
	            <div class="mb-3 col-md-3">
	              <label class="form-label" for="country">조회연도</label>
	              <select id="country" class="select2 form-select">
	                <option value="">전체</option>
	                <option value="">2022</option>
	                <option value="">2021</option>
	                <option value="">2020</option>
	                <option value="">2019</option>
	              </select>
	            </div>
         	    <div class="mb-3 col-md-3">
	              <label class="form-label" for="country">항목</label>
	              <select id="country" class="select2 form-select">
	                <option value="">결재</option>
	                <option value="">메일</option>
	                <option value="">근태</option>
	              </select>
	            </div>
	            <div class="mb-3 col-md-3">
	              <label class="form-label" for="country">그룹1</label>
	              <select id="country" class="select2 form-select">
	                <option value="">전체</option>
	                <option value="">부서별</option>
	                <option value="">직급별</option>
	              </select>
	            </div>
	            <div class="mb-3 col-md-3">
	              <label class="form-label" for="country">그룹2</label>
	              <select id="country" class="select2 form-select">
	                <option value="">전체</option>
	                <option value="">남자</option>
	                <option value="">여자</option>
	              </select>
	            </div>
            </div>
            <a href="#" class="btn btn-sm btn-outline-primary">통계 결과</a>
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
					<th width="200">기획팀</th>
					<th width="200">영업팀</th>
					<th width="200">회계팀</th>
					<th width="200">경영지원팀</th>
					<th width="200">생산팀</th>
					<th width="200">월전체평균</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>2022/01</td>
					<td>165</td>
					<td>938</td>
					<td>522</td>
					<td>998</td>
					<td>450</td>
					<td>614.6</td>
				</tr>
				<tr>
					<td>2022/02</td>
					<td>165</td>
					<td>938</td>
					<td>522</td>
					<td>998</td>
					<td>450</td>
					<td>614.6</td>
				</tr>
				<tr>
					<td>2022/03</td>
					<td>165</td>
					<td>938</td>
					<td>522</td>
					<td>998</td>
					<td>450</td>
					<td>614.6</td>
				</tr>
				<tr>
					<td>2022/04</td>
					<td>165</td>
					<td>938</td>
					<td>522</td>
					<td>998</td>
					<td>450</td>
					<td>614.6</td>
				</tr>
				<tr>
					<td>2022/05</td>
					<td>165</td>
					<td>938</td>
					<td>522</td>
					<td>998</td>
					<td>450</td>
					<td>614.6</td>
				</tr>
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

	<jsp:include page="bottom.jsp"/>
	
  </body>
</html>
