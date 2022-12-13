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
				<h1 class="text-white m-0">교육목표</h1>
			</div>
		</div>	
		
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">국제대학교 교육목표</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active" style="font-size:10pt;">창의적 미래 인재 양성, 세계를 변화시키는 대학</li>
					</ol>
					

					<div class="row">
						<div class="col-xl-12">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-table"></i> 국가 교육이념과 목표
								</div>
								<div class="card-body">
									<p>홍익인가 육성, 인격도야, 자주적 생활능력, 민주시민의 자질,인간다운 삶 영위, 민주국가발전과 인류공영 실현</p>
								</div>
							</div>
						</div>
					</div>
	
					<div class="row">
						<div class="col-xl-12">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-table"></i>고등교육의 목적
								</div>
								<div class="card-body">
									인격도야, 학술의 교수와 연구
									국가와 인류사회에 공헌				
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-xl-12">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-table"></i>교육목적
								</div>
								<div class="card-body">
									민주교육의 근본이념을 바탕으로 학술이론과 그 응용방법츨
									교수 연구하는 동시에 국가와 인류사회 발전에 필요한 인재를 육성한다.
								</div>
							</div>
						</div>
					</div>
					
					
					<div class="row">
						<div class="col-xl-12">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-table"></i>교육목표
								</div>
								<div class="card-body">
									지덕체를 겸비한 인격을 연마하고,창의적 학문 탐구와 전문적 실천능력을 배양하며,
									국제사회에 기여할 개방적 지도력을 육성한다.
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-xl-12">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-table"></i>인재상
								</div>
								<div class="card-body">
									지덕체를 겸비한 인격, 비판적 탐구와 창의적 실천능력, 봉사하고 책임지는 민주시민의식
									공선사후의 애국애족적 지도력, 국제적 이해와 교류능력
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
