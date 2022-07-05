<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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


<!-------------------------------------------------------------------------------------------------------------->

</head>
<body>
	
	<jsp:include page="../common/top.jsp"/>
	
	<link href='${pageContext.request.contextPath}/resources/jje_css/jje_schedule.css' rel='stylesheet' />
	
	<div class="container-xxl flex-grow-1 container-p-y">
	
		<!----------------------------------- 본문 ----------------------------------->
		<div class="row"  style="display: flex; justify-content: space-between;">
			
			<div class="container c0">
				
				<div class="i0 i0-1">
				
				  <!-- Pills -->
				  <div class="nav-align-top">
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
				  <!-- / Pills -->
				
				</div>
				
			<!-- 우측화면 -->
			    
			    <!-- 검색 -->
			    <div class="i0 i0-2">
			        <div class="card" style="height:100%">
			        	<h4 class="card-header" style="text-align: center; padding-top:20px; padding-bottom:18px;">키워드 검색</h4>
			            <div class="card-body">
			            
			            	<!-- 검색창 -->
			                <div method="POST" class="search_form" name="name="searchForm">
			                    <div class="input-group input-group-merge">
		                      		<span class="input-group-text" id="basic-addon-search31"><i class="bx bx-search"></i></span>
			                      	<input type="text" name="keyword" class="form-control" placeholder="Search..." aria-label="Search..." aria-describedby="basic-addon-search31">
			                    </div>
			                    <!-- <button type="submit" class="btn btn-primary search_btn"> -->
			                    <button type=button" class="btn btn-primary search_btn"id="search-btn" onclick="test($('input[name=keyword]').val(), 1)">
		                       		검색하기
			                    </button>
			                </div>
			                <!-- / 검색창 -->
			                
			            </div>
			        </div>
			    </div>
			    <!-- / 검색 -->
			    
			    <!-- 검색 ajax -->
                <script>
                	function test(e, n){
                		if(!e){											//검색어 없는 경우
	                        alert("검색어가 없습니다.");						//알림창
                        	return false;	
                		}
                		
                		searchBtnClick(e, n);
                		document.getElementById('search-modal-btn').click();
                	}
                
                	/*검색창 호출 함수*/
                	function searchBtnClick(e, n){
                		//console.log("누른 p값 : "+n);
                		
                		var keyWord = e;								//검색어
                        var loginEmpNo = ${loginEmp.empNo};				//로그인 직원
                        var currentNo = n;
                        if(!keyWord){									//검색어 없는 경우
	                        alert("검색어가 없습니다.");						//알림창
                        	return false;
                        }else{											//검색어가 있는 경우
	                        
	                        $('input[name=keyword]').val("");			//검색창 지우기
	                        
	                        /*ajax 호출*/
	                        $.ajax({ 
	            				url: "searchSked.do",
	            				data: {
	            					keyWord : keyWord,
	            					empNo : loginEmpNo,
	            					currentPage : currentNo
	            				},
	            				type: "GET",
	            				dataType : "json",
	            				success : function(result){
	            					
	            					var list="";
	            					
	            					/*결과물 반복문*/
	            					$.each(result, function(i){
	            						
										if(!result[i].end){			//end값이 비어있을 경우
											result[i].end = "-";
										}
	            						
										/*html 태그 추가*/
	            						list += "<tr>"
	                                    + "<td style='display:none;'>" + result[i].id + "</td>"
	                                    + "<td>" + result[i].start.replace("T"," ") + "</td>"
	                                    + "<td>" + result[i].end.replace("T"," ") + "</td>"
	                                    + "<td>" + result[i].title + "</td>"
	                                    + "<td>" + result[i].content + "</td>"
	                                    + "<td>" + result[i].cat + "</td>"
	                                  	+ "</tr>"
	        	 						
	        	 					});
	            					
	            					$("#resultTable").html(list);	//화면에 출력
	            					
	            					var pi = result[0].pi;
	            					
	            					/*console.log("currentPage : " + pi.currentPage);
	            					console.log("startPage : " + pi.startPage);
	            					console.log("endPage : " + pi.endPage);
	            					console.log("maxPage : " + pi.maxPage);*/

	            					var pageSet="";
	            					
	            					var clickFunctionP = "searchBtnClick(" + '"' + e + '"' + "," + (pi.currentPage-1) + ")"
	            					var clickFunctionN = "searchBtnClick(" + '"' + e + '"' + "," + (pi.currentPage+1) + ")"
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
			            							+ "<div class='page-link' href='javascript:void(0);' onclick='searchBtnClick(" + '"' + e + '"' + "," + p + ")'>"
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
        		   			
	                        $("input[name=modal-keyword]").val(keyWord);			//모달창 검색칸 입력
	                        	
                        }
                	}
                	
                </script>
                <!-- / 검색 ajax -->
                
			    <button type=button" data-bs-toggle="modal" data-bs-target="#search-modal" style="display:none;" id="search-modal-btn"></button>
			    
			
				<!-- 간단 일정 목록 -->
				<div class="i0 i0-3">
					<div class="col-12">
						<div class="card overflow-hidden" style="height: 590px;">
							<h4 class="card-header" style="text-align: center;">일정 목록</h4>
							<div class="card-body" id="vertical-example">
								<div style="text-align: center;">일정이 없습니다.<div>
							</div>
						</div>
					</div>
				</div>
				<script>
				function detailClick(e){
					console.log("찍힘 : "+e);
					var loginEmpNo=${loginEmp.empNo};
					var skedNo = e;
			        $.ajax({ 
						url: "selectSked.do",
						data: {
						 		empNo: loginEmpNo,
						 		skedNo: skedNo,
						 		skedCode: skedCode
						},
						type: "GET",
						dataType : "json",
						success : function(result){
							/*console.log("id : "+result.id);							 
							console.log("title : "+result.title);							 
							console.log("start : "+result.start);							 
							console.log("end : "+result.end);							 
							console.log("color : "+result.color);*/
							clickDetailBtn(result);
						},
						error : function(result){
						 alert('데이터 로딩 실패');
						}
				   });
				}
				</script>
				<!-- /간단 일정 목록 -->
				
			<!-- 우측화면 -->
		  </div>
		</div>
		<!----------------------------------- / 본문 ----------------------------------->
		
		<!----------------------------- 달력 스크립트 ----------------------------->
		
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
										 //console.log(skedList);
										},
										error : function(result){
										 alert('데이터 로딩 실패');
										}
								   });
				
				/*ajax정상작동 후 실행되는 함수 (달력 렌더링)*/
				skedSelectList.done(function (sked) {
					
					var calendarEl = document.getElementById('comb_calendar');
					var calendar = new FullCalendar.Calendar(calendarEl, {
					    initialView: 'dayGridMonth',
					    headerToolbar: {
					        start: 'prev title next',
					        center: '',
					        end: 'today dayGridMonth,timeGridWeek,listWeek'
					    },
					    locale: 'ko',
					    slotMinTime: '08:00',
					    slotMaxTime: '24:00:00',
					    businessHours:{
					    	 startTime: '09:00',
					    	  endTime: '18:60'
					    },
					    dayMaxEventRows: true,
					    dateClick: function(e) { //날짜 클릭 이벤트
					        //skedDayList(e);	//선택 일자 간편 조회 이벤트 
					        //console.log(e.dateStr);//선택한 날짜 콘솔에 출력 -> 상세조회 가능할듯
					    },
					    eventClick:function(e){
					    	//skedDetail(e);	//선택일정 상세조회 모달 이벤트
					        //console.log(e.event.title); //클릭한 이벤트의 제목
					        //console.log(e.event.id); //클릭한 이벤트의 id -> 일정 숫자로 지정해야겠음
					        },
					    events:sked
					    
					}); // 끝 calendar
					
					calendar.render();		//캘린더 랜더링
					
					/*아이디가 'a'인 이벤트 발생하면 콘솔창에 이벤트 시작 시간 출력*/
					//var event = calendar.getEventById('a') // an event object!
					//var start = event.start // a property (a Date object)
					//console.log(start.toISOString()) // "2018-09-01T00:00:00.000Z"
					
					/*일정 클릭 이벤트*/
					calendar.on('eventClick', function(info) {
						/*console.log('clicked on ' + info.event.id);
						console.log('clicked on ' + info.event.title);*/
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
								/*console.log("id : "+result.id);							 
								console.log("title : "+result.title);							 
								console.log("start : "+result.start);							 
								console.log("end : "+result.end);							 
								console.log("color : "+result.color);*/
								clickDetailBtn(result);
							},
							error : function(result){
							 alert('데이터 로딩 실패');
							}
					   }); // 끝  ajax
						
					}); // 끝 calendar.on
					/* 끝 일정 클릭 이벤트*/

					/*날짜 클릭 이벤트*/
					calendar.on('dateClick', function(info) {
						/*console.log('clicked on ' + info.dateStr);*/
						var selectDate = info.dateStr;
						
						$.ajax({ 
							url: "selectDayList.do",
							data: {
							 		empNo: loginEmpNo,
							 		skedDay: selectDate
							},
							type: "GET",
							dataType : "json",
							success : function(result){
								
								var daylist = "";
								
								if(result.length == 0){
									daylist = "<div style='text-align: center;'>일정이 없습니다.<div>"
								}
									
								$.each(result, function(i){
									/*console.log([i]+" id : "+result[i].id);							 
									console.log([i]+" title : "+result[i].title);							 
									console.log([i]+" content : "+result[i].content);							 
									console.log([i]+" startTime : "+result[i].startTime);							 
									console.log([i]+" endTime : "+result[i].endTime);
									console.log([i]+" color : "+result[i].color);*/
									var time="-";
									
									if(result[i].startTime){ //시작시간만 있는 경우
										time = result[i].startTime;
									}
									if(result[i].startTime && result[i].endTime){ //종료시간도 있는 경ㅇ
										time = result[i].startTime + "~" + result[i].endTime;
									}
									
									daylist += "<div class='c1_list t_list mb-2' style='background-color:"+ result[i].color +";' onclick='detailClick("+result[i].id+")''>"
	                                    + "<input style='display:none;' value="+result[i].id+">"
	                                    + "<div class='t_header'>"
	                                    + "<div class='me-auto fw-bold'>" + result[i].title + "</div>"
	                                    + "</div>"
	                                    + "<div class='t_list_cont'>" + result[i].content + "</div>"
	                                    + "<div class='t_list_time'>" + time + "</div>"
	                                  	+ "</div>"
										
									//selectDate(result[i]);
        	 					});
								$('#vertical-example').html(daylist);
							},
							error : function(result){
							 alert('데이터 로딩 실패');
							}
					   }); // 끝  ajax
					   
					
					}); // 끝 calendar.on
					/* 끝 날짜 클릭 이벤트*/
					
					
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
		
		<!------------------- 등록 모달 ------------------->
        <form class="modal fade" id="sked-insert-modal" tabindex="-1" aria-hidden="true" action="insertSked.do" onsubmit="return sked_submit()" method="POST">
          <div class="modal-dialog modal-l" role="document">
            <div class="modal-content">
              <!-- 모달 헤더 -->
              <div class="modal-header">
                  <h5 class="modal-title" id="insert_head">일정 등록</h5>
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
                              <option value="D" id="sked_code_D">부서</option>
                          </select>
                      </div>
                      
                      <!-- P 색상 -->
                      <div class="col mb-3"  id="color_group_P">
                        <label for="sked_color" class="form-label">색상</label>
                        <!-- <input type="text" id="sked_color" class="form-control" placeholder="DD / MM / YY" /> -->
                        <div class="form-control color_radio">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="colorCode" id="color_pink" value="C1" required />
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="colorCode" id="color_blue" value="C2" />
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="colorCode" id="color_yellow" value="C3" />
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="colorCode" id="color_purple" value="C4" />
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="colorCode" id="color_red" value="C5" />
                            </div>
                        </div>
                  		  </div>
                      <!-- / P 색상 -->
                      
                      <!-- D 색상 -->
                      <div class="col mb-3" style="display:none;" id="color_group_D">
                        <label for="sked_color" class="form-label">색상</label>
                        <!-- <input type="text" id="sked_color" class="form-control" placeholder="DD / MM / YY" /> -->
                        <div class="form-control color_radio">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="colorCode" id="color_lightGray" value="C6"/>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="colorCode" id="color_gray" value="C7"/>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="colorCode" id="color_darkGray" value="C8"/>
                            </div>
                        </div>
                    </div>
                    <!-- / D 색상 -->
                    
                  </div>
                  
                  <!-- 2번줄 -->
                  <div class="row">
                      <div class="col mb-3">
                          <label for="sked_title" class="form-label">제목</label>
                          <input type="text" id="sked_title" name="skedTitle" class="form-control" placeholder="제목을 입력하세요." maxlength="10" required/>
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
                              <label for="start_time" class="form-label">시작 시간</label>
                              <input id="start_time" name="skedStartTime" type="time" class="form-control"/>
                              <label for="end_time" class="form-label">종료 시간</label>
                              <input id="end_time" name="skedEndTime" type="time" class="form-control"/>
                      </div>
                  </div>
                  
                  <!-- 4번줄 -->
                  <div class="row">
                      <div class="col mb-3">
                          <label for="sked_content" class="form-label">내용</label>
                          <input type="text" name="skedContent" id="sked_content" class="form-control" placeholder="내용을 입력하세요." maxlength="50" required/>
                      </div>
                  </div>
                  
                  <!-- 5번줄 -->
                  <div class="row">
                      <div class="col mb-3">
                          <label for="sked_place" class="form-label">장소</label>
                          <input type="text" name="skedPlace" id="sked_place" class="form-control" placeholder="장소 입력"/>
                      </div>
                  </div>
                  
                  <!-- 6번줄 -->
                  <div class="row">
                      <div class="col mb-3">
                          <label for="sked_meno" class="form-label">메모</label>
                          <textarea id="sked_meno" name="skedMemo" class="form-control" placeholder="메모 입력"></textarea>
                      </div>
                  </div>
                  
              </div>
              <!-- 모달 풋터 -->
              <div class="modal-footer">
                  <button type="reset" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
                  <button type="submit" class="btn btn-primary" id="sked_insert_btn">등록</button>
              </div>
            </div>
          </div>
        </form>
        <!------------------- / 등록 모달 ------------------->
		
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
						            <option value="D">부서</option>
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
						            <label for="detail_start_time" class="form-label">시작 시간</label>
						            <input id="detail_start_time" name="skedStartTime" type="time" class="form-control"/>
						            <label for="detail_end_time" class="form-label">종료 시간</label>
						            <input id="detail_end_time" name="skedEndTime" type="time" class="form-control"/>
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
		<!----------------------------- /상세 조회 -------------------------------------->
		
		<!------------------- 검색 결과 모달 ------------------->
		<form class="modal fade" id="search-modal" tabindex="-1" aria-hidden="true" >
          <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
              
              <!-- 모달 헤더 -->
              <div class="modal-header">
                <div class="input-group input-group-merge" style="width: 25%;">
                  <input type="text" id ="modal-key" class="form-control" value="검색어  " readOnly>
                  <input type="text" id ="modal-keyword" name="modal-keyword" class="form-control" placeholder="검색어" readOnly>
                </div>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <!-- / 모달 헤더 -->

              <!-- 모달 바디 -->
              <div class="modal-body" style="padding-bottom: 0px;">
                <!-- <div class="row"> -->
                  <div class="col mb-3">
                    <div class="input-group input-group-merge">
                      <!-- 검색 결과 테이블 -->
                      <table class="table table-bordered table-striped"  style="text-align: center;">
                        <!-- 테이블 헤드 -->
                        <thead>
                          <tr>
                            <th style="font-size: 15px;">시작일</th>
                            <th style="font-size: 15px;">종료일</th>
                            <th style="font-size: 15px;">제목</th>
                            <th style="font-size: 15px;">내용</th>
                            <th style="font-size: 15px;">종류</th>
                          </tr>
                        </thead>
                        <!-- / 테이블 헤드 -->

                        <!-- 테이블 바디 -->
                        <tbody id="resultTable">
          
                        </tbody>
                        <!-- / 테이블 바디 -->

                      </table>
                      <!-- / 검색 결과 테이블 -->
                    </div>
                  </div>
                <!-- </div> -->
              </div>
              <!-- / 모달 바디 -->
              
              <!-- 모달 풋터 -->
              <div class="modal-footer">
                <nav aria-label="Page navigation">
                  <ul class="pagination" id="pageUl">

<!-- prev -->
<li class="page-item prev disabled" id="prevLi">
  <a class="page-link" href="javascript:void(0);" id="prevA">
	<i class="tf-icon bx bx-chevron-left"></i>
  </a>
</li>
<!-- / prev -->

<li id='navList' style="display: flex; margin-left:3px"></li>

<!-- next -->
<li class="page-item next disabled" id="nextLi">
  <a class="page-link" href="javascript:void(0);" id="nextA">
	<i class="tf-icon bx bx-chevron-right"></i>
  </a>
</li>
<!-- / next -->

                  </ul>
                </nav>
              </div>
              <!-- / 모달 풋터 -->

            </div>
          </div>
                
         </form>
	    <!------------------- / 검색 결과 모달 ------------------->
		
		<script src='${pageContext.request.contextPath}/resources/jje_css/jje_schedule.js'></script>
	</div>
	
	<jsp:include page="../common/bottom.jsp"/>
	
</body>
</html>