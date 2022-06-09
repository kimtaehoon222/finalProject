<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<jsp:include page="top.jsp" />

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
										<a href="#" class="list-group-item">
											<div class="fonticon-wrap d-inline me-3">
												<svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                            		<use xlink:href="${pageContext.request.contextPath}/resources/kjs_assets/vendors/bootstrap-icons/bootstrap-icons.svg#envelope" />
                                        		</svg>
											</div> 받은 메일함
										</a> 
										<a href="#" class="list-group-item">
											<div class="fonticon-wrap d-inline me-3">
												<svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
                                            		<use xlink:href="${pageContext.request.contextPath}/resources/kjs_assets/vendors/bootstrap-icons/bootstrap-icons.svg#archive" />
                                       			</svg>
											</div> 보낸 메일함
										</a> 
										<a href="#" class="list-group-item">
											<div class="fonticon-wrap d-inline me-3">
												<svg class="bi" width="1.5em" height="1.5em"
													fill="currentColor">
                                            		<use xlink:href="${pageContext.request.contextPath}/resources/kjs_assets/vendors/bootstrap-icons/bootstrap-icons.svg#info-circle" />
                                        		</svg>
											</div> 예약 메일함 
										</a> 
										<a href="#" class="list-group-item text-primary">
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

												<!-- 체크박스(전체선택) -->
												<div
													class="checkbox checkbox-shadow checkbox-sm selectAll me-3">
													<input type="checkbox" id="checkboxsmall"
														class='form-check-input'> <label
														for="checkboxsmall"></label>
												</div>

												<!-- 버튼 리스트 -->
												<ul class="list-inline m-0 d-flex">
													<li class="list-inline-item mail-delete">
														<!-- 발송취소 및 삭제(휴지통) 버튼 -->
														<button type="button" class="btn-danger btn action-icon">
                                                            	영구삭제
														</button>
														<button type="button" class="btn-success btn action-icon">
                                                            	복원
														</button>
													</li>
												</ul>
											</div>
											<!-- 메일 리스트 상단 끝 -->

											<!-- action right start here -->
											<div
												class="action-right d-flex flex-grow-1 align-items-center justify-content-around">
												<!-- 검색창 시작 -->
												<div class="email-fixed-search flex-grow-1">
													<div
														class="form-group position-relative  mb-0 has-icon-left">
														<input type="text" class="form-control"
															placeholder="Searched Title..">
														<div class="form-control-icon">
															<svg class="bi" width="1.5em" height="1.5em"
																fill="currentColor">
                                                        <use
																	xlink:href="${pageContext.request.contextPath}/resources/kjs_assets/vendors/bootstrap-icons/bootstrap-icons.svg#search" />
                                                    </svg>
														</div>
													</div>
												</div>
												<!-- 검색창 끝 -->

												<!-- 페이징 처리 -->
												<span class="d-none d-sm-block">1-10 of 653</span>
												<button
													class="btn btn-icon email-pagination-prev d-none d-sm-block">
													<svg class="bi" width="1.5em" height="1.5em"
														fill="currentColor">
                                                <use
															xlink:href="${pageContext.request.contextPath}/resources/kjs_assets/vendors/bootstrap-icons/bootstrap-icons.svg#chevron-left" />
                                            </svg>
												</button>
												<button
													class="btn btn-icon email-pagination-next d-none d-sm-block">
													<svg class="bi" width="1.5em" height="1.5em"
														fill="currentColor">
                                                <use
															xlink:href="${pageContext.request.contextPath}/resources/kjs_assets/vendors/bootstrap-icons/bootstrap-icons.svg#chevron-right" />
                                            </svg>
												</button>

											</div>
										</div>
										<!-- 메일 리스트 상단 끝 -->

										<!-- 메일 리스트 하단 시작 -->
										<div class="email-user-list list-group ps ps--active-y">
											<!-- 메일 리스트 시작 -->
											<ul class="users-list-wrapper media-list">
											
												<!-- 메일 1개 시작 -->
												<li class="media mail-read">
													<!-- 체크박스 및 중요표시 -->
													<div class="user-action">
														<div class="checkbox-con me-3">
															<div class="checkbox checkbox-shadow checkbox-sm">
																<input type="checkbox" id="checkboxsmall1"
																	class='form-check-input'>
															</div>
														</div>
														<span class="favorite text-primary">수신</span>
													</div> 
													<!-- 메일 내용 표시 -->
													<div class="media-body">
														<!-- 내용의 상단 -->
														<div class="user-details">
															<!-- 메일 제목 -->
															<div class="mail-items">
																<span class="list-group-item-text text-truncate">안녕하세요. 신입사원 전재은 입니다. </span>
															</div>
															<!-- 메일 보낸 날짜 및 시간 -->
															<div class="mail-meta-item">
																<span class="float-right"> 
																<span class="mail-date">2022-06-09 6:00 PM</span>
																</span>
															</div>
														</div>
														<!-- 내용의 하단 -->
														<div class="mail-message">
															<!-- 메일 내용 -->
															<p class="list-group-item-text truncate mb-0">앞으로 잘 부탁드립니다. ^^ </p>
															<!-- 첨부파일 표시 -->
															<div class="mail-meta-item">
																<span class="float-right d-flex align-items-center">
																	<i class="bx bx-paperclip me-3"></i>
																</span>
															</div>
														</div>
													</div>
												</li>
												<!-- 메일 1개 끝 -->
												<!-- 메일 1개 시작 -->
												<li class="media mail-read">
													<!-- 체크박스 및 중요표시 -->
													<div class="user-action">
														<div class="checkbox-con me-3">
															<div class="checkbox checkbox-shadow checkbox-sm">
																<input type="checkbox" id="checkboxsmall1"
																	class='form-check-input'>
															</div>
														</div>
														<span class="favorite text-success">발신</span>
													</div> 
													<!-- 메일 내용 표시 -->
													<div class="media-body">
														<!-- 내용의 상단 -->
														<div class="user-details">
															<!-- 메일 제목 -->
															<div class="mail-items">
																<span class="list-group-item-text text-truncate">안녕하세요. 김지수 입니다. </span>
															</div>
															<!-- 메일 보낸 날짜 및 시간 -->
															<div class="mail-meta-item">
																<span class="float-right"> 
																<span class="mail-date">2022-06-09 6:00 PM</span>
																</span>
															</div>
														</div>
														<!-- 내용의 하단 -->
														<div class="mail-message">
															<!-- 메일 내용 -->
															<p class="list-group-item-text truncate mb-0">만나서 반가워요. ^^ </p>
															<!-- 첨부파일 표시 -->
															<div class="mail-meta-item">
																<span class="float-right d-flex align-items-center">
																	<i class="bx bx-paperclip me-3"></i>
																</span>
															</div>
														</div>
													</div>
												</li>
												<!-- 메일 1개 끝 -->
												<!-- 메일 1개 시작 -->
												<li class="media mail-read">
													<!-- 체크박스 및 중요표시 -->
													<div class="user-action">
														<div class="checkbox-con me-3">
															<div class="checkbox checkbox-shadow checkbox-sm">
																<input type="checkbox" id="checkboxsmall1"
																	class='form-check-input'>
															</div>
														</div>
														<span class="favorite text-success">발신</span>
													</div> 
													<!-- 메일 내용 표시 -->
													<div class="media-body">
														<!-- 내용의 상단 -->
														<div class="user-details">
															<!-- 메일 제목 -->
															<div class="mail-items">
																<span class="list-group-item-text text-truncate">안녕하세요. 김지수 입니다. </span>
															</div>
															<!-- 메일 보낸 날짜 및 시간 -->
															<div class="mail-meta-item">
																<span class="float-right"> 
																<span class="mail-date">2022-06-09 6:00 PM</span>
																</span>
															</div>
														</div>
														<!-- 내용의 하단 -->
														<div class="mail-message">
															<!-- 메일 내용 -->
															<p class="list-group-item-text truncate mb-0">만나서 반가워요. ^^ </p>
															<!-- 첨부파일 표시 -->
															<div class="mail-meta-item">
																<span class="float-right d-flex align-items-center">
																	<i class="bx bx-paperclip me-3"></i>
																</span>
															</div>
														</div>
													</div>
												</li>
												<!-- 메일 1개 끝 -->
												<!-- 메일 1개 시작 -->
												<li class="media mail-read">
													<!-- 체크박스 및 중요표시 -->
													<div class="user-action">
														<div class="checkbox-con me-3">
															<div class="checkbox checkbox-shadow checkbox-sm">
																<input type="checkbox" id="checkboxsmall1"
																	class='form-check-input'>
															</div>
														</div>
														<span class="favorite text-primary">수신</span>
													</div> 
													<!-- 메일 내용 표시 -->
													<div class="media-body">
														<!-- 내용의 상단 -->
														<div class="user-details">
															<!-- 메일 제목 -->
															<div class="mail-items">
																<span class="list-group-item-text text-truncate">안녕하세요. 신입사원 김재호 입니다. </span>
															</div>
															<!-- 메일 보낸 날짜 및 시간 -->
															<div class="mail-meta-item">
																<span class="float-right"> 
																<span class="mail-date">2022-06-09 6:00 PM</span>
																</span>
															</div>
														</div>
														<!-- 내용의 하단 -->
														<div class="mail-message">
															<!-- 메일 내용 -->
															<p class="list-group-item-text truncate mb-0">앞으로 잘 부탁드립니다. ^^ </p>
															<!-- 첨부파일 표시 -->
															<div class="mail-meta-item">
																<span class="float-right d-flex align-items-center">
																	<i class="bx bx-paperclip me-3"></i>
																</span>
															</div>
														</div>
													</div>
												</li>
												<!-- 메일 1개 끝 -->
											</ul>
											<!-- 메일 리스트 끝 -->

											<!-- no result when nothing to show on list -->
											<div class="no-results">
												<i class="bx bx-error-circle font-large-2"></i>
												<h5>No Items Found</h5>
											</div>
											<div class="ps__rail-x" style="left: 0px; bottom: 0px;">
												<div class="ps__thumb-x" tabindex="0"
													style="left: 0px; width: 0px;"></div>
											</div>
											<div class="ps__rail-y"
												style="top: 0px; height: 733px; right: 0px;">
												<div class="ps__thumb-y" tabindex="0"
													style="top: 0px; height: 567px;"></div>
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

	<jsp:include page="bottom.jsp" />
</body>
</html>