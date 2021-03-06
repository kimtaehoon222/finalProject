<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/img/logo/W.png" /> 
<title>휴지통</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

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
						<h3><a href="mailHome.do" style="color:#566a7f;" data-bs-toggle="tooltip" data-bs-offset="0,4" data-bs-placement="right" data-bs-html="true" title data-bs-original-title="<i class='bx bx-home bx-xs' ></i><span>메일 홈으로 돌아가기</span>">Email</a></h3>
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
										<a href="deleteMailList.do?delete=d" class="list-group-item text-primary">
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
									
								<!-- form 시작 -->
								<form id="mailForm" method="post">
								<!-- Email list Area -->
								<div class="email-app-list-wrapper">
									<div class="email-app-list">

										<!-- 메일 리스트 상단 시작 -->
										<div class="email-action">
											<div class="action-left d-flex align-items-center">

												<!-- 체크박스(전체선택) -->
												<div class="checkbox checkbox-shadow checkbox-sm selectAll me-3">
													<input type="checkbox" id="checked-all" class='form-check-input'> 
													<label for="checkboxsmall"></label>
												</div>

												<!-- 버튼 리스트 -->
												<ul class="list-inline m-0 d-flex">
													<li class="list-inline-item mail-delete">
														<!-- 발송취소 및 삭제(휴지통) 버튼 -->
														<button type="button" class="btn action-icon btn-danger" id="" data-bs-toggle="modal" data-bs-target="#deleteCheckModal">완전삭제</button>
														<button type="button" class="btn btn-success action-icon" id="restoreMailBtn">복원</button>
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
														<!-- <input type="text" class="form-control"
															placeholder="Searched Title..">
														<div class="form-control-icon">
															<svg class="bi" width="1.5em" height="1.5em"
																fill="currentColor">
                                                        <use
																	xlink:href="${pageContext.request.contextPath}/resources/kjs_assets/vendors/bootstrap-icons/bootstrap-icons.svg#search" />
                                                    </svg>
														</div>  -->
													</div>
												</div>
												<!-- 검색창 끝 -->

												<!-- 페이징 처리 시작 -->
												<span class="d-none d-sm-block">
												${ mpi.currentPage*mpi.mailLimit-9 }
												-
												<c:choose>
													<c:when test="${mpi.currentPage ne mpi.maxPage }">
														${mpi.currentPage*mpi.mailLimit }
													</c:when>
													<c:when test="${mpi.currentPage eq mpi.maxPage }">
														${mpi.listCount }
													</c:when>
												</c:choose>
												of 
												${ mpi.listCount } </span>
												<c:choose>
													<c:when test="${mpi.currentPage ne 1}">
													<a class="btn btn-icon btn-primary email-pagination-prev d-none d-sm-block" 
													   href="deleteMailList.do?currentPage=${ mpi.currentPage-1 }">
														<svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
	                                                		<use xlink:href="${pageContext.request.contextPath}/resources/kjs_assets/vendors/bootstrap-icons/bootstrap-icons.svg#chevron-left" />
	                                            		</svg>
													</a>
													</c:when>
													<c:otherwise>
														<a class="btn btn-icon email-pagination-prev d-none d-sm-block" hidden="true">
															<svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
	                                                			<use xlink:href="${pageContext.request.contextPath}/resources/kjs_assets/vendors/bootstrap-icons/bootstrap-icons.svg#chevron-left" />
	                                            			</svg>
														</a>
													</c:otherwise>
												</c:choose>
												<c:choose>
													<c:when test="${ mpi.currentPage ne mpi.maxPage && mpi.listCount ne 0 }">
														<a class="btn btn-icon btn-primary email-pagination-next d-none d-sm-block"
														    href="deleteMailList.do?currentPage=${ mpi.currentPage+1 }">
															<svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
		                                                		<use xlink:href="${pageContext.request.contextPath}/resources/kjs_assets/vendors/bootstrap-icons/bootstrap-icons.svg#chevron-right" />
		                                           			</svg>
														</a>
	                                           		</c:when>	
	                                           		<c:otherwise>
	                                           			<a class="btn btn-icon email-pagination-next d-none d-sm-block" hidden="true">
															<svg class="bi" width="1.5em" height="1.5em" fill="currentColor">
		                                                		<use xlink:href="${pageContext.request.contextPath}/resources/kjs_assets/vendors/bootstrap-icons/bootstrap-icons.svg#chevron-right" />
		                                           			</svg>
														</a>
	                                           		</c:otherwise>
												</c:choose>
												<!-- 페이징 처리 끝 -->

											</div>
										</div>
										<!-- 메일 리스트 상단 끝 -->

										<!-- 메일 리스트 하단 시작 -->
										<div class="email-user-list list-group card overflow-hidden ps ps--active-y" id="mailList">
											<c:if test="${ !empty list  }">
											<!-- 메일 리스트 시작 -->
											<div class="ps ps--active-y" id="vertical-example">
											<ul class="users-list-wrapper media-list">
												<!-- 메일 1개 시작 -->
												<c:forEach items="${ list }" var="mail">
												<li class="media mail-read noDetail">
												<input type="hidden" value="${ mail.mailNo }">
													<!-- 체크박스 및 중요표시 -->
													<div class="user-action noDetail">
														<div class="checkbox-con me-3">
															<div class="checkbox checkbox-shadow checkbox-sm">
																<input type="checkbox" id="checkboxsmall1" class='form-check-input noDetail' name="emailNocheck" value="${ mail.mailNo }">
															</div>
														</div>
														<c:if test="${ mail.stateName == '수신' }">
															<span class="favorite badge bg-primary" style="color:white;">${ mail.stateName }</span><span class="text-primary">${ mail.fromName }</span>
														</c:if>
														<c:if test="${ mail.stateName == '발신' }">
															<span class="favorite badge bg-success" style="color:white;">${ mail.stateName }</span><span class="text-success">${ mail.fromName }</span>
														</c:if>	
													</div> 
													<!-- 메일 내용 표시 -->
													<div class="media-body">
														<!-- 내용의 상단 -->
														<div class="user-details">
															<!-- 메일 제목 -->
															<div class="mail-items">
																<span class="list-group-item-text text-truncate">${ mail.title }</span>
															</div>
															<!-- 메일 보낸 날짜 및 시간 -->
															<div class="mail-meta-item">
																<span class="float-right"> 
																<span class="mail-date">${ mail.sendDate }</span>
																</span>
															</div>
														</div>
														<!-- 내용의 하단 -->
														<div class="mail-message">
															<!-- 메일 내용 -->
															<p class="list-group-item-text truncate mb-0">${ mail.content }</p>
															<!-- 첨부파일 표시 -->
															<div class="mail-meta-item">
																<span class="float-right d-flex align-items-center">
																	<c:if test="${ !empty mail.attchangeName }">
																		<i class="bx bx-paperclip me-3"></i>
																	</c:if>
																	<c:if test="${ empty mail.attchangeName }">
																		<i class="">&nbsp;</i>
																	</c:if>
																</span>
															</div>
														</div>
													</div>
												</li>
												<!-- 메일 1개 끝 -->
												</c:forEach>
											</ul>
											</div>
											<!-- 메일 리스트 끝 -->
											</c:if>
											<c:if test="${ empty list  }">
												<ul class="users-list-wrapper media-list">
													<li class="media mail-read noDetail">조회 가능한 메일이 없습니다.</li>
												</ul>
											</c:if>

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
								<input type="hidden" id="mailNoList" name="mailNoList" value="">
								</form>
								<!-- form 끝 -->

							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	
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
		$(document).ready(function () {
			//전체선택 체크박스 요소를 클릭하면
			$('#checked-all').click(function () {
				//해당 요소의 값이 checked인 경우
				if($('#checked-all').is(":checked")){
					//이름이 email-check인 input 요소의 값을 checked=true
					$('input[name=emailNocheck]').prop("checked", true);
				}else{
					//이름이 email-check인 input 요소의 값을 checked=false
					$('input[name=emailNocheck]').prop("checked", false);
				}
			})
			
		})
		
		/* 메일의 행 클릭 시 */
		$(function () {
			$('#mailList ul li').click(function (e) {
				
				/* 클릭된 target이 area라는 클래스를 갖고있다면 함수 종료 */
				if($(e.target).hasClass("noDetail")) {
					return;
				}
				
				location.href="detailDeleteMail.do?mailNo="+$(this).children().eq(0).val();
			})
		})
		
		/* 복원 클릭시 */
		$(function () {
			$('#restoreMailBtn').click(function () {
				
				var mailNoList = [];
		         
		         $('input[name=emailNocheck]:checked').each(function () {
		            var v = $(this).val();
		            mailNoList.push(v);
		         })
		         
		         console.log(mailNoList);
		         
		         $('#mailNoList').val(mailNoList);
		         
		         if($("input:checkbox[name='emailNocheck']").is(":checked") == false) {
		     		alert("하나 이상 선택 바랍니다.");
		     		return;
		     	 }
		         
		         $('#mailForm').attr("action", "${pageContext.request.contextPath}/restoreMail.do");
		         $('#mailForm').submit();
			})
		})
		
		/* 완전삭제 클릭시 */
		$(function () {
			$('#permanentDeleteMailBtn').click(function () {
				
				var mailNoList = [];
		         
		         $('input[name=emailNocheck]:checked').each(function () {
		            var v = $(this).val();
		            mailNoList.push(v);
		         })
		         
		         console.log(mailNoList);
		         
		         $('#mailNoList').val(mailNoList);
		         
		         if($("input:checkbox[name='emailNocheck']").is(":checked") == false) {
		     		alert("하나 이상 선택 바랍니다.");
		     		return;
		     	 }
		         
		         $('#mailForm').attr("action", "${pageContext.request.contextPath}/permanentDeleteMailList.do");
		         $('#mailForm').submit();
			})
		})
		
	</script>

   <jsp:include page="../common/bottom.jsp"/>
	
</body>
</html>