<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--@page import="java.util.ArrayList" import="com.workie.easy.schedule.model.dto.Schedule"--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Schedule</title>
<!---------------------------------------------달력----------------------------------------------------------------->
<link href='${pageContext.request.contextPath}/resources/jje_css/FullCalendar/lib/main.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/resources/jje_css/FullCalendar/lib/main.js'></script>
<script src='${pageContext.request.contextPath}/resources/jje_css/FullCalendar/lib/locales-all.js'></script>

<link href='${pageContext.request.contextPath}/resources/jje_css/jje_schedule.css' rel='stylesheet' />
<!-------------------------------------------------------------------------------------------------------------->

</head>
<body>
	<jsp:include page="../common/top.jsp"/>
	<div class="container-xxl flex-grow-1 container-p-y">
		<!-- Layout Demo -->
		<!------------------------------------------------------------------->
		<!-- Pills -->
		<div class="row">
			<div class="col-lg-8">
			  <div class="nav-align-top mb-4">
			    <div class="cal_container">
			      <ul class="nav nav-tabs" role="tablist">
			          <li class="nav-item">
			          <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab"
			              	  data-bs-target="#comb_calendar_p" aria-controls="comb_calendar_p" ria-selected="true"
			              	  id="C_sked" onclick="selectCatecory(this)">
			              	통합 일정
			          </button>
			          </li>
			          <li class="nav-item">
			          <button type="button" class="nav-link" role="tab" data-bs-toggle="tab"
			                  data-bs-target="#comb_calendar_p" aria-controls="comb_calendar_p" aria-selected="false"
			                  id="P_sked" onclick="selectCatecory(this)">
			              	개인 일정
			          </button>
			          </li>
			          <li class="nav-item">
			          <button type="button" class="nav-link" role="tab" data-bs-toggle="tab"
			                  data-bs-target="#comb_calendar_p" aria-controls="comb_calendar_p" aria-selected="false"
			                  id="D_sked" onclick="selectCatecory(this)">
			              	부서 일정
			          </button>
			          </li>
			      </ul>
			      <!-------------------모달------------------->
			      <!-- Modal -->
			      <form class="modal fade" id="sked-insert-modal" tabindex="-1" aria-hidden="true" action="skedInsert.do"  onsubmit="sked_submit()"method="POST">
			          <div class="modal-dialog modal-l" role="document">
			          <div class="modal-content">
			              <!-- 모달 헤더 -->
			              <div class="modal-header">
			                  <h5 class="modal-title" id="exampleModalLabel4">일정 등록</h5>
			              </div>
			              <!-- 모달 바디 -->
			              <div class="modal-body">
			                  <!-- 1번줄 -->
			                  <div class="row">
			                  <!-- 카테고리 -->
			                      <div class="col mb-3">
			                      <label for="sked_code" class="form-label">카테고리</label>
			                          <!-- <input type="text" id="sked_code" class="form-control" placeholder="xxxx@xxx.xx" /> -->
			                          <select id="sked_code" name="sked_code" class="form-select" autofocus required>
			                              <option value="P">개인</option>
			                              <option value="D">부서</option>
			                          </select>
			                      </div>
			                      <!-- 색상 -->
			                      <div class="col mb-3">
			                        <label for="sked_color" class="form-label">색상</label>
			                        <!-- <input type="text" id="sked_color" class="form-control" placeholder="DD / MM / YY" /> -->
			                        <div class="form-control color_radio">
			                            <div class="form-check form-check-inline">
			                                <input class="form-check-input" type="radio" name="sked_color" id="color_pink" value="c1" required />
			                            </div>
			                            <div class="form-check form-check-inline">
			                                <input class="form-check-input" type="radio" name="sked_color" id="color_blue" value="c2" />
			                            </div>
			                            <div class="form-check form-check-inline">
			                                <input class="form-check-input" type="radio" name="sked_color" id="color_yellow" value="c3" />
			                            </div>
			                            <div class="form-check form-check-inline">
			                                <input class="form-check-input" type="radio" name="sked_color" id="color_purple" value="c4" />
			                            </div>
			                            <div class="form-check form-check-inline">
			                                <input class="form-check-input" type="radio" name="sked_color" id="color_red" value="c5" />
			                            </div>
			                        </div>
			                    </div>
			                  </div>
			                  <!-- 2번줄 -->
			                  <div class="row">
			                      <div class="col mb-3">
			                          <label for="sked_title" class="form-label">제목</label>
			                          <input type="text" id="sked_title" class="form-control" placeholder="제목을 입력하세요." required/>
			                      </div>
			                  </div>
			                  <!-- 3번줄 -->
			                  <div class="row" id="line3">
			                  <!-- 시작 날짜 -->
			                      <div class="col mb-3">
			                          <label for="start_date" class="form-label">날짜</label>
			                          <input id="start_date" type="date" class="form-control" required>
			                          <label for="end_date" class="form-label">종료날짜</label>
			                          <input id="end_date" type="date" class="form-control">
			                      </div>
			                      <!--시간 -->
			                      <div class="col mb-3">
			                          <div class="row">
			                              <label for="start_time" class="form-label">시작 시간</label>
			                              <input id="start_time" type="time" class="form-control"/>
			                              <label for="fin_time" class="form-label">종료 시간</label>
			                              <input id="fin_time" type="time" class="form-control"/>
			                          </div>
			                      </div>
			                  </div>
			                  <!-- 4번줄 -->
			                  <div class="row">
			                      <div class="col mb-3">
			                          <label for="sked_content" class="form-label">내용</label>
			                          <input type="text" id="sked_content" class="form-control" placeholder="내용을 입력하세요." required/>
			                      </div>
			                  </div>
			                  <!-- 5번줄 -->
			                  <div class="row">
			                      <div class="col mb-3">
			                          <label for="sked_place" class="form-label">장소</label>
			                          <input type="text" id="sked_place" class="form-control" placeholder="장소 입력"/>
			                      </div>
			                  </div>
			                  <!-- 6번줄 -->
			                  <div class="row">
			                      <div class="col mb-3">
			                          <label for="sked_meno" class="form-label">메모</label>
			                          <textarea id="sked_meno" class="form-control" placeholder="메모 입력"></textarea>
			                          <!-- <input type="text" id="nameExLarge" class="form-control" placeholder="Enter Name" /> -->
			                      </div>
			                      
			                  </div>
			              </div>
			              <!-- 모달 풋터 -->
			              <div class="modal-footer">
			                  <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                      			취소
			                  </button>
			                  <button type="button" class="btn btn-primary" id="sked_insert_btn" onclick="sked_submit()">등록</button>
			              </div>
			          </div>
			          </div>
			      </form>
			      <!-------------------모달------------------->
			      <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#sked-insert-modal" id="insert_btn">
			         	 일정 등록
			      </button>
			    </div>
			    <!-- 달력 -->
			    <div class="tab-content">
			      <div class="tab-pane fade show active" id="comb_calendar_p" role="tabpanel">
			          <div class='calendar-container'>
			              <div id='comb_calendar'></div>
			          </div>
			      </div>
			    </div>
			    <!-- / 달력 -->
			  </div>
			</div>
		
		  <!-- 우측화면 -->
		  <div class="col-lg-4 mb-4">
		    <div class="row" style="height: 100%;">
		      <!-- 검색 -->
		      <div class="col-12 mb-4 search_box">
		          <div class="card" style="height: 100%;">
		              <div class="card-body">
		                  <form action="" method="POST" class="search_form">
		                      <div class="input-group input-group-merge">
		                        <span class="input-group-text" id="basic-addon-search31"><i class="bx bx-search"></i></span>
		                        <input type="text" class="form-control" placeholder="Search..." aria-label="Search..." aria-describedby="basic-addon-search31">
		                      </div>
		                      <button type="submit" class="btn btn-primary search_btn">
	                          		검색하기
		                      </button>
		                  </form>
		              </div>
		          </div>
		      </div>
		      <!-- / 검색 -->
		
		      <!-- 간단 일정 목록 -->
		      <div class="col-12">
		        <div class="card overflow-hidden" style="height: 400px">
		          <h4 class="card-header" style="text-align: center;">일정 목록</h4>
		          <div class="card-body" id="vertical-example">
		            <!-- 간단 일정 목록 추가 -->
		            <div class="c1_list t_list mb-2">
		              <div class="t_header">
		                <div class="me-auto fw-bold">일정 제목1</div>
		              </div>
		              <div class="t_list_cont">
		                	일정 내용
		              </div>
		              <div class="t_list_time">
		                08:00~12:00
		              </div>
		            </div>
		
		            <div class="c2_list t_list mb-2">
		              <div class="t_header">
		                <div class="me-auto fw-bold">일정 제목2</div>
		              </div>
		              <div class="t_list_cont">
		               	 일정 내용
		              </div>
		              <div class="t_list_time">
		                08:00~12:00
		              </div>
		            </div>
		            
		            <div class="c3_list t_list mb-2">
		              <div class="t_header">
		                <div class="me-auto fw-bold">일정 제목3</div>
		              </div>
		              <div class="t_list_cont">
		                	일정 내용
		              </div>
		              <div class="t_list_time">
		                08:00~12:00
		              </div>
		            </div>
		            
		            <div class="c4_list t_list mb-2">
		              <div class="t_header">
		                <div class="me-auto fw-bold">일정 제목4</div>
		              </div>
		              <div class="t_list_cont">
		                	일정 내용
		              </div>
		              <div class="t_list_time">
		                08:00~12:00
		              </div>
		            </div>
		            
		            <div class="c5_list t_list mb-2">
		              <div class="t_header">
		                <div class="me-auto fw-bold">일정 제목5</div>
		              </div>
		              <div class="t_list_cont">
		               	 일정 내용
		              </div>
		              <div class="t_list_time">
		                08:00~12:00
		              </div>
		            </div>
		            <!-- /간단 일정 목록 추가 -->
		          </div>
		        </div>
		      </div>
		      <!-- /간단 일정 목록 -->
		            
		      <!-- <div class="col-12 mb-4">
		          <div class="card">
		              <div class="card-body">
		                  <div id='p_calendar'></div>
		              </div>
		          </div>
		      </div> -->
		    </div>
		  </div>
		  <!-- 우측화면 -->
		
		</div>
		<!-- Pills -->
		<!-----------------------------달력 스크립트-------------------------------------->
		<script src='${pageContext.request.contextPath}/resources/jje_css/jje_schedule.js'></script>
		
		<script>
		
			$(function(){
				test();
			});
				
			var btn_id;								//누른 버튼의 id값
			var skedCode = "C";						//skedCode
			
			/*버튼 클릭 함수*/
			function selectCatecory(e){				//버튼 눌렀을 때 값이 바뀐다. C->(P/D)
				btn_id=$(e).attr("id");
				console.log("버튼 아이디 : "+btn_id);
				skedCode = btn_id.substring(0,1);
				console.log("카테고리 : "+skedCode);
				test();
			}
			
			/*달력*/
			var skedSelectList;
			function test(){
				
				var skedList;							//조회 한 일정 목록을 담을 변수
				var loginEmpNo=${loginEmp.empNo};		//로그인 사원번호
				/*최초 조회 데이터 호출 ajax*/
				skedSelectList = $.ajax({ 
										url: "skedSelectList.do",
										data: {
										 		empNo: loginEmpNo,
										 		skedCode: skedCode
										},
										type: "GET",
										dataType: "JSON",
										success : function(sked){
										 //alert("연결됨");
										 skedList = sked;
										 console.log(skedList);
										},
										error : function(sked){
										   //alert(xhr.responseText);
										 alert('데이터 로딩 실패');
										}
								   });
				
				skedSelectList.done(function (sked) {
					
					var calendarEl = document.getElementById('comb_calendar');
					// var pCalendarEl = document.getElementById('p_calendar');
				
					var calendar = new FullCalendar.Calendar(calendarEl, {
					    initialView: 'dayGridMonth',
					    headerToolbar: {
					        start: 'prev title next', // will normally be on the left. if RTL, will be on the right
					        center: '',
					        end: 'today dayGridMonth,timeGridWeek,listWeek' // will normally be on the right. if RTL, will be on the left
					    },
					    locale: 'ko',
					    slotMinTime: '08:00',
					    slotMaxTime: '24:00:00',
					    businessHours: true,
					    dayMaxEventRows: true,
					    dateClick: function(e) { //날짜 클릭 이벤트
					        //skedDayList(e);	//선택 일자 간편 조회 이벤트 
					        console.log(e.dateStr);//선택한 날짜 콘솔에 출력 -> 상세조회 가능할듯
					    },
					    eventClick:function(e){
					    	//skedDetail(e);	//선택일정 상세조회 모달 이벤트
					        console.log(e.event.title); //클릭한 이벤트의 제목
					        console.log(e.event.id); //클릭한 이벤트의 id -> 일정 숫자로 지정해야겠음
					    },
					    events:sked
					    
					}); // 끝 calendar
				
					//아이디가 'a'인 이벤트 발생하면 콘솔창에 이벤트 시작 시간 출력
					//var event = calendar.getEventById('a') // an event object!
					//var start = event.start // a property (a Date object)
					//console.log(start.toISOString()) // "2018-09-01T00:00:00.000Z"
				
					calendar.on('dateClick', function(info) { 		//날짜 클릭 후 콘솔 출력
						console.log('clicked on ' + info.dateStr);
					}); // 끝 calendar.on
					
					calendar.render();		//캘린더 랜더링
					
				});// 끝 request.done끝
			}
					
			
		</script>
		
		<!-----------------------------달력 스크립트-------------------------------------->
	
	<!------------------------------------------------------------------->
	<!--/ Layout Demo -->
	</div>
	<!-- / Content -->
	
	<!-- Footer -->
	<footer class="content-footer footer bg-footer-theme">
		<div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
		    <div class="mb-2 mb-md-0">
		      ©
		      <script>
		        document.write(new Date().getFullYear());
		      </script>
		      , made with ❤️ by
		      <a href="https://themeselection.com" target="_blank" class="footer-link fw-bolder">ThemeSelection</a>
		    </div>
	    <div>
	      <a href="https://themeselection.com/license/" class="footer-link me-4" target="_blank">License</a>
	      <a href="https://themeselection.com/" target="_blank" class="footer-link me-4">More Themes</a>
	
	      <a
	        href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/"
	        target="_blank"
	        class="footer-link me-4"
	        >Documentation</a
	      >
	
	      <a
	        href="https://github.com/themeselection/sneat-html-admin-template-free/issues"
	        target="_blank"
	        class="footer-link me-4"
	        >Support</a
	      >
	    </div>
	  </div>
	</footer>
	<!-- / Footer -->
	<!----------------------------------------------------------------------------------------------------------->
	
	<jsp:include page="../common/bottom.jsp"/>
</body>
</html>