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
	<jsp:include page="${pageContext.request.contextPath}/top.jsp"/>
    
	<c:if test="${requestScope['javax.servlet.error.status_code'] == 404}">
	    <div class="container-xxl container-p-y" style="text-align:center">
	      <div class="misc-wrapper">
	        <h2 class="mb-2 mx-2">Page Not Found :(</h2>
	        <p class="mb-4 mx-2">Oops! 😖 The requested URL was not found on this server.</p>
	        <a href="index.html" class="btn btn-primary">Back to home</a>
	        <div class="mt-3">
	          <img
	            src="${pageContext.request.contextPath}/resources/assets/img/illustrations/page-misc-error-light.png"
	            alt="page-misc-error-light"
	            width="500"
	            class="img-fluid"
	            data-app-dark-img="illustrations/page-misc-error-dark.png"
	            data-app-light-img="illustrations/page-misc-error-light.png"
	          />
	        </div>
	      </div>
	    </div>
	</c:if>


		
	<c:if test="${requestScope['javax.servlet.error.status_code'] == 500}">
	    <div class="container-xxl container-p-y"  style="text-align:center">
	      <div class="misc-wrapper">
	        <h2 class="mb-2 mx-2">Internal Server error!</h2>
	        <p class="mb-4 mx-2"></p>
	        <a href="index.html" class="btn btn-primary">Back to home</a>
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
	</c:if>
	

	
	<a href="${pageContext.servletContext.contextPath}">HOME</a>
		
	
	<jsp:include page="${pageContext.request.contextPath}/bottom.jsp"/>
</body>
</html>