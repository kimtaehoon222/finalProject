<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.workie.easy.employee.model.dto.Employee" %>     
<%
	String contextPath = request.getContextPath();
	Employee loginEmp = (Employee)session.getAttribute("loginEmp");
%>     
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>

<style type="text/css">

#ckbox:checked + div{
 display:none;
}

</style>
</head>

<body>
	
   <!-- top -->
   <jsp:include page="../common/top.jsp"/>

   <!-- 컨테이너 시작 -->
   <div class="container-xxl flex-grow-1 container-p-y">
   <h4 class="fw-bold py-3 mb-4">
        <span class="text-muted fw-light">Email /</span> 작성하기
   </h4>

   <!-- 행 시작 -->
   <div class="row">
      <div class="col-md-12">
       <ul class="nav nav-pills flex-column flex-md-row mb-3">
         <li class="nav-item"><a class="nav-link active" href="javascript:void(0);">목록으로</a></li>
       </ul>
    
       <!-- 메일 영역 시작 -->
       <div class="card mb-4">
         <h5 class="card-header"><%=loginEmp.getEmpName()%> <%=loginEmp.getEmpId()%>@easy.co.kr</h5>
         <!-- 보내는 사람 정보 영역 시작 -->
         <div class="card-body">
           <div class="d-flex align-items-start align-items-sm-center gap-4">
             <!-- 보내는 사람 사진 -->
             <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/1.png" alt="user-avatar" class="d-block rounded" height="100" width="100" id="uploadedAvatar" />
             <div class="button-wrapper">
               <label for="" class="btn btn-primary me-2 mb-4" tabindex="0">
                 <!-- 내 정보 수정하기 페이지로 이동 -->
                 <span class="d-none d-sm-block">내 정보 수정하기</span>
               </label>
               <p class="text-muted mb-0">부서 : <%=loginEmp.getDeptName() %></p>
               <p class="text-muted mb-0">내선번호 : 02-123-4567</p>
             </div>
           </div>
         </div>
         <!-- 보내는 사람 정보 영역 끝 -->
         
         <hr class="my-0">
         
         <!-- 보내는 영역 시작 -->
         <div class="card-body">
         
            <!-- form 시작 -->
           <form id="formAccountSettings" action="insertMail.do" method="post" enctype="multipart/form-data" onsubmit="return insertMailValidate();">
             <!-- 메일 정보 영역 시작 -->
             <input type="hidden" name="fromMail" value="<%= loginEmp.getEmpNo()%>">
             <div class="row">
               <div class="mb-3 col-md-11">
                 <label for="to" class="form-label">받는사람</label>
                 <input class="form-control" type="text" name="toMail" id="toMail" placeholder="주소록을 통해 입력하세요." value="${ toReply}" readonly required/>
               </div>
               <div class="mb-3 col-md-1">
                 <label for="addressList" class="form-label">&nbsp;</label>
                 <input class="form-control btn-primary" type="button" name="" id="addressList1" value="주소록" data-toggle="modal" data-target="#myModal1"/>
               </div>
               <div class="mb-3 col-md-11">
                 <label for="cc" class="form-label">참조</label>
                 <input class="form-control" type="text" name="ccMail" id="ccMail" placeholder="주소록을 통해 입력하세요." value="${ ccMail }" readonly/>
               </div>
               <div class="mb-3 col-md-1">
                 <label for="addressList" class="form-label">&nbsp;</label>
                 <input class="form-control btn-primary" type="button" name="" id="addressList2" value="주소록" data-toggle="modal" data-target="#myModal2"/>
               </div>
               <div class="mb-3 col-md-3">
                 <label class="form-label" for="typeNo">분류(일반/중요)</label>
                 <select name="typeNo" id="typeNo" class="select2 form-select" required>
                   <option value="N">일반</option>
                   <option value="E">중요</option>
                 </select>
               </div>
               <div class="mb-3 col-md-4">
                 <input type="checkbox" class="form-check-warning" name="ckbox" id="ckbox">
                 <!-- 예약 메일 여부에 대한 y/n 데이터를 넘겨주는 hidden input -->
                 <input type="hidden" name="reserveYn" id="reserveYn" required>
                 <label class="form-label" for="calendar">예약메일</label>
                 <div><input type="date" class="form-control" name="sendDate" id="sendDate"></div>
               </div>
               <div class="mb-3 col-md-7">
                 <label class="form-label" for="upfile">파일첨부<i class="bi bi-upload"></i></label>
                 <div><input type="file" class="form-control" name="uploadFile" id="upfile" /></div>
               </div>
               <div class="mb-3 col-md-12">
                 <label class="form-label" for="title">제목</label>
                 <input class="form-control" type="text" name="title" id="title" value="${ ccTitle }" placeholder="제목을 작성하세요" maxlength="33" required/>
               </div>
               <div class="mb-3 col-md-12">
                 <label class="form-label" for="content">내용</label>
                 <div>
                    <textarea class="form-control" name="content" id="content" rows="10" cols="150" required>
                    	${ ccContent }
                    </textarea>
                 </div>
               </div>
             </div>
             <!-- 메일 정보 영역 끝 -->
             <div class="mt-2">
               <button type="submit" class="btn btn-primary me-2">보내기</button>
               <button type="reset" class="btn btn-danger">다시작성</button>
             </div>
           </form>
           <!-- form 끝 -->
           
         </div>
         <!-- 보내는 영역 끝 -->
       </div>
       <!-- 메일 영역 시작 -->
    
  </div>
   </div>
   <!-- 행 끝 -->

   </div>
   <!-- 컨테이너 끝 -->
   

   <!-- 주소록 클릭시 나오는 모달창 시작 : 받는사람용 -->
   <div class="modal fade" id="myModal1" data-backdrop="static" data-keyboard="false">
       <div class="modal-dialog modal-xl modal-dialog-centered">
         <div class="modal-content">
         
           <!-- Modal Header -->
           <div class="modal-header">
             <h4 class="modal-title">주소록</h4>
             <button type="button" class="close" data-dismiss="modal">&times;</button>
           </div>
           
           <!-- Modal body -->
           <div class="modal-body">
            <!--<button onclick="javascript:window.returnValue='음훼훼';window.close()">부모창 폼에 값넘기기</button>  -->
              <label class="form-label" for="add">받는사람선택</label>
                 <select id="insertAddress1" class="select2 form-select">
               <option value="5">전재은</option>
               <option value="3">김태훈</option>
               <option value="1">김재호</option>
               <option value="4">임현빈</option>
            </select>
         </div>
           
           <!-- Modal footer -->
           <div class="modal-footer">
             <button type="button" class="btn btn-secondary" onclick="insertAddress1();" data-dismiss="modal">선택완료</button>
             <button type="button" class="btn btn-secondary" onclick="deleteAddress1();" data-dismiss="modal">선택취소</button>
           </div>
           
         </div>
       </div>
   </div>
   <!-- 주소록 클릭시 나오는 모달창 끝 : 받는사람용-->
   
   <!-- 주소록 클릭시 나오는 모달창 시작 : 참조인용 -->
   <div class="modal fade" id="myModal2" data-backdrop="static" data-keyboard="false">
       <div class="modal-dialog modal-xl modal-dialog-centered">
         <div class="modal-content">
         
           <!-- Modal Header -->
           <div class="modal-header">
             <h4 class="modal-title">주소록</h4>
             <button type="button" class="close" data-dismiss="modal">&times;</button>
           </div>
           
           <!-- Modal body -->
           <div class="modal-body">
            <!--<button onclick="javascript:window.returnValue='음훼훼';window.close()">부모창 폼에 값넘기기</button>  -->
              <label class="form-label" for="add">참조인선택</label>
                 <table>
                    <tr>
                  <td>
                     <input type="checkbox" id="insertAddress2" name="insertAddress2" value="5">
                     <label for="">전재은</label>
                     
                     <input type="checkbox" id="insertAddress2" name="insertAddress2" value="3">
                     <label for="">김태훈</label>
                     
                     <input type="checkbox" id="insertAddress2" name="insertAddress2" value="1">
                     <label for="">김재호</label>
                     
                     <input type="checkbox" id="insertAddress2" name="insertAddress2" value="4">
                     <label for="">임현빈</label>
                  </td>
               </tr>
                 </table>
         </div>
           
           <!-- Modal footer -->
           <div class="modal-footer">
             <button type="button" class="btn btn-secondary" onclick="insertAddress2();" data-dismiss="modal">선택완료</button>
             <button type="button" class="btn btn-secondary" onclick="deleteAddress2();" data-dismiss="modal">선택취소</button>
           </div>
           
         </div>
       </div>
   </div>
   <!-- 주소록 클릭시 나오는 모달창 끝 : 참조인용 -->
   
   
   <script type="text/javascript">
   
      /* 받는사람 선택 */
      function insertAddress1() {
         var value = $('#insertAddress1').val();
         $('#toMail').val(value);
      }
      
      /* 받는사람 선택 취소 */
      function deleteAddress1() {
         $('#toMail').val("");
      }
      
      /* 참조인 선택  */
      function insertAddress2() {
         
         var value = [];
         
         $('input[name=insertAddress2]:checked').each(function () {
            var v = $(this).val();
            value.push(v);
         })
         
         $('#ccMail').val(value);
         
      }
      
      /* 참조인 선택 취소  */
      function deleteAddress2() {
         $('#ccMail').val("");
      }
      
      /* 예약여부 선택에 따른 달력 표시 */    
      $(document).ready(function () {
    	 $("#sendDate").val(" ");
         $("#sendDate").hide();
         $('#reserveYn').val('N');
         $('#sendDate').attr('required', false);
         
         $("#ckbox").on('click', function () {
            if($(this).prop('checked')){
               alert('예약 메일은 보낸 메일함이 아닌 예약 메일함에서 확인이 가능합니다.');
               $('#reserveYn').val('Y');
               $('#sendDate').attr('required', 'required');
               $("#sendDate").show();
            }else{
               $('#reserveYn').val('N');
               $('#sendDate').attr('required', false);
               $("#sendDate").val(" ");
               $("#sendDate").hide();
            }
         });
      });
      
      function insertMailValidate() {
         
         if($('#toMail').val() == null){
            alert('받는 사람을 선택해주세요.');
            return false;
         }
         if($('#title').val() == null){
            alert('제목을 입력해주세요.');
            return false;
         }
         if($('#content').val() == null){
            alert('내용을 입력해주세요.');
            return false;
         }
         
         return true;
      }
      
      $(document).ready(function(){
          $('#title').keyup(function(){
              if ($(this).val().length > $(this).attr('maxlength')) {
                  alert('제한길이 초과');
                  //chrome에선 maxlength가 5라면 한글이 6자까지 들어가게 되므로 필히 keyup에서 substr을 통해 maxlength의 글자까지 끊어줘야 한다.
                  $(this).val($(this).val().substr(0, $(this).attr('maxlength')));
              }
          });
      });
   </script>
   
   <!-- bottom -->
   <jsp:include page="../common/bottom.jsp"/>
	
</body>
</html>