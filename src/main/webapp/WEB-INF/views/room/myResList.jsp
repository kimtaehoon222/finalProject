<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DataTable - Mazer Admin Dashboard</title>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/kjh123/css/bootstrap.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/kjh123/vendors/simple-datatables/style.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/kjh123/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/kjh123/css/app.css">
</head>
<style type="text/css">

   body.stop-dragging
   {
     -ms-user-select: none; 
     -moz-user-select: -moz-none;
     -khtml-user-select: none;
     -webkit-user-select: none;
     user-select: none;
   }
   
   .titleBox{
      background-color: white;
      padding: 15px;
   }
   
   .titleBox h2{
      margin: 0;
      font-weight: bold;
      color: #6a6a69;
   }
   
   .table > tbody > tr > td {
     vertical-align: middle;
   }
   
   .table-borderless > tbody > tr > td,
   .table-borderless > tbody > tr > th,
   .table-borderless > tfoot > tr > td,
   .table-borderless > tfoot > tr > th,
   .table-borderless > thead > tr > td,
   .table-borderless > thead > tr > th {
       border: none;
   }
   
   <%-- ----------------------- --%>
   
   .smallTitleBox > h4{
      font-size: 12pt;
      font-weight: bold;
      color: #6a6a69;
   }
   
   .detailBtn{
      margin-right: 3%; 
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
 .main{font-size: larger;
 color: inherit;
 }
</style>

<body>
	<jsp:include page="../common/top.jsp" />
    <div id="app">
       
        <div id="main">
            <header class="mb-3">
                 <a href="#" class="burger-btn d-block d-xl-none">
                    <i class="bi bi-justify fs-3"></i>
                </a>
            </header>

                   <div class="page-heading">
           
                    <div class="card">
                        <div class="card-header">
                          <a class="main" href="roomList.do">회의실  </a> 
                          \
                           <a class="main" href="#"> 나의 예약 목록</a>
                          <hr>
                          
                        </div>
                        
                        <div class="card-body">
                            <table class="table table-striped" id="table1">
                                <thead>
                                    <tr>
                                        <th>회의실 이름</th>
                                        <th>예약 제목</th>
                                        <th>예약 시간</th>
                                        <th>      </th>
                                        
                                    </tr>
                                </thead>
                              <tbody class="RsvList">
                               
                               </tbody>
                            </table>

                        </div>
                    </div>

             
            </div>
</div>
         
        </div>
        

    
    <%-- ---------------- 모달 ---------------- --%>
   
   <%-- 예약 상세정보 보여주기 모달 --%>
   <div id="showDetailRsvModal" class="modal fade" role="dialog" data-keyboard="false" data-backdrop="static">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title" style="font-weight: bold;">예약정보</h4>
          <button type="button" class="close" data-dismiss="modal" onclick="window.closeModal()">&times;</button>
        </div>
        <div class="modal-body">
          <div class="container">
               <form name="editCalNameFrm">
             <table class="table table-borderless">
               <tbody class="detailTbody">
                 
               </tbody>
             </table>
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
     
        </div>
        <div class="modal-body">
          <label>정말 예약을 취소하시겠습니까?</label>
          <input class="hidden_resNo" type="hidden">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn blueBtn" onclick="rsvCancel()">예</button>
          <button type="button" class="btn grayBtn"onclick="window.closeModal()">아니오</button>
        </div>
      </div>
    </div>
  </div>

 
 <script type="text/javascript">

   //전체 모달 닫기(전역함수인듯)
   window.closeModal = function(){
       $('.modal').modal('hide');
       //javascript:history.go(0);
   };

   $(document).ready(function() {
      
      readRsvList();
      
   });
      
   
   // 나의 예약 목록을 읽어오는 함수
     function readRsvList(){
        
        $.ajax({
            url:"selectMyResList.do",
            type:"get",
            dataType:"JSON",
            success:function(json){
               var html = "";
               if (json.length > 0) {
                  $.each(json, function(index, item){
                     html += "<tr class='oneRow'>";
                        html += "<td>"+ item.roomName + "</td>";
                        html += "<td>" + item.meetTitle + "</td>";
                        html += "<td>";
                           html += item.startDate + " ~ " + item.endDate;
                        html += "</td>";
                        html += "<td>";
                        html += "<button class='btn btn-primary me-2' type='button' onclick='rsvDetailBtn(" + item.resNo + ")'>상세보기</button>";
                        html += "<button class='btn btn-secondary' type='button' onclick='rsvCancelBtn(" + item.resNo + ")'>예약취소</button>";
                        html += "</td>";
                     html += "</tr>";
                  });
               }else{
                  html += "<tr class='oneRow'>";
                  html += "<td colspan='4' style='text-align: center;'>리스트가 존재하지 않습니다.</td>";
                  html += "</tr>";
               }
               
               $("tbody.RsvList").html(html);

            },
            error: function(request, status, error){
               alert("나의 예약 목록 조회에 실패하였습니다. 관리자에 문의 바랍니다.");
             }
         });
        
     }
   
   // 예약 상세보기 버튼을 클릭시 실행하는 함수
   function rsvDetailBtn(resNo) {
      
      $.ajax({
         url:"detailRes.do",
         type:"get",
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
            
            $("tbody.detailTbody").html(html);
         },
         error: function(){
            alert("회의실 상세보기,수정에 실패하였습니다. 관리자에게 문의바랍니다.");
          }
      });
      
      $('#showDetailRsvModal').modal('show');
   }
   
   // 예약 취소하기 버튼을 클릭시 실행하는 함수(모달을 띄워주기만 함)
   function rsvCancelBtn(resNo) {
      $("input.hidden_resNo").val(resNo);
      $('#cancelRsvCheckModal').modal('show');
   }
   
   // 예약 취소를 DB에서 처리해주는 함수
   function rsvCancel() {
      var resNo = $("input.hidden_resNo").val();
      
      $.ajax({
    	 url:"deleteRes.do",
         type:"get",
         data: {resNo:resNo},
         dataType:"JSON",
         success:function(json){
        	 console.log(json);
            if (json.n == 1) {
               alert("회의실 예약이 취소되었습니다"); 
               readRsvList();
               window.closeModal();
            }else{
               alert("DB오류");
            }
            
         },
         error: function(request, status, error){
            alert("회의실 예약 취소에 실패하였습니다. 관리자에게 문의바랍니다.");
          }
      });
   }
   
</script>
    <jsp:include page="../common/bottom.jsp" />
    <script src="${pageContext.request.contextPath}/resources/kjh123/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/kjh123/js/bootstrap.bundle.min.js"></script>

    <script src="${pageContext.request.contextPath}/resources/kjh123/vendors/simple-datatables/simple-datatables.js"></script>
    <script>
        // Simple Datatable
        let table1 = document.querySelector('#table1');
        let dataTable = new simpleDatatables.DataTable(table1);
    </script>

    <script src="${pageContext.request.contextPath}/resources/kjh123/js/main.js"></script>
</body>

</html>
















    