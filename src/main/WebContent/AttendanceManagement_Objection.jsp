<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>국제대학교 학생 관리 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="./resources/css/admin.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<script>
	function checkForm(){
		if(!document.newWrite.member_id.value){
			alert("학번을 입력해주세요.");
			document.newWrite.member_id.focus(); // 해당 부분 발생하였을 시 포커스를 줄 수 있도록 설정
			return false;
		}
		if(!document.newWrite.name.value){
			alert("이름을 입력해주세요.");
			document.newWrite.name.focus();
			return false;
		}
		if(!document.newWrite.faculty.value){
			alert("본인의 학과를 입력해주세요.");
			document.newWrite.faculty.focus();
			return false;
		}
		if(!document.newWrite.subject.value){
			alert("정정을 요청할 과목명을 입력해주세요.");
			document.newWrite.subject.focus();
			return false;
		}
		if(!document.newWrite.date.value){
			alert("정정을 요청할 날짜를 입력해주세요.");
			document.newWrite.subject.focus();
			return false;
		}
		if(!document.newWrite.content.value){
			alert("정정을 요청할 내용을 입력해주세요.");
			document.newWrite.content.focus();
			return false;
		}
	}
</script>
</head>
<body class="sb-nav-fixed">
	 <%@ include file="infoAdmin.jsp" %>

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">출결 정정 신청</h1>
					<hr>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active"><a href="AdminDashBoard.do">마이페이지</a></li>
						<li class="breadcrumb-item active">출결 관리</li>
						<li class="breadcrumb-item active">출결 정정 신청</li>
					</ol>
					<br>
					<div class="container-fluid px-5 border border-2">
						<br>
						<form name="newWrite" action="objection.do"	class="form-horizontal" method="post"
							onsubmit="return checkForm()">

							<input name="id" type="hidden" class="form-control"
								value="" />

							<div class="form-group row">
								<label class="col-sm-2 control-label"><strong>정정 신청 종류</strong></label>
								<div class="col-sm-3">
									<select name="obj_type" id="obj_type" class="form-select">
    										<option>선택</option>
    										<option value="1">출결 정정</option>
    										<option value="2">학적 정정</option>
    										<option value="3">성적 정정</option>
									</select>
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-sm-2 control-label"><strong>학번</strong></label>
								<div class="col-sm-3">
									<input name="member_id" type="text" class="form-control" placeholder="학번 ex)20150000" />
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-sm-2 control-label"><strong>이름</strong></label>
								<div class="col-sm-3">
									<input name="name" type="text" class="form-control"
										placeholder="이름" />
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-sm-2 control-label"><strong>학과</strong></label>
								<div class="col-sm-3">
									<input name="faculty" type="text" class="form-control"
										placeholder="학과" />
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-sm-2 control-label"><strong>과목</strong></label>
								<div class="col-sm-3">
									<input name="subject" type="text" class="form-control"
										placeholder="과목" />
								</div>
							</div>

							<div class="form-group row">
								<label class="col-sm-2 control-label"><strong>정정 희망 일자</strong></label>
								<div class="col-sm-3">
									<input name="date" type="text" class="form-control"
										placeholder="정정 희망 일자" />
								</div>
							</div>

							<div class="form-group row">
								<label class="col-sm-2 control-label"><strong>정정 내용</strong></label>
								<div class="col-sm-5">
									<textarea name="content" class="form-control" placeholder="내용"
										rows="10" cols="100"></textarea>
								</div>
							</div>
							<br>
							<div class="form-group row" align="left">
								<div class="col-sm-offset-2 col-sm-10">
									<input type="submit" class="btn btn-primary" value="제출" /> <input
										type="reset" class="btn btn-danger" value="취소" />
								</div>
							</div>
						</form>
						<br>
					</div>


				</div>
			</main>
         <%@ include file="footerAdmin.jsp" %>

		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
</body>
</html>