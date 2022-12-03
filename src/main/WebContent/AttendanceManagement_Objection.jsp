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
	<div>
 	<%@ include file="infoAdmin.jsp" %>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">출결 정정 신청</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active"><a href="admin.jsp">마이페이지</a></li>
						<li class="breadcrumb-item active">출결 관리</li>
						<li class="breadcrumb-item active">출결 정정 신청</li>
					</ol>

					<div class="container-fluid px-4">
						<form name="newWrite" action=""	class="form-horizontal" method="post"
							onsubmit="return checkForm()">

							<input name="id" type="hidden" class="form-control"
								value="" />

							<div class="form-group row">
								<label class="col-sm-2 control-label">학번</label>
								<div class="col-sm-2">
									<input name="name" type="text" class="form-control"
										placeholder="학번" />
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-sm-2 control-label">이름</label>
								<div class="col-sm-2">
									<input name="subject" type="text" class="form-control"
										placeholder="이름" />
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-sm-2 control-label">학과</label>
								<div class="col-sm-2">
									<input name="subject" type="text" class="form-control"
										placeholder="학과" />
								</div>
							</div>

							<div class="form-group row">
								<label class="col-sm-2 control-label">내용</label>
								<div class="col-sm-6">
									<textarea name="content" class="form-control" placeholder="내용"
										rows="5" cols="50"></textarea>
								</div>
							</div>

							<div class="form-group row">
								<div class="col-sm-offset-2 col-sm-10">
									<input type="submit" class="btn btn-primary btn-sm" value="등록" /> <input
										type="reset" class="btn btn-primary btn-sm" value="취소" />
								</div>
							</div>

						</form>
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