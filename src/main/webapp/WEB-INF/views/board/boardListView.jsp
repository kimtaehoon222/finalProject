<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 	<!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&family=Rubik:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/animate/animate.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>
<body>

	<jsp:include page="top.jsp" />
	
	<div class="container-xxl flex-grow-1 container-p-y">
	
		<div class="container-fluid py-5 wow fadeInUp" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
            
	        <div class="container py-0">
	        	<button type="button" class="btn btn-primary mb-2">새 글쓰기</button>
	            <div class="row g-5">
	                <!-- 내용영역 좌측 : 게시글 리스트 시작 -->
	                <div class="col-lg-8">
	                    <div class="row g-5">
	                    	<!-- 게시글 1개 시작 -->
	                        <div class="col-md-6 wow slideInUp" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: slideInUp;">
	                            <div class="blog-item bg-light rounded overflow-hidden">
	                                <div class="blog-img position-relative overflow-hidden">
	                                    <img class="img-fluid" src="${pageContext.request.contextPath}/resources/kjs_assets/images/samples/bg-mountain.jpg" alt="">
	                                    <a class="position-absolute top-0 start-0 bg-primary text-white rounded-end mt-5 py-2 px-4" href="">일상이야기</a>
	                                </div>
	                                <div class="p-4">
	                                    <div class="d-flex mb-3">
	                                        <small class="me-3"><i class="far fa-user text-primary me-2"></i>김재호</small>
	                                        <small><i class="far fa-calendar-alt text-primary me-2"></i>10 June, 2022</small>
	                                    </div>
	                                    <h4 class="mb-3">등산 가고싶네요~</h4>
	                                    <p>올해 국제 산의 날 주제는 '지속가능한 산악관광'입니다. 산지의 지속가능한 관광은... </p>
	                                    <a class="text-uppercase" href="">Read More <i class="bi bi-arrow-right"></i></a>
	                                </div>
	                            </div>
	                        </div>
	                        <!-- 게시글 1개 끝 -->
	                        <!-- 게시글 1개 시작 -->
	                        <div class="col-md-6 wow slideInUp" data-wow-delay="0.6s" style="visibility: visible; animation-delay: 0.6s; animation-name: slideInUp;">
	                            <div class="blog-item bg-light rounded overflow-hidden">
	                                <div class="blog-img position-relative overflow-hidden">
	                                    <img class="img-fluid" src="${pageContext.request.contextPath}/resources/kjs_assets/images/samples/jump.jpg" alt="">
	                                    <a class="position-absolute top-0 start-0 bg-primary text-white rounded-end mt-5 py-2 px-4" href="">Tech</a>
	                                </div>
	                                <div class="p-4">
	                                    <div class="d-flex mb-3">
	                                        <small class="me-3"><i class="far fa-user text-primary me-2"></i>김태훈</small>
	                                        <small><i class="far fa-calendar-alt text-primary me-2"></i>09 June, 2022</small>
	                                    </div>
	                                    <h4 class="mb-3">모달창 사용방법</h4>
	                                    <p>모달창 사용하려고 하는데 자식창에서 부모창으로 데이터를...</p>
	                                    <a class="text-uppercase" href="">Read More <i class="bi bi-arrow-right"></i></a>
	                                </div>
	                            </div>
	                        </div>
	                        <!-- 게시글 1개 끝 -->
	                        <!-- 게시글 1개 시작 -->
	                        <div class="col-md-6 wow slideInUp" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: slideInUp;">
	                            <div class="blog-item bg-light rounded overflow-hidden">
	                                <div class="blog-img position-relative overflow-hidden">
	                                    <img class="img-fluid" src="${pageContext.request.contextPath}/resources/kjs_assets/images/samples/banana.jpg" alt="">
	                                    <a class="position-absolute top-0 start-0 bg-primary text-white rounded-end mt-5 py-2 px-4" href="">일상이야기</a>
	                                </div>
	                                <div class="p-4">
	                                    <div class="d-flex mb-3">
	                                        <small class="me-3"><i class="far fa-user text-primary me-2"></i>전재은</small>
	                                        <small><i class="far fa-calendar-alt text-primary me-2"></i>08 June, 2022</small>
	                                    </div>
	                                    <h4 class="mb-3">저의 요즘 취미는 양모펠트~</h4>
	                                    <p>잘 만들어지지 않네요..흑흑 어려워요 ㅠ_ㅠ</p>
	                                    <a class="text-uppercase" href="">Read More <i class="bi bi-arrow-right"></i></a>
	                                </div>
	                            </div>
	                        </div>
	                        <!-- 게시글 1개 끝 -->
	                        <!-- 게시글 1개 시작 -->
	                        <div class="col-md-6 wow slideInUp" data-wow-delay="0.6s" style="visibility: visible; animation-delay: 0.6s; animation-name: slideInUp;">
	                            <div class="blog-item bg-light rounded overflow-hidden">
	                                <div class="blog-img position-relative overflow-hidden">
	                                    <img class="img-fluid" src="${pageContext.request.contextPath}/resources/kjs_assets/images/samples/banana.jpg" alt="">
	                                    <a class="position-absolute top-0 start-0 bg-primary text-white rounded-end mt-5 py-2 px-4" href="">일상이야기</a>
	                                </div>
	                                <div class="p-4">
	                                    <div class="d-flex mb-3">
	                                        <small class="me-3"><i class="far fa-user text-primary me-2"></i>임현빈</small>
	                                        <small><i class="far fa-calendar-alt text-primary me-2"></i>06 June, 2022</small>
	                                    </div>
	                                    <h4 class="mb-3">현충일에 일하는 중..</h4>
	                                    <p>회사에 저만 있네요..하하...</p>
	                                    <a class="text-uppercase" href="">Read More <i class="bi bi-arrow-right"></i></a>
	                                </div>
	                            </div>
	                        </div>
	                        <!-- 게시글 1개 끝 -->
	                        
	                       <!-- 페이징 처리 영역 시작 -->
	                        <div class="col-12 wow slideInUp" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: slideInUp;">
	                            <nav aria-label="Page navigation">
	                              <ul class="pagination pagination-lg m-0">
	                                <li class="page-item disabled">
	                                  <a class="page-link rounded-0" href="#" aria-label="Previous">
	                                    <span aria-hidden="true"><i class="bi bi-arrow-left"></i></span>
	                                  </a>
	                                </li>
	                                <li class="page-item active"><a class="page-link" href="#">1</a></li>
	                                <li class="page-item"><a class="page-link" href="#">2</a></li>
	                                <li class="page-item"><a class="page-link" href="#">3</a></li>
	                                <li class="page-item">
	                                  <a class="page-link rounded-0" href="#" aria-label="Next">
	                                    <span aria-hidden="true"><i class="bi bi-arrow-right"></i></span>
	                                  </a>
	                                </li>
	                              </ul>
	                            </nav>
	                        </div>
	                        <!-- 페이징 처리 영역 끝 -->
	                    </div>
	                </div>
	                <!-- 내용영역 좌측 : 게시글 리스트 끝 -->
	    
	    			<!-- 내용영역 우측 : 사이드바 시작(검색, 카테고리, 최신글) -->
	                <div class="col-lg-4">
	                    <!-- 검색 창 시작 -->
	                    <div class="mb-5 wow slideInUp" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: slideInUp;">
	                        <div class="input-group">
	                            <input type="text" class="form-control p-3" placeholder="Keyword">
	                            <button class="btn btn-primary px-4"><i class="bi bi-search"></i></button>
	                        </div>
	                    </div>
	                    <!-- 검색 창 끝 -->
	    
	                    <!-- 카테고리 선택 시작 -->
	                    <div class="mb-5 wow slideInUp" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: slideInUp;">
	                        <div class="section-title section-title-sm position-relative pb-3 mb-4">
	                            <h3 class="mb-0 text-primary">Categories</h3>
	                        </div>
	                        <div class="link-animated d-flex flex-column justify-content-start">
	                        	<!-- a태그 버튼으로 변경하기! -->
	                            <a class="h5 fw-semi-bold bg-light rounded py-2 px-3 mb-2" href="#"><i class="bi bi-arrow-right me-2"></i>전체</a>
	                            <a class="h5 fw-semi-bold bg-light rounded py-2 px-3 mb-2" href="#"><i class="bi bi-arrow-right me-2"></i>일상이야기</a>
	                            <a class="h5 fw-semi-bold bg-light rounded py-2 px-3 mb-2" href="#"><i class="bi bi-arrow-right me-2"></i>Tech</a>
	                        </div>
	                    </div>
	                    <!-- 카테고리 선택 끝 -->
	    
	                    <!-- 최신글 영역 시작 -->
	                    <div class="mb-5 wow slideInUp" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: slideInUp;">
	                        <div class="section-title section-title-sm position-relative pb-3 mb-4">
	                            <h3 class="mb-0 text-primary">Recent Post</h3>
	                        </div>
	                        <div class="d-flex rounded overflow-hidden mb-3">
	                            <img class="img-fluid" src="${pageContext.request.contextPath}/resources/kjs_assets/images/samples/building.jpg" style="width: 100px; height: 100px; object-fit: cover;" alt="">
	                            <a href="" class="h5 fw-semi-bold d-flex align-items-center bg-light px-3 mb-0">휴가로 스페인 다녀왔는데 너무 좋았어요...
	                            </a>
	                        </div>
	                        <div class="d-flex rounded overflow-hidden mb-3">
	                            <img class="img-fluid" src="${pageContext.request.contextPath}/resources/kjs_assets/images/samples/motorcycle.jpg" style="width: 100px; height: 100px; object-fit: cover;" alt="">
	                            <a href="" class="h5 fw-semi-bold d-flex align-items-center bg-light px-3 mb-0">주말에 자전거 타실분 모집합니다~
	                            </a>
	                        </div>
	                        <div class="d-flex rounded overflow-hidden mb-3">
	                            <img class="img-fluid" src="${pageContext.request.contextPath}/resources/kjs_assets/images/samples/origami.jpg" style="width: 100px; height: 100px; object-fit: cover;" alt="">
	                            <a href="" class="h5 fw-semi-bold d-flex align-items-center bg-light px-3 mb-0">취미로 종이접기 하는중입니다. 오리배 너무 귀엽죠?
	                            </a>
	                        </div>
	                    </div>
	                    <!-- 최신글 영역 끝 -->
	                </div>
	                <!-- 내용영역 우측 : 사이드바 시작(검색, 카테고리, 최신글) -->
	                
	            </div>
	        </div>
	    </div>
    </div>
	
	<jsp:include page="bottom.jsp" />
	
</body>
</html>