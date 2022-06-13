<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<style>
#kim{ width: 1300px; 
margin-left: 50px;

}
.time1 {width: 200px}
.time{width: 900px}
</style>
<body>
<jsp:include page="top.jsp"/>
<div id="kim">
<h4 class="fw-bold py-3 mb-4">회의실/예약</h4>
<div class="col-xl">
    <div class="card mb-4">
      <div class="card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0"> <select id="jobName" class="select2 form-select">
                <option value="">회의실 선택</option>
                <option value="-12">회의실 2</option>
                <option value="-12">회의실 2</option>
                <option value="-12">회의실 2</option>
              </select></h5> 
      </div>
      <div class="card-body">
        <form>
        	  <div class="mb-3 col-md-4">
	              <input type="hidden" name="reserveYn" id="reserveYn" required>
	              <label class="form-label" for="calendar">예약할 날짜</label>
	              <div><input type="date" value="SYSDATE" class="form-control" name="sendDate" id="sendDate"></div>
	            </div>
	            <div class="time">
          <div class="time1">
            <label class="form-label" for="basic-default-fullname">예약 시간</label>
            <input type="time" class="form-control" id="basic-default-fullname"  style="width: 200px">
          </div>
            <div class="time2">
             <input type="time" class="form-control" id="basic-default-fullname"  style="width: 200px">
          </div>
          </div>

          <div class="mb-3">
            <label class="form-label" for="basic-default-company">회의 제목</label>
            <input type="text" class="form-control" id="basic-default-company" >
          </div>
          <div class="mb-3">
            <label class="form-label" for="basic-default-email">예약자</label>
            <div class="input-group input-group-merge">
              <input type="text" id="basic-default-email" class="form-control"  >
            </div>
          </div>
          <div class="mb-3">
            <label class="form-label" for="basic-default-phone">참석 인원</label>
            <input type="text" id="basic-default-phone" class="form-control phone-mask">
          </div>
          <div class="mb-3">
            <label class="form-label" for="basic-default-message">목적</label>
            <textarea id="basic-default-message" class="form-control"></textarea>
          </div>
          <button type="submit" class="btn btn-primary">예약하기</button>
            <button type="reset" class="btn btn-outline-secondary">취소하기</button>
        </form>
      </div>
    </div>
  </div>
  </div>
  <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
  <jsp:include page="bottom.jsp"/>
</body>
</html>