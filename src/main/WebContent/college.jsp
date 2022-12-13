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
<style>



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
				<h1 class="text-white m-0">단과 대학 소개</h1>
			</div>
		</div>	
		
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">대학·학부(과)</h1>
					

					<div class="row">
						<div class="col-xl-12">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-table" style="color: green; font-size: 25pt;">간호대학</i>
								</div>
								<div class="card-body">
									<ul>
										<li>간호학과</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
	
					<div class="row">
						<div class="col-xl-12">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-table"style="color: green; font-size: 25pt;">경영대학</i>
								</div>
								<div class="card-body">
									<ul>
										<li>경영학부</li>
										<li>경제학부</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-xl-12">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-table" style="color: green; font-size: 25pt;">공과대학</i>
								</div>
								<div class="card-body">
									<ul>
										<li>건축학부</li>
										<li>기계공학부</li>
										<li>생물공학과</li>
										<li>에너지자원공학과</li>
										<li>전자공학과</li>
										<li>소프트웨어공학과</li>
										<li>화학공학부</li>
										
										<li>고분자융합소재공학부</li>
										<li>산업공학과</li>
										<li>신소재공학부</li>
										<li>전기공학과</li>
										<li>컴퓨터정보통신공학과</li>
										<li>토목공학과</li>
										<li>환경에너지공학과</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					
					
					<div class="row">
						<div class="col-xl-12">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-table" style="color: green; font-size: 25pt;">의과대학</i>
								</div>
								<div class="card-body">
									<ul>
										<li>의학과</li>
										<li>의예과</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-xl-12">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-table" style="color: green; font-size: 25pt;">인문대학</i>
								</div>
								<div class="card-body">
									<ul>
										<li>국어국문학과</li>
										<li>불어불문학과</li>
										<li>영어영문학과</li>
										<li>중어중문학과</li>
										<li>독일언어문학과</li>
										<li>사학과</li>
										<li>일어일문학과</li>
										<li>철학과</li>
									</ul>
								</div>
							</div>
						</div>
					</div>



				</div>
			</main>
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
