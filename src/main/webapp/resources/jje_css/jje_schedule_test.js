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
//    events: [
//        {id: 'a', title: '테스트2', start: '2022-06-12'}
//    ]
    
    events: function(info, successCallback, failureCallback){
  	  // ajax 처리로 데이터를 로딩 시킨다.
  	  $.ajax({
  		 type:"get",
  		 url:"${path}/calendar.do?method=data",
  		dataType:"json"  
  	  });
    }
    
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
////////////////////////////////////////////////////////////////////////////


document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
	// new FullCalendar.Calendar(대상 DOM객체, {속성:속성값, 속성2:속성값2..})
	
    var calendar = new FullCalendar.Calendar(calendarEl, {
    	initialView: 'dayGridMonth',
	    headerToolbar: {
	        start: 'prev title next',
	        center: '',
	        end: 'today dayGridMonth,timeGridWeek,listWeek'
	    },
	    slotMinTime: '08:00',
	    slotMaxTime: '24:00:00',
	    businessHours: true,
	    navLinks: true, // can click day/week names to navigate views
	    selectable: true,
	    selectMirror: true,
	    // 이벤트명 : function(){} : 각 날짜에 대한 이벤트를 통해 처리할 내용..
	    select: function(arg) {
		 	console.log(arg);
	
	        var title = prompt('입력할 일정:');
	        // title 값이 있을때, 화면에 calendar.addEvent() json형식으로 일정을 추가
	        if (title) {
	        	calendar.addEvent({
		            title: title,
		            start: arg.start,
		            end: arg.end,
		            allDay: arg.allDay,
	        	});
	        }
	        calendar.unselect();
	    },
	    eventClick: function(arg) {
	    	// 있는 일정 클릭시,
    	 	console.log("#등록된 일정 클릭#");
    	 	console.log(arg.event);
    	  
	        if (confirm('Are you sure you want to delete this event?')) {
	          arg.event.remove()
	        }
	    },
	    editable: true,
	    dayMaxEvents: true, // allow "more" link when too many events
	    events: function(info, successCallback, failureCallback){
	    	$.ajax({
	    		type:"get",
	    		url:"skedSelectList.do",
	    		dataType:"json"  
	    	});
	    }
	});

    calendar.render();
});



////////////////////////////////////////////////////////////////////////////
$(function () {
    var request = $.ajax({
        url: "skedSelectList.do",
        method: "GET",
        dataType: "json"
    });
 
    request.done(function (data) {
    	console.log(data); // log 로 데이터 찍어주기.
    	
    	var initialLocaleCode = 'ko';
    	
        var calendarEl = document.getElementById('comb_calendar');
 
        var calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth',
            headerToolbar: {
                start: 'prev title next',
                center: '',
                end: 'today dayGridMonth,timeGridWeek,listWeek'
            },
            locale: initialLocaleCode,
            slotMinTime: '08:00',
            slotMaxTime: '24:00:00',
            businessHours: true,
            editable: true,
            droppable: true, // this allows things to be dropped onto the calendar
            drop: function (info) {
                // is the "remove after drop" checkbox checked?
                if (document.getElementById('drop-remove').checked) {
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
            /**
             * data 로 값이 넘어온다. log 값 전달.
             */
            events: data
        });
        
        calendar.on('dateClick', function(info) { //날짜 클릭 후 콘솔 출력
            console.log('clicked on ' + info.dateStr);
        });
 
        calendar.render();
    });
 
    request.fail(function( jqXHR, textStatus ) {
        alert( "Request failed: " + textStatus );
    });
});