<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회의실</title>
<!---------------------------------------------달력----------------------------------------------------------------->
<link href='${ pageContext.request.contextPath }/resources/kjhPackages/core/main.css' rel='stylesheet' />  
<link href='${pageContext.request.contextPath }/resources/kjhPackages/daygrid/main.css' rel='stylesheet' />
<link href='${ pageContext.request.contextPath}/resources/kjhPackages/timegrid/main.min.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/resources/kjhPackages/core/main.js'></script>
<script src='${pageContext.request.contextPath}/resources/kjhPackages/daygrid/main.js'></script>
<script src="${pageContext.request.contextPath}/resources/kjhPackages/interaction/main.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/kjhPackages/timegrid/main.min.js"></script></head>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<style>
   
   body.stop-dragging
   {
     -ms-user-select: none; 
     -moz-user-select: -moz-none;
     -khtml-user-select: none;
     -webkit-user-select: none;
     user-select: none;
   }
   html, body {
     margin: 0;
     padding: 0;
     font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
     font-size: 14px;
   }
   
   h2.pageTitleText{
      border: solid 0px red;
      margin: 18px;
      margin-bottom: 13px;
      margin-left: 9%;
      font-weight: bold;
      font-size: 15pt;
      color: #6a6a69;
   }
   
   .fc-event{
      cursor: pointer;
    }
   
   div.cal_sidebar{
      background-color: white;
   }
   
   .nav_ul{
      list-style-type: none;
      margin-left: -10%;
   }
   
   .nav_ul_p{
      padding: 0;
      margin: 0;
   }
   
   .largeText{
      color: #6a6a69;
      font-weight: bold; 
      font-size: 11pt;
   }
   
   .smallText{
      padding: 0;
      margin: 0;
      color: black;
      line-height: 27px;
      cursor: pointer;
   }
   
   div.add_calendar_box{
      padding-top: 15px;
   }
   
   a.add_calendar{
      cursor: pointer;
      color: black;
   }
   
   li span.btn_wrap{
      position: absolute;
      right: 24px;
   }
   
   #external-events {
     border: solid 1px red;
     display: none;
     z-index: 2;
     top: 20px;
     left: 20px;
     width: 150px;
     padding: 0 10px;
     border: 1px solid #ccc;
     background: #eee;
     margin: 0;
   }
   .demo-topbar + #external-events { /* will get stripped out */
     top: 60px;
   }
   #external-events .fc-event {
     margin: 1em 0;
     cursor: move;
   }
   #calendar-container {
     position: relative;
     z-index: 1;
     margin-left: 200px;
   }
   #calendar {
     width: 90%;
     height: 80%;
     background: white;
     margin: 4 px;
   
   }
   
   .dot {
     height: 12px;
     width: 12px;
     background-color: #bbb;
     border-radius: 50%;
     display: inline-block;
     cursor: pointer;
   }
   
   .fc-row > table > thead > tr > th.fc-today{
      background: #b5a8b9 !important;
   }
   
   <%-- 오늘날짜 cell 색상 없애기 --%>
   .fc-unthemed .fc-today {
        background: #f1f1f1 !important;
       border-top: 1px solid #ddd !important;
       font-weight: bold !important;
       color: black;
   }
   
   .table-borderless > tbody > tr > td,
   .table-borderless > tbody > tr > th,
   .table-borderless > tfoot > tr > td,
   .table-borderless > tfoot > tr > th,
   .table-borderless > thead > tr > td,
   .table-borderless > thead > tr > th {
       border: none;
   }
   
   <%-- 일정등록 Modal css --%>
   input.datepicker{
      width: 130px;
   }
   
   input.modal_input{
      height: 30px;
   }
   
   .clickSmallText{
      font-weight: bold;
      color: #97b8e0;
   }
   
   <%-- (Modal)예약 상세보기 --%>
   .table > tbody > tr > td {
     vertical-align: middle;
   }
   
 
   
   .detailTbody th tr{
      font-size: 12pt;
   }
   
   .container{
      background-color: white;
      margin: 0 auto;
      margin-top: 2%;
      width: 97%;
   }
   
   .blueBtn{
      border-radius: 4px;
      background-color: #0F4C81;
      color: white;
   }
   
   .grayBtn{
      border-radius: 4px;
      background-color: #D8D8D8;
      color: gray;
   }
   
   .redBtn{
      border-radius: 4px;
      background-color: #d53641;
      color: white;
   }
    #calendarTop{
    border: solid 0px red;  
    margin-left: 25%;
    margin-right:2%;
    }
    #allCss{
    margin: auto; background-color: white;
    width:90%;
    }
</style>
</head>
<body >
<jsp:include page="../common/top.jsp"/>

<div id="allCss" >

 <div class="navbar-default sidebar cal_sidebar" role="navigation" style="width: 160px; height: 10px; margin-left: 5%;   margin-top: 3%; " >
      <div class="sidebar-nav navbar-collapse slimscrollsidebar">
           <h2 class="pageTitleText">
           <i class="fa fa-clock-o fa-fw" aria-hidden="true"></i>예약하기</h2>
           <div class="center p-20" style="padding-top: 0px !important;">
              <span class="hide-menu addSchedule"><a class="btn btn-danger btn-block btn-rounded waves-effect waves-light" 
              onclick="addRs()">예약하기</a></span>
          </div>
         
          <ul class="nav" id="side-menu" style="padding-left: 9%;">
              <li style="padding: 10px 0 0;" name = 'roomNo'>
                  <span class="largeText">회의실</span>
                  <ul class="nav_ul">
                     <li>
                        <p class='nav_ul_p'>
                           <label class='smallText firstSmallText' onclick="changeResource(10)" style="margin-top: 5px;">회의실1</label>
                        </p>
                        <p class='nav_ul_p'>
                           <label class='smallText' onclick="changeResource(11)" style="margin-top: 2px;">회의실2</label>
                        </p>
                         <p class='nav_ul_p'>
                           <label class='smallText' onclick="changeResource(12)"  style="margin-top: 2px;">회의실3</label>
                        </p>
                         <p class='nav_ul_p'>
                           <label class='smallText' onclick="changeResource(13)"  style="margin-top: 2px;">회의실4</label>
                        </p>
                     </li>
                  </ul>
              </li>
          
              <li>
                 <div class="add_calendar_box">
                     <a class="add_calendar" href="<%= request.getContextPath() %>/goMyRsvList.os" style="color: black;">
                     <i class="fa fa-cog" style="padding-right: 10px;"></i>나의 예약 목록</a>
                  </div>
              </li>         
          </ul>
          
          </div>
      </div>

   <div id="external-events">
      <p>
         <strong>Draggable Events</strong>
       </p>
       <div class="fc-event">My Event 1</div>
       <div class="fc-event">My Event 2</div>
       <div class="fc-event">My Event 3</div>
       <div class="fc-event">My Event 4</div>
       <div class="fc-event">My Event 5</div>
       <p>
         <input type="checkbox" id="drop-remove">
         <label for="drop-remove">remove after drop</label>
       </p>
  </div>
  <div id="calendarTop">
   <div id='calendar'>
   </div>
  </div>
</div>  >
  <%-- 예약하기 모달 --%>
   <div id="addRsvModal" class="modal fade" role="dialog" data-keyboard="false" data-backdrop="static">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" onclick="window.closeModal()">&times;</button>
          <h4 class="modal-title" style="font-weight: bold;">회의실 예약</h4>
        </div>
        <div class="modal-body">
        
          <div class="modal_container">
               <form name="addSchFrm">
                  <input type="hidden" name="bAllday">
             <table class="table table-borderless">
               <tbody>
                 <tr>
                   <th>예약일</th>
                   <td>
                   <!-- 예약 시작 시간 -->
                      <input type="date" class="datepicker" name="startDate">
                      <select class="startDate_hour" style="width: 100px;">
                     <c:set var="breakPoint" value="0" />
                     <c:forEach var="i" begin="0" end="23">
                         <c:forEach var="j" begin="0" end="1">
                             <c:if test="${(i == 24) && (j == 1)}">    
                                 <c:set var="breakPoint" value="1" />                                    
                             </c:if>
                             <c:if test="${breakPoint == 0}">                           
                                 <option value="<fmt:formatNumber pattern="00" value="${i}" />:<fmt:formatNumber pattern="00" value="${j*30}" />">
                                 <fmt:formatNumber pattern="00" value="${i}" />:<fmt:formatNumber pattern="00" value="${j*30}" /></option>                                                                            
                             </c:if>
                         </c:forEach>
                     </c:forEach>
                  </select>
                  ~
                     <!-- 예약 끝나는 시간 -->
                  <input type="date" class="datepicker" name="endDate">
                      <select class="endDate_hour" style="width: 70px;">
                     <c:set var="breakPoint" value="0" />
                     <c:forEach var="i" begin="0" end="23">
                         <c:forEach var="j" begin="0" end="1">
                             <c:if test="${(i == 24) && (j == 1)}">    
                                 <c:set var="breakPoint" value="1" />                                    
                             </c:if>
                             <c:if test="${breakPoint == 0}">                           
                                 <option value="<fmt:formatNumber pattern="00" value="${i}" />:<fmt:formatNumber pattern="00" value="${j*30}" />">
                                 <fmt:formatNumber pattern="00" value="${i}" />:<fmt:formatNumber pattern="00" value="${j*30}" /></option>                                                                            
                             </c:if>
                         </c:forEach>
                     </c:forEach>
                  </select>
                  
                  <input type="checkbox" id="allday" name="allday" /><label for="allday">종일</label>
                   </td>
                 </tr>
                 
                 <tr>
                   <th>자원선택</th>
                   <td><select class="addRsSelect" name="roomNo"></select></td>
                 </tr>
                 
                 <tr>
                   <th>사용용도</th>
                   <td><input class="form-control modal_input" name="meetGoal" type="text" style="height: 30px;" /></td>
                 </tr>
                 
               </tbody>
             </table>
            
            <div style="float: right;">
               <button class="btn blueBtn" type="button" onclick="addRsvModalBtn()">확인</button>
               <button class="btn grayBtn" type="button" onclick="window.closeModal()">취소</button>
            </div>
            <br style="clear: both;">
            </form>
         </div>
         
        </div>
      </div>
    </div>
   </div>
   
   
   <%-- 예약 상세정보 보여주기 모달 --%>
   <div id="showDetailRsvModal" class="modal fade" role="dialog" data-keyboard="false" data-backdrop="static">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" onclick="window.closeModal()">&times;</button>
          <h4 class="modal-title" style="font-weight: bold;">예약정보</h4>
        </div>
        <div class="modal-body">
          <div class="container">
               <form>
             <table class="table table-borderless">
               <tbody class="detailTbody">
                 
               </tbody>
             </table>
         
            <button class="btn redBtn rsvCancelBtn" style="float: right; margin-left: 5px;" type="button" onclick="cancelRsv()">예약취소</button>
            <button class="btn grayBtn" style="float: right;" type="button" onclick="window.closeModal()">확인</button>
            </form>
         </div>
        </div>
      </div>
    </div>
   </div>
   
   <%-- 취소 버튼 클릭 시 정말 취소할 것인지 묻는 모달 --%>
   <div class="modal fade" id="cancelRsvCheckModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" onclick="window.closeModal()">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
          <label>정말 예약을 취소하시겠습니까?</label>
          <input class="hidden_resNo" type="hidden">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" onclick="rsvCancel()">예</button>
          <button type="button" class="btn btn-default"onclick="window.closeModal()">아니오</button>
        </div>
      </div>
    </div>
  </div>
<jsp:include page="../common/bottom.jsp"/>
<script type="text/javascript">
/*
    ================ 캘린더 함수 정리 ================
    
   info.dateStr
   info.event.title
      ` 
   calendar.refetchEvents() => 모든 소스의 이벤트를 다시 가져와 화면에 다시 렌더링
   calendar.addEvent( {'title':'evt4', 'start':'2020-12-04', 'end':'2020-12-04'});  ==> 이벤트를 추가하는 함수
   calendar.gotoDate (날짜) => 달력을 임의의 날짜로 이동
   
   
   var date = calendar.getDate(); ==> 현재 날짜 받기
   alert(date.toString()); ==> 현재 날짜 출력?(date.toString())
   date = moment(date).format("YYYY-MM");  ==> 받은 날짜를 원하는 형식으로 변경(cdn 추가해야 함)
   
   allDay 는 event.push 안에 title, start 처럼 줘야 함
   
*/
// 캘린더 전역변수 설정
var calendar;
// 처음 초기값은 1 => 회의실1 정보를 불러옴
var roomNo = 10;
//전체 모달 닫기(전역함수인듯)
window.closeModal = function(){
    $('.modal').modal('hide');
    //javascript:history.go(0);
};
$(document).ready(function() {
   $(".rsvCancelBtn").hide();
   
   // 처음 페이지에 들어왔을 때 1번 회의실로 설정
   $("label.firstSmallText").addClass("clickSmallText");
   
   // 사이드바의 자원명을 선택했을 시 선택한 텍스트의 색을 변경
   $("label.smallText").click(function() {
      $("label.smallText").removeClass("clickSmallText");
      $(this).addClass("clickSmallText");
   });
});
document.addEventListener('DOMContentLoaded', function() {
    var Calendar = FullCalendar.Calendar;
    var Draggable = FullCalendarInteraction.Draggable;
 
    var containerEl = document.getElementById('external-events');
    var calendarEl = document.getElementById('calendar');
    var checkbox = document.getElementById('drop-remove');
 
    // initialize the external events
    // -----------------------------------------------------------------
 
    new Draggable(containerEl, {
      itemSelector: '.fc-event',
      eventData: function(eventEl) {
        return {
          title: eventEl.innerText
        };
        
      }
    });
 
    // initialize the calendar
    // -----------------------------------------------------------------
    calendar = new Calendar(calendarEl, {
      plugins: ['interaction', 'timeGrid'],
      header: {
        left: 'prev viewWeekends',
        center: 'title ',
        right: 'next today',
      },
      locale: 'ko',
      dateClick: function(info) {
          
          // 이전날짜에 예약 불가
          var sysdate = new Date();
          sysdate = moment(sysdate).format("YYYY-MM-DD HH:mm:ss");
          
          var date = moment(info.dateStr).format("YYYY-MM-DD");
          
          // 오늘만 시간이 지났어도 예약 가능하게 함
          if (sysdate > date + 1) {
          alert("지난 시간은 예약할 수 없습니다.");
       }else{
          addRs();   // 모달을 초기화하고 자원명을 불러오는 함수
          
          // 클릭한 시각으로 모달의 datepicker를 변경시킴
            $("input[name=startday]").val(date);   
           $("input[name=endday]").val(date);
            
           var hhmm = moment(info.dateStr).format("HH:mm");
            $("select.startday_hour").val(hhmm).change();
            $("select.endday_hour").val(hhmm).change();
       }
          
       
    },
      eventClick: function(info) {
              viewRsv(info.event.id);
      },
      selectable: true,
      navLinks: false,             // 달력의 날짜 텍스트를 선택할 수 있는지 유무
      editable: false,
      eventLimit: true,            // 셀에 너무 많은 일정이 들어갔을 시 more로 처리
      allDaySlot: false,
      customButtons: { //주말 숨기기 & 보이기 버튼
          today : {
             text  : '오늘',
             click : function () {
                calendar.today();
             }
           },
           prev : {
              click : function () {
                 calendar.prev();
          }
           },
           next : {
              click : function () {
                 calendar.next();
          }
           }
           
           
          },
      events: function (info, successCallback, failureCallback){
            $.ajax({
              url:"selectResList.do",
              data:{roomNo:roomNo},
              type:"GET",
              dataType:"JSON",
              success:function(json){
              console.log(json);
              var events = [];
             $.each(json, function(index, item){
            	   console.log("이치이치");
                  if (json.length > 0) {
                	  console.log("이프문");
                     events.push({
                               title: item.empName,                             
                               start: item.startDate,
                               end: item.endDate,
                               textColor: "white",
                               color: "rgb(124, 127, 251)",
                               id: item.resNo
                            });
                  }else{
                     // 검색된 결과가 없을 때
                  }
                  
                  
               });
                successCallback(events);  
                console.log("확인" +events);           
              },
              error: function(request, status, error){
            	  alert('데이터 로딩 실패');
               },
           });
            
         },
    });
    
    calendar.render();
  });
// 자원을 변경했을 시 자원 변수값을 변경해주는 함수
function changeResource(rsNo) {
   roomNo = rsNo;
    calendar.refetchEvents();
 } 
function viewRsv(resNo){
    $.ajax({
        url:"detailRes.do",
        type:"GET",
        data: {resNo:resNo},
        dataType:"JSON",
        success:function(json){
           var html = "";
           html += "<tr>";
              html += "<th>회의실 명</th>";
              html += "<td>" + json.roomName + "</td>";
           html += "</tr>";
           html += "<tr>";
              html += "<th>시작시간</th>";
              html += "<td>" + json.startDate + "</td>";
           html += "</tr>";
           html += "<tr>";
              html += "<th>종료시간</th>";
              html += "<td>" + json.endDate + "</td>";
           html += "</tr>";
           html += "<tr>";
           html += "<th>부서</th>";
           html += "<td>" + json.deptName + "</td>";
        html += "</tr>";
           html += "<tr>";
              html += "<th>예약자</th>";
              html += "<td>" + json.empName + "</td>";
           html += "</tr>";
           html += "<tr>";
              html += "<th>예약목적</th>";
              html += "<td>" + json.meetGoal+ "</td>";
              html += "<input type='hidden' class='resNo' value='" + resNo + "' >";
           html += "</tr>";
           
           $("tbody.detailTbody").html(html);//tbody 부분에 보여주기
           $(".rsvCancelBtn").hide();
           if (json.empNo == "${loginEmp.empNo}") {//예약자랑 로그인 직원 번호 일치시 보이게
              $(".rsvCancelBtn").show();
           }
        },
        error: function(){
           alert("예약 상세 조회에 실패하였습니다. 관리자에 문의 바랍니다.");
         }
     });
    
    $("#showDetailRsvModal").modal('show');
 }
 
</script>
</body>
</html>