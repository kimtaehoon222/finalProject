<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.workie.easy.work.model.dto.VacationInfo" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연차 내역</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/img/logo/W.png" /> 
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
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/kjs_assets/images/favicon.svg"
	type="image/x-icon">
<style>

a {
    color: #435ebe;
    /* text-decoration: underline; */
}
</style>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body onload="printClock()">
	<jsp:include page="../common/top.jsp"/>
 

	<div class="container-xxl flex-grow-1 container-p-y">

		<div class="page-heading email-application">
			<div class="page-title">
				<div class="row">
					<div class="col-12 col-md-6 order-md-1 order-last">
						<h3>연차 내역</h3>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
						</nav>
					</div>
				</div>
			</div>

			<!-- 영역 :왼쪽 근태관리 사이드 바  ,  오른쪽 근태 상세 정보 -->
			<section class="section content-area-wrapper">
			<div>
				<jsp:include page="../work/workSidebarView.jsp" >
					<jsp:param value="${w}" name="w"/>
				</jsp:include>
			
			</div>

		

				<!-- 연차내역(오른쪽 영역) 시작 -->
				<div class="content-right">
					<div class="content-wrapper">
						<div class="content-body">
							<!-- email app overlay -->
							<div class="email-app-area">

								<!-- Email list Area -->
								<div class="email-app-list-wrapper">
									<div class="email-app-list">
									
										<!-- 연차 내역 상단에 날짜 시작 -->
									    <div class="row">
									 
											<div class="m-auto">
												<!--  <span>2022.06</span>-->
												<!--  <h5>2022.06</h5>-->
											   <c:set var="today" value="<%= new java.util.Date() %>"/>
											   <p style="font-size:14px"><fmt:formatDate value="${today}" type="date" pattern="yyyy.MM"/></p>
											</div>
										</div>
										<!-- 연차 내역 상단에 날짜 시작 -->
										
										<!-- 연차 내역  상단 시작(로그인된 유저의 정보) -->
										<div class="email-action">
												<img
												src="${pageContext.request.contextPath}/resources/emp_files/${loginEmp.changeName}"
												alt="user" class="rounded-circle" width="65">
												<div class="col-3 m-auto" style="height:100%; padding:10px 0px">
											
													<p class="text-center m-auto" style="font-size:18px">${loginEmp.empName} ${loginEmp.jobName}</p>
												</div>
												<div class="col-3 m-auto" style="height:100%; padding:10px 0px">
													<p class="text-center m-auto" style="font-size:18px">총 연차</p>
													<p class="text-center m-auto text-primary">${vInfo.allDays}</p>
												</div>
											
												<div class="col-3 m-auto" style="height:100%; padding:10px 0px">
													<p class="text-center m-auto" style="font-size:18px">잔여 연차</p>
													<p class="text-center m-auto text-primary">${vInfo.leftDays}</p>
												</div>
										

											<!-- action right start here -->
									
										</div>
										<!-- 연차 내역  상단 시작(로그인된 유저의 정보) -->

										<!-- 연차 내역 가운데 시작(상세 정보) 시작-->
										<div class="email-user-list list-group ps ps--active-y">
										<div class="dataTable-container">
											<table class="table table-striped dataTable-table" id="table1">
			                                <thead>
			                                	<br><br>
			                                	<h4>사용내역</h4>
			                                    <tr>
			                                    	<th data-sortable="" style="width: 11.8062%;"><a href="#" class="dataTable-sorter">부서명</a></th>
				                                    <th data-sortable="" style="width: 41.8502%;"><a href="#" class="dataTable-sorter">사용 기간</a></th>
				                                    <th data-sortable="" style="width: 18.8546%;"><a href="#" class="dataTable-sorter">휴가 종류</a></th
				                                    ><th data-sortable="" style="width: 16.3877%;"><a href="#" class="dataTable-sorter">일 수</a></th>
				                                    <th data-sortable="" style="width: 11.1013%;"><a href="#" class="dataTable-sorter">내용</a></th>
			                                    </tr>
			                                    
			                                    
			                                </thead>
			                                
			                                <tbody>
			                                <c:forEach items="${empVlist}" var="vacation">
				                                <tr>
				                                	<c:set var="dept" value="${vacation.deptName }"/>
				                                	<c:choose> 
				                                		<c:when test="${empty dept}">
				                                			<td>부서 미정</td>
				                                		</c:when>
				                                		<c:otherwise>
					                                		<td>${vacation.deptName}</td>
					                              	  </c:otherwise>
					                                </c:choose>
					                                <td>${vacation.firstDate} ~ ${vacation.lastDate}</td>
					                                <td>${vacation.VName}</td>
						                           <c:if test="${vacation.VName eq '연차'}">
	                                               <td>${vacation.usingDay}</td>
	                                               </c:if>
	                                               <c:if test="${vacation.VName ne '연차'}">
	                                               <td>${vacation.HDay}</td>
	                                               </c:if>
	                                               <td>${vacation.reason}</td>
					                            </tr>
					                          </c:forEach>
					                          
				                           </tbody>
				                       
			                            </table>
                           			 </div>
										</div>
									<!-- 연차 내역 가운데 시작(상세 정보) 시작-->
									</div>
								</div>
								<!--/ Email list Area -->

							</div>
						</div>
					</div>
				</div>
				<!-- 연차내역(오른쪽 영역) 끝 -->
			</section>
		</div>
	</div>





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
	<!--  -->
	<script
		src="${ pageContext.servletContext.contextPath }/resources/summernote/summernote-lite.js"></script>
	<script
		src="${ pageContext.servletContext.contextPath }/resources/summernote/lang/summernote-ko-KR.js"></script>
	



	
	<jsp:include page="../common/bottom.jsp"/>
</body>
</html>