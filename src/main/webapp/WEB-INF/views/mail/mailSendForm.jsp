<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>

<style type="text/css">

#ckbox:checked + div{
 display:none;
}

</style>
</head>

<body>
	<!-- top -->
	<jsp:include page="top.jsp" />

	<!-- 컨테이너 시작 -->
	<div class="container-xxl flex-grow-1 container-p-y">
	<h4 class="fw-bold py-3 mb-4">
  		<span class="text-muted fw-light">Email /</span> 작성하기
	</h4>

	<!-- 행 시작 -->
	<div class="row">
		<div class="col-md-12">
	    <ul class="nav nav-pills flex-column flex-md-row mb-3">
	      <li class="nav-item"><a class="nav-link active" href="javascript:void(0);">목록으로</a></li>
	    </ul>
    
	    <!-- 메일 영역 시작 -->
	    <div class="card mb-4">
	      <h5 class="card-header">김지수 jisu123@easy.co.kr</h5>
	      <!-- 보내는 사람 정보 영역 시작 -->
	      <div class="card-body">
	        <div class="d-flex align-items-start align-items-sm-center gap-4">
	          <!-- 보내는 사람 사진 -->
	          <img src="${pageContext.request.contextPath}/resources/assets/img/avatars/1.png" alt="user-avatar" class="d-block rounded" height="100" width="100" id="uploadedAvatar" />
	          <div class="button-wrapper">
	            <label for="" class="btn btn-primary me-2 mb-4" tabindex="0">
	              <!-- 내 정보 수정하기 페이지로 이동 -->
	              <span class="d-none d-sm-block">내 정보 수정하기</span>
	            </label>
	            <p class="text-muted mb-0">부서 : 기획팀</p>
	            <p class="text-muted mb-0">내선번호 : 02-123-4567</p>
	          </div>
	        </div>
	      </div>
	      <!-- 보내는 사람 정보 영역 끝 -->
	      
	      <hr class="my-0">
	      
	      <!-- 보내는 영역 시작 -->
	      <div class="card-body">
	      	<!-- form 시작 -->
	        <form id="formAccountSettings" method="POST" onsubmit="return false">
	          <!-- 메일 정보 영역 시작 -->
	          <div class="row">
	            <div class="mb-3 col-md-11">
	              <label for="firstName" class="form-label">받는사람</label>
	              <input class="form-control" type="text" id="" name="" value="" placeholder="주소록을 통해 입력하세요." readonly/>
	            </div>
	             <div class="mb-3 col-md-1">
	              <label for="firstName" class="form-label">&nbsp;</label>
	              <input class="form-control btn-primary" type="button" name="" id="addressList" value="주소록" data-toggle="modal" data-target="#myModal"/>
	            </div>
	            <div class="mb-3 col-md-11">
	              <label for="lastName" class="form-label">참조</label>
	              <input class="form-control" type="text" name="" id="" value="hoho123@easy.co.kr" readonly />
	            </div>
	            <div class="mb-3 col-md-1">
	              <label for="firstName" class="form-label">&nbsp;</label>
	              <input class="form-control btn-primary" type="button" name="" id="addressList" value="주소록" data-toggle="modal" data-target="#myModal"/>
	            </div>
	            <div class="mb-3 col-md-3">
	              <label class="form-label" for="country">분류(일반/중요)</label>
	              <select id="country" class="select2 form-select">
	                <option value="N">일반</option>
	                <option value="E">중요</option>
	              </select>
	            </div>
	            <div class="mb-3 col-md-4">
	              <input type="checkbox" class="form-check-warning" id="ckbox">
	              <label class="form-label" for="country">예약메일</label>
	              <div><input type="date" class="form-control" id="calendar"></div>
	            </div>
	            <div class="mb-3 col-md-7">
	              <label class="form-label" for="">파일첨부<i class="bi bi-upload"></i></label>
	              <div><input type="file" class="form-control" id="inputGroupFile01" name="" id="" value="" /></div>
	            </div>
	            <div class="mb-3 col-md-12">
	              <label class="form-label" for="country">제목</label>
	              <input class="form-control" type="text" name="" id="" value="" placeholder="제목을 작성하세요"/>
	            </div>
	            <div class="mb-3 col-md-12">
	              <label class="form-label" for="country">내용</label>
	              <div>
	              	<textarea class="form-control" id="exampleFormControlTextarea1" rows="10" cols="150"></textarea>
	              </div>
	            </div>
	          </div>
	          <!-- 메일 정보 영역 끝 -->
	          <div class="mt-2">
	            <button type="submit" class="btn btn-primary me-2">보내기</button>
	            <button type="reset" class="btn btn-danger">다시작성</button>
	          </div>
	        </form>
	        <!-- form 끝 -->
	      </div>
	      <!-- 보내는 영역 끝 -->
	    </div>
	    <!-- 메일 영역 시작 -->
    
  </div>
	</div>
	<!-- 행 끝 -->


           
	</div>
	<!-- 컨테이너 끝 -->
	

	<!-- 주소록 클릭시 나오는 모달창 -->
	<div class="modal fade" id="myModal" data-backdrop="static" data-keyboard="false">
    	<div class="modal-dialog modal-xl modal-dialog-centered">
	      <div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h4 class="modal-title">주소록</h4>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        
	        <!-- Modal body -->
	        <div class="modal-body">
				<!--<button onclick="javascript:window.returnValue='음훼훼';window.close()">부모창 폼에 값넘기기</button>  -->
				  <label class="form-label" for="add">받는사람선택</label>
	              <select id="add" class="select2 form-select">
					<option>전재은</option>
					<option>김태훈</option>
					<option>김재호</option>
					<option>임현빈</option>
				</select>
			</div>
	        
	        <!-- Modal footer -->
	        <div class="modal-footer">
	          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        </div>
	        
	      </div>
	    </div>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function () {
			$("#calendar").hide();
			$("#ckbox").on('click', function () {
				if($(this).prop('checked')){
					$("#calendar").show();
				}else{
					$("#calendar").hide();
				}
			});
		});

	</script>
	<!-- bottom -->
	<jsp:include page="bottom.jsp" />
	
	
	
	
	
</body>
</html>