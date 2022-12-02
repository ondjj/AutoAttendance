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
</head>
<body>
	<!-- Responsive navbar-->
	<%@ include file="Main_menu.jsp"%>
	<!-- Page Content-->
	<div class="container px-4 px-lg-5">
		<!-- Call to Action-->
		<div class="card text-white bg-secondary my-5 py-4 text-center">
			<div class="card-body">
				<h1 class="text-white m-0">학교 뉴스</h1>
			</div>
		</div>



		<div class="container">
			<div class="row" align="center">
				<div class="col-md-4">
				<a href="#">
					<img src="./resources/img/campus1.jpg"
						style="width:300px;height:200px" />
					<h3>학교가 문을 닫게 되었습니다</h3>
				</a>	
				</div>
				<div class="col-md-4">
				<a href="#">
					<img src="./resources/img/campus1.jpg"
						style="width:300px;height:200px" />
					<h3>학교가 문을 닫게 되었습니다</h3>
				</a>	
				</div>
				<div class="col-md-4">
				<a href="#">
					<img src="./resources/img/campus1.jpg"
						style="width:300px;height:200px" />
					<h3>학교가 문을 닫게 되었습니다</h3>
				</a>	
				</div>
				<div class="col-md-4">
				<a href="#">
					<img src="./resources/img/campus1.jpg"
						style="width:300px;height:200px" />
					<h3>학교가 문을 닫게 되었습니다</h3>
				</a>	
				</div>
				<div class="col-md-4">
				<a href="#">
					<img src="./resources/img/campus1.jpg"
						style="width:300px;height:200px" />
					<h3>학교가 문을 닫게 되었습니다</h3>
				</a>	
				</div>
				<div class="col-md-4">
				<a href="#">
					<img src="./resources/img/campus1.jpg"
						style="width:300px;height:200px" />
					<h3>학교가 문을 닫게 되었습니다</h3>
				</a>	
				</div>
				<div class="d-grid gap-2 col-1"></div>
					<div>
						<select name="searchField">
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select> 
						<input type="text" name="searchWord">  
						<button class="btn btn-primary" type="button" onclick="">검색하기</button>
						<button class="btn btn-primary" type="button" onclick="">글쓰기</button>
					</div>
			</div>
			<hr>
		</div>


	</div>

	<jsp:include page="Main_footer.jsp"></jsp:include>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>
