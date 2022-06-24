<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.workie.easy.employee.model.dto.Employee" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String contextPath = request.getContextPath();
	Employee loginEmp = (Employee)session.getAttribute("loginEmp");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일 상세보기</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/kjs_assets/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/kjs_assets/css/pages/email.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/kjs_assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/kjs_assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/kjs_assets/css/app.css">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/kjs_assets/images/favicon.svg"
	type="image/x-icon">
</head>
<body>

   <jsp:include page="../common/top.jsp"/>

	<form>
	<div class="container-xxl flex-grow-1 container-p-y">

		<div class="page-heading email-application">
			<div class="page-title">
				<div class="row">
					<div class="col-12 col-md-6 order-md-1 order-last">
						<h3><a href="mailHome.do" style="color:#566a7f;">Email</a></h3>
					</div>
					<div class="col-12 col-md-6 order-md-2 order-first">
						<nav aria-label="breadcrumb"
							class="breadcrumb-header float-start float-lg-end">
						</nav>
					</div>
				</div>
			</div>

			<!-- 내용 영역 : 좌측은 메일 사이드바, 우측은 메일 리스트 -->
			<section class="section content-area-wrapper">

				<!-- 좌측 : 메일 사이드바 시작 -->
				<div class="sidebar-left">
					<!-- sidebar start -->
					<div class="sidebar">
						<div class="sidebar-content email-app-sidebar d-flex">

							<!-- email-app-menu start -->
							<div class="email-app-menu">
								<div class="form-group form-group-compose">
									<!-- 작성하기 버튼  -->
									<a href="mailSendForm.do" class="btn btn-primary btn-block my-4 compose-btn" id="center">작성하기</a>
								</div>

								<div class="sidebar-menu-list ps">
									<!-- 메일 사이드바 시작 -->
									<div class="list-group list-group-messages">
										<a href="receiveMailList.do?receive=r" class="list-group-item">
											<div class="fonticon-wrap d-inline me-3">
												<svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                            		<use xlink:href="${pageContext.request.contextPath}/resources/kjs_assets/vendors/bootstrap-icons/bootstrap-icons.svg#envelope" />
                                        		</svg>
											</div> 받은 메일함
										</a> 
										<a href="sendMailList.do?send=s" class="list-group-item">
											<div class="fonticon-wrap d-inline me-3">
												<svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                            		<use xlink:href="${pageContext.request.contextPath}/resources/kjs_assets/vendors/bootstrap-icons/bootstrap-icons.svg#archive" />
                                       			</svg>
											</div> 보낸 메일함
										</a> 
										<a href="reserveMailList.do?reserve=re" class="list-group-item">
											<div class="fonticon-wrap d-inline me-3">
												<svg class="bi" width="1.5em" height="1.5em"
													fill="currentColor">
                                            		<use xlink:href="${pageContext.request.contextPath}/resources/kjs_assets/vendors/bootstrap-icons/bootstrap-icons.svg#info-circle" />
                                        		</svg>
											</div> 예약 메일함 
										</a> 
										<a href="deleteMailList.do?delete=d" class="list-group-item">
											<div class="fonticon-wrap d-inline me-3">
												<svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                            		<use xlink:href="${pageContext.request.contextPath}/resources/kjs_assets/vendors/bootstrap-icons/bootstrap-icons.svg#trash" />
                                        		</svg>
											</div> 휴지통
										</a>
									</div>
									<!-- 메일 사이드바 끝 -->
								</div>

							</div>
							<!-- email-app-menu end -->

						</div>
					</div>
					<!-- sidebar end -->
				</div>
				<!-- 좌측 : 메일 사이드바 끝 -->

				<!-- 우측 : 메일 리스트 시작 -->
				<div class="content-right">
					<div class="content-wrapper">
						<div class="content-body">
							<!-- email app overlay -->
							<div class="email-app-area">

								<!-- Email list Area -->
								<div class="email-app-list-wrapper">
									<div class="email-app-list">

										<!-- 메일 리스트 상단 시작 -->
										<div class="email-action">
											<div class="action-left d-flex align-items-center">

												<!-- 버튼 리스트 -->
												<ul class="list-inline m-0 d-flex">
													<li class="list-inline-item mail-delete">
														<!-- 발송취소 및 삭제(휴지통) 버튼 -->
														<button type="button" class="btn btn-outline-primary mt-2" id="replyMail">답장</button>
														<button type="button" class="btn btn-outline-primary mt-2" id="forwardMail">전달</button>
														<c:if test="${ mail.status == 'Y' }">
															<button type="button" class="btn btn-outline-danger mt-2" id="deleteMail">삭제</button>
														</c:if>
														<c:if test="${ mail.status == 'N' }">
															<button type="button" class="btn btn-outline-danger mt-2" id="" data-bs-toggle="modal" data-bs-target="#deleteCheckModal">완전삭제</button>
														</c:if>
													</li>
												</ul>
											</div>

										</div>
										<!-- 메일 리스트 상단 끝 -->

										<!-- 메일 리스트 하단 시작 -->
										<div class="email-user-list list-group ps ps--active-y">
																				
										<div class="card-body">
									        <form id="formAccountSettings" method="POST" onsubmit="return false">
									        
									          <!-- 메일 정보 영역 시작 -->
											  <input type="hidden" id="mailNo" name="mailNo" value="${ mail.mailNo }">
									          <div class="row">
									          	<div class="col-md-12">
									              <b class="text-danger">[${ mail.typeName }]</b><span class="mx-2">${ mail.sendDate }</span>
									            </div>
									            
									            <!-- 제목 영역 -->
									          	<h3>${ mail.title }</h3>
									          	<hr>
									          	
									          	<!-- 발신인/수신인/참조인 영역 -->
									            <div class="mb-1 col-md-12 toFromMaill">
									              <label for="firstName" class="form-label">발신 : </label>
									              <span class="badge rounded-pill bg-label-info">
									              	${ mail.fromName }
									              <input type="hidden" name="" id="fromMail" value="${ mail.fromMail}" />
									              </span>
									            </div>
									            <div class="mb-1 col-md-12 toFromMaill">
									              <label for="firstName" class="form-label">수신 : </label>
									              <span class="badge rounded-pill bg-label-primary">
									                 ${ mail.toName }
									                 <input type="hidden" name="" id="toMail" value="${ mail.toMail}"/>
									              </span>
									            </div>
									            <div class="mb-1 col-md-12">
									              <label for="lastName" class="form-label">참조 : </label>
									              <c:forEach items="${ ccList }" var="cc">
									              	<span class="badge rounded-pill bg-label-warning">
									              		${ cc.ccName }
									              		<input type="hidden" name="" value="${ cc.ccMail}"/>
									              	</span>
									              </c:forEach>
									            </div>
									            <input type="hidden" name="" id="ccMail" value="${ mail.ccMail}"/>
									            
									            <hr>
									            <!-- 내용 영역 -->
									            <div class="mb-2 col-md-12" style="height: 300px;">
									            	${ mail.content }
									            </div>
									           
									           	<hr>
									           	
									            <div class="mb-2 col-md-12">
										            <c:if test="${ !empty mail.changeName }">
										            	<a href="${ pageContext.servletContext.contextPath }/resources/mail_files/${mail.changeName}" download="${ mail.changeName }"> ${ mail.originName }</a>
										            </c:if>
										            <c:if test="${ empty mail.changeName }">
										            	첨부파일이 없습니다.
										            </c:if> 
									            </div>
									            
									          </div>
									          <!-- 메일 정보 영역 끝 -->
									          
									        </form>
									      </div>
											
										</div>
										<!-- 메일 리스트 하단 끝 -->
									</div>
								</div>
								<!--/ Email list Area -->

							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	</form>

	   <!-- 영구 삭제 재확인 모달창 -->
	   <!-- 본 모달창에서 완전삭제 클릭시 controller로 넘어갈 수 있는 스크립트가 실행된다. -->
	   <div class="modal fade" id="deleteCheckModal" data-backdrop="static" data-keyboard="false">
	      <div class="modal-dialog modal-sm modal-dialog-centered">
	        <div class="modal-content">
	        
	          <!-- Modal Header -->
	          <div class="modal-header">
	            <h4 class="modal-title">완전삭제 확인</h4>
	            <button type="button" class="close" data-dismiss="modal" data-bs-dismiss="modal">&times;</button>
	          </div>
	          
	          <!-- Modal body -->
	          <div class="modal-body">
	            <p class="desc_info">
			        선택된 메일을 완전히 삭제하시겠습니까?<br>
			        <b class="text-danger">완전삭제</b>되어 복구할 수 없습니다.
			    </p>
	          </div>
	          
	          <!-- Modal footer -->
	          <div class="modal-footer">
	            <button type="button" class="btn btn-outline-primary" id="permanentDeleteMailBtn" data-dismiss="modal">완전삭제</button>
	            <button type="button" class="btn btn-outline-secondary close" data-bs-dismiss="modal">취소</button>
	          </div>
	          
	        </div>
	      </div>
	   </div>
   
	<script src="${pageContext.request.contextPath}/resources/kjs_assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/kjs_assets/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/kjs_assets/js/main.js"></script>
	
	<script type="text/javascript">
		
		/* 답장 */
		$('#replyMail').click(function () {
		      
		       var mailNo = $('#mailNo').val();
	           location.href="mailReplyForm.do?mailNo="+mailNo;
	     })
	     
	    /* 전달 */ 
		$('#forwardMail').click(function () {
		      
		       var mailNo = $('#mailNo').val();
	           location.href="mailForwardForm.do?mailNo="+mailNo;
	     })
	     
		/* 삭제 클릭시 : 받은/보낸/예약의 상세 조회에서 */
		$('#permanentDeleteMailBtn').click(function () {
			 var mailNo = $('#mailNo').val();
	         location.href="permanentDeleteMail.do?mailNo="+mailNo;
		})

		/* 완전삭제 클릭시 : 휴지통에서의 상세 조회에서 */
		$('#deleteMail').click(function () {
			 var mailNo = $('#mailNo').val();
	         location.href="deleteMail.do?mailNo="+mailNo;
		})
		
	</script>

   <jsp:include page="../common/bottom.jsp"/>
   
</body>
</html>