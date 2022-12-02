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
				<h1 class="text-white m-0">대학소개</h1>
			</div>
		</div>

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">International University</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">광주광역시 유일 등록금이 없는 대학</li>
					</ol>

					<div class="row gx-4 gx-lg-5 align-items-center my-4">
						<div class="col-lg-12">
							<img class="img-fluid rounded mb-4 mb-lg-0"
								src="./resources/img/Chosun_Boss.jpg" alt="..." />
						</div>
					</div>

					<div class="row">
						<div class="col-xl-10">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-table"></i> 국제 대학교 총장 김이박입니다.
								</div>
								<div class="card-body">
									<p>국제 경기가 날이 갈수록 안좋아지는 가운데 우리 대학교는 무려 전국에서 유일하게 등록금을 받지 않고
										있는 대학교입니다 솔직히 등록금이야 안내도 어디서든 뜯어낼돈은 많지만 일단 홍보만 이렇게 하는게 자연스럽게 돈을
										갈취할 수 있는 수단ㅇ</p>
								</div>
							</div>
						</div>
					</div>

					<!-- 이전 성적 데이터 존재 시 추가 출력을 위함 -->
					<div class="row">
						<div class="col-xl-7">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-table"></i> 우리 대학을 믿어주시는 시민여러분 덕분에.
								</div>
								<div class="card-body">
									
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
