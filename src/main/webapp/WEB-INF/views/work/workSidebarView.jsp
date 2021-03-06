<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/kjs_assets/css/pages/email.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/kjs_assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/kjs_assets/vendors/bootstrap-icons/bootstrap-icons.css">

<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/kjs_assets/images/favicon.svg"
	type="image/x-icon">
<style>
	.accordion-button.collapsed:focus {
    box-shadow: none;
}
.accordion-item:first-of-type .accordion-button {
    border-top-left-radius: .375rem;
    border-top-right-radius: .375rem;
}
button:focus:not(:focus-visible) {
    outline: 0;
}
.accordion-button.collapsed {
    border-radius: .375rem;
}
.accordion-button:focus {
    z-index: 3;
    border-color: rgba(249,249,255,.54);
    outline: 0;
    box-shadow: none;
}
.accordion-button:hover {
    z-index: 2;
}
button:not(:disabled), [type=button]:not(:disabled), [type=reset]:not(:disabled), [type=submit]:not(:disabled) {
    cursor: pointer;
}

	.inner:hover{
		color: rgb(95,118,232);
		cursor: pointer;
	}
	
	#status{
		display:none;
		position:absolute;
	}
	
	.selects1:hover, .selects2:hover, .selects3:hover, .selects4:hover, .selects5:hover{
		background-color: rgba(95,118,232, 0.1);
	}
	
	.week, .selects1, .selects2, .selects3, .selects4, .selects5{
		display:none;
	}
	
	.today{
		background-color: rgba(95,118,232);
		color : white;
		border-radius : 8px;
		padding: 1px;
	}
	

</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body onload="printClock()">

<div class="page-heading email-application">
		<div class="sidebar-left">
					<!-- sidebar start -->
					<div class="sidebar">
						<div class="sidebar-content email-app-sidebar d-flex">


							<!-- email-app-menu start -->
							<div class="email-app-menu">
								<div class="form-group form-group-compose">
									<c:set var="today" value="<%= new java.util.Date() %>"/>
								<p style="font-size:14px"><fmt:formatDate value="${today}" type="date" pattern="yyyy-MM-dd (E)"/></p>
								<p id="clock" style="font-size:40px"></p>
								</div>

								<div class="sidebar-menu-list ps">
									<!-- ?????? ???????????? ?????? -->
									<div class="list-group list-group-messages">
										
											<div class="fonticon-wrap d-inline me-3">
												<div>
													<div class="d-flex" style="font-size: 12px">
														<p class="col-6" style="padding:0px; font-size:15px">????????????</p>
														<c:choose>
															<c:when test="${empty w.startTime }">
																<p class="col-6 text-right" style="padding:0px; font-size:15px">?????????</p>
															</c:when>
															<c:otherwise>
																<p class="col-6 text-right" style="padding:0px; font-size:15px">${w.startTime}</p>
															</c:otherwise>
														</c:choose>
													</div>
													<div class="d-flex" style="font-size: 12px">
														<p class="col-6" style="padding:0px; font-size:15px">????????????</p>
															<c:choose>
															<c:when test="${empty w.endTime }">
																<p class="col-6 text-right" style="padding:0px; font-size:15px">?????????</p>
															</c:when>
															<c:otherwise>
																<p class="col-6 text-right" style="padding:0px; font-size:15px">${w.endTime}</p>
															</c:otherwise>
														</c:choose>
														
													</div>
		
												</div>
												<form method="get" action="update.do">
													<div class="d-flex align-items-center">
													
													
													<!-- choose when?????? ??????????????? ????????? ???????????? ???????????? -->
													<!-- ??????,??????????????? ????????? ???????????? ???????????? -->
													<!-- ??????,??????????????? ????????? ??????,???????????? ???????????? -->
													<!-- disabled ?????? ??????.-->
													<c:choose>
														<c:when test="${empty w.startTime }">
															<button type="submit" class="btn btn-rounded btn-outline-primary col-6" style="margin:2px" value="1" name="status">????????????</button>
															<button type="submit" class="btn btn-rounded btn-outline-primary col-6" style="margin:2px" value="2" name="status" disabled>????????????</button>
														</c:when>
														<c:when test="${not empty w.startTime && empty w.endTime}">
															<button type="submit" class="btn btn-rounded btn-outline-primary col-6" style="margin:2px" value="1" name="status" disabled>????????????</button>
															<button type="submit" class="btn btn-rounded btn-outline-primary col-6" style="margin:2px" value="2" name="status">????????????</button>
														</c:when>
														<c:otherwise>
															<button type="submit" class="btn btn-rounded btn-outline-primary col-6" style="margin:2px" value="1" name="status" disabled>????????????</button>
															<button type="submit" class="btn btn-rounded btn-outline-primary col-6" style="margin:2px" value="2" name="status" disabled>????????????</button>
														</c:otherwise>
													</c:choose>
												
													</div>
											
													<input type="hidden" name="workNo" value="${w.workNo}">
												</form>
											</div> 
											<div class="list-group"> 
												<a href="work.do" class="list-group-item">??? ?????? ??????</a>
											    <a href="vacation.do" class="list-group-item">??? ?????? ??????</a>  
										    </div>					
					
					
									</div>
									<!-- ?????? ???????????? ??? -->
								</div>

							</div>
							<!-- email-app-menu end -->

						</div>
					</div>
					<!-- sidebar end -->
				</div>
				</div>
				<script>
 		//????????? ??? ?????? ??????
		$(function(){
			$("#status").css("z-index","1")
			$(".list-group").css("z-index","0")
			$(".card-title").css("z-index","0")
			
			$("#selectStatus").click(function(){
				if($("#status").css("display") == "none") {
					$("#status").show();
					
					var width = $("#selectStatus").css("width");
					
					$("#status").css("width", width)
				}
				
				else {
					$("#status").hide();
				}
			})
			
		})
		
		// ???????????? ????????????
		function printClock() {
		    //?????? ??????
		    var clock = document.getElementById("clock");
		    //?????? ????????? currentDate??? ??????
		    var currentDate = new Date();	
		    //?????? ????????? calendar??? ??????
		    var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate()
			//??????
		    var currentHours = addZeros(currentDate.getHours(),2); 
			//???
		    var currentMinute = addZeros(currentDate.getMinutes() ,2);
			//???
		    var currentSeconds =  addZeros(currentDate.getSeconds(),2);
			
		    if(currentHours >= 18 && currentMinute >= 00 && currentSeconds >= 00){// ???????????? 18??? ???????????? ??????????????? ??? ??????
		    	currentHours = '<span style="color:#de1951;">'+currentHours+'</span>'
		    	currentMinute = '<span style="color:#de1951;">'+currentMinute+'</span>'
		    	currentSeconds = '<span style="color:#de1951;">'+currentSeconds+'</span>'
		     }

		    
		    clock.innerHTML = currentHours+":"+currentMinute+":"+currentSeconds; //????????? ????????? ???
		    
		    setTimeout("printClock()",1000);         // 1????????? printClock() ?????? ??????
		    
		    function addZeros(num, digit) { // ????????? ????????????
			  	var zero = '';
			  	num = num.toString();
			  	if (num.length < digit) {
				  	for (i = 0; i < digit - num.length; i++) {
				  		zero += '0';
				  	}
			  	}
			  	return zero + num;
			}
		}
	</script>
	
	
	


	<script
		src="${pageContext.request.contextPath}/resources/kjs_assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/kjs_assets/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/kjs_assets/js/main.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/kth_assets/libs/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap tether Core JavaScript -->
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
	<!-- slimscrollbar scrollbar JavaScript -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/kth_assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/kth_assets/extra-libs/sparkline/sparkline.js"></script>
	<!--Wave Effects -->
	<!-- themejs -->
	<!--Menu sidebar -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/kth_dist/js/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/kth_dist/js/custom.min.js"></script>
</body>
</html>