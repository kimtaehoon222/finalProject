<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${ !empty msg }">
		<script>
			alert("${msg}");
		</script>
		<c:remove var="msg" scope="session"/>
	</c:if>
	<jsp:include page="top.jsp"/>
    
    <div class="container-xxl container-p-y"  style="text-align:center">
      <div class="misc-wrapper">
        <h2 class="mb-2 mx-2">${ msg }</h2>
        <h2>${ ref_form }</h2>
        <p class="mb-4 mx-2">${ requestScope['javax.servlet.error.message'] }</p>
        <a href="/" class="btn btn-primary">Back to home</a>
        <div class="mt-4">
          <img
            src="${pageContext.request.contextPath}/resources/assets/img/illustrations/girl-doing-yoga-light.png"
            alt="girl-doing-yoga-light"
            width="500"
            class="img-fluid"
            data-app-dark-img="illustrations/girl-doing-yoga-dark.png"
            data-app-light-img="illustrations/girl-doing-yoga-light.png"
          />
        </div>
      </div>
    </div>
	
	<jsp:include page="bottom.jsp"/>
</body>
</html>