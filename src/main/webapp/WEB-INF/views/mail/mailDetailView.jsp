<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

	<div class="container-xxl flex-grow-1 container-p-y">

		<div class="page-heading email-application">
			<div class="page-title">
				<div class="row">
					<div class="col-12 col-md-6 order-md-1 order-last">
						<h3>Email</h3>
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
									<button type="button"
										class="btn btn-primary btn-block my-4 compose-btn">
										작성하기</button>
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
														<button type="button" class="btn action-icon ">
                                                            	답장
														</button>
														<button type="button" class="btn action-icon">
                                                            	전달
														</button>
														<button type="button" class="btn action-icon">
                                                            	삭제
														</button>
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
          <div class="row">
          	<div class="col-md-12">
              <b class="text-danger">[중요]</b>
            </div>
            
            <!-- 제목 영역 -->
          	<h3>안녕하세요. 신입사원 김태훈 입니다.</h3>
          	
          	<hr>
          	
          	<!-- 발신인/수신인/참조인 영역 -->
            <div class="mb-1 col-md-12">
              <label for="firstName" class="form-label">보낸사람 : </label>
              <span>tae123@easy.co.kr</span>
            </div>
            <div class="mb-1 col-md-12">
              <label for="firstName" class="form-label">받는사람 : </label>
              <span>jisu123@easy.co.kr</span>
            </div>
            <div class="mb-1 col-md-12">
              <label for="lastName" class="form-label">참조 : </label>
              <span>je123@easy.co.kr, bin123@easy.co.kr, hoho123@easy.co.kr</span>
            </div>
            
            <hr>
            <!-- 내용 영역 -->
            <div class="mb-2 col-md-2" style="height: 300px;">
            	잘 부탁드립니다. ^^
            </div>
           
           	<hr>
            <div class="mb-2 col-md-2">
            <!-- <c:if test="${ !empty b.originName }">
            	<a href="${ pageContext.servletContext.contextPath }/resources/upload_files/${b.changeName}" download="${ b.originName }">${ b.originName }</a>
            </c:if>
            <c:if test="${ empty b.originName }">
            	첨부파일이 없습니다.
            </c:if> -->
           		 첨부파일이 없습니다.
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

	<script
		src="${pageContext.request.contextPath}/resources/kjs_assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/kjs_assets/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/kjs_assets/js/main.js"></script>

   <jsp:include page="../common/bottom.jsp"/>
   
</body>
</html>