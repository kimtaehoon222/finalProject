<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed " dir="ltr" data-theme="theme-default" data-assets-path="../assets/" data-template="vertical-menu-template-free">

  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

   
   
    
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
<jsp:include page="../common/top.jsp" />

  <div class="layout-container">

   
      

      <!-- Content wrapper -->
      <div class="content-wrapper">

        <!-- Content -->
        
          <div class="container-xxl flex-grow-1 container-p-y">
            
            


<div class="row">
  <div class="col-md-12">    
    <div class="card mb-4">
      <h4 class="card-header">직원 승인 페이지</h4>
   <form class="reg-form mb-5" action="insertEmp.do" enctype="multipart/form-data" method="post" >
      
      <div class="card-body">
     
        <div class="d-flex align-items-start align-items-sm-center gap-4">
    
       		  <div class="field-row mb-3">
             
            <img id="titleImg" name="titleImg" width="250" height="200">
         </div>

      		 <div id="topPage" >
                    <div id="title">
				    <h5>이메일 : ${e.empId}@easy.co.kr</h5>
					<h5>전화번호 : ${e.phone}</h5>
					<h5>생년월일 : ${e.empReg}</h5>
                    </div>
                    
					</div>
					
        		</div>
        		  <!-- 숨겨져있는 파일영역 -->
           <div id="fileArea">
             <input type="file" accept="image/*" name="file" id="file" onchange="loadImg(this);">
          </div> 		
        
      </div>
      <hr>
      <div class="card-body">
          <div class="row">
          <div class="mb-3 col-md-6">
              <label for="empName" class="form-label">이름 </label>
              <input type="text" class="form-control" id="empName" name="empName" value="${e.empName}" />
            </div>
           	<div class="mb-3 col-md-6">
              <label for="lastName" class="form-label">내선 번호</label>
              <input class="form-control" type="text" name="telNo"  value="" />
            </div>
             <div class="mb-3 col-md-6">
              <label for="address" class="form-label">주소</label>
              <input type="text" class="form-control" id="address" name="address" value="${e.address}" readonly/>
            </div>
            <div class="mb-3 col-md-6">
              <label for="organization" class="form-label">생년월일</label>
              <input type="text" class="form-control" id="empReg" name="empReg" value="${e.empReg}" readonly/>
            </div>
               <div class="mb-3 col-md-6">
              <label for="deptName" class="form-label">부서</label>
             <select name ="deptCode" id="deptCode" class="select2 form-select">
                <option value="">부서선택</option>
                <option value="D1">인사관리부</option>
                <option value="D2">회계관리부</option>
                <option value="D3">마케팅부</option>
                <option value="D4">자재관리부</option>
                <option value="D5">기획영업부</option>
                <option value="D6">경영관리부</option>
                <option value="D7">기술개발부</option>
              </select>
            </div>
            <div class="mb-3 col-md-6">
              <label for="jobName" class="form-label">직위</label>
             <select name ="jobCode" id="jobCode" class="select2 form-select">
                <option>직위 선택</option>
                <option value="J1">사장</option>
                <option value="J2">부사장</option>
                <option value="J3">부장</option>
                <option value="J4">차장</option>
                <option value="J5">과장</option>
                <option value="J6">대리</option>
                <option value="J7">사원</option>
                <option value="J8">인턴</option>
              </select>
            </div>
        
            <div class="mb-3 col-md-6">
              <label for="address" class="form-label">입사일</label>
              <input type="text" class="form-control" id="hireDate" name="hireDate" value="${e.hireDate}" readonly/>
            </div>
			    <div class="mb-3 col-md-6">
              <label for="disabledYN" class="form-label">장애여부</label>
              <select id="disabledYN" class="select2 form-select">
    		   <option value="">N</option>
    		 <option value="-12">Y</option>
           	 </select>
            </div>
           <div class="mb-3 col-md-6">
              <label for="organization" class="form-label">특이사항</label>
              <input type="text" class="form-control" id="empNote" name="empNote" value=" " />
            </div> 
         
          </div>
          <!-- 수정하는 부분 끝 -->
          <div class="mt-2">
            <button type="submit" class="btn btn-primary me-2">승인하기</button>
            <button type="reset" class="btn btn-outline-secondary">취소하기</button>
          </div>
       
      </div>
  </form>     
    </div>
   
  </div>
</div>
         </div>


          
       
        </div>
        <!-- Content wrapper -->
      </div>
      <!-- / Layout page -->
   
    
    <!-- Overlay -->
      <script>
   	
       $(function(){
           // 파일 input 하는 부분은 숨겼음
           console.log("확인");
           $("#fileArea").hide();


           // 위에 이미지 부분을 클릭하면 숨겨놓은 input 버튼 클릭되게 구현
           $("#titleImg").click(function(){
              $("#file").click();
           });
        });

       function loadImg(inputFile){
           if(inputFile.files.length == 1){
              //readAsDataURL : 파일의 읽어서 리더에 업로드 동작이 되면서 파일 읽기가 완료가 되면 이미지 src를 URL에 담아주는 방식
              var reader = new FileReader(); //파일을 읽어 들일 객체 생성
              reader.readAsDataURL(inputFile.files[0]); //파일을 읽어 들이는 메소드
              // onload : 파일 읽기가 완료가 되면 실행 하는것
              reader.onload = function(e){ //파일 읽기가 다 완료 되면 실행
                 $("#titleImg").attr("src", e.target.result);
              }
           }
        }
       </script>
    
    
	<jsp:include page="../common/bottom.jsp" />
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
