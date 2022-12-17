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
				<h1 class="text-white m-0">대학일자리센터</h1>
			</div>
		</div>	
		
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<div class="row">
						<div class="col-xl-12">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-table" style="font-size: 17pt;"><b>대학일자리센터 소개</b></i>
								</div>
								<div class="card-body">
									창의적이고 진취적인 사고와 실제적인 제반업무를 겸비한 경쟁력 있는 인재를 양성하는
									취업전담기관으로, 단순한 취업정보를 제공하는데 벗어나 개개인의 적성을 파악하여 
									능력과 특성을 발휘할 수 있는 예비사회인으로 성장할 수 있도록 지원을 다하고 있습니다.
									또한 대학생활에서 경험하는 다양한 정서적인 문제,학업이나 진로 및 취업문제,심리적인 문제를
									상담하고 있으며 자신을 보다 정확하고 객관적으로 이해할 수 있도록 각종 심리검사를 실시합니다.
									대학생활에서의 어려운 점이나 진로 및 취업문제로 고민하고 있는 학생들을 위해 언제나 문을 
									열어놓고 있습니다.
								</div>
							</div>
						</div>
					</div>
	
					<div class="row">
						<div class="col-xl-12">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-table" style="font-size: 17pt"><b>센터업무</b></i>
								</div>
								<div class="card-body">
									<ol>
										<li>대학창조일자리센터사업 운영 및 관리</li>									
										<li>취업상담실 운영</li>									
										<li>취업지도 관리</li>									
										<li>진로개발 프로그램 기획</li>									
										<li>진로 컨설팅 및 상담</li>									
										<li>취업 종합전산망 인터넷 관리</li>									
										<li>취업특강 및 세미나 관리</li>									
										<li>취업통계 작성 관리</li>									
										<li>기업체 대상 홍보활동</li>									
											<li>졸업생 관리</li>									
											<li>취업연계형 인턴십 운영, 기타 위 각 호에 부수되는 사항</li>									
									</ol>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-xl-12">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-table" style="font-size: 17pt;"><b>담당자 및 연락처</b></i>
								</div>
									<table border="2">
										<tr>
											<th>소속</th>
											<th>직위</th>
											<th>이름</th>
											<th>담당업무</th>
											<th>연락처</th>
										</tr>
										
										<tr>
											<td>진로취업지원팀</td>
											<td>진로취업지원 팀장</td>
											<td>이대형</td>
											<td>진로취업 기획 및 총괄</td>
											<td>031-8041-0121</td>
										</tr>
										
										<tr>
											<td>진로취업지원팀</td>
											<td>취업지원관</td>
											<td>문현미</td>
											<td>대학일자리센터 사업 기획 및 운영</td>
											<td>031-750-4787</td>
										</tr>
										
										<tr>
											<td>진로취업지원팀</td>
											<td>취업지원관</td>
											<td>심규리</td>
											<td>진로 및 취업컨설팅,취업상담 관리</td>
											<td>031-750-5834</td>
										</tr>
										
										<tr>
											<td>진로취업지원팀</td>
											<td>취업지원관</td>
											<td>권도희</td>
											<td>취업 서포터즈 기획 및 운영</td>
											<td>031-750-5006</td>
										</tr>
										
										<tr>
											<td>진로취업지원팀</td>
											<td>취업지원관</td>
											<td>정연재</td>
											<td>진로,취업 비교과 프로그램 기획 및 운영</td>
											<td>031-750-6431</td>
										</tr>
									</table>
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
