<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.workie.easy.employee.model.dto.Employee"%>
<%
	Employee loginEmp = (Employee)session.getAttribute("loginEmp");
%>
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
  //google.charts.setOnLoadCallback(drawVisualization);

  function drawVisualization(chartData, title, xx, yy) {
	   
	   var changeTitle = title;
	   var changeVAxiss = xx;
	   var changeHAxiss = yy;
	   
       console.log(typeof(chartData));

       /* 파라미터로 들어온 데이터 chartData가 String 타입이므로 배열로 형변환 */
       var chartArray = JSON.parse(chartData);
       
       console.log(typeof(chartArray));
       /* 최종 데이터 : 위에서 변환한 배열 데이터를 파라미터로 넘겨준다. */
       var data = google.visualization.arrayToDataTable(chartArray);

       var options = {
         title : changeTitle,
         vAxis: {title: changeVAxiss},
         hAxis: {title: changeHAxiss},
         seriesType: 'bars',
         /*series: {7: {type: 'line'}}*/
         width: 1300
       };
       
       /* 차트 그려줄 위치 */
       var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
	   
       /* 차트 그리기 */
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
    
     <div class="nav-align-top mb-4">
     	 <!-- 통계 항목 탭 시작 -->
	   	 <div class="col-xl-6">
	     <ul class="nav nav-tabs" role="tablist">
	    	<li class="nav-item">
		    	<button type="button" class="nav-link active" role="tab" 
		    		data-bs-toggle="tab" data-bs-target="#navs-top-mail" aria-controls="#navs-top-mail" aria-selected="true">Mail
		    	</button>
	    	</li>
	    	<!-- 회계관리부의 직원만 보이는 Tab -->
	    	<% if(loginEmp.getDeptCode().equals("D2")) {%>
	    	<li class="nav-item">
		    	<button type="button" class="nav-link" role="tab" id="accountChart"
		    		data-bs-toggle="tab" data-bs-target="#navs-top-account" aria-controls="#navs-top-account" aria-selected="false">Account
		    	</button>
	    	</li>
	    	<%} %>
	    	<!-- 인사관리부의 직원만 보이는 Tab -->
	    	<% if(loginEmp.getDeptCode().equals("D1")) {%>
	    	<li class="nav-item">
		    	<button type="button" class="nav-link" role="tab" id="personnelChart"
		    		data-bs-toggle="tab" data-bs-target="#navs-top-personnel" aria-controls="#navs-top-personnel" aria-selected="false">HRM
		    	</button>
	    	</li>
	    	<%} %>
	     </ul>
	     </div>
     	<!-- 통계 항목 탭 끝 -->
     	
     <!-- 통계 항목 선택 영역 시작 -->
     <div class="tab-content">
	     <!-- 메일 시작 -->
	     <div class="col-lg-12 mb-4 tab-pane show active" id="navs-top-mail" role="tabpanel">
	       <div class="card">
	          <div class="card-body">
	            <form>
	            <h5 class="card-title text-primary"><b>통계항목 선택<button class="btn btn-sm btn-outline-primary mx-2" type="reset" id="">선택 초기화</button></b></h5>
	            <div class="row">
	            	
	                <!-- 조회 항목 선택 -->
	                <div class="mb-3 col-md-3">
	                <label class="form-label" for="categoryForMail">카테고리</label>
	                <select id="categoryForMail" class="select2 form-select">
	                  <option value="mail">메일</option>
	                </select>
	                </div>
	               <!-- 조회 연도 선택 -->
	               <div class="mb-3 col-md-3">
	                 <label class="form-label" for="year">조회연도</label>
	                 <select id="year" class="select2 form-select">
	                   <option value="2022">2022</option>
	                   <option value="2021">2021</option>
	                   <option value="2020">2020</option>
	                 </select>
	               </div>
	               
	               <!-- 조회 월 선택 -->
	               <div class="mb-3 col-md-3">
	                 <label class="form-label" for="month">조회월</label>
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
	                 <label class="form-label" for="typeForMail">조회항목</label>
	                 <select id="typeForMail" class="select2 form-select">
	                   <option value="toMails">메일 수신 집계</option>
	                   <option value="fromMails">메일 발신 집계</option>
	                 </select>
	               </div>
	            </div>
	            </form>
	            <button class="btn btn-sm btn-outline-primary" id="getMailChartResult">결과 보기</button>
	            <button class="btn btn-sm btn-outline-danger" type="button" onclick="resetSelected();">결과 삭제</button>
	          </div>
	       </div>
	     </div>
	     <!-- 메일 끝 -->
	     
	     <!-- 회계 시작 -->
	     <div class="col-lg-12 mb-4 tab-pane" id="navs-top-account" role="tabpanel">
	       <div class="card">
	          <div class="card-body">
	            <form>
	            <h5 class="card-title text-primary"><b>통계항목 선택<button class="btn btn-sm btn-outline-primary mx-2" type="reset" id="">선택 초기화</button></b></h5>
	            <div class="row">
	                  <!-- 조회 항목 선택 -->
	                  <div class="mb-3 col-md-3">
	                <label class="form-label" for="categoryForAccount">카테고리</label>
	                <select id="categoryForAccount" class="select2 form-select">
	                  <option value="account">회계</option>
	                </select>
	                </div>
	               <!-- 대그룹 선택 -->
	               <div class="mb-3 col-md-3">
	                 <label class="form-label" for="groupingLarge">그룹1</label>
	                 <select id="groupingLarge" class="select2 form-select" onchange="changeForSmallGroup()">
	                   <option value="allGroup">전체</option>
	                   <option value="byDept">부서별</option>
	                   <option value="byJob">직급별</option>
	                 </select>
	               </div>
	               
	               <!-- 소그룹 선택 -->
	               <!-- 대그룹 선택 값에 따라 동적으로 option 변함 -->
	               <div class="mb-3 col-md-3">
	                 <label class="form-label" for="groupingSmall">그룹2</label>
	                 <select id="groupingSmall" class="select2 form-select" disabled>
	                 	<option value="allGroup">전체</option>
	                 </select>
	               </div>
	               
	               <div class="mb-3 col-md-3">
	                 <label class="form-label" for="typeForAccount">조회항목</label>
	                 <select id="typeForAccount" class="select2 form-select">
	                   <option value="salayPercent">급여 비율 현황</option>
	                 </select>
	               </div>
	            </div>
	            </form>
	            <button class="btn btn-sm btn-outline-primary" id="getAccountChartResult">결과 보기</button>
	            <button class="btn btn-sm btn-outline-danger" type="button" onclick="resetSelected();">결과 삭제</button>
	          </div>
	       </div>
	     </div>
	     <!-- 회계 끝 -->
	     
	     <!-- 인사 시작 -->
	     <div class="col-lg-12 mb-4 tab-pane" id="navs-top-personnel" role="tabpanel">
	       <div class="card">
	          <div class="card-body">
	            <form>
	            <h5 class="card-title text-primary"><b>통계항목 선택<button class="btn btn-sm btn-outline-primary mx-2" type="reset" id="">선택 초기화</button></b></h5>
	            <div class="row">
	            	
	                <!-- 조회 항목 선택 -->
	                <div class="mb-3 col-md-3">
	                <label class="form-label" for="categoryForPersonnel">카테고리</label>
	                <select id="categoryForPersonnel" class="select2 form-select">
	                  <option value="personnel">인사</option>
	                </select>
	                </div>
	               <!-- 조회 연도 선택 -->
	               <div class="mb-3 col-md-3">
	                 <label class="form-label" for="years">조회연도</label>
	                 <select id="years" class="select2 form-select">
	                   <option value="2022">2022</option>
	                   <option value="2021">2021</option>
	                   <option value="2020">2020</option>
	                 </select>
	               </div>
	               
	               <!-- 조회 월 선택 -->
	               <div class="mb-3 col-md-3">
	                 <label class="form-label" for="months">조회월</label>
	                 <select id="months" class="select2 form-select">
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
	                 <label class="form-label" for="typeForPersonnel">조회항목</label>
	                 <select id="typeForPersonnel" class="select2 form-select">
	                   <option value="byIn">입사자 집계</option>
	                   <option value="byOut">퇴사자 집계</option>
	                 </select>
	               </div>
	            </div>
	            </form>
	            <button class="btn btn-sm btn-outline-primary" id="getPersonnelChartResult">결과 보기</button>
	            <button class="btn btn-sm btn-outline-danger" type="button" onclick="resetSelected();">결과 삭제</button>
	          </div>
	       </div>
	     </div>
	     <!-- 인사 끝 -->
	     
     </div>
     <!-- 통계 항목 선택 영역 끝 -->
    </div>
     
    </div>
    <!-- 첫번째 행 끝-->
     
    <!-- 두번째 행 시작 -->
    <div class="row">
    
      <!-- 통계 결과 리스트형 시작 -->
      <div class="col-lg-12 mb-4">
        <div class="card">
           <div class="card-body">
            <h5 class="card-title text-primary"><b>통계결과 List</b></h5>
            <span id="noList"></span>
          <table class="listArea" align="center" id="resultList">
         
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
             <span id="noChart" class="mx-3"></span>
             <!-- 통계 결과 그래프형 시작 -->
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
   
   function resetSelected() {
	   
	   /* 데이터 모두 초기화 */ 
		$('#resultList').html(""); 
	   	$('#noList').html("");
	   	$('#noChart').html("");
	   	$('#chart_div').empty();
   }
   
   /* 탭 클릭시 */
   $(function () {
		$('.nav-link').click(function () {

	    	/* 데이터 모두 초기화 */ 
			$('#resultList').html(""); 
	    	$('#noList').html("");
	    	$('#noChart').html("");
	    	$('#chart_div').empty();
	    	
		})
   })
   
   
   /* 큰그룹 선택 값에 따른 작은그룹 출력 항목 */
   function changeForSmallGroup() {
	   
	   /* 그룹1 선택값에 따라 뿌려줄 데이터 배열 */
	   var deptName = ["전체", "인사관리부", "회계관리부", "마케팅부", "자재관리부", "기획영업부", "경영관리부", "기술개발부"];
	   var jobName = ["전체", "대표", "부사장", "부장", "차장", "과장", "대리", "사원", "인턴"];
	   
	   /* 그룹1에서 선택한 값 추출 */
	   var selectGroupLarge = $('#groupingLarge').val();

	   /* 그룹1의 선택 값에 따라 위에 생성해놓은 배열 대입 */
	   if(selectGroupLarge == 'byDept'){
		   $('#groupingSmall').attr('disabled', false);
		   changeGroupSmall = deptName;
	   }else if(selectGroupLarge == 'byJob'){
		   $('#groupingSmall').attr('disabled', false);
		   changeGroupSmall = jobName;
	   }else if(selectGroupLarge == 'allGroup'){
		   $('#groupingSmall').attr('disabled', true);
	   }
	   
	   /* 비우기 : 비우지 않으면 그룹1에서 선택한 값이 누적되어버리는 현상 있음 */
	   $('#groupingSmall').empty();
	   
	   console.log(changeGroupSmall);
	   
	   /* changeGroupSmall 배열에 담겨있는 모든 요소를 꺼내서 option 태그안에 넣는다. */
	   for(var i=0; i<changeGroupSmall.length; i++){
		   var option = $("<option>" + changeGroupSmall[i] + "</option>");
		   
		   /* 그룹2에 추가(연결)한다. */
		   $('#groupingSmall').append(option);
	   }
   }
   
   
    /* 메일 차트결과 버튼 */
    $(function () {
      $('#getMailChartResult').click(function () {
    	  
    	  $('#resultList').html(""); 
    	  $('#noList').html("");
    	  $('#noChart').html("");
    	  $('#chart_div').empty();
    	  
         var category = document.getElementById("categoryForMail").value;
         var year = document.getElementById("year").value;
         var month = document.getElementById("month").value;
         var type = document.getElementById("typeForMail").value;
         
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
               
               console.log('메일차트성공');
               console.log(list);
               
               if(list.length > 0){
	               var result = '<thead>' + '<tr>'
	               				+ '<th width="200">' + '월' + '</th>'
	               				+ '<th width="200">' + '인사관리부' + '</th>'
	               				+ '<th width="200">' + '회계관리부' + '</th>'
	               				+ '<th width="200">' + '마케팅부' + '</th>'
	               				+ '<th width="200">' + '자재관리부' + '</th>'
	               				+ '<th width="200">' + '기획영업부' + '</th>'
	               				+ '<th width="200">' + '경영관리부' + '</th>'
	               				+ '<th width="200">' + '경영관리부' + '</th>'
	               			    + '</thead>' 
	               			    + '</tr>' + '<tbody>';   				
	                
	                $.each(list, function(i) {
	                  result += '<tr>'
	                         + '<td>' + list[i].groupBy + '</td>'
	                         + '<td>' + list[i].departD1 + '</td>'
	                         + '<td>' + list[i].departD2 + '</td>'
	                         + '<td>' + list[i].departD3 + '</td>'
	                         + '<td>' + list[i].departD4 + '</td>'
	                         + '<td>' + list[i].departD5 + '</td>'
	                         + '<td>' + list[i].departD6 + '</td>'
	                         + '<td>' + list[i].departD7 + '</td>'
	                         + '</tr>'
	                })
                
	                /*리스트결과 출력*/ 
	                $('#resultList').html(result);
                }else{
                	$('#noList').html('조회 결과가 없습니다');
                	$('#noChart').html('조회 결과가 없습니다');
                }
                
				/* 그래프 부분 */                
                /* 구글 차트로 넘기기 위한 데이터 일단 String으로 보낸다. */
                var chartData = '[[' + '"' + 'Month' + '","' + '인사관리부' + '","' + '회계관리부' 
                	                 + '","' + '마케팅부' + '","' + '자재관리부' + '","' + '기획영업부' 
                	                 + '","' + '경영관리부' + '","' + '기술개발부' + '"' + '],';
                $.each(list, function(i) {
                	chartData += '["' + list[i].groupBy + '",' +  list[i].departD1 
                			  + "," + list[i].departD2 + "," +  list[i].departD3 
                			  + "," + list[i].departD4 + "," +  list[i].departD5 
                			  + "," + list[i].departD6 + "," +  list[i].departD7 + ']';
                	if(i != list.length-1){
                		chartData += ',';
                	}
                })
                
                chartData += ']';
                
                console.log(chartData);

                /* 메일 통계는 수신,발신 두 가지라 확인해야함 */
                var mailCheck = $('#typeForMail option:checked').val();
                
                var title;
                
                if(mailCheck == 'toMails'){
                	title = "메일 수신 현황";
                }else{
                	title = "메일 발신 현황";
                }
                var xx = "Count of Mails";
                var yy = "Month";
                
                /* 구글 차트를 그려주는 함수 호출 : list가 있는 경우에만 호출! */
                if(list.length > 0){
	                drawVisualization(chartData, title, xx, yy);
                }
            },
            
            error: function(list) {
               element.html('실패');
            }
         })
      })
   })
   
   /* 인사 차트결과 버튼 */
    $(function () {
      $('#getPersonnelChartResult').click(function () {
    	  
    	  $('#resultList').html(""); 
    	  $('#noList').html("");
    	  $('#noChart').html("");
    	  $('#chart_div').empty();
    	  
         var category = document.getElementById("categoryForPersonnel").value;
         var year = document.getElementById("years").value;
         var month = document.getElementById("months").value;
         var type = document.getElementById("typeForPersonnel").value;
         
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
               
               console.log('인사차트성공');
               console.log(list);
               
               if(list.length > 0){
	               var result = '<thead>' + '<tr>'
	               				+ '<th width="200">' + '월' + '</th>'
	               				+ '<th width="200">' + '인사관리부' + '</th>'
	               				+ '<th width="200">' + '회계관리부' + '</th>'
	               				+ '<th width="200">' + '마케팅부' + '</th>'
	               				+ '<th width="200">' + '자재관리부' + '</th>'
	               				+ '<th width="200">' + '기획영업부' + '</th>'
	               				+ '<th width="200">' + '경영관리부' + '</th>'
	               				+ '<th width="200">' + '경영관리부' + '</th>'
	               			    + '</thead>' 
	               			    + '</tr>' + '<tbody>';   				
	                
	                $.each(list, function(i) {
	                  result += '<tr>'
	                         + '<td>' + list[i].groupBy + '</td>'
	                         + '<td>' + list[i].departD1 + '</td>'
	                         + '<td>' + list[i].departD2 + '</td>'
	                         + '<td>' + list[i].departD3 + '</td>'
	                         + '<td>' + list[i].departD4 + '</td>'
	                         + '<td>' + list[i].departD5 + '</td>'
	                         + '<td>' + list[i].departD6 + '</td>'
	                         + '<td>' + list[i].departD7 + '</td>'
	                         + '</tr>'
	                })
                
	                /*리스트결과 출력*/ 
	                $('#resultList').html(result);
                }else{
                	$('#noList').html('조회 결과가 없습니다');
                	$('#noChart').html('조회 결과가 없습니다');
                }
                
				/* 그래프 부분 */                
                /* 구글 차트로 넘기기 위한 데이터 일단 String으로 보낸다. */
                var chartData = '[[' + '"' + 'Month' + '","' + '인사관리부' + '","' + '회계관리부' 
                	                 + '","' + '마케팅부' + '","' + '자재관리부' + '","' + '기획영업부' 
                	                 + '","' + '경영관리부' + '","' + '기술개발부' + '"' + '],';
                $.each(list, function(i) {
                	chartData += '["' + list[i].groupBy + '",' +  list[i].departD1 
                			  + "," + list[i].departD2 + "," +  list[i].departD3 
                			  + "," + list[i].departD4 + "," +  list[i].departD5 
                			  + "," + list[i].departD6 + "," +  list[i].departD7 + ']';
                	if(i != list.length-1){
                		chartData += ',';
                	}
                })
                
                chartData += ']';
                
                console.log(chartData);

                /* 메일 통계는 수신,발신 두 가지라 확인해야함 */
                var mailCheck = $('#typeForPersonnel option:checked').val();
                
                var title;
                
                if(mailCheck == 'byIn'){
                	title = "입사자 현황";
                }else{
                	title = "퇴사자 현황";
                }
                var xx = "Count of Employees";
                var yy = "Month";
                
                /* 구글 차트를 그려주는 함수 호출 : list가 있는 경우에만 호출! */
                if(list.length > 0){
	                drawVisualization(chartData, title, xx, yy);
                }
            },
            
            error: function(list) {
               element.html('실패');
            }
         })
      })
   })
   
   /* 회계 차트결과 버튼 */
   $(function () {
      $('#getAccountChartResult').click(function () {
    	  
	   	  $('#resultList').html(""); 
	   	  $('#noList').html("");
	   	  $('#noChart').html("");
	   	  $('#chart_div').empty();
    	  
         var category = document.getElementById("categoryForAccount").value;
         var groupingLarge = document.getElementById("groupingLarge").value;
         //var groupingSmall = document.getElementById("groupingSmall").value;
         var groupingSmall = $("#groupingSmall option:checked").text();
         var type = document.getElementById("typeForAccount").value;
         
         $.ajax({
            url: "chartList.do",   
            data:{
               category : category,
               groupingLarge : groupingLarge,
               groupingSmall : groupingSmall,
               type : type
            },
            type: "post",
            success: function(list) {
               
               console.log('회계차트성공');
               console.log(list);
               
               if(list.length > 0){
	               var result = '<thead>' + '<tr>'
	               				+ '<th width="200">' + '부서' + '</th>'
	               				+ '<th width="200">' + '직급' + '</th>'
	               				+ '<th width="200">' + '이름' + '</th>'
	               				+ '<th width="200">' + '입사일' + '</th>'
	               				+ '<th width="200">' + '급여' + '</th>'
	               				+ '<th width="200">' + '비율' + '</th>'
	               				+ '<th width="200">' + '누적합계' + '</th>'
	               				+ '<th width="200">' + '총합계' + '</th>'
	               			    + '</thead>' 
	               			    + '</tr>' + '<tbody>';   				
	                
	                $.each(list, function(i) {
	                  result += '<tr>'
	                         + '<td>' + list[i].deptName + '</td>'
	                         + '<td>' + list[i].jobName + '</td>'
	                         + '<td>' + list[i].empName + '</td>'
	                         + '<td>' + list[i].hireDate + '</td>'
	                         + '<td>' + list[i].salary + '</td>'
	                         + '<td>' + list[i].percent + '</td>'
	                         + '<td>' + list[i].middleSum + '</td>'
	                         + '<td>' + list[i].totalSum + '</td>'
	                         + '</tr>'
	                })
                
	                /*리스트결과 출력*/ 
	                $('#resultList').html(result);
                }else{
                	$('#noList').html('조회 결과가 없습니다');
                	$('#noChart').html('조회 결과가 없습니다');
                }
                
				/* 그래프 부분 */                
                /* 구글 차트로 넘기기 위한 데이터 일단 String으로 보낸다. */
                var chartData = '[[' + '"' + '이름' + '","' + '급여' + '","' + '누적합' + '"' + '],';
                
                $.each(list, function(i) {
                	chartData += '["' + list[i].empName + '",' + list[i].salary + "," + list[i].middleSum + ']';
                	if(i != list.length-1){
                		chartData += ',';
                	}
                })
                
                chartData += ']';
                
                console.log(chartData);
               
                var title = "급여 비율 현황";
                var xx = "Salary of Employee";
                var yy = "Employee";

                /* 구글 차트를 그려주는 함수 호출 : list가 있는 경우에만 호출! */
                if(list.length > 0){
	                drawVisualization(chartData, title, xx, yy);
                }
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