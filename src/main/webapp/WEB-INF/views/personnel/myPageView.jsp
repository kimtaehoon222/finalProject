<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>


<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/kjh_assets/assets/images/favicon.png">
    <title>Groupware</title>
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/resources/kjh_assets/assets/extra-libs/c3/c3.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/kjh_assets/assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/kjh_assets/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/resources/kjh/css/style.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<style>
.info{
padding-left:45px;
}
.info li{
	
	margin: 15px 0px 12px 0px;
	font-size: 18px;
}
.hidden{
	
	display:none !important;
}
#profile-img:hover .change{
	top:50%;
}
picture-area{
	position:relative;
	overflow:hidden;
}
.profile-image{
	
	cursor:pointer;	
	width:125px;
	height:125px;
}
.update-picture{
	position:absolute;
	width:125px;
	height:60px;
}
.profile-image:hover .update-picture{
	font-size:15px;
	opacity:0.5;
	color:rgba(255,255,255,0.57);
}
#mainImg{float: left;}
#title{margin-left: 350px; margin-top: 15px;}
#allButton{margin-left:550px; margin-bottom: 20px;}
</style>

<body>
	<jsp:include page="../common/top.jsp" />
   	<br>
    <div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">
  
        <div class="page-wrapper">
            <div class="page-breadcrumb">
                <div class="row">
                 
                        <h1 class="mypage">마이 페이지</h1>
                        
                        <hr>	  
            		
         		    <div id="topPage" >
         		    <form action="updateEmp.do" method="post">
         		    <img id="mainImg" src="${pageContext.request.contextPath}/resources/assets/img/avatars/1.png" height="250" width="300"/>
                    <div id="title">
					<h3  name="empName">이름 : ${loginEmp.empName} </h3>
					<h3 name="deptName"> 부서 :  ${loginEmp.deptName}</h3>
					<h3  name="jobName"> 직위 : ${loginEmp.jobName}</h3>
					<h3  name="telNo"> 내선번호 :  ${loginEmp.telNo}</h3>
					<h3  name="empReg"> 생년월일 : ${loginEmp.empReg}</h3>
                    </div>
					</div>

                            <div class="update hidden d-block align-items-center">
                            <hr>
                       
                            	
								<ul class="ref navbar-nav">
									<li>
                            			<div class="card-body" >
								
											<h3 class="card-title">이메일 </h3>
											<input type="text" class="form-control phone" name="empId" value="${loginEmp.empId}">
										</div>
                            		</li>
                            		<li>
                            			<div class="card-body">
											<h3 class="card-title"> 연락처 </h3>
											<input type="text" class="form-control phone" name="phone" value="${loginEmp.phone}">
										</div>
                            		</li>
                            		<li>
                            			<div class="card-body">
											<h3 class="card-title"> 주소 </h3>
											<input type="text" class="form-control phone" name="address" value="${loginEmp.address}">
										</div>
                            		</li>
                            		
                            	
                            	</ul>
                            	
                            		
                            </div>
                            	<div id=allButton>
                            		<a data-toggle="modal" data-target="#passModal">비밀번호 수정하기</a>
                            		<button type="submit" class="off btn waves-effect waves-light btn-success"> 수정하기 </button>
									<button type="button" class="cancle btn waves-effect waves-light btn-danger"> 목록으로</button>    
                            		</div>
                            	</form>
            
            </div>
        </div>
    </div>
                    </div>
                  
                </div>
            </div>
        
                
               
          
        </div>
    
      <jsp:include page="../common/bottom.jsp" />
    <script src="${pageContext.request.contextPath}/resources/kjh_assets/assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/kjh_assets/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/kjh_assets/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- apps -->
    <!-- apps -->
    <script src="${pageContext.request.contextPath}/resources/kjh/js/app-style-switcher.js"></script>
    <script src="${pageContext.request.contextPath}/resources/kjh/js/feather.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/kjh_assets/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/kjh/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/kjh/js/custom.min.js"></script>
    <!--This page JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/kjh_assets/assets/extra-libs/c3/d3.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/kjh_assets/assets/extra-libs/c3/c3.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/kjh_assets/assets/libs/chartist/dist/chartist.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/kjh_assets/assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/kjh_assets/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/kjh_assets/assets/extra-libs/jvector/jquery-jvectormap-world-mill-en.js"></script>
    <script src="${pageContext.request.contextPath}/resources/kjh/js/pages/dashboards/dashboard1.min.js"></script>
	
</body>
	
	
</html>