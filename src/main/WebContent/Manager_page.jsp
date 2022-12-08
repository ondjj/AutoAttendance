<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en">

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>국제대학교 관리자 페이지</title>


<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="./resources/css/admin.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"	crossorigin="anonymous"></script>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="./resources/assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="./resources/css/style.css" rel="stylesheet" />


<!-- jquery -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- bootstrap 4 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- fullcalendar -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.js"></script>



<!-- Calendar script, style -->
<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {

			timeZone : 'UTC',
			initialView : 'dayGridMonth', // 홈페이지에서 다른 형태의 view를 확인할  수 있다.
			locale : 'ko',
			initialDate : '2022-12-02', // 오늘 날짜로 설정할 것
			navLinks : true,
			editable : true,
			dayMaxEvents : true,
			headerToolbar : {
				left : 'prevYear,prev,next,nextYear today',
				center : 'title',
				right : 'dayGridMonth,listMonth' // 캘린더 옵션 입력
			},
			events : [ // 일정 데이터 추가 , DB의 event를 가져오려면 JSON 형식으로 변환해 events에 넣어주면된다.
			{
				title : '일정',
				start : '2021-05-26',
				end : '2021-05-27'
			} ],
			headerToolbar : {
				center : 'addEventButton' // headerToolbar에 버튼을 추가
			},
			customButtons : {
				addEventButton : { // 추가한 버튼 설정
					text : "학사 일정 추가", // 버튼 내용
					click : function() { // 버튼 클릭 시 이벤트 추가
						$("#calendarModal").modal("show"); // modal 나타내기

						$("#addCalendar").on(
								"click",
								function() { // modal의 추가 버튼 클릭 시
									var content = $("#calendar_content").val();
									var start_date = $("#calendar_start_date").val();
									var end_date = $("#calendar_end_date").val();

									//내용 입력 여부 확인
									if (content == null || content == "") {
										alert("내용을 입력하세요.");
									} else if (start_date == "" || end_date == "") {
										alert("날짜를 입력하세요.");
									} else if (new Date(end_date) - new Date(start_date) < 0) { // date 타입으로 변경 후 확인
										alert("종료일이 시작일보다 먼저입니다.");
									} else { // 정상적인 입력 시
										var obj = {
											"title" : content,
											"start" : start_date,
											"end" : end_date
										}//전송할 객체 생성
										console.log(obj); //서버로 해당 객체를 전달해서 DB 연동 가능
									}
								});
					}
				}
			},
			editable : true, // false로 변경 시 draggable 작동 x 
			displayEventTime : false
		// 시간 표시 x
		});
		calendar.render();
	});
</script>


<style>
body {
	margin: 40px 10px;
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
<body class="sb-nav-fixed">
	<%@ include file="info_manager.jsp"%>
	<div id="layoutSidenav_content">
		<main>
			<!-- Responsive navbar-->
			<!-- Page Content-->
			<div class="container px-4 px-lg-5">

				<!-- Calendar 삽입 위치 -->
				<div id="calendarBox">
					<div id="calendar"></div>
				</div>
			</div>
			<!-- modal 추가 -->
			<div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">일정을 입력하세요.</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label for="taskId" class="col-form-label">일정 내용</label> 
								<input type="text" class="form-control" id="calendar_content" name="calendar_content">
								<label for="taskId"	class="col-form-label">시작 날짜</label> 
								<input type="date" class="form-control" id="calendar_start_date" name="calendar_start_date">
								<label for="taskId"	class="col-form-label">종료 날짜</label> 
								<input type="date" class="form-control" id="calendar_end_date" name="calendar_end_date">
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-warning" id="addCalendar">추가</button>
							<button type="button" class="btn btn-secondary"	data-dismiss="modal" id="sprintSettingModalClose">취소</button>
						</div>
					</div>
				</div>
			</div>

			<%@ include file="footerAdmin.jsp"%>
			<!-- Bootstrap core JS-->
			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
			<!-- Core theme JS-->
			<script src="js/scripts.js"></script>
			<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
			<script src="js/scripts.js"></script>
			<script	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
			<script src="assets/demo/chart-area-demo.js"></script>
			<script src="assets/demo/chart-bar-demo.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"	crossorigin="anonymous"></script>
			<script src="js/datatables-simple-demo.js"></script>
		</main>
	</div>
</body>
</html>
