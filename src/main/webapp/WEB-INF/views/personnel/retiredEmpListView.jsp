<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <title>퇴사자 목록</title>
     <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/img/logo/W.png" /> 
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/kjh123/css/bootstrap.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/kjh123/vendors/simple-datatables/style.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/kjh123/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/kjh123/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/kjh123/css/app.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/kjh123/images/favicon.svg" type="image/x-icon">
</head>

<body>
	<jsp:include page="../common/top.jsp" />
    <div id="app">
       
        <div id="main">
            <header class="mb-3">
                <a href="#" class="burger-btn d-block d-xl-none">
                    <i class="bi bi-justify fs-3"></i>
                </a>
            </header>

            <div class="page-heading">
                
                <section class="section">
                    <div class="card">
                        <div class="card-header">
                          <h2>퇴사자 목록</h2>
                          <hr>
                          
                        </div>
                        
                        <div class="card-body">
                            <table class="table table-striped" id="table1">
                                <thead>
                                    <tr>
                                        <th>이름</th>
                                        <th>이메일</th>
                                        <th>핸드폰</th>
                                        <th>퇴사전 부서</th>
                                        <th>퇴사전 직위</th>
                                        <th>   </th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${ list }" var="e">
                                    <tr>
                                     <td>${e.empName}</td>
                                      <td >${e.empId}</td>
                                      <td> ${e.phone}</td>
                                      <td>${e.deptName}</td>
                                     	<td>${e.jobName}</td>
               <td><a  class="btn btn-primary rounded-pill" href="detailRetiredEmp.do?eId=${e.empId}">상세보기</a></td>                                   
                                       	
                                    </tr>
                                
                                   </c:forEach> 
                                </tbody>
                            </table>
                        </div>
                    </div>

                </section>
            </div>

         
        </div>
        
    </div>
          <script>
          function emp(e){
        		console.log(e.innerText)
        	    location.href="detailRetiredEmp.do?eId=" +e.innerText;
          	};
    </script>
     <jsp:include page="../common/bottom.jsp" />
    <script src="${pageContext.request.contextPath}/resources/kjh123/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/kjh123/js/bootstrap.bundle.min.js"></script>

    <script src="${pageContext.request.contextPath}/resources/kjh123/vendors/simple-datatables/simple-datatables.js"></script>
    <script>
        // Simple Datatable
        let table1 = document.querySelector('#table1');
        let dataTable = new simpleDatatables.DataTable(table1);
    </script>

    <script src="${pageContext.request.contextPath}/resources/kjh123/js/main.js"></script>
</body>

</html>
















    