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
#home{background-color: rgb(144, 145, 191); }
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
      <h4 class="card-header">????????? ??????</h4>
      
      <div class="card-body">
      
        <div class="d-flex align-items-start align-items-sm-center gap-4">
        
          <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/1.png" alt="user-avatar" class="d-block rounded" height="150" width="200" id="uploadedAvatar" />
      		 <div id="topPage" >
                    <div id="title">
					<h5  name="empName"> ?????? : ?????????</h5>
					<h5 name="email"> ????????? : shslove22@nate.com </h5>
					<h5 name= phone>???????????? : 010-888-8888</h5>
                    </div>
					</div>
        </div>
      </div>
      <hr class="my-0">
      <div class="card-body">
        <form id="formAccountSettings" method="POST" onsubmit="return false">
          <div class="row">
          		 <div class="mb-3 col-md-6">
              <label for="address" class="form-label">??????</label>
              <input type="text" class="form-control" id="address" name="address" value="?????????" readonly="readonly"/>
            </div>
               <div class="mb-3 col-md-6">
              <label for="organization" class="form-label">????????????</label>
              <input type="text" class="form-control" id="empReg" name="empReg" value="960305" readonly="readonly"/>
            </div>
           		<div class="mb-3 col-md-6">
              <label for="deptName" class="form-label">????????? ??????</label>
              <input class="form-control" type="text" name="deptName"  value="?????????" readonly="readonly"/>
            </div>
            <div class="mb-3 col-md-6">
              <label for="jobName" class="form-label">????????? ??????</label>
              <input class="form-control" type="text" name="jobName"  value="??????" readonly="readonly"/>
            </div>

          
            <div class="mb-3 col-md-6">
              <label for="entDate" class="form-label">?????????</label>
              <input type="text" class="form-control" id="entDate" name="entDate" value="2022-06-10" readonly="readonly"/>
            </div>

           <div class="mb-3 col-md-6">
              <label for="organization" class="form-label">????????????</label>
              <input type="text" class="form-control" id="empNote" name="empNote" value="????????? ?????? ??????" readonly="readonly"/>
            </div> 
         	 
          </div>
          <div class="mt-2">
           <button  class="btn btn-primary me-2">????????????</button>
           <button type="submit" class="btn btn-outline-secondary">?????? ??? ??????</button>
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
