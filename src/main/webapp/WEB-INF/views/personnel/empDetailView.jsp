<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed " dir="ltr" data-theme="theme-default" data-assets-path="../assets/" data-template="vertical-menu-template-free">

  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>Account settings - Account | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>
    
    <meta name="description" content="Most Powerful &amp; Comprehensive Bootstrap 5 HTML Admin Dashboard Template built for developers!" />
    <meta name="keywords" content="dashboard, bootstrap 5 dashboard, bootstrap 5 design, bootstrap 5">
    <!-- Canonical SEO -->
    <link rel="canonical" href="https://themeselection.com/products/sneat-bootstrap-html-admin-template/">
    
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/fonts/boxicons.css" />
    
    

    <!-- Core CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />
    
    

    <!-- Page CSS -->
    
    <!-- Helpers -->
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/config.js"></script>
    
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async="async" src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"></script>
   

</head>
<style>
#home{background-color: rgb(144, 145, 191);}
</style>
<body>
<jsp:include page="top.jsp"/>

  <div class="layout-container">

   
      

      <!-- Content wrapper -->
      <div class="content-wrapper">

        <!-- Content -->
        
          <div class="container-xxl flex-grow-1 container-p-y">
            
            


<div class="row">
  <div class="col-md-12">
    
    <div class="card mb-4">
      <h4 class="card-header">직원 정보</h4>
      
      <div class="card-body">
      
        <div class="d-flex align-items-start align-items-sm-center gap-4">
        
          <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/1.png" alt="user-avatar" class="d-block rounded" height="150" width="200" id="uploadedAvatar" />
      		 <div id="topPage" >
                    <div id="title">
					<h5  name="empName"> 이름 : 김재호</h5>
					<h5 name="email"> 이메일 : shslove22@nate.com </h5>
					<h5 name= phone>전화번호 : 010-888-8888</h5>
                    </div>
					</div>
        </div>
      </div>
      <hr class="my-0">
      <div class="card-body">
        <form id="formAccountSettings" method="POST" onsubmit="return false">
          <div class="row">
           		<div class="mb-3 col-md-6">
              <label for="lastName" class="form-label">내선 번호</label>
              <input class="form-control" type="text" name="telNo"  value="02-888-8888" />
            </div>
             <div class="mb-3 col-md-6">
              <label for="address" class="form-label">주소</label>
              <input type="text" class="form-control" id="address" name="address" value="면목동" />
            </div>
               <div class="mb-3 col-md-6">
              <label for="deptName" class="form-label">부서</label>
              <select id="deptName" class="select2 form-select">
                <option value="">총무부</option>
                <option value="-12">법무부</option>
                <option value="-12">총무부</option>
              </select>
            </div>
            <div class="mb-3 col-md-6">
              <label for="jobName" class="form-label">직위</label>
              <select id="jobName" class="select2 form-select">
                <option value="">부장</option>
                <option value="-12">부장</option>
                <option value="-12">차장</option>
                <option value="-12">사원</option>
              </select>
            </div>

            <div class="mb-3 col-md-6">
              <label for="organization" class="form-label">생년월일</label>
              <input type="text" class="form-control" id="empReg" name="empReg" value="960305" />
            </div>
          
            <div class="mb-3 col-md-6">
              <label for="address" class="form-label">입사일</label>
              <input type="text" class="form-control" id="hireDate" name="hireDate" value="1996-03-05" />
            </div>
			    <div class="mb-3 col-md-6">
              <label for="disabledYN" class="form-label">장애여부</label>
              <select id="disabledYN" class="select2 form-select">
    		   <option value="">N</option>
    		 <option value="-12">Y</option>
           	 </select>
            </div>
                <div class="mb-3 col-md-6">
              <label for="entYN" class="form-label">재직 여부</label>
              <select id="entYN" class="select2 form-select">
    		    <option value="-12">Y</option>
    		   <option value="">N</option>
           	 </select>
            </div>
           <div class="mb-3 col-md-6">
              <label for="organization" class="form-label">특이사항</label>
              <input type="text" class="form-control" id="empNote" name="empNote" value="대통령 비서 출신" />
            </div> 
         
          </div>
          <div class="mt-2">
          <button type="submit" id="home" class="btn btn-primary me-3">목록으로</button>
            <button type="submit" class="btn btn-primary me-2">수정하기</button>
            <button type="reset" class="btn btn-outline-secondary">삭제하기</button>
          </div>
        </form>
      </div>
      <!-- /Account -->
    </div>
    <div class="card">
 
    </div>
  </div>
</div>


            
          </div>


          
          <div class="content-backdrop fade"></div>
        </div>
        <!-- Content wrapper -->
      </div>
      <!-- / Layout page -->
   
    
    <!-- Overlay -->
  
    
    
	<jsp:include page="bottom.jsp"/>
  <!-- Core JS -->
  <!-- build:js assets/vendor/js/core.js -->
  <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/jquery/jquery.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/popper/popper.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/vendor/js/bootstrap.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
  
  <script src="${pageContext.request.contextPath}/resources/assets/vendor/js/menu.js"></script>
  
  <!-- Main JS -->
  <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

  <!-- Page JS -->
  <script src="${pageContext.request.contextPath}/resources/assets/js/pages-account-settings-account.js"></script>
  
  <!-- Place this tag in your head or just before your close body tag. -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  
</body>

</html>