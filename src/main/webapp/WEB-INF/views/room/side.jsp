<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='${ pageContext.request.contextPath }/resources/kjhPackages/core/main.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath }/resources/kjhPackages/daygrid/main.css' rel='stylesheet' />
<link href='${ pageContext.request.contextPath}/resources/kjhPackages/timegrid/main.min.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/resources/kjhPackages/core/main.js'></script>
<script src='${pageContext.request.contextPath}/resources/kjhPackages/daygrid/main.js'></script>
<script src="${pageContext.request.contextPath}/resources/kjhPackages/interaction/main.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/kjhPackages/timegrid/main.min.js"></script></head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</head>
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
    margin-left: 20%; 
     margin-top: 2%; 
   width: 80%;
   height: 80%;
    }
</style>
<body>
  <div class="navbar-default sidebar cal_sidebar" role="navigation" style="width: 160px; height: 10px; margin-left: 100px;   margin-top: 2%; " >
      <div class="sidebar-nav navbar-collapse slimscrollsidebar">
           <h2 class="pageTitleText">
           <i class="fa fa-clock-o fa-fw" aria-hidden="true"></i>예약하기</h2>
           <div class="center p-20" style="padding-top: 0px !important;">
              <span class="hide-menu addSchedule"><a class="btn btn-danger btn-block btn-rounded waves-effect waves-light" 
              onclick="addRs()">예약하기</a></span>
          </div>
          
          <ul class="nav" id="side-menu" style="padding-left: 9%;">
              <li style="padding: 10px 0 0;">
                  <span class="largeText">회의실</span>
                  <ul class="nav_ul">
                     <li>
                        <p class='nav_ul_p'>
                           <label class='smallText firstSmallText' onclick="changeResource(1)" style="margin-top: 5px;">1번 회의실</label>
                        </p>
                        <p class='nav_ul_p'>
                           <label class='smallText' onclick="changeResource(2)">2번 회의실</label>
                        </p>
                     </li>
                  </ul>
              </li>
              <li style="padding: 10px 0 0;">
                  <span class="largeText">빔프로젝터</span>
                  <ul class="nav_ul">
                     <li>
                        <p class='nav_ul_p'>
                           <label class='smallText' onclick="changeResource(3)" style="margin-top: 5px;">1번 빔프로젝터</label>
                        </p>
                        <p class='nav_ul_p'>
                           <label class='smallText' onclick="changeResource(4)">2번 빔프로젝터</label>
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
</body>
</html>