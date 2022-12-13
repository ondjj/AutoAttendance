<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>학생 정보 상세</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"	rel="stylesheet" />
<link href="./resources/css/admin.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"	crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<div>
		<%@ include file="info_manager.jsp"%>
		<form action="MemberDelCon.do?id=${code_id}" name="removefrm" method="post">
		<div id="layoutSidenav_content">

			<div class="container-fluid px-4">
				<h1 class="mt-4">학생 정보 상세</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="manager_page.jsp">관리자
							페이지</a></li>
					<li class="breadcrumb-item active">학적</li>
					<li class="breadcrumb-item active">학생</li>
				</ol>
				<div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label>한글 이름</label> 
							<input type="text" class="form-control" name="kr_name" value="${kr_name}" disabled>
							
						</div>
						<div class="col-md-6 mb-3">
							<label>영문 이름</label> 
							<input type="text" class="form-control"	name="en_name" value="${en_name}" disabled>
						</div>
					</div>


					<div class="mb-3">
						<label>학번(ID)</label> 
						<input type="text" class="form-control"	name="id" value="${code_id}" disabled>
					</div>


					<div class="row">
						<div class="col-md-6 mb-3">
							<label>비밀번호</label> 
							<input type="password" class="form-control" value="${pass}" disabled>
						</div>
					</div>


					<div class="row">
						<div class="col-md-2 mb-3">
							<label>성별</label> 
							<input type="text" class="form-control"	name="gender" value="${gender}" disabled>
						</div>


						<div class="col-md-2 mb-3">
							<label>adminkey</label>
							<input type="text" class="form-control"	name="adminkey" value="${key}" disabled>
						</div>


						<div class="col-md-2 mb-3">
							<label>나이</label> 
							<input type="text" class="form-control"	name="age" value="${age}" disabled>
						</div>
					</div>

					<div class="col-md-6 mb-3">
						<label>입학년도</label> 
						<input type="text" class="form-control"	name="col_reg_date" value="${date}" disabled>
					</div>

					<div class="col-md-6 mb-3">
						<label>주민등록번호</label> 
						<input type="text" class="form-control"	name="private_num" value="${priNum}" disabled>
					</div>

					<div class="col-md-6 mb-3">
						<label>핸드폰 번호</label> 
						<input type="text" class="form-control"	name="phone_num" value="${phNum}" disabled>
					</div>

					<div class="col-md-6 mb-3">
						<label>이메일</label> 
						<input type="email" class="form-control" name="email" value="${email}" disabled>
					</div>

					<div class="mb-3">
						<label>주소</label> 
						<input type="text" class="form-control" name="address" value="${address}" disabled>
					</div>

					<hr class="mb-3">
					<div class="mb-6">
						<label for="id_picture">증명사진</label><br>
						
							<input type="file" name="id_picture" value="${face}" disabled>
						
						<br>
						<div class="mb-6">
							<button type="button" class="btn btn-outline-info" onclick="location.href='MemberListCon.do'">목록</button>
							<button type="button" class="btn btn-outline-primary" onclick="location.href='MemberUpdateForm.do?id=${code_id}'">수정</button>
					    	<button type="button" class="btn btn-outline-danger" onclick="button_event();">삭제</button>
						</div>	
						<br>
						<br>
					</div>
				</div>
			</div>
		</div>
		</form>
	</div>
	<script>
	function button_event(){
		  if (confirm("정말 삭제하시겠습니까??") == true){    //확인
		      document.removefrm.submit();
		  }else{   //취소
		      return;
		  }
		}
	</script>
	
	<%-- <%@ include file="footerAdmin.jsp"%> --%>

	<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"	crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
</body>
</html>
