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
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/img/logo/W.png" /> 

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

    <!--????????? css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jje_css/jje_login.css" />
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
                    2asy Work???<br>
                   	????????? ????????? ???????????????.   
                </h3>
            </div>
        </div>
    </div>
        
	<!-- Content -->
	<div class="container-xxl">
	    <div class="authentication-wrapper authentication-basic container-p-y">
			<div class="join-card">
				<div class="card-body">
			     	
			     	<!-- Logo -->
					<div class="app-brand justify-content-center">
						<span class="app-brand-text demo text-body fw-bolder m-2 mb-2">Join</span>
					</div>
					<!-- / Logo -->
					
					<!-- ???????????? ??? -->
					<form id="formAuthentication" class="m-3 join-input" action="insertEmp.do" method="POST">
						<!-- ?????? -->
						<div class="mb-2">
						    <input type="text" class="form-control" id="empName" name="empName" placeholder="Name" autofocus required title="??????"/>
						</div>
						<!-- ????????? -->
					    <div class="mb-2">
					        <input type="text" class="form-control" id="phone" name="phone" placeholder="Phone" autofocus required title="?????????"/>
					    </div>
						<!-- ID, ????????? -->
					    <div class="mb-2">
					        <input type="text" class="form-control" id="empId" name="empId" placeholder="ID" autofocus required title="ID, ?????????"/>
					    </div>
						<!-- ???????????? -->
					    <div class="mb-2">
					        <input type="text" class="form-control" id="empReg" name="empReg" placeholder="Persnal Number" autofocus required title="????????????"/>
					    </div>
						<!-- ???????????? -->
					    <div class="mb-2 form-password-toggle">
					        <div class="input-group input-group-merge">
					        <input type="password" class="form-control" id="empPwd" name="empPwd" placeholder="Pwd" aria-describedby="password" required title="????????????"/>
					        <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
					        </div>
					    </div>
						<!-- ?????? -->
					    <div class="mb-2">
					        <input type="text" class="form-control" id="address" name="address" placeholder="Address" autofocus required title="??????"/>
					    </div>
					    
					    <!--?????????, ???????????? ??????-->
						<div class="join-buttons">
							<button class="btn rounded-pill btn-primary" type="submit" title="??????">Submit</button>
							<button class="btn rounded-pill btn-secondary" type="reset" title="?????????">Reset</button>
						</div>
					</form>
					<!-- ???????????? ??? -->
					<script>
						$(function(){
				            
				            /*Form submit*/
				            $('form').submit(function(event){
				            	
								/*?????? ?????? ?????????*/
				                var chkName = /^[???-???]{2,6}$/;
			                	if(!chkName.test($('#empName').val())){
									alert("????????? ????????? ????????? ????????? ??????????????????.");	//??????
									$('#empName').focus();			//?????????
									return false;
			                	}
					            
					            /*????????? ?????????*/
				            	var chkPhone = /^010\d{8}$/;
								if(!chkPhone.test($('#phone').val())){
									alert("???????????? ??????????????? ???????????? \"010\"?????? ??????????????????.");
									$('#phone').focus();
									return false;
								}		            	
					            
					            /*ID, ????????? ?????????*/
					            var chkId = /^[a-zA-Z0-9]+([_]?[a-zA-Z0-9]){2,19}$/;
								if(!chkId.test($('#empId').val())){
									alert("Id,Email??? ??????????????? ????????? 3?????? ???????????? ??????????????????.");
									$('#empId').focus();
									return false;
								}
					            
					            /*???????????? ?????????*/
					            var chkReg = /^\d{2}([0]\d|[1][0-2])([0][1-9]|[1-2]\d|[3][0-1])[1-4]\d{6}$/;
					            if(!chkReg.test($('#empReg').val())){
									alert("??????????????? \"-\"??? ???????????? ??????????????????");
									$('#empReg').focus();
									return false;
								}
					            
					            /*???????????? ?????????*/
								var chkPwd = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[~!@#$*?]).{4,10}$/;
					            if(!chkPwd.test($('#empPwd').val())){
									alert("??????????????? 4~10??? ????????? ??????, ??????, ??????????????? ???????????? ???????????? ??????????????????.");
									$('#empPwd').focus();
									return false;
								}
				            	
				            })
				            
						});
					</script>
				</div>
			</div>
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
