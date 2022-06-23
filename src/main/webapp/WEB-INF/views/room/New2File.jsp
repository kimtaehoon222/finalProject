<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
</head>
<body>
	
	<jsp:include page="WEB-INF/views/common/top.jsp"/> 
	
	<link href='${pageContext.request.contextPath}/resources/jje_css/jje_schedule.css' rel='stylesheet' />
	
	<div class="container-xxl flex-grow-1 container-p-y">
	
		<!----------------------------------- 본문 ----------------------------------->
		<div class="row">
			<div class="col-lg-8">
			  <!-- Pills -->
			  <div class="nav-align-top mb-4">
			    <div class="cal_container">
			      <ul class="nav nav-tabs" role="tablist">
			          <li class="nav-item">
			          <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab"
			              	  data-bs-target="#comb_calendar_p" aria-controls="comb_calendar_p" ria-selected="true"
			              	  id="C_sked" onclick="selectCatecory(this)">
			                                회의실 1
			          </button>
			          </li>
			          <li class="nav-item">
			          <button type="button" class="nav-link" role="tab" data-bs-toggle="tab"
			                  data-bs-target="#comb_calendar_p" aria-controls="comb_calendar_p" aria-selected="false"
			                  id="P_sked" onclick="selectCatecory(this)">
			              	   회의실 2
			          </button>
			          </li>
			          <li class="nav-item">
			          <button type="button" class="nav-link" role="tab" data-bs-toggle="tab"
			                  data-bs-target="#comb_calendar_p" aria-controls="comb_calendar_p" aria-selected="false"
			                  id="D_sked" onclick="selectCatecory(this)">
			              	   회의실 3
			          </button>
			          </li>
			      </ul>
			      <!------------------- 등록 모달 ------------------->
			      <form class="modal fade" id="sked-insert-modal" tabindex="-1" aria-hidden="true" action="insertSked.do"  onsubmit="return sked_submit()"method="POST">
			          <div class="modal-dialog modal-l" role="document">
			          <div class="modal-content">
			              <!-- 모달 헤더 -->
			              <div class="modal-header">
			                  <h5 class="modal-title" id="insert_head">예약하기</h5>
			              </div>
			              <!-- 모달 바디 -->
			              <div class="modal-body">
			              
			             	  <!-- 작성자 정보 -->
	                          <input type="hidden" id="empNo" name="empNo" class="form-control" value="${ loginEmp.empNo }" required/>
			              
			                  <!-- 1번줄 -->
			                  <div class="row">
			                  <!-- 카테고리 -->
			                      <div class="col mb-3">
			                      <label for="sked_code" class="form-label">카테고리</label>
			                          <select id="sked_code" name="skedCode" class="form-select" autofocus required>
			                              <option value="P" id="sked_code_P">개인</option>
			                           
			                          </select>
			                      </div>
			                    
			                  </div>
			                  
			                  <!-- 2번줄 -->
			                  <div class="row">
			                      <div class="col mb-3">
			                          <label for="sked_title" class="form-label">제목</label>
			                          <input type="text" id="sked_title" name="skedTitle" class="form-control" placeholder="제목을 입력하세요." required/>
			                      </div>
			                  </div>
			                  
			                  <!-- 3번줄 -->
			                  <div class="row" id="line3">
			                  <!-- 시작 날짜 -->
			                      <div class="col mb-3">
			                          <label for="start_date" class="form-label">날짜</label>
			                          <input id="start_date" name="skedStart" type="date" class="form-control" required>
			                          <label for="end_date" class="form-label">종료날짜</label>
			                          <input id="end_date" name="skedEnd" type="date" class="form-control">
			                      </div>
			                      <!--시간 -->
			                      <div class="col mb-3">
			                          <div class="row">
			                              <label for="start_time" class="form-label">시작 시간</label>
			                              <input id="start_time" name="skedStartTime" type="time" class="form-control"/>
			                              <label for="end_time" class="form-label">종료 시간</label>
			                              <input id="end_time" name="skedEndTime" type="time" class="form-control"/>
			                          </div>
			                      </div>
			                  </div>
			                  
			                  <!-- 4번줄 -->
			                  <div class="row">
			                      <div class="col mb-3">
			                          <label for="sked_content" class="form-label">내용</label>
			                          <input type="text" name="skedContent" id="sked_content" class="form-control" placeholder="내용을 입력하세요." required/>
			                      </div>
			                  </div>			                  
			                  <div class="row">
			                      <div class="col mb-3">
			                          <label for="sked_meno" class="form-label">메모</label>
			                          <textarea id="sked_meno" name="skedMemo" class="form-control" placeholder="메모 입력"></textarea>
			                      </div>
			                  </div>
			                  
			              </div>
			              <!-- 모달 풋터 -->
			              <div class="modal-footer">
			                  <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                      			취소
			                  </button>
			                  <button type="submit" class="btn btn-primary" id="sked_insert_btn">등록</button>
			              </div>
			          </div>
			          </div>
			      </form>
			      <!------------------- / 등록 모달 ------------------->
			      <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#sked-insert-modal" id="insert_btn">
			         	 예약하기
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
			  <!-- / Pills -->
			</div>
		
		
		  
		</div>
		
		
		<!----------------------------- 달력 스크립트 ----------------------------->
		<script src='${pageContext.request.contextPath}/resources/jje_css/jje_schedule.js'></script>
		
		<script>
		
			$(function(){
				sked();
			});
			var btn_id;								//누른 버튼의 id값
			var skedCode = "C";						//skedCode
			
			/*버튼 클릭 함수*/
			function selectCatecory(e){				//버튼 눌렀을 때 값이 바뀐다. C->(P/D)
				btn_id=$(e).attr("id");				//버튼의 id값
				skedCode = btn_id.substring(0,1);	//id값 첫글자가 skedCode값
				sked();								//달력 실행
			}
			
			/*달력*/
			function sked(){
				
				var skedList;							//조회 한 일정 목록을 담을 변수
				var loginEmpNo=${loginEmp.empNo};		//로그인 사원번호
				/*최초 조회 데이터 호출 ajax*/
				var skedSelectList = $.ajax({ 
										url: "selectSkedList.do",
										data: {
										 		empNo: loginEmpNo,
										 		skedCode: skedCode
										},
										type: "GET",
										dataType: "JSON",
										success : function(result){
										 //alert("연결됨");
										 skedList = result;
										 console.log(skedList);
										},
										error : function(result){
										 alert('데이터 로딩 실패');
										}
								   });
				
				skedSelectList.done(function (sked) {
					
					var calendarEl = document.getElementById('comb_calendar');
					var calendar = new FullCalendar.Calendar(calendarEl, {
					    initialView: 'dayGridMonth',
					    headerToolbar: {
					        start: 'prev title next', // will normally be on the left. if RTL, will be on the right
					        center: '',
					        end: 'today timeGridWeek,listWeek' // will normally be on the right. if RTL, will be on the left
					    },
					    locale: 'ko',
					    slotMinTime: '09:00',
					    slotMaxTime: '18:30:00',
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
				
					calendar.on('dateClick', function(info) { 		//날짜 클릭 후 콘솔 출력
						console.log('clicked on ' + info.dateStr);
					}); // 끝 calendar.on
					
					calendar.on('eventClick', function(info) { 		//일정 클릭 후 콘솔 출력
						console.log('clicked on ' + info.event.id);
						console.log('clicked on ' + info.event.title);
						var skedNo = info.event.id;
				        $.ajax({ 
							url: "selectSked.do",
							data: {
							 		empNo: loginEmpNo,
							 		skedNo: skedNo,
							 		skedCode: skedCode
							},
							type: "GET",
							dataType : "json",
							//contentType: "application/x-www-form-urlencoded; charset=UTF-8",
							success : function(result){
								console.log("id : "+result.id);							 
								console.log("title : "+result.title);							 
								console.log("start : "+result.start);							 
								console.log("end : "+result.end);							 
								console.log("color : "+result.color);
								clickDetailBtn(result);
							},
							error : function(result){
							 alert('데이터 로딩 실패');
							}
					   }); // 끝  ajax
						
					}); // 끝 calendar.on
					
					calendar.render();		//캘린더 랜더링
					
				});// 끝 request.done끝
			} // 끝 sekd()
			
			/* 등록하는 ajax
			$.ajax({ 
				url: "skedSelect.do",
				data: {
				 		empNo: loginEmpNo,
				 		skedNo: skedNo
				},
				type: "GET",
				dataType : "json",
				//contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				success : function(result){
					console.log("id : "+result.id);							 
					console.log("title : "+result.title);							 
					console.log("start : "+result.start);							 
					console.log("end : "+result.end);							 
					console.log("color : "+result.color);							 

					calendar.addEvent({
						id:result.id,
						title: result.title,
                                 start: result.start,
                                 end: result.end,
                                 color: result.color
					})
				},
				error : function(result){
				 alert('데이터 로딩 실패');
				}
		   });
			*/
		</script>
		<!----------------------------- / 달력 스크립트 ----------------------------->
		
		<!----------------------------- 상세 조회 -------------------------------------->
		<!------------------- 상세 조회 모달 ------------------->
		<form class="modal fade" id="sked-detail-modal" tabindex="-1" aria-hidden="true" action="updateSked.do" onsubmit="return sked_update_submit()" method="POST">
		    <div class="modal-dialog modal-l" role="document">
			    <div class="modal-content">
			        <!-- 모달 헤더 -->
				    <div class="modal-header">
				        <h5 class="modal-title" id="detail_head"></h5>
				    </div>
					<!-- 모달 바디 -->
					<div class="modal-body">
						
						<!-- 작성자 정보 -->
	                    <input type="hidden" id="detail_empNo" name="empNo" value="${ loginEmp.empNo }" required/>
						<!-- 일정 번호 -->
	                    <input type="hidden" id="detail_sked_number" name="skedNo" value="" required/>
					
						<!-- 1번줄 -->
						<div class="row">
						<!-- 카테고리 -->
						    <div class="col mb-3">
						    <label for="detail_sked_code" class="form-label">카테고리</label>
						        <select id="detail_sked_code" name="skedCode" class="form-select" autofocus required>
						            <option value="P">개인</option>
						        </select>
						    </div>
						    <!-- P 색상 -->
		                      <div class="col mb-3"  id="detail_color_group_P">
		                        <label for="sked_color" class="form-label">색상</label>
		                        <div class="form-control color_radio">
		                            <div class="form-check form-check-inline">
		                                <input class="form-check-input" type="radio" name="colorCode" id="detail_color_pink" value="C1" required />
		                            </div>
		                            <div class="form-check form-check-inline">
		                                <input class="form-check-input" type="radio" name="colorCode" id="detail_color_blue" value="C2" />
		                            </div>
		                            <div class="form-check form-check-inline">
		                                <input class="form-check-input" type="radio" name="colorCode" id="detail_color_yellow" value="C3" />
		                            </div>
		                            <div class="form-check form-check-inline">
		                                <input class="form-check-input" type="radio" name="colorCode" id="detail_color_purple" value="C4" />
		                            </div>
		                            <div class="form-check form-check-inline">
		                                <input class="form-check-input" type="radio" name="colorCode" id="detail_color_red" value="C5" />
		                            </div>
		                        </div>
		                  		  </div>
		                      <!-- / P 색상 -->
		                      <!-- D 색상 -->
		                      <div class="col mb-3" style="display:none;" id="detail_color_group_D">
		                        <label for="sked_color" class="form-label">색상</label>
		                        <!-- <input type="text" id="sked_color" class="form-control" placeholder="DD / MM / YY" /> -->
		                        <div class="form-control color_radio">
		                            <div class="form-check form-check-inline">
		                                <input class="form-check-input" type="radio" name="colorCode" id="detail_color_lightGray" value="C6"/>
		                            </div>
		                            <div class="form-check form-check-inline">
		                                <input class="form-check-input" type="radio" name="colorCode" id="detail_color_gray" value="C7"/>
		                            </div>
		                            <div class="form-check form-check-inline">
		                                <input class="form-check-input" type="radio" name="colorCode" id="detail_color_darkGray" value="C8"/>
		                            </div>
		                        </div>
		                    </div>
		                    <!-- / D 색상 -->
						</div>
						
						<!-- 2번줄 -->
						<div class="row">
						    <div class="col mb-3">
						        <label for="detail_sked_title" class="form-label">제목</label>
						        <input type="text" name="skedTitle" id="detail_sked_title" class="form-control" placeholder="제목을 입력하세요." required/>
						    </div>
						</div>
						
						<!-- 3번줄 -->
						<div class="row" id="line3">
						<!-- 시작 날짜 -->
						    <div class="col mb-3">
						        <label for="detail_start_date" class="form-label">날짜</label>
						        <input id="detail_start_date" name="skedStart" type="date" class="form-control" required>
						        <label for="detail_end_date" class="form-label">종료날짜</label>
						        <input id="detail_end_date" name="skedEnd" type="date" class="form-control">
						    </div>
						    <!--시간 -->
						    <div class="col mb-3">
						        <div class="row">
						            <label for="detail_start_time" class="form-label">시작 시간</label>
						            <input id="detail_start_time" name="skedStartTime" type="time" class="form-control"/>
						            <label for="detail_end_time" class="form-label">종료 시간</label>
						            <input id="detail_end_time" name="skedEndTime" type="time" class="form-control"/>
						        </div>
						    </div>
						</div>
						
						<!-- 4번줄 -->
						<div class="row">
						    <div class="col mb-3">
						        <label for="detail_sked_content" class="form-label">내용</label>
						        <input type="text" name="skedContent" id="detail_sked_content" class="form-control" placeholder="내용을 입력하세요." required/>
						    </div>
						</div>
						
						<!-- 5번줄 -->
						<div class="row">
						    <div class="col mb-3">
						        <label for="detail_sked_place" class="form-label">장소</label>
						        <input type="text" name="skedPlace" id="detail_sked_place" class="form-control" placeholder="장소 입력"/>
						    </div>
						</div>
						
						<!-- 6번줄 -->
						<div class="row">
						    <div class="col mb-3">
						        <label for="detail_sked_meno" class="form-label">메모</label>
						        <textarea id="detail_sked_meno" name="skedMemo" class="form-control" placeholder="메모 입력"></textarea>
						        <!-- <input type="text" id="nameExLarge" class="form-control" placeholder="Enter Name" /> -->
						    </div>
						</div>
						    
					</div>
			        <!-- 모달 풋터 -->
			        <div class="modal-footer detail_footer">
					    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">닫기</button>
					    <button type="submit" class="btn btn-primary" id="sked_update_btn">수정</button>
					    <button type="button" class="btn btn-danger" id="sked_delete_btn" onclick="deleteSked()">삭제</button>
					    <script>
						    function deleteSked(){
							    location.href = "deleteSked.do?skedNo="+$('#detail_sked_number').val();
						    }
					    </script>
					</div>
			    </div>
		    </div>
		</form>
		<!------------------- / 상세 조회 모달 ------------------->
		<button data-bs-toggle="modal" data-bs-target="#sked-detail-modal" id="detail_btn" style="display:none;"></button>
	
	</div>
	
	<jsp:include page="WEB-INF/views/common/bottom.jsp"/> 
	
</body>
</html>