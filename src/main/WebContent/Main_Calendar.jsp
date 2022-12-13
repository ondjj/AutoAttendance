<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="kr">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>International College</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="./resources/assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="./resources/css/style.css" rel="stylesheet" />

<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- fullcalendar CDN -->
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>

<!-- Calendar script, style -->
<script>
  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prevYear,prev,next,nextYear today',
        center: 'title',
        right: 'dayGridMonth,listMonth' // 캘린더 옵션 입력
      },
      locale: 'ko',
      initialDate: '2022-12-02', // 오늘 날짜로 설정할 것
      navLinks: false, 
      editable: false,
      dayMaxEvents: true, 
      events: [ // DB에서 이런 형식으로 데이터 저장해서 받아오기
        {
          title: 'All Day Event',
          start: '2022-12-01'
        },
        {
          title: 'Long Event',
          start: '2022-12-07',
          end: '2022-12-10'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2022-12-09T16:00:00'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2022-12-16T16:00:00'
        },
        {
          title: 'Conference',
          start: '2022-12-11',
          end: '2022-12-13'
        },
        {
          title: 'Meeting',
          start: '2022-12-12T10:30:00',
          end: '2022-12-12T12:30:00'
        },
        {
          title: 'Lunch',
          start: '2022-12-12T12:00:00'
        },
        {
          title: 'Meeting',
          start: '2022-12-12T14:30:00'
        },
        {
          title: 'Happy Hour',
          start: '2022-12-12T17:30:00'
        },
        {
          title: 'Dinner',
          start: '2022-12-12T20:00:00'
        },
        {
          title: 'Birthday Party',
          start: '2022-12-13T07:00:00'
        },
        {
          title: 'Click for Google',
          url: 'http://google.com/',
          start: '2020-09-28'
        }
      ]
    });

    calendar.render();
  });

</script>
<style>
  body {
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }
  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }
</style>

</head>
<body>

	<!-- Responsive navbar-->
	<%@ include file="Main_menu.jsp"%>
	<!-- Page Content-->
	<div class="container px-4 px-lg-5">
		<!-- Call to Action-->
		<div class="card text-white bg-secondary my-5 py-4 text-center">
			<div class="card-body">
				<h1 class="text-white m-0">학사일정</h1>
			</div>
		</div>
		
		<!-- Calendar 삽입 위치 -->
		<div id="calendar"></div>
	</div>


	<jsp:include page="Main_footer.jsp"></jsp:include>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>
