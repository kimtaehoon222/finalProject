<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
 <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <!-- <link href="${pageContext.request.contextPath}/resources/kjs_assets/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet"> -->

    <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/kjs_assets/css_board/style.css" rel="stylesheet">
</head>
<body>
	
	<jsp:include page="top.jsp" />
	
	<div class="container-xxl flex-grow-1 container-p-y">
		<div class="container py-5">
		<button type="button" class="btn btn-primary mb-2">새 글쓰기</button>
		<button type="button" class="btn btn-primary mb-2">수정</button>
		<button type="button" class="btn btn-primary mb-2">삭제</button>
        <div class="row">
            <div class="col-lg-8">
                <!-- 게시글 상세 영역 시작 -->
                <div class="pb-3">
                	<!-- 날짜 표기 동그라미 -->
                    <div class="position-relative">
                        <img class="img-fluid w-100" src="${pageContext.request.contextPath}/resources/kjs_assets/images/samples/bg-mountain.jpg" alt="">
                        <div class="position-absolute bg-primary d-flex flex-column align-items-center justify-content-center rounded-circle" style="width: 60px; height: 60px; bottom: -30px; right: 30px;">
                            <h4 class="font-weight-bold mb-n1">10</h4>
                            <small class="text-white text-uppercase">June</small>
                        </div>
                    </div>
                    <!-- 게시글 정보 -->
                    <div class="bg-light mb-3" style="padding: 30px;">
                        <div class="d-flex mb-3">
                            <div class="d-flex align-items-center">
                                <img class="rounded-circle" style="width: 40px; height: 40px;" src="${pageContext.request.contextPath}/resources/assets/img/avatars/1.png" alt="">
                                <a class="text-muted ml-2" href="">김재호</a>
                            </div>
                            <div class="d-flex align-items-center ml-4">
                                <i class="far fa-bookmark text-primary"></i>
                                <a class="text-muted ml-2" href="">일상이야기</a>
                            </div>
                            <div class="d-flex align-items-center ml-4">
                                <i class="far fa-heart text-danger"></i>
                                <a class="text-muted ml-2" href="">3</a>
                            </div>
                        </div>
                        <!-- 제목 -->
                        <h4 class="font-weight-bold mb-3">등산 가고싶네요~</h4>
                        <!-- 내용 -->
                        <p> 올해 국제 산의 날 주제는 '지속가능한 산악관광'입니다. 
                         	산지의 지속가능한 관광은 인근 주민들의 생계를 위한 대안적 방안이 될 수 있을 뿐만 아니라 빈곤을 줄이고 사회적 통합을 높이며 나아가 경관 보존, 
                         	생물다양성 보존에도 기여할 수 있을 것입니다.
                         	산악 관광은 전세계 관광의 15~20%를 차지합니다. 
                         	하지만 코로나19 팬데믹 사태로 관광 자체가 가장 많은 영향을 받음에 따라 세계적으로 경제나 공공서비스 등도 악영향을 받는 상황입니다.</p>
                    </div>
                </div>
                <!-- 게시글 상세 영역 끝 -->

                <!-- 댓글 영역 시작 -->
                <div class="bg-light" style="padding: 30px; margin-bottom: 30px;">
                    <h3 class="mb-4"><i class="far fa-comment text-primary"></i>&nbsp;3 Comments</h3>
                    <!-- 댓글 작성란 시작 -->
                    <div class="row mb-4" id="reply-div">
		              <label class="form-label" for="">댓글 작성</label>
		              <div class="col-lg-10">
		              	<input class="form-control" type="text" name="" id="" value="" placeholder="댓글을 작성하세요"/>
		              </div>
		              <div class="col-lg-2">
		              	<button class="btn btn-primary">작성</button>
		              </div>
		           	</div> 
		           	<!-- 댓글 작성란 끝 -->
                    <!-- 댓글 시작 -->
                    <div class="media mb-4">
                        <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/1.png" alt="Image" class="img-fluid mr-3 mt-1" style="width: 45px;">
                        <div class="media-body">
                            <h6><span class="text-primary">김태훈</span>
                            	<small><i>10 June 2022</i> 
                            	</small>
                            </h6>
                            <span>우와~산에 대해 정말 많은 걸 알고계시네요!</span>
                            <button class="btn btn-sm btn-primary">→댓글</button>
                            <button class="btn btn-sm btn-primary">수정</button>
                            <button class="btn btn-sm btn-primary">삭제</button>
                           
                        </div>
                    </div>
                    <!-- 대댓글 시작 -->
                    <div class="media mb-4">
                     <!-- 댓글 레벨에 따른 깊이 조절. 일단 임시 상태. -->
                     <img src="" alt="" class="img-fluid mr-3 mt-1" style="width: 45px;">
                     <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/5.png" alt="Image" class="img-fluid mr-3 mt-1" style="width: 45px;">
	                     <div class="media-body">
	                         <h6><span class="text-primary">임현빈</span>
	                          <small><i>10 June 2022</i>
	                          </small>
	                         </h6>
	                         <span>공감해요! 재호님 대단하시네용!</span>
	                         <button class="btn btn-sm btn-primary">→댓글</button>
	                     </div>
               		</div>
               		<!-- 대댓글 끝 -->
                    <!-- 댓글 시작 -->
                    <div class="media mb-4">
                        <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/6.png" alt="Image" class="img-fluid mr-3 mt-1" style="width: 45px;">
                        <div class="media-body">
                            <h6><span class="text-primary">전재은</span>
                            	<small><i>10 June 2022</i></small>
                            </h6>
                            <span>굿굿!</span>
                            <button class="btn btn-sm btn-primary">→댓글</button>
                    	</div>
                   </div>
                </div>
                <!-- 댓글 영역 끝 -->

            </div>

            <!-- 내용영역 우측 : 사이드바 시작(검색, 카테고리, 최신글) -->
            <div class="col-lg-4">
                <!-- 카테고리 선택 시작 -->
                <div class="mb-5 wow slideInUp" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: slideInUp;">
                    <div class="section-title section-title-sm position-relative pb-3 mb-4">
                        <h3 class="mb-0 text-primary">목록으로</h3>
                    </div>
                    <div class="link-animated d-flex flex-column justify-content-start">
                    	<!-- a태그 버튼으로 변경하기! -->
                        <a class="h5 fw-semi-bold bg-light rounded py-2 px-3 mb-2" href="#"><i class="bi bi-arrow-right me-2"></i>전체</a>
                        <a class="h5 fw-semi-bold bg-light rounded py-2 px-3 mb-2" href="#"><i class="bi bi-arrow-right me-2"></i>일상이야기</a>
                        <a class="h5 fw-semi-bold bg-light rounded py-2 px-3 mb-2" href="#"><i class="bi bi-arrow-right me-2"></i>Tech</a>
                    </div>
                </div>
                <!-- 카테고리 선택 끝 -->
                <!-- 좋아요 정보 시작 -->
                <div class="mb-5 wow slideInUp" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: slideInUp;">
                    <div class="section-title section-title-sm position-relative pb-3 mb-4">
                        <h3 class="mb-1 text-primary">좋아요&nbsp;<i class="far fa-heart text-danger"></i></h3>
                        <span class="text-danger">하트를 클릭해주세요!</span>
                    </div>
                </div>
                <!-- 좋아요 정보 끝 -->
                <!-- 조회수 정보 시작 -->
                <div class="mb-5 wow slideInUp" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: slideInUp;">
                    <div class="section-title section-title-sm position-relative pb-3 mb-4">
                        <h3 class="mb-1 text-primary">조회수&nbsp;<b class="text-dark">15</b></h3>
                    </div>
                </div>
                <!-- 좋아요 정보 끝 -->
            </div>
            <!-- 내용영역 우측 : 사이드바 시작(검색, 카테고리, 최신글) -->
        </div>
    </div>
	
	</div>
		
	<jsp:include page="bottom.jsp" />
	
</body>
</html>