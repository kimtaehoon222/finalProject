<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="${ pageContext.servletContext.contextPath }/resources/kth_assets/images/favicon.png">

<style>
.ps-scrollbar-x-rail {
	bottom: 0px;
}
.ps-scrollbar-y-rail {
	top: 0px;
}
.nameList:hover{
	font-weight:bold;
	
}
</style>

<title>채팅</title>
<!-- This page css -->

<!--     부트스트랩5
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" 
	rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" 
	crossorigin="anonymous"> -->

<!-- Custom CSS -->
<link
	href="${ pageContext.servletContext.contextPath }/resources/kth_dist/css/style.min.css"
	rel="stylesheet">


<style>
.contectDeptList button:hover {
	font-weight: bold;
}
.accordion {<%-- 지워도 된다.--%>
	height: 80px;
}
.accordion-button { <%-- 지워도 된다.--%>
	height: 60px;
}
</style>

</head>

<body>




	<!-- ============================================================== -->
	<!-- Preloader - style you can find in spinners.css -->
	<!-- ============================================================== -->
	<div class="preloader">
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- Main wrapper - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<div id="main-wrapper" data-theme="light" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed"
		data-boxed-layout="full">
		<!-- ============================================================== -->
		<!-- Topbar header - style you can find in pages.scss -->
		<jsp:include page="../common/top.jsp" />
		<!-- End Topbar header -->
		<!-- ============================================================== -->
		<!-- 팝업 공지  -->


		<!-- Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->

		<!-- ============================================================== -->
		<!-- End Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper">


			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-7 align-self-center">
						<h4
							class="page-title text-truncate text-dark font-weight-bold mb-1">채팅</h4>
						<div class="d-flex align-items-center">
							<nav aria-label="breadcrumb">
								
							</nav>
						</div>
					</div>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid"
				style="padding-left: 70px; padding-right: 70px;">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="row no-gutters">

								<!-- 주소록 -->
								<div class="col-lg-5 col-xl-3 border-right">
									<div class="card-body">
										<h3
											style="color: #1C2D41; font-weight: bold; display: inline;">주소록</h3>
										<select
											style="height: 35px; width: 100px; font-size: 13px; position: absolute; right: 10px; color: #5F76E8;"
											class="mr-sm-2 custom-select form-control bg-white custom-radius custom-shadow border-1"
											name="status" id="status" >
											<option value="1" selected>온라인</option>
											<option value="2">자리 비움</option>
										</select>



									</div>
									<div class="scrollable position-relative"
										style="height: calc(100vh - 400px);">


										<ul class="mailbox list-style-none" id="contectListArea">
									

										</ul>
									</div>
								</div>
								<!--  채팅화면 -->
								<div class="col-lg-7  col-xl-9">

									<div class="border-bottom" style="padding: 15px; height: 90px;">


										

										<div style="float: left; margin-left: 10px;">
											<c:choose>
												<c:when test="${not empty toChat }">
												<div style="float: left;">
													<img
														src="${pageContext.request.contextPath}/resources/emp_files/${toChat.changeName}"
														alt="user" class="w-px-50 h-px-50 rounded-circle" width="65">
												</div>
													<span id='receiverName'
														style="font-size: 22px; color: #1c2d41; font-weight: bold;">${ toChat.empName}</span>
													<span id="job" style="font-size: 16px;">${ toChat.jobName}</span>
													<br>
													<span id="dept" style="font-size: 12px;"> ${ toChat.deptName}</span>
													<input id="receiver" type="hidden" name="receiver"
														value="${toChat.empNo }" />
														
														<input id="receiverId" type="hidden" name="receiverId"
														value="${toChat.empId }" />
												
				
												</c:when>
												<c:otherwise>
												<div style="float: left;">
													<img
														src="${ pageContext.servletContext.contextPath }/resources/assets/img/avatars/8.png"
														alt="user" class="rounded-circle" width="65">
												</div>

													<span style="font-size: 15px;"><i class="icon-clock"></i>
														 채팅 내역은 일주일 동안 보존됩니다.</span>
													<br>
													<span style="font-size: 15px;">이후에는 자동으로 삭제 되므로,</span>
											
													<span style="font-size: 15px;"> 이전 기록이 필요하시면 보안실로 문의 해 주세요.</span>
												</c:otherwise>


											</c:choose>
										</div>
									</div>
										<!--  <div id="chatAlert" style="display:none;" class="alert alert-dark alert-dismissible fade show mb-0" role="alert">
		                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
		                                        <span aria-hidden="true">×</span>
		                                    </button>
		                                    <strong>새로운 메세지 도착 </strong>
		                                </div>-->
		                                
		                                <div id="chatAlert"  style="display:none;" class="alert alert-primary alert-dismissible" role="alert">
								          <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
								          </button>
								        </div>
									<div class="chat-box scrollable position-relative"
										style="height: calc(100vh - 400px); ">

										<!--chat Row -->
										<ul class="chat-list list-style-none px-3 pt-3">


											<!-- 이전 기록 조회 -->
											<c:forEach items="${ chatList }" var="c">
												<c:if test="${ c.fromChat eq loginEmp.empNo }">
													<li class="chat-item odd list-style-none mt-3">
														<div class="chat-content text-right d-inline-block pl-3">
															<div class="box msg p-2 d-inline-block mb-1">${c.message}
															</div>
															<br>
														</div>
													</li>
												</c:if>
												<c:if test="${ c.fromChat ne loginEmp.empNo }">
													<li class="chat-item list-style-none mt-3">
														<div class="chat-img d-inline-block">
															<img
																src="${pageContext.request.contextPath}/resources/emp_files/${c.changeName}"
																alt="user" class="rounded-circle" width="45">
														</div>
														<div class="chat-content d-inline-block pl-3">
															<div class="msg p-2 d-inline-block mb-1">${c.message}</div>
														</div>

													</li>
												</c:if>


											</c:forEach>

											<!-- 메시지 올라오는 화면 -->
										</ul>
									</div>
									
										<c:if test="${not empty toChat }">
										<div class="card-body border-top">
											<div class="row">
												<div class="col-9">
													<div class="input-field mt-0 mb-0">
														
															<input placeholder="메세지를 입력하세요."
																class="form-control border-0" id="message" type="text">
														
														
													
													</div>
												</div>
												<div class="col-3">
													 <button type="button" class="btn btn-primary" id="sendBtn">전송</button>
												</div>
											</div>
										</div>
								   </c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- End Container fluid  -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- footer -->
			<!-- ============================================================== -->
				<jsp:include page="../common/bottom.jsp" />
			<!-- ============================================================== -->
			<!-- End footer -->
			<!-- ============================================================== -->
		</div>
		<!-- ============================================================== -->
		<!-- End Page wrapper  -->
		<!-- ============================================================== -->
	</div>
	<!-- ============================================================== -->
	<!-- End Wrapper -->
	<!-- ============================================================== -->
	<!-- End Wrapper -->
	<!-- ============================================================== -->
	<!-- All Jquery -->
	<!-- ============================================================== -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/kth_assets/libs/jquery/dist/jquery.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/kth_assets/libs/popper.js/dist/umd/popper.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/kth_assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- apps -->
	<!-- apps -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/kth_dist/js/app-style-switcher.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/kth_dist/js/feather.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/kth_assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/kth_dist/js/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/kth_dist/js/custom.min.js"></script>
	<!--This page JavaScript -->

<script>

$("#status").on('change',function(){
	var sNo = $(this).val();
 	var empNo = '${ loginEmp.empNo }';
 	console.log(sNo);
 	console.log(empNo);
	$.ajax({
		url:'updateStatus.do',
		data: {
			sNo : sNo,
			empNo : empNo
			
		},
		type:'post',
		success:function(result){
			console.log("result " + result);
			if(result <= 0){
				alert(" 상태를 바꿀 수 없습니다. 관리자에게 문의 바랍니다.");
			}
		},error:function(){
			alert("상태를 바꿀 수 없습니다. 관리자에게 문의 바랍니다.");
		}
	
	})
});




	$(function(){
		
		selectDeptList();
		
		var reFresh = setInterval(function(){
        	selectDeptList();
	    }, 50000)
		
	});
	
	
	
	
	let target = document.querySelector('.chat-list');
	// 감시자 인스턴스 만들기
	let observer = new MutationObserver((mutations) => {
	    // 노드가 변경 됐을 때의 작업
	    
	    //새로운 메세지 오면 스크롤바 제일 아래로
	      $('.chat-list').parent().animate({
	          scrollTop: $('.chat-list').height()
	        }, 300);
	    
	})
	// 감시자의 설정
	let option = {
	    attributes: true,
	    childList: true,
	    characterData: true
	};
	// 대상 노드에 감시자 전달
	observer.observe(target, option);
	
	
    $('#message').on('keypress',function(e){
        if (e.keyCode == 13) {
            var message = $(this).val();
            var receiver = $("#receiver").val();
            
               sendAjax(message);

            $(".chat-list").append( 
                   `
                 <li class="chat-item odd list-style-none mt-3">
						<div class="chat-content text-right d-inline-block pl-3">	
							<div class="box msg p-2 d-inline-block mb-1">\${message}</div>
							<br>
						</div>
					</li>`
                   );
           $(this).val("");
           $(this).focus(); 
       }
        
	});
		var selectDeptList = function(){
			
		var contectList = $("#contectListArea");
		contectList.empty();
		
		$.ajax({
			url:"chDeptList.do",
			type:"post",
			dataType:"json",
			success : function(list){
				list.forEach((d => {

					console.log("list 들어오나 확인" + list)
        			contectList.append(
                            `<li>
	                            <a href="#"
	                                class="message-item d-flex align-items-center border-bottom px-3 py-2">
	                                <i class="icon-menu" style="font-size:11px;"></i> &nbsp;&nbsp;&nbsp;
	                                  <span class="message-title mb-0 mt-1" style="font-size:19px;">\${d.deptName}</span>
	                            </a>
	                            <ul id="\${d.deptName}">
	                           </ul>
                          </li>`
        					)
   					console.log(d.deptName)
					selectContectList(d.deptName); 
         		}));  
	 
			}
			
		})
	}
		
    
		function selectContectList(deptName){
		        	
        	var deptArea = $("#"+deptName);
        	var deptName = deptName;
        	$.ajax({
        		url:'contect.do',
        		type:'post',
        		dataType:'json',
        		data:{
        			deptName : deptName
        		},
        		success : function(list){
              		list.forEach((e => {
              			if(e.empNo != "${ loginEmp.empNo }"){//값이 넘어온 사원 번호가 session에 empNo랑 같지 않으면 
              		 
              				deptArea.append(`
    								<div style="margin-left:20px;">
            							<a href="chat.do?empNo=\${e.empNo}">
    	        								<li class="nameList">
    	    											<span style="font-size:16px; color:#1C2D41;">\${e.empName}</span>
    	    											<span style="font-size:10px; color:rgb(124, 127, 251); display:inline-block; margin-left:10px;">(\${e.sName})</span>
    	    									</li>
    									</a>
    								</div>
    								`)
              			}
            		}));
        		}
        	})
        	
        	
        	

        }

		
	       var sendAjax = function(message){
	    		
	    		
	           
	           
	           
	           var message = message;
	        	var toChat = $("#receiver").val();
	         	var receiverId = $("#receiverId").val();
	         	var fromChat = '${ loginEmp.empNo }';
	        	var senderId = '${ loginEmp.empId }';
	                       
	               $.ajax({
	                  url:'sendMessage.do',
	                  type:'post',
	                  data:{
	                     message : message,
	                     toChat : toChat,
	                     fromChat : fromChat
	                  },
	                  success:function(result){
	                     if(result == 1){
	                     
	                    	
	                    	 socket.send(senderId +"," + receiverId+","+fromChat +"," + message);
	                    	console.log("socket 들어오나 확인" + socket)
	                     }else{
	                        alert("현재 서버오류로 채팅이 불가합니다.");
	                     }
	                  }
	               }) 
	              
	         }
	     
		
		
		
</script>
</body>

</html>