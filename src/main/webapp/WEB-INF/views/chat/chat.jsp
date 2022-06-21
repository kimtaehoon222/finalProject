<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../resources/kth_assets/images/favicon.png">
    <title>채팅</title>
    <!-- This page css -->
    <!-- Custom CSS -->
    <link href="../resources/kth_dist/css/style.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
   <style>
.contectDeptList button:hover {
	font-weight: bold;
}
.accordion {
	height: 80px;
}
.accordion-button {
	height: 60px;
}
</style>
</head>

<body>

<jsp:include page="../common/top.jsp"/>
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
    <div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">

        <!-- ============================================================== -->
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
                	<!-- 주소록 영역 -->
                    <div class="col-7 align-self-center">
                        <h2 class="page-title text-truncate text-dark font-weight-medium mb-1">메신저</h2>
                        
                        <br><br><br>
                         <h3 class="page-title text-truncate text-dark font-weight-medium mb-1">주소록</h3>
                         
                        <div class="d-flex align-items-center">

                        </div>
                    </div>
                    <!-- 주소록 영역 끝 -->
                    
                    <div class="col-5 align-self-center">
                        <div class="customize-input float-right">
                            <select class="custom-select custom-select-set form-control bg-white border-0 custom-shadow custom-radius">
                                <option selected>Aug 19</option>
                                <option value="1">July 19</option>
                                <option value="2">Jun 19</option>
                            </select>
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
            <div class="container-fluid">
                <div class="row">
                
                    <div class="col-md-12">
                        <div class="card">
                            <div class="row no-gutters">
                                <div class="col-lg-3 col-xl-2 border-right">
                                    <div class="card-body border-bottom">
                                        <form>
                                            <input class="form-control" type="text" placeholder="이름을 입력해 주세요" id="searchName">
                                        </form>
                                    </div>
                                    <div class="scrollable position-relative" style="height: calc(100vh - 111px);">
                                        <ul class="mailbox list-style-none" id="contectList">
                                            <li>
                                                  <!-- 주소록 상세 영역 -->
                                                <div class="message-center">
                                              
                                                    <a href="javascript:void(0)"
                                                        class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                                        <div class="user-img"><img src="../resources/kth_assets/images/users/1.jpg"
                                                                alt="user" class="img-fluid rounded-circle"
                                                                width="40px"> <span
                                                                class="profile-status online float-right"></span>
                                                        </div>
                                                        <div class="w-75 d-inline-block v-middle pl-2">
                                                            <h6 class="message-title mb-0 mt-1">김재호</h6>
                                                            <span
                                                                class="font-12 text-nowrap d-block text-muted text-truncate">Just
                                                                see
                                                                the my new
                                                                admin!</span>
                                                            <span class="font-12 text-nowrap d-block text-muted">9:30
                                                                AM</span>
                                                        </div>
                                                    </a>
                                                    <!-- Message -->
                                                    <a href="javascript:void(0)"
                                                        class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                                        <div class="user-img"><img src="../resources/kth_assets/images/users/7.jpg"
                                                                alt="user" class="img-fluid rounded-circle"
                                                                width="40px"> <span
                                                                class="profile-status busy float-right"></span>
                                                        </div>
                                                        <div class="w-75 d-inline-block v-middle pl-2">
                                                            <h6 class="message-title mb-0 mt-1">김지수</h6>
                                                            <span
                                                                class="font-12 text-nowrap d-block text-muted text-truncate">I've
                                                                sung a
                                                                song! See you at</span>
                                                            <span class="font-12 text-nowrap d-block text-muted">9:10
                                                                AM</span>
                                                        </div>
                                                    </a>
                                                    <!-- Message -->
                                                    <a href="javascript:void(0)"
                                                        class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                                        <div class="user-img"> <img src="../resources/kth_assets/images/users/3.jpg"
                                                                alt="user" class="img-fluid rounded-circle"
                                                                width="40px"> <span
                                                                class="profile-status away float-right"></span>
                                                        </div>
                                                        <div class="w-75 d-inline-block v-middle pl-2">
                                                            <h6 class="message-title mb-0 mt-1">임현빈</h6>
                                                            <span
                                                                class="font-12 text-nowrap d-block text-muted text-truncate">I
                                                                am a
                                                                singer!</span>
                                                            <span class="font-12 text-nowrap d-block text-muted">9:08
                                                                AM</span>
                                                        </div>
                                                    </a>
                                                    <!-- Message -->
                                                    <a href="javascript:void(0)"
                                                        class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                                        <div class="user-img"><img src="../resources/kth_assets/images/users/4.jpg"
                                                                alt="user" class="img-fluid rounded-circle"
                                                                width="40px"> <span
                                                                class="profile-status offline float-right"></span>
                                                        </div>
                                                        <div class="w-75 d-inline-block v-middle pl-2">
                                                            <h6 class="message-title mb-0 mt-1">전재은</h6>
                                                            <span
                                                                class="font-12 text-nowrap d-block text-muted text-truncate">Just
                                                                see the my admin!</span>
                                                            <span class="font-12 text-nowrap d-block text-muted">9:02
                                                                AM</span>
                                                        </div>
                                                    </a>
                                                  
                                                </div>
                                              <!-- 주소록 상세 영역 끝 -->
                                              
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-lg-9  col-xl-10">
                                    <div class="chat-box scrollable position-relative"
                                        style="height: calc(100vh - 111px);">
                                        <div style="float: left;">
											<!-- <img
												src="${ pageContext.servletContext.contextPath }/resources/assets/images/users/1.jpg"
												alt="user" class="rounded-circle" width="65"> -->
										</div>

										<div style="float: left;">
											<img
												src="${ pageContext.servletContext.contextPath }/resources/kth_assets/images/users/1.jpg"
												alt="user" class="rounded-circle" width="65">
										</div>
										
										<div style="float: left; margin-left: 10px;">

												  	<span id='receiverName'
														style="font-size: 22px; color: #1c2d41; font-weight: bold;">김재호</span>
													<span id="job" style="font-size: 16px;">팀장</span>
													<br>
													<span id="dept" style="font-size: 12px;"> 인사부
													</span>
													<br><br>
													

													<!--  <span style="font-size: 14px;"><i class="icon-clock"></i>
														메신저의 대화기록은 일주일 보존됩니다.</span>
													<br>
													<span style="font-size: 14px;"> 이전 기록이 필요하시면
													보안실로 문의주시기 바랍니다.</span>-->
									
										</div>
                                        <!--채팅영역 -->
                                        <ul class="chat-list list-style-none px-3 pt-3">
                                            <!--chat Row -->
                                            <li class="chat-item list-style-none mt-3">

                                                <div class="chat-content d-inline-block pl-3">
                                                    <h6 class="font-weight-medium">김재호</h6>
                                                    <div class="msg p-2 d-inline-block mb-1">안녕하세요</div>
                                                </div>
                                                <div class="chat-time d-block font-10 mt-1 mr-0 mb-3">10:56 am
                                                </div>
                                            </li>
                                           
                                           
                                            <!--chat Row -->
                                            <li class="chat-item odd list-style-none mt-3">
                                                <div class="chat-content text-right d-inline-block pl-3">
                                                    <div class="box msg p-2 d-inline-block mb-1 box">안녕하세요</div>
                                                    <br>
                                                </div>
                                                <div class="chat-time text-right d-block font-10 mt-1 mr-0 mb-3">
                                                    10:59 am</div>
                                            </li>
                                        </ul>
                                        <!-- 채팅 영역 끝 -->
                                    </div>
                                    <div class="card-body border-top">
                                        <div class="row">
                                            <div class="col-9">
                                                <div class="input-field mt-0 mb-0">
                                                    <input id="message" placeholder="내용을 입력해 주세요"
                                                        class="form-control border-0" type="text">
                                                </div>
                                            </div>
                                            <div class="col-3">
                                                <!--  <a class="btn-circle btn-lg btn-cyan float-right text-white"
                                                    href="javascript:void(0)"><i class="fas fa-paper-plane"></i></a>-->
                                                 <!--  <button id = "message">전송</button>-->
                                                 <button type="button" class="btn btn-primary" id="sendBtn">전송</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
       
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->

    </div>
     <jsp:include page="../common/bottom.jsp"/>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="../resources/kth_assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="../resources/kth_assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="../resources/kth_assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- apps -->
    <!-- apps -->
    <script src="../resources/kth_dist/js/app-style-switcher.js"></script>
    <script src="../resources/kth_dist/js/feather.min.js"></script>
    <script src="../resources/kth_assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="../resources/kth_dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="../resources/kth_dist/js/custom.min.js"></script>
    <!--This page JavaScript -->
    <script>
        $(function () {
            $(document).on('keypress', "#textarea1", function (e) {
                if (e.keyCode == 13) {
                    var id = $(this).attr("data-user-id");
                    var msg = $(this).val();
                    msg = msg_sent(msg);
                    $("#someDiv").append(msg);
                    $(this).val("");
                    $(this).focus();
                }
            });
        });
    </script>
    
</body>

</html>
</html>