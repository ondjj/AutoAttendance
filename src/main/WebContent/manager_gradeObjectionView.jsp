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
</head>
<body class="sb-nav-fixed">
	 <%@ include file="info_manager.jsp" %>

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					 <h1 class="mt-4">성적 정정 신청</h1>
                        <hr>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="manager_page.jsp">관리자 페이지</a></li>
                            <li class="breadcrumb-item active">학적</li>
                            <li class="breadcrumb-item active">성적정정신청내용</li>
                        </ol>
                        <br>
					<div class="container-fluid px-5 border border-2">
						<br>
						<form name="newWrite" class="form-horizontal" method="post" action="ObjectionListCon.do?view_del=${dto.obj_num }&&view_type=${dto.obj_type}">

							<%-- <input name="obj_num_hidden" id="obj_num_hidden" type="hidden" class="form-control"
								value="${dto.obj_num }" />
							<input name="obj_type_hidden" id="obj_type_hidden" type="hidden" class="form-control"
								value="${dto.obj_type}" /> --%>

							<div class="form-group row">
								<label class="col-sm-2 control-label"><strong>학번</strong></label>
								<div class="col-sm-3">
									<input name="member_id" id="member_id" type="text" class="form-control" value="${dto.obj_memberid }" readonly/>
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-sm-2 control-label"><strong>이름</strong></label>
								<div class="col-sm-3">
									<input name="name" id="name" type="text" class="form-control"
										value="${dto.obj_name }" readonly/>
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-sm-2 control-label"><strong>학과</strong></label>
								<div class="col-sm-3">
									<input name="faculty" id="faculty" type="text" class="form-control"
										value="${dto.obj_faculty }" readonly/>
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-sm-2 control-label"><strong>과목</strong></label>
								<div class="col-sm-3">
									<input name="subject" id="subject" type="text" class="form-control"
										value="${dto.obj_subject }" readonly/>
								</div>
							</div>

							<div class="form-group row">
								<label class="col-sm-2 control-label"><strong>정정 내용</strong></label>
								<div class="col-sm-5">
									<textarea name="content" class="form-control" placeholder="내용"
										rows="10" cols="100" readonly>${dto.obj_content }</textarea>
								</div>
							</div>
							<br>
							<div class="form-group row" align="left">
								<div class="col-sm-offset-2 col-sm-10">
									<input type="submit" class="btn btn-success" value="처리" />
									<!-- <button type="submit" class="btn btn-primary" onclick="send_update()">처리</button> -->
									<!-- <button type="button" class="btn btn-primary" onclick="ObjectionListCon.do?view_del=${dto.obj_num }&&view_type=${dto.obj_type}&&view_update=3">처리</button>-->
									<button type="submit" class="btn btn-secondary">반려</button>
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
	<script>
		function send_update(){
			var obj_num = document.getElementById("obj_num").value;
			var obj_type = document.getElementById("obj_type").value;
			var memberid = document.getElementById("member_id").value;
			var name = document.getElementById("name").value;
			var faculty = document.getElementById("faculty").value;
			var subject = document.getElementById("subject").value;
			location.href = "manager_gradeObjectionUpdate.jsp?obj_num="+obj_num+"&&obj_type="+obj_type+"&&memberid="+memberid+"&&name="+name+"&&faculty="+faculty+"&&subject="+subject;
		}
	</script>
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