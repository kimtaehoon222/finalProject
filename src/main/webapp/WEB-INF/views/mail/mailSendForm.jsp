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
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body>
	
   <!-- top -->
   <jsp:include page="../common/top.jsp"/>

   <!-- 컨테이너 시작 -->
   <div class="container-xxl flex-grow-1 container-p-y">
   <h4 class="fw-bold py-3 mb-4">
        <span class="text-muted fw-light"><a href="mailHome.do" style="color:#566a7f;" data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="top" data-bs-html="true" title data-bs-original-title="<i class='bx bx-home bx-xs' ></i><span>메일 홈으로 돌아가기</span>">Email</a> /</span> 작성하기
   </h4>

   <!-- 행 시작 -->
   <div class="row">
      <div class="col-md-12">
       <ul class="nav nav-pills flex-column flex-md-row mb-3">
       	 <!-- "목록으로" Modal 열기  -->
         <li class="nav-item">
         <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#smallModal">목록으로</button>
         </li>
       </ul>
    	
       <!-- "목록으로" 열린 Modal -->
       <div class="modal fade" id="smallModal" tabindex="-1" style="display: none;" aria-hidden="true">
          <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel2">목록으로</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                 <a href="receiveMailList.do?receive=r" class="mb-4"><svg class="bi mb-1" width="1.5em" height="1.5em" fill="currentColor">
                 <use xlink:href="${pageContext.request.contextPath}/resources/kjs_assets/vendors/bootstrap-icons/bootstrap-icons.svg#envelope" />
                 </svg>&nbsp;받은 메일함</a><br>
                 <a href="sendMailList.do?send=s" class="mb-4"><svg class="bi mb-1" width="1.5em" height="1.5em" fill="currentColor">
                 <use xlink:href="${pageContext.request.contextPath}/resources/kjs_assets/vendors/bootstrap-icons/bootstrap-icons.svg#archive" />
                 </svg>&nbsp;보낸 메일함</a><br>
                 <a href="reserveMailList.do?reserve=re" class="mb-4"><svg class="bi mb-1" width="1.5em" height="1.5em"fill="currentColor">
                 <use xlink:href="${pageContext.request.contextPath}/resources/kjs_assets/vendors/bootstrap-icons/bootstrap-icons.svg#info-circle" />
                 </svg>&nbsp;예약 메일함</a><br>
                 <a href="deleteMailList.do?delete=d" class="mb-4"><svg class="bi mb-1" width="1.5em" height="1.5em" fill="currentColor">
                 <use xlink:href="${pageContext.request.contextPath}/resources/kjs_assets/vendors/bootstrap-icons/bootstrap-icons.svg#trash" />
                 </svg>&nbsp;휴지통</a>
              </div>
              <div class="modal-footer">
              </div>
            </div>
          </div>
        </div>
    
       <!-- 메일 영역 시작 -->
       <div class="card mb-4">
         <h5 class="card-header"><%=loginEmp.getEmpName()%> <%=loginEmp.getEmpId()%>@easy.co.kr</h5>
         <!-- 보내는 사람 정보 영역 시작 -->
         <div class="card-body">
           <div class="d-flex align-items-start align-items-sm-center gap-4">
             <!-- 보내는 사람 사진 -->
             <img src="${pageContext.request.contextPath}/resources/emp_files/<%=loginEmp.getChangeName() %>" alt="empPhoto" class="d-block rounded" height="100" width="100" id="uploadedAvatar" />
             <div class="button-wrapper">
               <label for="" class="btn btn-primary me-2 mb-4" tabindex="0" id="myPageUpdate">
                 <!-- 내 정보 수정하기 페이지로 이동 -->
                 <span class="d-none d-sm-block">내 정보 수정하기</span>
               </label>
               <p class="text-muted mb-0">부서 : <%=loginEmp.getDeptName() %></p>
               <p class="text-muted mb-0">내선번호 : <%=loginEmp.getTelNo() %></p>
             </div>
           </div>
         </div>
         <!-- 보내는 사람 정보 영역 끝 -->
         
         <hr class="my-0">
         
         <!-- 보내는 영역 시작 -->
         <div class="card-body">
         
           <!-- form 시작 -->
           <form id="formAccountSettings" action="insertMail.do" method="post" enctype="multipart/form-data" onsubmit="return mailSendValidate();">
             <!-- 메일 정보 영역 시작 -->
             <input type="hidden" name="fromMail" value="<%= loginEmp.getEmpNo()%>">
             <div class="row">
               <div class="mb-3 col-md-11">
                 <label for="to" class="form-label">받는사람</label>
                 <input class="form-control" type="text" name="toMailEmpId" id="toMail" placeholder="주소록을 통해 입력하세요." value="${ toReply}" readonly="readonly"/>
               </div>
               <div class="mb-3 col-md-1">
                 <label for="addressList" class="form-label">&nbsp;</label>
                 <input class="form-control btn-primary" type="button" name="" id="addressList1" value="주소록" data-toggle="modal" data-target="#myModal1"/>
               </div>
               <div class="mb-3 col-md-11">
                 <label for="cc" class="form-label">참조</label>
                 <input class="form-control" type="text" name="ccMailEmpId" id="ccMail" placeholder="주소록을 통해 입력하세요." value="${ ccMail }" readonly/>
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
                 <div data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="right" data-bs-html="true" title data-bs-original-title="<i class='bx bx-envelope bx-xs' ></i><span>예약 메일은 다음날부터 지정 가능합니다.</span>"><input type="date" class="form-control" name="sendDate" id="sendDate" min="" max="" ></div>
               </div>
               <div class="mb-3 col-md-7">
                 <label class="form-label" for="upfile">파일첨부<i class="bi bi-upload"></i></label>
                 <div><input type="file" class="form-control" name="uploadFile" id="upfile" /></div>
               </div>
               <div class="mb-3 col-md-12">
                 <label class="form-label" for="title">제목</label>
                 <input class="form-control" type="text" name="title" id="title" value="${ originTitle }" placeholder="제목을 작성하세요" maxlength="33" required/>
               </div>
               <div class="mb-3 col-md-12">
                 <label class="form-label" for="content">내용</label>
                 <div>
                    <textarea class="form-control" name="content" id="content" rows="10" cols="150" required>${ originContent }</textarea>
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
             <h4 class="modal-title"><b>주소록</b></h4>
             <button type="button" class="close" data-dismiss="modal">&times;</button>
           </div>
           
           <!-- Modal body -->
           <div class="container-xxl flex-grow-1 container-p-y">

			<!-- Accordion -->
			<h5 class="mt-2">수신인(TO) 선택</h5>
			<input type="text" class="form-control mt-1" id="setToEmail" value="" readonly style="border: 1px solid #696cff; color:#696cff;">
			<div class="row">
			  <div class="col-md mb-4 mb-md-0">
			    <small class="text-light fw-semibold">수신인은 1명만 지정이 가능합니다. 이외의 수신인은 참조인으로 선택해주세요.</small><br>
			    <button class="btn btn-outline-primary mt-2" id="selectListDept">부서조회</button>
			    <button class="btn btn-outline-primary mt-2" id="choiceEmployee">직원추가</button>
			    
			    <!-- 부서리스트 영역 시작 -->
			    <div class="accordion mt-3" id="accordionExample">
			      <!-- 부서 1개 시작 -->

			      <!-- 부서 1개 끝 -->
			    </div>
			    <!-- 부서리스트 영역 시작 -->
			  </div>
			</div>
			<!--/ Accordion -->
        </div>
         
         <!-- Modal footer -->
         <div class="modal-footer">
           <button type="button" class="btn btn-secondary" onclick="insertAddress1();" data-dismiss="modal">선택완료</button>
           <button type="button" class="btn btn-secondary" onclick="deleteAddress1();" data-dismiss="modal">선택취소</button>
         </div>
           
         </div>
         <!-- modal content 끝 -->
       </div>
   </div>
   <!-- 주소록 클릭시 나오는 모달창 끝 : 받는사람용-->
   
   
   <!-- 주소록 클릭시 나오는 모달창 시작 : 참조인용 -->
   <div class="modal fade" id="myModal2" data-backdrop="static" data-keyboard="false">
       <div class="modal-dialog modal-xl modal-dialog-centered">
         <div class="modal-content">
         
           <!-- Modal Header -->
           <div class="modal-header">
             <h4 class="modal-title"><b>주소록</b></h4>
             <button type="button" class="close" data-dismiss="modal">&times;</button>
           </div>
           
            <!-- Modal body -->
           <div class="container-xxl flex-grow-1 container-p-y">

			<!-- Accordion -->
			<h5 class="mt-2">참조인(CC) 선택</h5>
			<input type="text" class="form-control mt-1" id="setCcEmail" value="" readonly style="border: 1px solid #696cff; color:#696cff;">
			<div class="row">
			  <div class="col-md mb-4 mb-md-0">
			    <small class="text-light fw-semibold">참조인은 여러명 지정이 가능합니다.</small><br>
			    <button class="btn btn-outline-primary mt-2" id="selectListDept2">부서조회</button>
			    <button class="btn btn-outline-primary mt-2" id="choiceEmployeeList">직원추가/수정</button>
			    
			    <!-- 부서리스트 영역 시작 -->
			    <div class="accordion mt-3" id="accordionExampleList">
			      <!-- 부서 1개 시작 -->

			      <!-- 부서 1개 끝 -->
			    </div>
			    <!-- 부서리스트 영역 끝 -->
			  </div>
			  
			</div>
			<!--/ Accordion -->
        </div>
           
           <!-- Modal footer -->
           <div class="modal-footer">
             <button type="button" class="btn btn-secondary" onclick="insertAddress2();" data-dismiss="modal">선택완료</button>
             <button type="button" class="btn btn-secondary" onclick="deleteAddress2();" data-dismiss="modal">선택취소</button>
           </div>
           
         </div>
       </div>
   </div>
		
   <script type="text/javascript">
      /* 마이 페이지로 이동 */
	  $(document).ready(function() {
	    $('#myPageUpdate').click(function() {
	    	location.href="myPage.do";
	    })
	  });
      
   /* 예약날짜 min 지정*/   
   $(document).ready(function () {
	   
	    /* 지금 날짜를 밀리초로 얻는다. */
	    var now_utc = Date.now();
	    
	    /* 분단위를 밀리초로 변환 
	       getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환 */
	    /* 오늘 이후 부터 되어야 하므로 하루 밀리초(86400000)를 빼준다. (차이를 좁혀야 하므로 빼준다.) */   
		var timeOff = (new Date().getTimezoneOffset()*60000)-86400000; 
	    
	    /* new Date(now_utc-timeOff).toISOString()은 '2022-06-21T19:24:38.134Z'를 반환 */
		var today = new Date(now_utc-timeOff).toISOString().split("T")[0];

	    console.log(today);
		document.getElementById("sendDate").setAttribute("min", today);
   })
   
     /* form 데이터 유효성 검사 */
   	 function mailSendValidate() {
		var toMailCheck = document.getElementById("toMail").value;
		
		if(!toMailCheck){
			alert('주소록을 통해 받는 사람을 입력해주세요!');
			$('#toMail').focus();
			return false;
		}
	}   
   
   
      /* 부서 조회 Ajax*/
      $(function () {
		$('#selectListDept').click(function () {
			
			$.ajax({
				url: "deptList.do",	
				type: "post",
				success: function(list) {
					var result = "";
					const element = document.getElementById('accordionExample');
					
	 					$.each(list, function(i) {
							result += '<div class="card accordion-item active">' 
							  	   + '<h2 class="accordion-header" id="headingOne">'
							  	   + '<button type="button" onclick="test(this);" class="accordion-button" data-bs-toggle="collapse" data-bs-target="#' + list[i].deptName + '" aria-expanded="true" aria-controls="' + list[i].deptName + '">'
					               + '<b style=color:#696cff;>' + list[i].deptName +  '</b>'
					               + '</button>'
					               + '</h2>'
					               + '<div id="' + list[i].deptName + '" class="accordion-collapse collapse" data-bs-parent="#accordionExample">'
					               + '<div class="accordion-body mb-2">'
					               + '</div>'
					               + '</div>'
						           + '</div>';
						})
					
					/*결과 출력*/ 
					element.innerHTML = result;
				},
				
				error: function(list) {
					element.innerHTML = "실패";
				}
				
			})

		})
	})
	
	/* 직원 조회 Ajax : 수신인 용 */
	function test(e) {
		console.log('직원호출');
		console.log(e);
		
		var selectDept = e.innerText;
		console.log(selectDept);
			
		$.ajax({
			url: "employeeList.do",
			data:{
				selectDept : selectDept
			},
			type: "post",
			success: function(list) {
				var result = "";
				const element = document.getElementById(selectDept);
				
				console.log(element);
				//console.log(list);
				
				if(list.length > 0){
	
					$.each(list, function(i) {
						//console.log(result);
						result += '<input type="radio" name="empToId" class="getToEmail mx-2 mb-1" value="' + list[i].empId + '">' + list[i].empName + '&nbsp;&nbsp;['+ list[i].empId + ']<br>'
					})
					
				}else{
					alert('선택하신 부서 [' + selectDept + '] 에는 조회된 직원이 없습니다.');
				}
				
				//결과 뿌려지는 곳
				//$("#accordionExample").val(result)
				element.innerHTML = result;
			},
			
			error: function(list) {
				element.innerHTML = "실패";
			}
			
		})
	}
	
      /* 수신인 선택 */
      /* 1.modal 주소록에서 받는 사람 선택하면 modal안의 input으로 값이 들어간다. */ 
	  $(document).ready(function() {
	    $('#choiceEmployee').click(function() {
	    	console.log("확인");
	    	
	    	var value = $("input[type=radio][name=empToId]:checked").val();
	    	
	    	if(value != null){
		        $('#setToEmail').val(value);
	    	}else{
	    		alert('선택하신 직원이 없습니다. 부서조회를 통해 선택하세요.');
	    	}
	    })
	  });
   
      /* 2.위 1번 modal에서 선택완료 클릭시 해당 페이지의 input으로 값이 들어온다. */
      function insertAddress1() {
         var value = $('#setToEmail').val();
         $('#toMail').val(value);
      }
      
      /* 3.수신인 선택 취소 */
      function deleteAddress1() {
    	 $('#setToEmail').val("");
         $('#toMail').val("");
         $('input:radio[name=empToId]').prop('checked', false);
      }
      
      ////////////////////////////////////////////////////////////////////////////////////////////////////////////
      
      /* 부서 조회 Ajax : 참조인 용*/
      $(function () {
  		$('#selectListDept2').click(function () {
  			
  			$.ajax({
  				url: "deptList.do",	
  				type: "post",
  				success: function(list) {
  					var result = "";
  					const element2 = document.getElementById('accordionExampleList');
  					
  						console.log(element2);
  	 					$.each(list, function(i) {
  							result += '<div class="card accordion-item active">' 
							  	   + '<h2 class="accordion-header" id="' + i + '">'
							  	   + '<button type="button" onclick="test2(this);" class="accordion-button" data-bs-toggle="collapse" data-bs-target="#' + list[i].deptName + '" aria-expanded="true" aria-controls="' + list[i].deptName + '">'
					               + '<b style=color:#696cff;>' + list[i].deptName + '</b>'
					               + '</button>'
					               + '</h2>'
					               + '<div id="' + list[i].deptName +'" class="accordion-collapse collapse" aria-labelledby="' + i + '">'
					               + '<div class="accordion-body mb-2" >'
					               + '</div>'
					               + '</div>'
						           + '</div>';
  						})
  					
  					/*결과 출력*/ 
  					element2.innerHTML = result;
  				},
  				
  				error: function(list) {
  					element2.innerHTML = "실패";
  				}
  				
  			})

  		})
  	})
  	
    /* 직원 조회 Ajax : 참조인 용 */
	function test2(e) {
		console.log('직원호출');
		console.log(e);
		
		var selectDept2 = e.innerText;
		console.log(selectDept2);
			
		$.ajax({
			url: "employeeList.do",
			data:{
				selectDept : selectDept2
			},
			type: "post",
			success: function(list) {
				var result = "";
				const element2 = document.getElementById(selectDept2);
				
				console.log(element2);
				//console.log(list);
				
				if(list.length > 0){
	
					$.each(list, function(i) {
						result += '<input type="checkbox" name="empCcId" class="getCcEmail mx-2 mb-1" value="' + list[i].empId + '">' + list[i].empName + '&nbsp;&nbsp;['+ list[i].empId + ']<br>';
						//console.log(result);
					})
					
				}else{
					alert('선택하신 부서 [' + selectDept2 + '] 에는 조회된 직원이 없습니다.');
				}
				
				//결과 뿌려지는 곳
				//$("#accordionExample").val(result)
				element2.innerHTML = result;
			},
			
			error: function(list) {
				element2.innerHTML = "실패";
			}
			
		})
	}  
      
      
      /* 참조인 선택 */
      /* 1.modal 주소록에서 받는 사람 선택하면 modal안의 input으로 값이 들어간다. */ 
	  $(document).ready(function() {
	    $('#choiceEmployeeList').click(function() {
	    	var value = [];
	    	
	    	$('input[name=empCcId]:checked').each(function () {
	            var v = $(this).val();
	            value.push(v);
	         })
	         
	         if(value.length == 0){
	    		alert('선택하신 직원이 없습니다. 부서조회를 통해 선택하세요.');
	         }else{
		        $('#setCcEmail').val(value);
	         }
	    	
	    })
	   });
      
	  /* 2.위 1번 modal에서 선택완료 클릭시 해당 페이지의 input으로 값이 들어온다. */
      function insertAddress2() {
	  	  var value = $('#setCcEmail').val();
	      $('#ccMail').val(value);
      }
      
      /* 3.참조인 선택 취소  */
      function deleteAddress2() {
    	  $('#setCcEmail').val("");
    	  $('#ccMail').val("");
          $('input:checkbox[name=empCcId]').prop('checked', false);
      }
      
      
      /* 예약여부 선택에 따른 달력 표시 */    
      $(document).ready(function () {
    	 $("#sendDate").val(" ");
         $("#sendDate").hide();
         $('#reserveYn').val('N');
         $('#sendDate').attr('required', false);
         
         $("#ckbox").on('click', function () {
            if($(this).prop('checked')){
               //alert('예약 메일은 지정한 날짜의 9:00에 발송됩니다.');
               Swal.fire({
            	   title: '※ 필수확인 ※',
            	   text: "예약 메일은 지정한 날짜의 9:00에 발송됩니다.",
            	   icon: 'warning',
            	   showCancelButton: true,
            	   confirmButtonColor: '#3085d6',
            	   cancelButtonColor: '#d33',
            	   confirmButtonText: '확인',
            	   cancelButtonText: '취소'
          	 	}).then((result) => {
            	   if (result.isConfirmed) {
            		   $('#reserveYn').val('Y');
                       $('#sendDate').attr('required', 'required');
                       $("#sendDate").show();
            	   }
            	 })
               
            }else{
               $('#reserveYn').val('N');
               $('#sendDate').attr('required', false);
               $("#sendDate").val(" ");
               $("#sendDate").hide();
            }
         });
      });
      
      /* 제목 길이 제한 */
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