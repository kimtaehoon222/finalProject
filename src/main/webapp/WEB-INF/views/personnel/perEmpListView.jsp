<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>

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
	<jsp:include page="top.jsp"/>
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
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>김재호</td>
                                        <td>shslove22@nate.com</td>
                                        <td>076 4820 8838</td>
                                        <td>인사과</td>
                                       	<td>부장</td>
                                    </tr>
                                        <tr>
                                        <td>김재호</td>
                                        <td>shslove22@nate.com</td>
                                        <td>076 4820 8838</td>
                                        <td>인사과</td>
                                       	<td>부장</td>
                                    </tr>
                                         <tr>
                                        <td>김재호</td>
                                        <td>shslove22@nate.com</td>
                                        <td>076 4820 8838</td>
                                        <td>인사과</td>
                                       	<td>부장</td>
                                    </tr>
                                         <tr>
                                        <td>김재호</td>
                                        <td>shslove22@nate.com</td>
                                        <td>076 4820 8838</td>
                                        <td>인사과</td>
                                       	<td>부장</td>
                                    </tr>
                                         <tr>
                                        <td>김재호</td>
                                        <td>shslove22@nate.com</td>
                                        <td>076 4820 8838</td>
                                        <td>하하</td>
                                       	<td>부장</td>
                                    </tr>
                                         <tr>
                                        <td>김재호</td>
                                        <td>shslove22@nate.com</td>
                                        <td>076 4820 8838</td>
                                        <td>인사과</td>
                                       	<td>부장</td>
                                    </tr>
                                         <tr>
                                        <td>김재호</td>
                                        <td>shslove22@nate.com</td>
                                        <td>076 4820 8838</td>
                                        <td>인사과</td>
                                       	<td>부장</td>
                                    </tr>
                                         <tr>
                                        <td>김태훈</td>
                                        <td>shslove22@nate.com</td>
                                        <td>076 4820 8838</td>
                                        <td>인사과</td>
                                       	<td>부장</td>
                                    </tr>
                                         <tr>
                                        <td>김재호</td>
                                        <td>shslove22@nate.com</td>
                                        <td>076 4820 8838</td>
                                        <td>인사과</td>
                                       	<td>부장</td>
                                    </tr>
                                         <tr>
                                        <td>김재호</td>
                                        <td>shslove22@nate.com</td>
                                        <td>076 4820 8838</td>
                                        <td>인사과</td>
                                       	<td>부장</td>
                                    </tr>
                                         <tr>
                                        <td>김재호</td>
                                        <td>shslove22@nate.com</td>
                                        <td>076 4820 8838</td>
                                        <td>인사과</td>
                                       	<td>부장</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </section>
            </div>

         
        </div>
        
    </div>
    <jsp:include page="bottom.jsp"/>
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
















    