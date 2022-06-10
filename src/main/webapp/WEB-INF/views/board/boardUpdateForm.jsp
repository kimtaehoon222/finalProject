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
      <h3 class="card-header text-primary"><b>게시글 수정</b></h3>
      
      <!-- 게시글 작성 양식 시작 -->
      <form>
	      <div class="card-body">
	        <!-- 카테고리 -->
	        <div class="mb-3">
	          <label for="exampleFormControlSelect1" class="form-label text-primary">Category</label>
	          <select class="form-select" id="exampleFormControlSelect1" aria-label="Default select example">
	            <option value="1">일상이야기</option>
	            <option value="2">Tech</option>
	          </select>
	        </div>
	        <!-- 제목 -->
	        <div class="mb-3">
	          <label for="exampleFormControlReadOnlyInput1" class="form-label text-primary">Title</label>
	          <input class="form-control" type="text" id="exampleFormControlReadOnlyInput1" value="현충일에 일하는 중..." placeholder="제목을 입력해주세요.">
	        </div>
	        <!-- 내용 -->
	        <div class="mb-3">
	          <label for="exampleFormControlTextarea1" class="form-label text-primary">Content</label>
	          <textarea class="form-control" id="exampleFormControlTextarea1" rows="10" placeholder="내용을 입력해주세요.">회사에 저만 있네요..하하...</textarea>
	        </div>
	        <div class="mb-3">
	          <label for="formFile" class="form-label text-primary">Image File</label>
	          <input class="form-control" type="file" id="formFile">
	          <label for="formFile" class="form-label text-danger">*게시글의 타이틀 이미지를 첨부해주세요.&nbsp;jpg, png 파일만 가능합니다.</label>
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