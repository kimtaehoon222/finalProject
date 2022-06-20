<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/kjs_assets/css/pages/email.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/kjs_assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/kjs_assets/vendors/bootstrap-icons/bootstrap-icons.css">

<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/kjs_assets/images/favicon.svg"
	type="image/x-icon">

<title>연차 조회</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
	.inner:hover, .calendar:hover{
		color: rgb(95,118,232);
		cursor: pointer;
	}
	
	#status{
		display:none;
		position: absolute;
	}
	
	.week1:hover, .week2:hover, .week3:hover, .week4:hover, .week5:hover{
		background-color: rgba(95,118,232, 0.1);
	}
	
	.header:hover{
		background-color: white;
	}
	.week, .week1, .week2, .week3, .week4, .week5{
		display:none;
	}
	
	.today{
		background-color: rgb(124, 127, 251);
		color : white;
		border-radius : 8px;
		padding: 1px;
	}
	

</style>
</head>

	<div class="row">
		<div class="m-auto">
			<span class="calendar" id="before"><i data-feather="chevron-left" class="feather-icon"></i></span>
			<span>${year }.${month }</span>
			<span class="calendar" id="after"><i data-feather="chevron-right" class="feather-icon"></i></span>
		</div>
	</div>
	<script>
		var year = ${year}
		var month = ${month}
		
		$('.calendar').click(function(){
			if($(this).attr('id') == 'before'){
				month = month - 1;
				if(month < 1){
					year = year - 1;
					month = 12;
				}
			}
			else{
				month = month + 1;
				if(month > 12){
					year = year + 1;
					month = 1;
				}
			}
			var empNo = "${sessionScope.loginEmp.empNo}";	//로그인유저 사번
			
			$.ajax({
				type: "POST", 
				url:"selectWorkList.do",
				dataType:"html",	//html 방식
				data: { 
						year:year, 
						month: month, 
						empNo: empNo
					},
				success : function(result){
					
					$('#workList').html(result);	//html태그 넣기
				},
				error : function(){
					
					alert("근무정보를 조회할 수 없습니다. \n관리자에게 문의하세요.");
				}
			}); 
		})
	</script>
	<div class="row">
		<div class="col-md-12 m-auto">

				<div id = "thisweek" class="email-action">
					<div class="col-2 m-auto" style="height:100%; padding:10px 0px">
						<p class="text-center m-auto" style="font-size:18px">이번주 누적</p>
						<p class="text-center m-auto text-primary">00h 00m 00s</p>
					</div>
					<div class="col-2 m-auto" style="height:100%; padding:10px 0px">
					<p class="text-center m-auto" style="font-size:18px">이번주 초과</p>
						<p class="text-center m-auto text-primary">00h 00m 00s</p>
					</div>
					<div class="col-2 m-auto" style="height:100%; padding:10px 0px">
						<p class="text-center m-auto" style="font-size:18px">이번주 잔여</p>
						<p class="text-center m-auto text-primary">52h 00m 00s</p>
					</div>

				
			</div>
		</div>
	</div>
	<br><br>
	
	<!-- 이번달 wlist 출력  -->
	<c:set var="begin" value="0"/>
	<c:set var="end" value="6"/>
	
	<!-- 이번달이 4주인지 5주인지 구분 -->
	<c:choose>
		<c:when test="${wlist.size() / 7 == 4 && wlist.size() % 7 == 0}">
			<c:set var="weekNum" value="4"/>
		</c:when>
		<c:otherwise>
			<c:set var="weekNum" value="5"/>
		</c:otherwise>
	</c:choose>
	<c:forEach var="week" begin ="1" end ="${weekNum }">
		<div class="d-flex col-12" style="padding: 0px 10px; border-bottom: 2px solid rgba(0,0,0,.125);">
			<!-- 주차 표시 -->
				<div class="text-left col-2">								
					<!-- 접었다 펼때 아이콘 바뀜 -->
					<h5 class="chevron cl" id="chevron${week }"><i data-feather="chevron-down" class="feather-icon inner"></i>&nbsp;&nbsp;${week }주차</h5>
				</div>
			</div>
			
			<!-- 헤더 표시, 접었다 펼 수 있음 -->
			<div class="col-12 week${week } header" id="week${week }" style="border-bottom: 1px solid rgba(0,0,0,.125);">
				<div class="col-1 text-center">
					<span class="font-weight-bold">일차</span>
				</div>
				<div class="col-2">
					<span class="font-weight-bold">출근 시간</span>
				</div>
				<div class="col-2">
					<span class="font-weight-bold">퇴근 시간</span>
				</div>
				<div class="col-2">
					<span class="font-weight-bold">총 근무시간</span>
				</div>

			</div>
			
			<!-- 일자 표시 (7일) -->
			<c:forEach var="date" items="${wlist }" begin ="${begin }" end ="${end }" varStatus ="status">
			<div class="col-12 select week${week }" id="${date.workNo }">
				<div class="col-1 text-center">
					<span class="date" id="<fmt:formatDate value="${date.workDate}" type="date" pattern="YYYY/MM/dd"/>"><fmt:formatDate value="${date.workDate}" type="date" pattern="dd"/></span>
					<span class="day"><fmt:formatDate value="${date.workDate}" type="date" pattern="E"/></span>
				</div>
				<div class="col-2">
					<c:set var="st" value="${date.startTime }"/>
					<c:choose>
						<c:when test="${empty st }">
							<span class="startTime">출근 기록 없음</span>
						</c:when>
						<c:otherwise>
							<span class="startTime">${st }</span>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-2">
					<c:set var="et" value="${date.endTime }"/>
					<c:choose>
						<c:when test="${empty et }">
							<span class="endTime">퇴근 기록 없음</span>
						</c:when>
						<c:otherwise>
							<span class="endTime">${et }</span>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-2">
					<c:choose>
						<c:when test="${empty st or empty et }">
							<span class="totalTime totalTime1">00h 00m 00s</span>
						</c:when>
						<c:otherwise>
							<span class="totalTime totalTime2">${date.totalTime }</span>
						</c:otherwise>
					</c:choose>
				</div>
				
				
			</div>
			</c:forEach>
			<c:set var="begin" value="${begin+7 }"/>
			<c:set var="end" value="${end+7 }"/>

		<br>
	</c:forEach>
	
	<script>
		$(function(){
			
			//근무시간 형식 맞추기
			var length = $('.date').length;//해당 달에 총 날짜를 가져옴
			var totalTime = null;//근무 누적을 담기위한 변수
			var totalTimeArr = null;//날짜별로 총 근무시간이 있기때문에 배열 변수

			for(var i = 0; i < length; i++){
				totalTime = $('.totalTime').eq(i).text()
				totalTimeArr = totalTime.split(" ");
				console.log("totalTimeArr : " + totalTimeArr)
				var h = Number(totalTimeArr[0].substr(0, totalTimeArr[0].length-1))
				var m = Number(totalTimeArr[1].substr(0, totalTimeArr[1].length-1))
				var s = Number(totalTimeArr[2].substr(0, totalTimeArr[2].length-1))
				
				h = zero(h)
				m = zero(m)
				s = zero(s)
				
				totalTime = h + "h " + m + "m " + s + "s";
				console.log("zzzzztotal" + totalTime)
				$('.totalTime').eq(i).text(totalTime);
			}	
			var currentDate = new Date();	// 현재시간
			
			//현재 요일, 월, 일
			var day = new Array('일', '월', '화', '수', '목', '금', '토')
			var today = day[currentDate.getDay()];
			
			var month = new Array('1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월')
			var toMonth = month[currentDate.getMonth()];
			
			var date = currentDate.getDate();
			
			var toDate = today + " " + toMonth + " " + date;
			console.log("main toDate : " + toDate)
			//리스트
			var classDate;
			
			var length = $('.date').length;
			console.log("main length : " + length)
			for(var i = 0; i < length; i++){
				classDate = $('.date').eq(i).attr('id');
				console.log("main classDate : " + classDate)
				
				
				if(toDate.substr(5, 10) == classDate.substr(8, 10)){
					console.log("main if : " )
					$('.date').eq(i).addClass('today')

				}
			}
			
			//몇번재 주인지 선택
			var weekNum = "${weekNum}";
			var selectsId = ".selects"
			for(var i = 1; i <= weekNum; i++){
				var time = "00h 00m 00s";
				
				for(var j = 0; j < 7; j++){
					selects = $(selectsId+i).eq(j);
					var total = selects.children().eq(3).children('span');
					var result = selects.children().eq(4).children('span');
					 
					//t1
					var h1 = Number(time.substr(0,2));
					var m1 = Number(time.substr(4,2));
					var s1 = Number(time.substr(8,2));
					
					//t2
					var h2 = Number(total.text().substr(0,2));
					var m2 = Number(total.text().substr(4,2));
					var s2 = Number(total.text().substr(8,2));
					
					var h = h1 + h2
					var m = m1 + m2
					var s = s1 + s2
					
					if(s >= 60) {//초가 60이 넘으면
						m = m + 1; //분 +1
						s = s - 60;
						
					}
					if(s < 10){//초가 10보다 작으면 앞에 0을 붙여줌
						s = "0" + s;
					}
					
					if(m >= 60) {// 분이 60이 넘으면
						h = h + 1; //시 +1
						m = m - 60;
															
					}
					if(m < 10){//분이 10보다 작으면 앞에 0을 붙여줌
						m = "0" + m;
					}
					
					if(h < 10){//시간이 10보다 작으면 앞에 0을 붙여줌
						h = "0" + h;
					}
					
					time = h + "h " + m + "m " + s + "s"
					console.log("time+++++" + time)

				}
			}
			
			
			//오늘 날짜 
			var currentDate = new Date();
			console.log(currentDate)
			var toDate = currentDate.getFullYear() + "-" + (currentDate.getMonth() + 1) + "-" + currentDate.getDate()
			console.log(toDate)
			//리스트
			var classDate;
			

			
			//주별, 일별 누적 근무시간
			var weekNum = "${weekNum}"; //몇주 인지 구하기.
			console.log("zzzzzdsds" + weekNum)
			var num = 0;
			
			for(var i = 1; i <= weekNum; i++){
				
				var accumulation = "00h 00m 00s"; //누적
				var overtime = "00h 00m 00s"; //초과
				var leftTime = "52h 00m 00s";	//잔여
				
				for(var j = 0; j < 7; j++){
					var accumulation2 = accumulation;
					var overtime2 = overtime
					var leftTime2 = leftTime;
					
					var total = $('.totalTime').eq(num); //totalTime
					console.log("zzzzzdsds" + total)

					
					//accumulation
					var h1 = Number(accumulation.substr(0,2));
					var m1 = Number(accumulation.substr(4,2));
					var s1 = Number(accumulation.substr(8,2));
					console.log("h1 : " + h1)
					console.log("m1 : " + m1)
					console.log("s1 : " + s1)
					//total
					var h2 = Number(total.text().substr(0,2));
					var m2 = Number(total.text().substr(4,2));
					var s2 = Number(total.text().substr(8,2));
					console.log("h2 : " + h2)
					console.log("m2 : " + m2)
					console.log("s2 : " + s2)
					
					//전날누적시간 + 하루 근무시간
					var h = h1 + h2
					var m = m1 + m2
					var s = s1 + s2
					console.log("누적h : " + h)
					console.log("누적m : " + m)
					console.log("누적s : " + s)
					if(s >= 60) {
						m = m + 1; //분 +1
						console.log("if문 log" + m)
						s = s - 60;
						console.log("if문 log" + s)
					}
					
					if(m >= 60) {
						h = h + 1; //시 +1
						m = m - 60;
					}
					
					// 초과시간 계산
					if(h>= 52 && m > 0 && s > 0){
						//overtime
						var h3 = h - 52;
						var m3 = m;
						var s3 = s;
						
						h3 = zero(h3)
						m3 = zero(m3)
						s3 = zero(s3)
						
						overtime = h3 + "h " + m3 + "m " + s3 + "s"
					}
					
					//이번주 잔여
					var s4 = 60;
					var m4 = 60;
					var h4 = 52;
					
					if(s4 - s < 60){
						s4 = s4-s;

						m4 = m4 -1;
					}
					if(m4 - m < 60){
						m4 = m4 - m;
						h4 = h4 - 1;
						
					}
					if(h4 - h < 52){
						h4 = h4 - h;
						console.log("h4----" + h4);
					}
					
					h4 = zero(h4)
					m4 = zero(m4)
					s4 = zero(s4)
					console.log("h++++" + h)
					console.log("h4" + h4)
					console.log("m4" + m4)
					console.log("s4" + s4)
					
			
					//이번주 잔여
					leftTime = h4 + "h " + m4 + "m " + s4 + "s"
					
				
					console.log("leftTime" + leftTime)
					

					h = zero(h)
					m = zero(m)
					s = zero(s)
					console.log("마지막 s" + s)
					accumulation = h + "h " + m + "m " + s + "s"
					console.log("accumulation 1111" + accumulation)
					
					//오늘 날짜이고, 총 근무시간이 00h 00m 00s이면(출퇴근 x) -> 누적시간 표시x
					if($('.date').eq(num).attr('class').includes('today')&&total.text() == '00h 00m 00s'){ // 다 0으로 나옴
						console.log("if문 확인")
						$('#thisweek').children().eq(0).children().eq(1).text(accumulation2)
						console.log("if문 확인" + accumulation2)
						$('#thisweek').children().eq(1).children().eq(1).text(overtime2)
						$('#thisweek').children().eq(2).children().eq(1).text(leftTime2)
				
					}
					//오늘 날짜이면 -> 누적시간 표시o
					else if($('.date').eq(num).attr('class').includes('today')){ //accumulation : 52h 60m 60 s 나머지 0
						console.log("if문 확인2")
						$('#thisweek').children().eq(0).children().eq(1).text(accumulation)
						console.log("if문 확인2 : " + accumulation)
						$('#thisweek').children().eq(1).children().eq(1).text(overtime)
						console.log("if문 확인2 : " + overtime)
						$('#thisweek').children().eq(2).children().eq(1).text(leftTime)
						console.log("if문 확인2 : " + leftTime)
						
					
			
					}
				
					num++;
				}
			}
			//한 자릿수에 0추가하기
			function zero(n){
				
				if(n < 10){
					n = "0" + n;
				}
				return n;
			}
			
			
			//주차 클릭시 아래 리스트 펼침, 닫힘
			$(".chevron").click(function(){
				
				var week = $(this).attr('id').substr(7, 1);
				
				if($(this).attr('class').includes('cl') == true) {
					$(this).removeClass('cl');
					$(this).addClass('op');
					
					//week? 클래스에 d-flex추가
					$(".week" + week).addClass('d-flex')
				}
				
				else if($(this).attr('class').includes('op') == true){
					
					$(this).removeClass('op');
					$(this).addClass('cl');
					
					//week? 클래스에 d-flex제거
					$(".week" + week).removeClass('d-flex')
					
				}
			})
			
			
		})
		
	</script>
	
	

	<!-- ============================================================== -->
	<!-- End PAge Content -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- Right sidebar -->
	<!-- ============================================================== -->
	<!-- .right-sidebar -->
	<!-- ============================================================== -->
	<!-- End Right sidebar -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- End Container fluid  -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- footer -->
	<!-- ============================================================== -->

	<!-- ============================================================== -->
	<!-- End footer -->
	<!-- ============================================================== -->

	<!-- ============================================================== -->
	<!-- End Wrapper -->
	<!-- ============================================================== -->
	<!-- End Wrapper -->
	<!-- ============================================================== -->
	<!-- All Jquery -->
	<!-- ============================================================== -->

	
	<script
		src="${ pageContext.servletContext.contextPath }/resources/kth_assets/libs/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap tether Core JavaScript -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/kth_assets/libs/popper.js/dist/umd/popper.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/kth_assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- apps -->
	<!-- apps -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/kth_dist/js/app-style-switcher.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/kth_dist/js/feather.min.js"></script>
	<!-- slimscrollbar scrollbar JavaScript -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/kth_assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/kth_assets/extra-libs/sparkline/sparkline.js"></script>
	<!--Wave Effects -->
	<!-- themejs -->
	<!--Menu sidebar -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/kth_dist/js/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/kth_dist/js/custom.min.js"></script>
	<!--  -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/summernote/summernote-lite.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/summernote/lang/summernote-ko-KR.js"></script>
			<script
		src="${pageContext.request.contextPath}/resources/kjs_assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/kjs_assets/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/kjs_assets/js/main.js"></script>

</body>
</html>