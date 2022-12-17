<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="kr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>International College</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="./resources/assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="./resources/css/admin.css" rel="stylesheet" />
<link href="./resources/css/style.css" rel="stylesheet" />
<link href="./resources/css/Main_Slide.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<style>
#anchorboard a {
	text-decoration: none;
	color: black;
}
</style>

</head>
<body>
	<!-- Responsive navbar-->
	<%@ include file="Main_menu.jsp"%>

	<div class="container px-4 px-lg-5">
		<!-- Call to Action-->
		<div class="card text-white bg-secondary my-5 py-4 text-center">
			<div class="card-body">
				<h1 class="text-white m-0">입학 안내</h1>
			</div>
		</div>


		<main>

			<div class="row">
				<div class="col-xl-12">
					<div class="card mb-4">
						<div class="card-header"><h4>유의사항</h4></div>
						<div class="card-body">
							<p><b>수험생 유의시항</b></p>
							<ul>
								<li><b>- 동일 모집 시기에 우리 대학교 2개 학과에 입학원서를 이중으로 접수할 수 없음</b></li>
								<li><b>- 예비합격자의 연락두절로 인한 불이익은 우리 대학교에서 책임지지 않음</b></li>
								<li><b>- 교육부에서 정한 복수지원 금지 및 이중등록 위반 수험생은 입학을 취소함</b></li>
								<li style="color: #E90D36;"><b>- 전문대학, 대학의 수시전형 최초합격자와 수시 충원합격자도 학생의 의사여부와 등록에 상관없이
									정시모집에 지원할 수 없으며, 이를 위반 시에는 대학 입학이 취소됨</b></li>
								<li><b>- 수험생은 부정한 방법으로 합격 또는 입학한 사실이 확인될 경우에 입학 후라도 합격 또는 입학을
									취소함</b></li>
								<li><b>- 지원자는 반드시 대입전형자료 온라인 제공에 동의여부를 원서에 표기하여야 함</b></li>
								<li><b>- 학교생활기록부 사본 및 대학수학능력시험 성적표 또는 성적증명서 자료는 고등학교 및
									한국교육과정평가원에 조회하여 위·변조 사실이 발견된 경우 입학을 취소함</b></li>
								<li><b>- 입학전형의 성적 및 평가내용은 공개하지 않으며, 제출한 서류는 반환하지 않음</b></li>
								<li><b>- 모집요강에 명시되지 않은 사항은 입학전형관리위원회의 결정에 따라 처리함</b></li>
							</ul>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-xl-12">
					<div class="card mb-4">
						<div class="card-header"><h4>수시모집</h4></div>
						<div class="card-body">
							<table width="80%">
								<tr>
									<th width="20%">일반고 전형</th>
									<td><span><b>지원 자격</b></span>
										<ol>
											<li>- 일반계(인문계)고등학교 졸업(예정)자</li>
											<li>- 종합고등학교 일반과정 졸업(예정)자</li>
											<li>- 특수목적고등학교 중 과학고, 외국어고, 국제고, 자율고 졸업(예정)자</li>
											<li>- 방송통신고등학교 졸업(예정)자</li>
											<li>- 고등학교 졸업학력 검정고시 합격자</li>
										</ol>
									</td>
								</tr>
								<tr>
									<th>특성화고 전형</th>
									<td><span><b>지원 자격</b></span>
										<ol>
											<li>- 특성화고등학교 졸업(예정)자</li>
											<li>- 종합고등학교 특성화(전문계,실업계)과정 졸업(예정)자</li>
											<li>- 특수목적고등학교 중 예술고, 체육고, 마이스터고 졸업(예정)자</li>
											<li>- 학력인정 평생교육 시설에 의한 고등학교 졸업(예정)자</li>
											<li>- 일반계(인문계)고등학교 졸업(예정)자 중 1년이상 직업과정 이수자</li>
										</ol>
									</td>
								</tr>
								<tr>
									<th>고른기회 전형</th>
									<td><span><b>지원 자격</b></span>
										<ol>
											<li>- 농어촌학생</li>
											<li>- 기초생활수급권자, 차상위계층, 한부모가족지원대상자</li>
											<li>- 국가보훈대상자</li>
											<li>- 만학도</li>
										</ol>
										<span>제출서류</span>
										<ol>
											<li>- 지원자격 중 본인명의의 입증서류 증명서(접수마감일 기준 최근 1개월이내 발급)</li>
										</ol>
									</td>
							</table>
							<div>
								<br>
								<h4><b>공통 제출서류</b></h4>
								<ol>
									<li><b>- 입학원서 1부(인터넷접수자 제외)</b></li>
									<li><b>- 학교생활기록부 1부</b>
										<br>&nbsp;&nbsp;<span class="mini">- 2015년 2월 이전 졸업자 및 온라인 제공이 안 되는 대상자만 제출</span>
										<br>&nbsp;&nbsp;<span class="mini">- 온라인 제공 비동의자 및 온라인 제공 시스템 미설치교 출신자는 반드시 제출</span>
									</li>
								</ol>
								<ol>
									<li><b>- 검정고시 출신자</b>
										<br>&nbsp;&nbsp;<span class="mini">- 온라인 제공 동의자 : 별도 제출서류 없음</span>
										<br>&nbsp;&nbsp;<span class="mini">- 온라인 제공 비동의자 : 합격증명서와 성적증명서 원본 각 1부</span>
									</li>
								</ol>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-xl-12">
					<div class="card mb-4">
						<div class="card-header"><h4>정시모집</h4></div>
						<div class="card-body">
							<table width="80%">
								<tr>
									<th width="20%">일반전형</th>
									<td><span><b>지원 자격</b></span>
										<ol>
											<li>- 고등학교 졸업(예정)자</li>
											<li>- 고등학교를 졸업한 자와 동등 이상의 학력이 있다고 인정된 자
											<br>&nbsp;&nbsp;<span class="mini">* 외국계 고교 출신 졸업(예정)자는 전 학년(1,2,3학년) 고교내신 성적이 없는 자는 지원불가</span>
											</li>
										</ol>
									</td>
								</tr>
							</table>
							<div>
								<br>
								<h4><b>공통 제출서류</b></h4>
								<ol>
									<li><b>- 입학원서 1부(인터넷접수자 제외)</b></li>
									<li><b>- 학교생활기록부 1부</b>
										<br>&nbsp;&nbsp;<span class="mini">- 2015년 2월 이전 졸업자 및 온라인 제공이 안 되는 대상자만 제출</span>
										<br>&nbsp;&nbsp;<span class="mini">- 온라인 제공 비동의자 및 온라인 제공 시스템 미설치교 출신자는 반드시 제출</span>
									</li>
								</ol>
								<ol>
									<li><b>- 검정고시 출신자</b>
										<br>&nbsp;&nbsp;<span class="mini">- 온라인 제공 동의자 : 별도 제출서류 없음(해당 교육청에 온라인 제공동의자)</span>
										<br>&nbsp;&nbsp;<span class="mini">- 온라인 제공 비동의자 : 합격증명서와 성적증명서 원본 각 1부</span>
									</li>
								</ol>
								<ol>
									<li><b>- 외국계 고교 출신 졸업(예정)자</b>
										<br>&nbsp;&nbsp;<span class="mini">- 출입국사실증명서(학생) 1부</span>
										<br>&nbsp;&nbsp;<span class="mini">- 중학교 생활기록부 1부</span>
										<br>&nbsp;&nbsp;<span class="mini">- 고등학교 졸업(예정)증명서와 성적증명서 원본 각 1부</span>
										<br>&nbsp;&nbsp;<span class="mini">- 아포스티유 확인 또는 해당 국가 영사관 확인을 받은 후 한국어로 번역·공증된 원본 각 1부</span>
									</li>
								</ol>
							</div>
						</div>
					</div>
				</div>
			</div>


		</main>

	</div>

	<jsp:include page="Main_footer.jsp"></jsp:include>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
<style>
h4, h3 {
	color: #0031A0;
}
table tr, th, td {
	border: 1px solid blue;
}
th {
	background-color: #F8FBFE;
	text-align: center;
	width: 20%;
}
td {
	width: 80%;
}
span, p {
	color: #0031A9;
	font-size: 1.1em;
}
.mini {
	font-size: small;
}
</style>
</html>
