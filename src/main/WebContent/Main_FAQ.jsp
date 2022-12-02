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
				<h1 class="text-white m-0">FAQ</h1>
			</div>
		</div>
		<div class="container-fluid px-4">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> FAQ 목록 (페이지당 10개 까지만 출력될 수 있도록)<br>
				</div>
				<div class="card-body">
					<table class="table" id="datatablesSimple">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>첨부파일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>3</td>
								<td><a href="#">제목 테스트</a></td>
								<td>관리자</td>
								<td>2022-11-30</td>
								<td><a href="#">파일 테스트</a></td>
								<td>40</td>

							</tr>
							<tr>
								<td>2</td>
								<td><a href="#">제목</a></td>
								<td>관리자</td>
								<td>2022-12-01</td>
								<td><a href="#">test.txt</a></td>
								<td>1234</td>
							</tr>
							<tr>
								<td>1</td>
								<td><a href="#">1234ABCDㄱㄴㄷㄹabcd1234</a></td>
								<td>관리자</td>
								<td>2023-01-01</td>
								<td><a href="#">양식.hwp</a></td>
								<td>0</td>
							</tr>
						</tbody>
					</table>
					<br>
					
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
			</div>
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
