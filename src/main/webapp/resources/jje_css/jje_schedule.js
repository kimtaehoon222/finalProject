//<!---------------------------------------------달력----------------------------------------------------------------->
var initialLocaleCode = 'ko';
var calendarEl = document.getElementById('comb_calendar');
// var pCalendarEl = document.getElementById('p_calendar');

var calendar = new FullCalendar.Calendar(calendarEl, {
    initialView: 'dayGridMonth',
    headerToolbar: {
        start: 'prev title next', // will normally be on the left. if RTL, will be on the right
        center: '',
        end: 'today dayGridMonth,timeGridWeek,listWeek' // will normally be on the right. if RTL, will be on the left
    },
    locale: initialLocaleCode,
    slotMinTime: '08:00',
    slotMaxTime: '24:00:00',
    businessHours: true,
    // navLinks: true,
    editable: true,
    droppable: true, // this allows things to be dropped onto the calendar
    drop: function(info) {
        // is the "remove after drop" checkbox checked?
        if (checkbox.checked) {
        // if so, remove the element from the "Draggable Events" list
        info.draggedEl.parentNode.removeChild(info.draggedEl);
        }
    },
    dateClick: function(e) { //날짜 클릭 이벤트
        // alert('a day has been clicked!');
        console.log(e.dateStr);//선택한 날짜 콘솔에 출력 -> 상세조회 가능할듯
    },
    eventClick:function(e){
        console.log(e.event.title); //클릭한 이벤트의 제목
        console.log(e.event.id); //클릭한 이벤트의 id -> 일정 숫자로 지정해야겠음
    },

    // timeZone: 'UTC',
    //임의로 이벤트 추가1
    events: [
        {id: 'a', title: '테스트2', start: '2022-06-12'}
    ]
});

// var pCalendar = new FullCalendar.Calendar(pCalendarEl, {
//     initialView: 'listDay',
// });

//아이디가 'a'인 이벤트 발생하면 콘솔창에 이벤트 시작 시간 출력
var event = calendar.getEventById('a') // an event object!
var start = event.start // a property (a Date object)
console.log(start.toISOString()) // "2018-09-01T00:00:00.000Z"


//임의로 이벤트 추가2
calendar.addEvent( {'title':'테스트', 'start':'2022-06-10', 'end':'2022-06-11'});

calendar.on('dateClick', function(info) { //날짜 클릭 후 콘솔 출력
    console.log('clicked on ' + info.dateStr);
});

//캘린더 랜더링
calendar.render();
//<!---------------------------------------------달력----------------------------------------------------------------->



//시작날짜 설정
var today = document.getElementById('start_date').value= new Date().toISOString().slice(0, 10);
console.log("오늘 날짜 : "+today);

const getTimeDiff = (d, t, time1) => {
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
}

/*submit*/
function sked_submit(){
    var start_date = document.getElementById('start_date').value;
    var end_date = document.getElementById('end_date').value;
    var start_time = document.getElementById('start_time').value;
    var fin_time = document.getElementById('fin_time').value;
    
    if(start_date && !end_date){ //시작일만 있는 경우(종료일은 없는 경우)
        if(start_time && !fin_time){ //시작시간만 있는 경우 (종료시간이 없는 경우)
            console.log("시작일 "+start_date+" "+start_time);
        }
        if(!start_time && fin_time){ //종료시간만 있는 경우 (시작시간이 없는 경우)  -> 오류
            alert("시작 시간 누락");
            return false;
        }
        if(start_time && fin_time){ //시작시간과 종료시간 둘 다 있는경우
            if(start_time>=fin_time){ //시작시간이 종료시간보다 더 크면 안됨
                alert("종료시간은 시작시간보다 늦어야합니다.");
                return false;
            }else{
                var time1 = new Date(start_date+" "+start_time); //시작일+시작시간
                // var time2 = new Date(start_date+" "+fin_time); //시작일+종료시간
                var time = getTimeDiff(start_date, fin_time, time1);
                console.log(time);
                
                console.log("시작시간 "+start_date+" "+start_time);
                console.log("종료시간 "+start_date+" "+fin_time);
            }
        }else{
            if(!start_time){//시작 시간도 없는 경우
                console.log("시작일 "+start_date);
            }
        }
    }else{ //시작일과 종료일이 둘 다 있는 경우
        if(start_date>=end_date){ //종료일이 시작일보다 이른경우
            alert("종료일은 시작일보다 늦어야합니다.");
            return false;
        }else{
            if(!start_time){//시작 시간은 없는 경우
                console.log("시작일 "+start_date);
                console.log("종료일 "+end_date);
            }
            if(start_time && !fin_time){ //시작시간만 있는 경우 (종료시간이 없는 경우)
                console.log("시작일 "+start_date+" "+start_time);
                console.log("종료일 "+end_date+" "+start_time);
            }
            if(!start_time && fin_time){ //종료시간만 있는 경우 (시작시간이 없는 경우)  -> 오류
                alert("시작 시간 누락");
                return false;
            }
            if(start_time && fin_time){ //시작시간과 종료시간 둘 다 있는경우
                var time1 = new Date(start_date+" "+start_time); //시작일+시작시간
                // var time2 = new Date(end_date+" "+fin_time); //종료일+종료시간
                var time = getTimeDiff(end_date, fin_time, time1);
                
                var date = getDateDiff(start_date, end_date);
    
                console.log(date+"일 "+time);
                console.log("시작일 "+start_date+" "+start_time);
                console.log("시작일 "+end_date+" "+fin_time);
            }
        }
    }

}
