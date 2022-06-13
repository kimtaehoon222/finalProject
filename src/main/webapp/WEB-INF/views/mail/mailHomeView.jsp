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
	href="${pageContext.request.contextPath}/resources/${pageContext.request.contextPath}/resources/kjs_assets/css/bootstrap.css">
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
	<jsp:include page="${pageContext.request.contextPath}/top.jsp" />

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
									<a href="mailSendForm.do" class="btn btn-primary btn-block my-4 compose-btn" id="center">작성하기</a>
								</div>

								<div class="sidebar-menu-list ps">
									<!-- 메일 사이드바 시작 -->
									<div class="list-group list-group-messages">
										<a href="receiveMailList.do" class="list-group-item">
											<div class="fonticon-wrap d-inline me-3">
												<svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                            		<use xlink:href="${pageContext.request.contextPath}/resources/kjs_assets/vendors/bootstrap-icons/bootstrap-icons.svg#envelope" />
                                        		</svg>
											</div> 받은 메일함
										</a> 
										<a href="sendMailList.do" class="list-group-item">
											<div class="fonticon-wrap d-inline me-3">
												<svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                            		<use xlink:href="${pageContext.request.contextPath}/resources/kjs_assets/vendors/bootstrap-icons/bootstrap-icons.svg#archive" />
                                       			</svg>
											</div> 보낸 메일함
										</a> 
										<a href="reserveMailList.do" class="list-group-item">
											<div class="fonticon-wrap d-inline me-3">
												<svg class="bi" width="1.5em" height="1.5em"
													fill="currentColor">
                                            		<use xlink:href="${pageContext.request.contextPath}/resources/kjs_assets/vendors/bootstrap-icons/bootstrap-icons.svg#info-circle" />
                                        		</svg>
											</div> 예약 메일함 
										</a> 
										<a href="deleteMailList.do" class="list-group-item">
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
            <div class="row">
              <div class="col-12 grid-margin stretch-card">
                <div class="card corona-gradient-card">
                  <div class="card-body py-0 px-0 px-sm-3">
                  
                   
                    
                  </div>
                </div>
              </div>
            </div>

            <!-- 첫번째 행 시작 -->
              <div class="row mx-2">
              
                <!-- 통계현황 시작 -->
                <div class="col-md-6 col-lg-6 order-0 mb-4">
                  <div class="card h-100">
                  	<!-- 통계 상단 타이틀 -->
                    <div class="card-header d-flex align-items-center justify-content-between pb-0">
                      <div class="card-title mb-0">
                        <h5 class="m-0 me-2 text-primary">메일 수/발신 현황</h5>
                        <small class="text-muted">2022-06-09 05:05PM 기준</small>
                      </div>
                    </div>
                    
                    <!-- 통계 내용 시작 -->
                    <div class="card-body">
                      <!-- 통계 내용 상단 -->
                      <div class="d-flex justify-content-between align-items-center mb-3">
                        <div class="d-flex flex-column align-items-center gap-1">
                          <!-- 총 메일 개수 표시 -->
                          <h2 class="mb-2">1,000</h2>
                          <span>Total mails</span>
                        </div>
                        <!-- 원형 차트 -->
                        <div id="orderStatisticsChart"></div>
                      </div>
                      <!-- 통계 내용 하단 -->
                      <ul class="p-0 m-0">
                        <li class="d-flex mb-4 pb-1">
                          <div class="avatar flex-shrink-0 me-3">
                            <span class="avatar-initial rounded bg-label-primary">
                              <i class="bx bx-mail-send"></i></span>
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <h6 class="mb-0">발신현황</h6>
                              <small class="text-muted">340/1000</small>
                            </div>
                            <div class="user-progress">
                              <small class="fw-semibold">34%</small>
                            </div>
                          </div>
                        </li>
                        <li class="d-flex mb-4 pb-1">
                          <div class="avatar flex-shrink-0 me-3">
                            <span class="avatar-initial rounded bg-label-primary">
                            <i class="bx bx-mail-send"></i></span>
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <h6 class="mb-0">수신현황</h6>
                              <small class="text-muted">660/1000</small>
                            </div>
                            <div class="user-progress">
                              <small class="fw-semibold">66%</small>
                            </div>
                          </div>
                        </li>
                      </ul>
                    </div>
                    <!-- 통계 내용 끝 -->
                  </div>
                </div>
                <!-- 통계현황 끝 -->
				
                <!-- 즐겨찾는 사람 시작 -->
                <div class="col-md-6 col-lg-6 order-1 mb-4">
                  <div class="card h-100">
                    <div class="card-header d-flex align-items-center justify-content-between">
                      <h5 class="card-title m-0 me-2 text-primary">즐겨찾는사람</h5>
                    </div>
                    <div class="card-body">
                      <ul class="p-0 m-0">
                      
                        <li class="d-flex mb-4 pb-1">
                          <div class="avatar flex-shrink-0 me-3">
                 	        <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/1.png" alt="user-avatar" class="d-block rounded" height="100" width="100" id="uploadedAvatar" />
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <small class="text-muted d-block mb-1">김재호</small>
                              <h6 class="mb-0 text-primary">hoho123@easy.co.kr</h6>
                            </div>
                            <div class="user-progress d-flex align-items-center gap-1">
                              <button class="btn btn-primary">메일작성</button>
                            </div>
                          </div>
                        </li>
                        <li class="d-flex mb-4 pb-1">
                          <div class="avatar flex-shrink-0 me-3">
                 	        <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/1.png" alt="user-avatar" class="d-block rounded" height="100" width="100" id="uploadedAvatar" />
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <small class="text-muted d-block mb-1">전재은</small>
                              <h6 class="mb-0 text-primary">je123@easy.co.kr</h6>
                            </div>
                            <div class="user-progress d-flex align-items-center gap-1">
                              <button class="btn btn-primary">메일작성</button>
                            </div>
                          </div>
                        </li>
                        <li class="d-flex mb-4 pb-1">
                          <div class="avatar flex-shrink-0 me-3">
                 	        <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/1.png" alt="user-avatar" class="d-block rounded" height="100" width="100" id="uploadedAvatar" />
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <small class="text-muted d-block mb-1">임현빈</small>
                              <h6 class="mb-0 text-primary">bin123@easy.co.kr</h6>
                            </div>
                            <div class="user-progress d-flex align-items-center gap-1">
                              <button class="btn btn-primary">메일작성</button>
                            </div>
                          </div>
                        </li>
                        <li class="d-flex mb-4 pb-1">
                          <div class="avatar flex-shrink-0 me-3">
                 	        <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/1.png" alt="user-avatar" class="d-block rounded" height="100" width="100" id="uploadedAvatar" />
                          </div>
                          <div class="d-flex w-100 flex-wrap align-items-center justify-content-between gap-2">
                            <div class="me-2">
                              <small class="text-muted d-block mb-1">김태훈</small>
                              <h6 class="mb-0 text-primary">tae123@easy.co.kr</h6>
                            </div>
                            <div class="user-progress d-flex align-items-center gap-1">
                              <button class="btn btn-primary">메일작성</button>
                            </div>
                          </div>
                        </li>
                        
                      </ul>
                    </div>
                  </div>
                </div>
                <!-- 즐겨찾는 사람 끝 -->
              </div>
            <!-- 첫번째 행 끝 -->
            
            <!-- 두번째 행 시작 -->
            <div class="row mx-2">
            	<!-- 읽지않은메일 시작 -->
                <div class="col-md-12 col-lg-12 order-0">
                  <div class="card h-100">
                    <div class="card-header d-flex align-items-center justify-content-between">
                      <h5 class="card-title m-0 me-2 text-primary">읽지않은메일</h5>
                    </div>
                    
                    <div class="card-body">
                      <table class="table">
                        <thead>
                          <tr>
                            <th> 분류 </th>
                            <th> 보낸사람 </th>
                            <th> 제목 </th>
                            <th> 보낸날짜 </th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td class="text-danger">
                            	중요
                            </td>
                            <td>
                              <span class="pl-2">김재호</span>
                            </td>
                            <td> 안녕하세요. 김재호 입니다. </td>
                            <td> 2022-06-09 </td>
                          </tr>
                          <tr>
                            <td>
                            	일반
                            </td>
                            <td>
                              <span class="pl-2">임현빈</span>
                            </td>
                            <td> 안녕하세요. 임현빈 입니다. </td>
                            <td> 2022-06-08 </td>
                          </tr>
                          <tr>
                            <td>
                            	일반
                            </td>
                            <td>
                              <span class="pl-2">전재은</span>
                            </td>
                            <td> 안녕하세요. 전재은 입니다. </td>
                            <td> 2022-06-07 </td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
                <!-- 읽지않은메일 끝 -->
            </div>
            
		          </div>
		          <!-- content-wrapper ends -->
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

	<jsp:include page="${pageContext.request.contextPath}/bottom.jsp" />
	
</body>
</html>