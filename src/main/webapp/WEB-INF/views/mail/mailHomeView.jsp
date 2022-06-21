<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link
   href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap"
   rel="stylesheet">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/kjs_assets/css/bootstrap.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/kjs_assets/css/pages/email.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/kjs_assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/kjs_assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/kjs_assets/css/app.css">
<link rel="shortcut icon"
   href="${pageContext.request.contextPath}/resources/kjs_assets/images/favicon.svg"
   type="image/x-icon">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style type="text/css">
tr:hover{
   cursor: pointer;
   background-color: #696cff;
   color: white;
}

</style>
</head>
<body>

   <jsp:include page="../common/top.jsp"/>

   <div class="container-xxl flex-grow-1 container-p-y">

      <div class="page-heading email-application">
         <div class="page-title">
            <div class="row">
               <div class="col-12 col-md-6 order-md-1 order-last">
                  <h3><a href="mailHome.do" style="color:#566a7f;" data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="right" data-bs-html="true" title data-bs-original-title="<i class='bx bx-home bx-xs' ></i><span>메일 홈으로 돌아가기</span>">Email</a></h3>
               </div>
               <div class="col-12 col-md-6 order-md-2 order-first">
                  <nav aria-label="breadcrumb"
                     class="breadcrumb-header float-start float-lg-end">
                  </nav>
               </div>
            </div>
         </div>

         <!-- 내용 영역 : 좌측은 메일 사이드바, 우측은 메일 리스트 -->
         <section class="section content-area-wrapper">

            <!-- 좌측 : 메일 사이드바 시작 -->
            <div class="sidebar-left">
               <!-- sidebar start -->
               <div class="sidebar">
                  <div class="sidebar-content email-app-sidebar d-flex">


                     <!-- email-app-menu start -->
                     <div class="email-app-menu">
                        <div class="form-group form-group-compose">
                           <!-- 작성하기 버튼  -->
                           <a href="mailSendForm.do" class="btn btn-primary btn-block my-4 compose-btn" id="center">작성하기</a>
                        </div>

                        <div class="sidebar-menu-list ps">
                           <!-- 메일 사이드바 시작 -->
                           <div class="list-group list-group-messages">
                              <a href="receiveMailList.do?receive=r" class="list-group-item">
                                 <div class="fonticon-wrap d-inline me-3">
                                    <svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                                  <use xlink:href="${pageContext.request.contextPath}/resources/kjs_assets/vendors/bootstrap-icons/bootstrap-icons.svg#envelope" />
                                              </svg>
                                 </div> 받은 메일함
                              </a> 
                              <a href="sendMailList.do?send=s" class="list-group-item">
                                 <div class="fonticon-wrap d-inline me-3">
                                    <svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                                  <use xlink:href="${pageContext.request.contextPath}/resources/kjs_assets/vendors/bootstrap-icons/bootstrap-icons.svg#archive" />
                                                </svg>
                                 </div> 보낸 메일함
                              </a> 
                              <a href="reserveMailList.do?reserve=re" class="list-group-item">
                                 <div class="fonticon-wrap d-inline me-3">
                                    <svg class="bi" width="1.5em" height="1.5em"
                                       fill="currentColor">
                                                  <use xlink:href="${pageContext.request.contextPath}/resources/kjs_assets/vendors/bootstrap-icons/bootstrap-icons.svg#info-circle" />
                                              </svg>
                                 </div> 예약 메일함 
                              </a> 
                              <a href="deleteMailList.do?delete=d" class="list-group-item">
                                 <div class="fonticon-wrap d-inline me-3">
                                    <svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                                  <use xlink:href="${pageContext.request.contextPath}/resources/kjs_assets/vendors/bootstrap-icons/bootstrap-icons.svg#trash" />
                                              </svg>
                                 </div> 휴지통
                              </a>
                           </div>
                           <!-- 메일 사이드바 끝 -->
                        </div>

                     </div>
                     <!-- email-app-menu end -->

                  </div>
               </div>
               <!-- sidebar end -->
            </div>
            <!-- 좌측 : 메일 사이드바 끝 -->

         <!-- 우측 : 메일 리스트 시작 -->
         <div class="content-right">
          <div class="content-wrapper">
            <div class="row">
              <div class="col-12 grid-margin stretch-card">
                <div class="card corona-gradient-card">
                  <div class="card-body py-0 px-0 px-sm-3">
                  
                  </div>
                </div>
              </div>
            </div>

            <!-- 첫번째 행 시작 -->
              <div class="row mx-2">
              
                <!-- 통계현황 시작 -->
                <div class="col-md-6 col-lg-6 order-0 mb-4">
                  <div class="card h-100">
                     <!-- 통계 상단 타이틀 -->
                    <div class="card-header d-flex align-items-center justify-content-between pb-0">
                      <div class="card-title mb-0">
                        <h4 class="m-0 me-2 text-primary">메일 수/발신 현황</h4>
                        <small class="text-muted" id="currentDate"></small>&nbsp;<small class="text-muted" id="currentTime"></small>
                      </div>
                    </div>
                    
                    <!-- 통계 내용 시작 -->
                    <div class="card-body">
                    
                      <!-- 통계 내용 상단 시작 -->
                      <div class="d-flex justify-content-between align-items-center mb-3">
                          <!-- 총 메일 개수 표시  --> 
                        <div class="d-flex flex-column align-items-center gap-1">
                          <h2 class="mb-1">${ mailChart.totalMail }</h2>
                          <span>Total mails</span>
                        </div> 
                        
                        <!-- 원형 차트 -->
                        <div class="mt-3"> 
                       		<canvas id="mailChart" style="width: 200px; height: 150px;"></canvas>
                        </div> 
                      </div>
                      <!-- 통계 내용 상단 시작 -->
                      
                      <!-- 통계 내용 하단 -->
                      <ul class="p-0 m-0">
                        <li class="d-flex mb-4 pb-1">
                          <div class="avatar flex-shrink-0 me-3">
                            <span class="avatar-initial rounded bg-label-primary">
                              <i class="bx bx-mail-send"></i></span>
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <h6 class="mb-0">발신현황</h6>
                              <small class="text-muted">${ mailChart.fromMail }/${ mailChart.totalMail }</small>
                            </div>
                            <div class="user-progress">
                              <small class="fw-semibold">${ mailChart.percentFromMail }%</small>
                            </div>
                          </div>
                        </li>
                        <li class="d-flex mb-4 pb-1">
                          <div class="avatar flex-shrink-0 me-3">
                            <span class="avatar-initial rounded bg-label-primary">
                            <i class="bx bx-mail-send"></i></span>
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <h6 class="mb-0">수신현황</h6>
                              <small class="text-muted">${ mailChart.toMail }/${ mailChart.totalMail }</small>
                            </div>
                            <div class="user-progress">
                              <small class="fw-semibold">${ mailChart.percentToMail }%</small>
                            </div>
                          </div>
                        </li>
                      </ul>
                    </div>
                    <!-- 통계 내용 끝 -->
                  </div>
                </div>
                <!-- 통계현황 끝 -->
            
                <!-- 즐겨찾는 사람 시작 -->
                <div class="col-md-6 col-lg-6 order-1 mb-4">
                  <div class="card h-100">
                    <div class="card-header d-flex align-items-center justify-content-between">
                      <h4 class="card-title m-0 me-2 text-primary">즐겨찾는사람</h4>
                    </div>
                    
                    <!-- 즐겨찾기 리스트 시작 -->
                    <div class="card-body">
                      <ul class="p-0 m-0">
                        <c:forEach items="${ empList }" var="emp">
                        <form method="post" action="mailSendForm.do">
                           <li class="d-flex mb-4 pb-1">
                            <input type="hidden" name="toReply" value="${ emp.toId }">
                             <div class="avatar flex-shrink-0 me-3">
                               <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/1.png" alt="user-avatar" class="d-block rounded" height="100" width="100" id="uploadedAvatar" />
                             </div>
                             <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                               <div class="me-2">
                                 <small class="text-muted d-block mb-1">${emp.toName }</small>
                                 <h6 class="mb-0 text-primary">${ emp.toId }</h6>
                               </div>
                               <div class="user-progress d-flex align-items-center gap-1">
                                 <button type="submit" class="btn btn-primary">메일작성</button>
                               </div>
                              </div>
                           </li>
                         </form>
                        </c:forEach>
                      </ul>
                    </div>
                    <!-- 즐겨찾기 리스트 끝 -->
                    
                  </div>
                </div>
                <!-- 즐겨찾는 사람 끝 -->
              </div>
            <!-- 첫번째 행 끝 -->
            
            <!-- 두번째 행 시작 -->
            <form>
            <div class="row mx-2">
               <!-- 읽지않은메일 시작 -->
                <div class="col-md-12 col-lg-12 order-0 email-user-list list-group card overflow-hidden ps ps--active-y" id="mailList">
                  <div class="card h-100" >
                    <div class="card-header d-flex align-items-center justify-content-between">
                      <h4 class="card-title mt-0 me-2 text-primary">읽지않은메일</h4>
                    </div>
                    <!-- 메일 리스트 시작 -->
                    <div class="card-body ps ps--active-y" id="vertical-example">
                      <table class="table">
                        <thead>
                          <tr>
                            <th class="d-none"></th>
                            <th>구분</th>
                            <th>분류</th>
                            <th>보낸사람</th>
                            <th>제목</th>
                            <th>보낸날짜</th>
                          </tr>
                        </thead>
                        <tbody>
                        <!-- 읽지 않은 메일이 있는 경우 -->
                        <c:if test="${ !empty mailList }">
                          <c:forEach items="${ mailList }" var="mail">
                             <tr>
                               <td class="d-none">${mail.mailNo }</td>
                               <td>${mail.rowNum }</td>
                               <c:if test="${ mail.typeName == '중요' }">
                                  <td><span class="favorite badge bg-danger" style="color:white;">${ mail.typeName }</span></td>
                               </c:if>
                               <c:if test="${ mail.typeName == '일반' }">
                                  <td><span class="favorite badge bg-label-secondary">${ mail.typeName }</span></td>
                               </c:if>
                               <td><span class="pl-2">${ mail.fromName }</span></td>
                               <td> ${ mail.title } </td>
                               <td> ${ mail.sendDate } </td>
                             </tr>
                          </c:forEach>
                        </c:if>
                        <!-- 읽지 않은 메일이 없는 경우 -->
                        <c:if test="${ empty mailList }">
                           <tr>
                              <td colspan="6" style="text-align: center;">읽지 않은 메일이 없습니다.</td>
                           </tr>
                        </c:if>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
                <!-- 읽지않은메일 끝 -->
                <div class="ps__rail-x" style="left: 0px; bottom: 0px;">
               <div class="ps__thumb-x" tabindex="0"style="left: 0px; width: 0px;"></div>
            </div>
            <div class="ps__rail-y" style="top: 0px; height: 733px; right: 0px;">
               <div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 567px;"></div>
            </div>
            </div>
            </form>
            
                </div>
                <!-- content-wrapper ends -->
            </div>
         </section>
      </div>
   </div>
   
   
   <script src="${pageContext.request.contextPath}/resources/kjs_assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/kjs_assets/js/bootstrap.bundle.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/kjs_assets/js/main.js"></script>
   
   <script type="text/javascript">
      /* 읽지 않은 메일 행 클릭시 */
      $(function(){
            $(".table>tbody>tr").click(function() {
               var mailNo = $(this).children().eq(0).text(); 
               location.href = "detailMail.do?mailNo="+mailNo; 
            })
         })
         
       /* controller에서 보내주는 데이터 가져오기 */  
       var jsonData = ${json}; /* controller에서 model 객체에 담아준 데이터가 들어있는 json 객체를 jsonData에 담아준다. */
       var jsonObject = JSON.stringify(jsonData); /* stringify : 매개변수로 담겨있는 데이터를 String 객체로 변환한다. */
       console.log(jsonObject);
       var jData = JSON.parse(jsonObject); /* parse : String 객체를 json 객체로 변환한다. */
       console.log(jData);
       
       var labelList = new Array();
       var valueList = new Array();
       var colorList = new Array();
       
       for(var i = 0; i<jData.length; i++) {
    		var d = jData[i]; /* jData 인덱스순서대로 얻어오기 */
    		
    		labelList.push(d.result); /* 수신, 발신*/
    		valueList.push(d.count); /* 17, 29*/
    		colorList.push(colorize()); /* 랜덤 컬러 넣어주기. 아래 colorize() 함수를 통해 */
       }
       
       var data = {
				labels: labelList,
				datasets: [{
						backgroundColor: colorList,
						data : valueList
				}]
		};
       
       var chart = document.getElementById('mailChart').getContext('2d');
       new Chart(chart, {
       	      type: 'pie',
       		  data: data
       });
       
       /* 그래프의 랜덤 컬러를 생성해주는 함수*/
       function colorize() {
    		var r = Math.floor(Math.random()*105);
    		var g = Math.floor(Math.random()*108);
    		var b = Math.floor(Math.random()*255);
    		var color = 'rgba(' + r + ', ' + g + ', ' + b + ', 0.7)';
    		return color;
    	}
       
       /* 실시간 시계 */
       function clock(){
		var date = new Date();
	
		//년도
		var nowYear = date.getFullYear();
	
		// date Object
		var month = date.getMonth();
	
		// 월
		var clockDate = date.getDate();
	
		// 날짜
		var day = date.getDay();
	
	    // 요일은 숫자형태로 리턴되기때문에 미리 배열로 
		var week = ['일', '월', '화', '수', '목', '금', '토'];
	
		// 시간
		var hours = date.getHours();
	
		// 분
		var minutes = date.getMinutes();
	
		// 초
		var seconds = date.getSeconds();
		
	    // 시간 분 초는 한자리 수 이면 앞에0을 붙임
	    var hours_str = hours < 10 ? "0"+hours : hours;
		var minutes_str = minutes < 10 ? "0"+minutes : minutes;
		var seconds_str = seconds < 10 ? "0"+seconds : seconds;
		
	    // 월은 0부터 1월이기때문에 +1일을 해주고
	    $("#currentDate").html(nowYear+"년 "+(month+1)+"월 "+clockDate+"일 "+week[day]+"요일");
		$("#currentTime").html(hours_str+"시"+minutes_str+"분"+seconds_str+"초 기준");
	        
	}
	
	
	function init() {
		// 최초에 함수를 한번 실행
	    clock();
		
	    //1초마다 반복
		setInterval(clock, 1000);
	}
	
	$(document).ready(function(){
		init();
	});
		
   </script>

   <jsp:include page="../common/bottom.jsp"/>
   
</body>
</html>