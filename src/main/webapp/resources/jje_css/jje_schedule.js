//시작날짜 설정
var today = document.getElementById('start_date').value= new Date().toISOString().slice(0, 10);
//console.log("오늘 날짜 : "+today);

/*const getTimeDiff = (d, t, time1) => {
    var time2 = new Date(d+" "+t);
    var time3 = new Date(time2 - time1);
    
    var hh = Math.floor((time3 % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var mi = Math.floor((time3 % (1000 * 60 * 60)) / (1000 * 60));
    
    return hh +"시간 "+ mi +"분";
}

const getDateDiff = (d1, d2) => {
    const date1 = new Date(d1);
    const date2 = new Date(d2);

    const diffDate = date1.getTime() - date2.getTime();

    return Math.abs(diffDate / (1000 * 3600 * 24));
}*/

/*Insert submit*/
function sked_submit(){
    var start_date = document.getElementById('start_date').value;
    var end_date = document.getElementById('end_date').value;
    var start_time = document.getElementById('start_time').value;
    var end_time = document.getElementById('end_time').value;
    
    if(start_date && !end_date){ //시작일만 있는 경우(종료일은 없는 경우)
        /*if(start_time && !end_time){ //시작시간만 있는 경우 (종료시간이 없는 경우)
            console.log("시작일 "+start_date+" "+start_time);
        }*/
        if(!start_time && end_time){ //종료시간만 있는 경우 (시작시간이 없는 경우)  -> 오류
            alert("시작 시간 누락");
            return false;
        }
        if(start_time && end_time){ //시작시간과 종료시간 둘 다 있는경우
            if(start_time>=end_time){ //시작시간이 종료시간보다 더 크면 안됨
                alert("종료시간은 시작시간보다 늦어야합니다.");
                return false;
            }/*else{
                var time1 = new Date(start_date+" "+start_time); //시작일+시작시간
                // var time2 = new Date(start_date+" "+end_time); //시작일+종료시간
                var time = getTimeDiff(start_date, end_time, time1);
                console.log(time);
                
                console.log("시작시간 "+start_date+" "+start_time);
                console.log("종료시간 "+start_date+" "+end_time);
            }*/
        }/*else{
            if(!start_time){//시작 시간도 없는 경우
                console.log("시작일 "+start_date);
            }
        }*/
    }else{ //시작일과 종료일이 둘 다 있는 경우
        if(start_date>end_date){ //종료일이 시작일보다 이른경우
            alert("종료일은 시작일보다 늦어야합니다.");
            return false;
        }else{
            if(!start_time){//시작 시간은 없는 경우
                //console.log("시작일 "+start_date);
                //console.log("종료일 "+end_date);
                
                alert("시간을 지정하지 않는 경우 달력에 정확하게 표시되지 않을 수 있습니다.");
                
            }
            /*if(start_time && !end_time){ //시작시간만 있는 경우 (종료시간이 없는 경우)
                console.log("시작일 "+start_date+" "+start_time);
                console.log("종료일 "+end_date+" "+start_time);
            }*/
            if(!start_time && end_time){ //종료시간만 있는 경우 (시작시간이 없는 경우)  -> 오류
                alert("시작 시간 누락");
                return false;
            }
            /*if(start_time && end_time){ //시작시간과 종료시간 둘 다 있는경우
                var time1 = new Date(start_date+" "+start_time); //시작일+시작시간
                // var time2 = new Date(end_date+" "+end_time); //종료일+종료시간
                var time = getTimeDiff(end_date, end_time, time1);
                
                var date = getDateDiff(start_date, end_date);
    
                console.log(date+"일 "+time);
                console.log("시작일 "+start_date+" "+start_time);
                console.log("시작일 "+end_date+" "+end_time);
            }*/
        }
    }

}

/*Update submit*/
function sked_update_submit(){
    var detail_start_date = document.getElementById('detail_start_date').value;
    var detail_end_date = document.getElementById('detail_end_date').value;
    var detail_start_time = document.getElementById('detail_start_time').value;
    var detail_end_time = document.getElementById('detail_end_time').value;
    
    if(detail_start_date && !detail_end_date){ //시작일만 있는 경우(종료일은 없는 경우)
        /*if(detail_start_time && !detail_end_time){ //시작시간만 있는 경우 (종료시간이 없는 경우)
            console.log("시작일 "+detail_start_date+" "+detail_start_time);
        }*/
        if(!detail_start_time && detail_end_time){ //종료시간만 있는 경우 (시작시간이 없는 경우)  -> 오류
            alert("시작 시간 누락");
            return false;
        }
        if(detail_start_time && detail_end_time){ //시작시간과 종료시간 둘 다 있는경우
            if(detail_start_time>=detail_end_time){ //시작시간이 종료시간보다 더 크면 안됨
                alert("종료시간은 시작시간보다 늦어야합니다.");
                return false;
            }/*else{
                var time1 = new Date(detail_start_date+" "+detail_start_time); //시작일+시작시간
                // var time2 = new Date(detail_start_date+" "+detail_end_time); //시작일+종료시간
                var time = getTimeDiff(detail_start_date, detail_end_time, time1);
                console.log(time);
                
                console.log("시작시간 "+detail_start_date+" "+detail_start_time);
                console.log("종료시간 "+detail_start_date+" "+detail_end_time);
            }*/
        }/*else{
            if(!detail_start_time){//시작 시간도 없는 경우
                console.log("시작일 "+detail_start_date);
            }
        }*/
    }else{ //시작일과 종료일이 둘 다 있는 경우
        if(detail_start_date>detail_end_date){ //종료일이 시작일보다 이른경우
            alert("종료일은 시작일보다 늦어야합니다.");
            return false;
        }else{
            if(!detail_start_time){//시작 시간은 없는 경우
                //console.log("시작일 "+detail_start_date);
                //console.log("종료일 "+detail_end_date);
                
                alert("시간을 지정하지 않는 경우 달력에 정확하게 표시되지 않을 수 있습니다.");
                
                /*var dayDiff = getDateDiff(detail_start_date, detail_end_date)
                if(dayDiff==1){
                	alert("시간을 지정하지 않는 경우 달력에 정확하게 표시되지 않을 수 있습니다.");
                }else{
                	alert("시간을 지정하지 않는 경우 달력에 정확하게 표시되지 않을 수 있습니다.");
                }*/
                
            }
            /*if(detail_start_time && !detail_end_time){ //시작시간만 있는 경우 (종료시간이 없는 경우)
                console.log("시작일 "+detail_start_date+" "+detail_start_time);
                console.log("종료일 "+detail_end_date+" "+detail_start_time);
            }*/
            if(!detail_start_time && detail_end_time){ //종료시간만 있는 경우 (시작시간이 없는 경우)  -> 오류
                alert("시작 시간 누락");
                return false;
            }
            /*if(detail_start_time && detail_end_time){ //시작시간과 종료시간 둘 다 있는경우
                var time1 = new Date(detail_start_date+" "+detail_start_time); //시작일+시작시간
                // var time2 = new Date(detail_end_date+" "+detail_end_time); //종료일+종료시간
                var time = getTimeDiff(detail_end_date, detail_end_time, time1);
                
                var date = getDateDiff(detail_start_date, detail_end_date);
    
                console.log(date+"일 "+time);
                console.log("시작일 "+detail_start_date+" "+detail_start_time);
                console.log("시작일 "+detail_end_date+" "+detail_end_time);
            }*/
        }
    }

}

/*카테고리별 색상 변경*/
var sked_code = document.getElementById('sked_code');
sked_code.addEventListener('input',function(e){		//Form Event
	
	var codeValue = sked_code.options[sked_code.selectedIndex].value;
	
	var groupP = document.getElementById('color_group_P');
	var groupD = document.getElementById('color_group_D');

	if(codeValue=="P"){
    	groupD.style.display="none";
    	groupP.style.display="block";
    }else{
    	groupP.style.display="none";
    	groupD.style.display="block";
    }
});

/*상세조회 모달*/
function clickDetailBtn(result)  {
	var id = result.id;
	var skedCode = result.skedCode;
	var colorCode = result.colorCode;
	
	var title = result.title;
	var content = result.content;
	var place = result.place;
	var memo = result.memo;
	
	var start = result.start;
	var startTime = result.startTime;
	var end = result.end;
	var endTime = result.endTime;
	
	$("#detail_head").text(start);		//헤더
	$("#detail_sked_code").val(skedCode);	//일정코드
	
	/*표시 색상 변경*/
	var detailGroupP = document.getElementById('detail_color_group_P');
	var detailGroupD = document.getElementById('detail_color_group_D');
	if(skedCode==="P"){
		detailGroupD.style.display="none";
		detailGroupP.style.display="block";
	}else{
		detailGroupP.style.display="none";
		detailGroupD.style.display="block";
	}
	
	if(colorCode=="C1"){
		$("#detail_color_pink").attr("checked", true);
	}else if(colorCode=="C2"){
		$("#detail_color_blue").attr("checked", true);
	}else if(colorCode=="C3"){
		$("#detail_color_yellow").attr("checked", true);
	}else if(colorCode=="C4"){
		$("#detail_color_purple").attr("checked", true);
	}else if(colorCode=="C5"){
		$("#detail_color_red").attr("checked", true);
	}else if(colorCode=="C6"){
		$("#detail_color_lightGray").attr("checked", true);
	}else if(colorCode=="C7"){
		$("#detail_color_gray").attr("checked", true);
	}else if(colorCode=="C8"){
		$("#detail_color_darkGray").attr("checked", true);
	}else{
		console.log("없습니다.")
	}
	
	$("#detail_sked_number").val(id);		//일정번호
	$("#detail_sked_title").val(title);		//제목
	$("#detail_sked_content").val(content);	//내용
	$("#detail_sked_place").val(place);		//장소
	$("#detail_sked_meno").val(memo);		//메모
	
	$("#detail_start_date").val(start);		//시작일
	$("#detail_start_time").val(startTime);	//시작시간
	$("#detail_end_date").val(end);			//종료일
	$("#detail_end_time").val(endTime);		//종료시간
	
	/*목록창 닫기*/
	$('.fc-popover-close').click();
	
	/*모달창 호출*/
	document.getElementById('detail_btn').click();
}

