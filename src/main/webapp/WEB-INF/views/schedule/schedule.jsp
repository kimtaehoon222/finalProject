<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script>

    document.addEventListener('DOMContentLoaded', function() {
        var initialLocaleCode = 'ko';
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        headerToolbar: {
            start: 'prev title next', // will normally be on the left. if RTL, will be on the right
            center: '',
            end: 'today dayGridMonth,timeGridWeek,listWeek' // will normally be on the right. if RTL, will be on the left
        },
        locale: initialLocaleCode,
        slotMinTime: '08:00',
        slotMaxTime: '24:00:00',
        // navLinks: true,
        editable: true,
        droppable: true, // this allows things to be dropped onto the calendar
        drop: function(info) {
            // is the "remove after drop" checkbox checked?
            if (checkbox.checked) {
            // if so, remove the element from the "Draggable Events" list
            info.draggedEl.parentNode.removeChild(info.draggedEl);
            }
        },
        dateClick: function() { //날짜 클릭 이벤트
            alert('a day has been clicked!');
        },

        // timeZone: 'UTC',
        //임의로 이벤트 추가1
        events: [
            {id: 'a', title: '테스트2', start: '2022-06-12'}
        ]
        });
        
        //아이디가 'a'인 이벤트 발생하면 콘솔창에 이벤트 시작 시간 출력
        var event = calendar.getEventById('a') // an event object!
        var start = event.start // a property (a Date object)
        console.log(start.toISOString()) // "2018-09-01T00:00:00.000Z"
        
        
        //임의로 이벤트 추가2
        calendar.addEvent( {'title':'테스트', 'start':'2022-06-10', 'end':'2022-06-11'});

        calendar.on('dateClick', function(info) { //날짜 클릭 후 콘솔 출력
            console.log('clicked on ' + info.dateStr);
        });
        
        //캘린더 랜더링
        calendar.render();
    });
    
</script>
<!-------------------------------------------------------------------------------------------------------------->
</head>
<body>
	<jsp:include page="top.jsp"/>
	
	<!----------------------------------------------------------------------------------------------------------->
	            <!-- Content -->
	
	            <div class="container-xxl flex-grow-1 container-p-y">
	              <!-- Layout Demo -->
	<!------------------------------------------------------------------->
	            <div class="row">
	                <div class="col-lg-8 mb-4 order-0">
	                    <div class="card">
	                        <div class='calendar-container'>
	                            <div id='calendar'></div>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-lg-4 mb-4">
	                    <div class="row">
	                        <div class="col-12 mb-4">
	                            <div class="card">
	                                <div class="card-body insert_btn">
	                                    <!-------------------모달------------------->
	                                    <!-- Modal -->
	                                    <div class="modal fade" id="sked-insert-modal" tabindex="-1" aria-hidden="true">
	                                        <div class="modal-dialog modal-l" role="document">
	                                        <div class="modal-content">
	                                            <div class="modal-header">
	                                            <h5 class="modal-title" id="exampleModalLabel4">일정 등록</h5>
	                                            <!-- <button
	                                                type="button"
	                                                class="btn-close"
	                                                data-bs-dismiss="modal"
	                                                aria-label="Close"
	                                            ></button> -->
	                                            </div>
	                                            <div class="modal-body">
	                                                <div class="row">
	                                                    <div class="col mb-3">
	                                                    <label for="sked_code" class="form-label">카테고리</label>
	                                                        <!-- <input type="text" id="sked_code" class="form-control" placeholder="xxxx@xxx.xx" /> -->
	                                                        <select id="sked_code" name="sked_code" class="form-select" autofocus>
	                                                            <option value="P">개인</option>
	                                                            <option value="D">부서</option>
	                                                        </select>
	                                                    </div>
	                                                    <div class="col mb-3">
	                                                        <label for="sked_color" class="form-label">색상</label>
	                                                        <input type="text" id="sked_color" class="form-control" placeholder="DD / MM / YY" />
	                                                    </div>
	                                                </div>
	                                                <div class="row">
	                                                    <div class="col mb-3">
	                                                        <label for="sked_title" class="form-label">제목</label>
	                                                        <input type="text" id="sked_title" class="form-control" placeholder="제목을 입력하세요." />
	                                                    </div>
	                                                </div>
	                                                <div class="row">
	                                                    <div class="col mb-3">
	                                                        <label for="sked_start_date" class="form-label">날짜</label>
	                                                        <input id="sked_start_date" type="date" class="form-control">
	                                                    </div>
	                                                    <div class="col mb-3">
	                                                        <div class="row">
	                                                            <label for="sked_start_time" class="form-label">시간</label>
	                                                            <input id="sked_start_time" type="time" class="form-control"/>
	                                                            <label for="sked_start_time" class="form-label">종료 시간</label>
	                                                            <input id="sked_start_time" type="time" class="form-control"/>
	                                                        </div>
	                                                    </div>
	                                                </div>
	                                                <div class="row">
	                                                    <div class="col mb-3">
	                                                        <label for="sked_start_date" class="form-label">종료 날짜</label>
	                                                        <input id="sked_start_date" type="date" class="form-control">
	                                                    </div>
	                                                    <div class="col mb-3">
	                                                        <div class="row">
	                                                            <label for="sked_start_time" class="form-label">시간</label>
	                                                            <input id="sked_start_time" type="time" class="form-control"/>
	                                                            <label for="sked_start_time" class="form-label">종료 시간</label>
	                                                            <input id="sked_start_time" type="time" class="form-control"/>
	                                                        </div>
	                                                    </div>
	                                                </div>
	                                                <div class="row">
	                                                    <div class="col mb-3">
	                                                        <label for="sked_content" class="form-label">내용</label>
	                                                        <input type="text" id="sked_content" class="form-control" placeholder="내용을 입력하세요."/>
	                                                    </div>
	                                                </div>
	                                                <div class="row">
	                                                    <div class="col mb-3">
	                                                        <label for="sked_place" class="form-label">장소</label>
	                                                        <input type="text" id="sked_place" class="form-control" placeholder="장소 입력"/>
	                                                    </div>
	                                                </div>
	                                                <div class="row">
	                                                    <div class="col mb-3">
	                                                        <label for="sked_meno" class="form-label">메모</label>
	                                                        <textarea id="sked_meno" class="form-control" placeholder="메모 입력"></textarea>
	                                                        <!-- <input type="text" id="nameExLarge" class="form-control" placeholder="Enter Name" /> -->
	                                                    </div>
	                                                    
	                                                </div>
	                                            </div>
	                                            <div class="modal-footer">
	                                            <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
	                                                Close
	                                            </button>
	                                            <button type="button" class="btn btn-primary">Save changes</button>
	                                            </div>
	                                        </div>
	                                        </div>
	                                    </div>
	                                    <!-------------------모달------------------->
	                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#sked-insert-modal">
	                                    	일정 등록
	                                    </button>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="col-12 mb-4">
	                            <div class="card">
	                                <div class="card-body">
	                                    <form action="" method="POST">
	                                        <div class="input-group input-group-merge">
	                                            <span class="input-group-text" id="basic-addon-search31"><i class="bx bx-search"></i></span>
	                                            <input type="text" class="form-control" placeholder="Search..." aria-label="Search..." aria-describedby="basic-addon-search31">
	                                        </div>
	                                        <button type="submit" class="btn btn-primary">
	                                           	 검색하기
	                                        </button>
	                                    </form>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="col-12 mb-4">
	                            <div class="card">
	                                <div class="card-body">
	                                   
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	
	
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
	
	<jsp:include page="bottom.jsp"/>
</body>
</html>