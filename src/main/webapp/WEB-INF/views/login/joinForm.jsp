<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<!-- =========================================================
* Sneat - Bootstrap 5 HTML Admin Template - Pro | v1.0.0
==============================================================

* Product Page: https://themeselection.com/products/sneat-bootstrap-html-admin-template/
* Created by: ThemeSelection
* License: You must have a valid license purchased in order to legally use the theme for your project.
* Copyright ThemeSelection (https://themeselection.com)

=========================================================
-->
<!-- beautify ignore:start -->
<html
lang="en"
class="light-style customizer-hide"
dir="ltr"
data-theme="theme-default"
data-assets-path="${pageContext.request.contextPath}/resources/assets/"
data-template="vertical-menu-template-free"
>
<head>
    <meta charset="utf-8" />
    <meta
        name="viewport"
        content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>Join</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
        href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
        rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <!-- Page CSS -->
    <!-- Page -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/css/pages/page-auth.css" />
    <!-- Helpers -->
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/config.js"></script>

    <!--로그인 css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jje_css/jje_login.css" />
</head>

<body>
	<c:if test="${ !empty msg }">
		<script>
			alert("${msg}");
		</script>
		<c:remove var="msg" scope="session"/>
	</c:if>
	
    <nav class="layout-navbar">
        <img src="${pageContext.request.contextPath}/resources/assets/img/logo/logo_1.png" style="cursor: pointer" onclick="login()"/>
        <script>
        	function login(){
        		location.href="loginForm.do";
        	}
        </script>
    </nav>
    <div class="login-background">
        <img class="logo-img" src="${pageContext.request.contextPath}/resources/assets/img/logo/W3.png"/>
        <div class="text-div welcome-div">
            <div class="display-1 title-text">
                Welcome !
            </div>
            <div class="content-text mt-2">
                <h3>
                    2asy Work의<br>
                   	새로운 회원을 환영합니다.   
                </h3>
            </div>
        </div>
    </div>
        
        <!-- Content -->
        <div class="container-xxl">
            <div class="authentication-wrapper authentication-basic container-p-y">
        <!-- <div class="authentication-inner"> -->
            <!-- Register -->
            <div class="join-card">
            <div class="card-body">
                <!-- Logo -->
                <div class="app-brand justify-content-center">
                <span class="app-brand-text demo text-body fw-bolder m-2 mb-2">Join</span>
                </div>

                <form id="formAuthentication" class="m-3 join-input" action="insertEmp.do" method="POST">
                    <div class="mb-2">
                        <input type="text" class="form-control" id="empName" name="empName" placeholder="Name" autofocus required/>
                    </div>
                    <div class="mb-2">
                        <input type="tel" class="form-control" id="phone" name="phone" placeholder="Phone" autofocus required/>
                    </div>
                    <div class="mb-2">
                        <input type="text" class="form-control" id="empId" name="empId" placeholder="ID" autofocus required/>
                    </div>
                    <div class="mb-2">
                        <input type="text" class="form-control" id="empReg" name="empReg" placeholder="Persnal Number" autofocus required/>
                    </div>
                    <div class="mb-2 form-password-toggle">
                        <div class="input-group input-group-merge">
                        <input type="password" class="form-control" id="empPwd" name="empPwd" placeholder="Pwd" aria-describedby="password" required/>
                        <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
                        </div>
                    </div>
                    <div class="mb-2">
                        <input type="text" class="form-control" id="address" name="address" placeholder="Address" autofocus required/>
                    </div>
                    <!-- <div class="mb-2">
                        <select id="deptCode" name="deptCode" class="form-select" autofocus>
                            <option>Department</option>
                            <option value="D1">인사관리부</option>
                            <option value="D2">회계관리부</option>
                            <option value="D3">마게팅부</option>
                            <option value="D4">자재관리부</option>
                            <option value="D5">기획영업부</option>
                            <option value="D6">경영관리부</option>
                            <option value="D7">기술개발부</option>
                        </select>
                    </div>
                    <div class="mb-2">
                        <select id="jobCode" name="jobCode" class="form-select" autofocus>
                            <option>Job</option>
                            <option value="J1">대표</option>
                            <option value="J2">부사장</option>
                            <option value="J3">부장</option>
                            <option value="J4">차장</option>
                            <option value="J5">과장</option>
                            <option value="J6">대리</option>
                            <option value="J7">사원</option>
                            <option value="J8">인턴</option>
                        </select>
                    </div> -->
                    <!--로그인, 회원가입 버튼-->
                    <div class="join-buttons">
                        <button class="btn rounded-pill btn-primary" type="submit">Submit</button>
                        <button class="btn rounded-pill btn-secondary" type="reset">Reset</button>
                    </div>
                </form>
            </div>
            </div>
            <!-- /Register -->
        <!-- </div> -->
        </div>
    </div>

    <!-- / Content -->

    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/popper/popper.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="${pageContext.request.contextPath}/resources/assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->

    <!-- Main JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

    <!-- Page JS -->

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>
