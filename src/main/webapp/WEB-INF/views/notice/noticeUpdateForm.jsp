<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="top.jsp" />

	<div class="container-xxl flex-grow-1 container-p-y">
	  <div class="card mb-4">
      <!-- 게시글 작성 양식 시작 -->
      <form>
	      <div class="card-body">
	      <button type="button" class="btn btn-primary mb-2">목록으로</button>
	      	<!-- 작성자 -->
	        <div class="mb-3">
	          <label for="exampleFormControlSelect1" class="form-label text-primary">작성자</label>
			  <select class="form-select" id="exampleFormControlSelect1" aria-label="Default select example">
	            <option value="1">김지수</option>
	            <option value="2">기획팀</option>
	          </select>
	        </div>
	        <!-- 카테고리 -->
	        <div class="mb-3">
	          <label for="exampleFormControlSelect1" class="form-label text-primary">분류</label>
	          <select class="form-select" id="exampleFormControlSelect1" aria-label="Default select example">
	            <option value="1">일반</option>
	            <option value="2">중요</option>
	          </select>
	        </div>
	        <!-- 제목 -->
	        <div class="mb-3">
	          <label for="exampleFormControlReadOnlyInput1" class="form-label text-primary">제목</label>
	          <input class="form-control" type="text" id="exampleFormControlReadOnlyInput1" value="어린이날 대체공휴일 휴무안내" placeholder="제목을 입력해주세요.">
	        </div>
	        <!-- 내용 -->
	        <div class="mb-3">
	          <label for="exampleFormControlTextarea1" class="form-label text-primary">내용</label>
	          <textarea class="form-control" id="exampleFormControlTextarea1" rows="10">

	          </textarea>
	        </div>
		    <div>
		    	<button type="submit" class="btn btn-success">수정하기</button>
		    	<button type="reset" class="btn btn-danger">다시작성</button>
		    </div>
	    </div>
	    </form>
	    <!-- 게시글 작성 양식 끝 -->
    </div>
		
	</div>

	<jsp:include page="bottom.jsp" />

</body>
</html>