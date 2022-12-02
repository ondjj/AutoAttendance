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
<link href="./resources/css/Main_Slide.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<style>
#anchorboard a{
	text-decoration: none; 
	color: black;
}
</style>

</head>
<body>
	<!-- Responsive navbar-->
	<%@ include file="Main_menu.jsp"%>
	<!-- Page Content-->
	<div class="container px-4 px-lg-5">
				
		<!-- Main Slide -->
		<div id="slideShow">
    		<ul class="slides" id="testid">
      			<li><a href="http://www.naver.com/"><img src="./resources/img/campus1.jpg" alt=""></a></li>
			    <li><img src="./resources/img/famu1.jpg" alt=""></li>
			    <li><img src="./resources/img/johns_hopkins1.jpg" alt=""></li>
			    <li><img src="./resources/img/school_design1.jpg" alt=""></li>
	    	</ul>  
	    <p class="controller">
      
        <!-- &lang: 왼쪽 방향 화살표
        &rang: 오른쪽 방향 화살표 -->
        <span class="prev">&lang;</span>  
        <span class="next">&rang;</span>
    	</p>
		</div>
	
		
		<!-- Call to Action-->
		<div id="anchorboard" class="card text-white bg-secondary my-5 py-4 text-center">
			<table>
				<tr>
					<td><a href="MainPage.jsp" class="text-white fs-4">교육 목표</a></td>
					<td><a href="MainPage.jsp" class="text-white fs-4">단과대학 소개</a></td>
					<td><a href="MainPage.jsp" class="text-white fs-4">대학입학</a></td>
					<td><a href="MainPage.jsp" class="text-white fs-4">대학 일자리 플러스 센터</a></td>
					<td><a href="MainPage.jsp" class="text-white fs-4">오시는 길</a></td>
				</tr>
			</table>
		</div>
		<!-- Content Row-->
		<div class="row gx-4 gx-lg-5">
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<div id="anchorboard" class="card-body">
						<a href="Main_Anouncement.jsp" ><h2 class="card-title text-center">공지사항</h2></a>
						<hr class="card-divider">
						<table class="table" id="datatablesSimple">
						<!-- 이쪽 부분에 대해 DB에서 파일 제목을 최신순으로 5개 받아오면서 해당 링크로도 같이 받아올 수 있도록 생성 -->
								<tr>
									<td><a href="#">[글쓰기센터] '겨울방학 글쓰기 소모임' 안내</a></td>
								</tr>
								<tr>
									<td><a href="#">2023년도 1학기 기숙사 입사 신청</a></td>
								</tr>
								<tr>
									<td><a href="#">2022학년도 동계계절학기 표준 현장실습학기제 참여학생 모집</a></td>
								</tr>
								<tr>
									<td><a href="#">2022 국제대학교 대학혁신지원사업 학생주도형 우리 대학 시그니처 비교과 프로그램 성과공유회 발표자 모집</a></td>
								</tr>
								<tr>
									<td><a href="#">2022년 11기 IBA 프로젝트 봉사단 추가모집 안내</a></td>
								</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-4 mb-5">
				<div class="card h-100">
						<div id="anchorboard" class="card-body">
								<a href="Main_Calendar.jsp"><h2 class="card-title text-center">학사일정</h2></a>
								<hr class="card-divider">
								<a href="Main_Calendar.jsp">
								<div class="card-body">
								<table class="table card-title" id="datatablesSimple">
								<thead>
									<tr>
										<th>일자</th>
										<th>일정</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>12-08~12-15</td>
										<td>기말고사</td>
		
									</tr>
									<tr>
										<td>12-19</td>
										<td>개교기념일</td>
									</tr>
									<tr>
										<td>12-30</td>
										<td>설립기념일</td>
									</tr>
									<tr>
										<td>12-31</td>
										<td>연말술자리</td>
									</tr>
								</tbody>
							</table>
							</div>
							</a>
						</div>
				</div>
			</div>
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<div id="anchorboard" class="card-body">
						<a href="Main_News.jsp" ><h2 class="card-title text-center">학교뉴스</h2></a>
						<hr class="card-divider">
						<table class="table" id="datatablesSimple">
								<tr>
									<td><a href="#">2022.11.4 외국인 유학생 조기 적응 프로그램</a></td>
								</tr>
								<tr>
									<td><a href="#">2022.11.2 데이트 폭력 예방 교육</a></td>
								</tr>
								<tr>
									<td><a href="#">2022.10.20 조선대학교 총동창회 정기총회 및 회장 이취임식</a></td>
								</tr>
								<tr>
									<td><a href="#">2022.10.13 2022학년도 고위직 대상 인권 및 폭력예방교육(2)</a></td>
								</tr>
								<tr>
									<td><a href="#">2022.9.30 아시아문화장학재단 장학금 전달식</a></td>
								</tr>
						</table>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<div id="anchorboard" class="card-body">
						<a href="Main_QnA.jsp" ><h2 class="card-title text-center">Q&A</h2></a>
						<hr class="card-divider">
						<table class="table" id="datatablesSimple">
								<tr>
									<td><a href="#">학교 등록금이 너무 비싸요</a></td>
								</tr>
								<tr>
									<td><a href="#">최근 국제정세에 기반한 한국 주류세금의 문제점에 대햐여</a></td>
								</tr>
								<tr>
									<td><a href="#">퇴학하고싶은데 서류를 어디에 제출하면 되나요</a></td>
								</tr>
								<tr>
									<td><a href="#">일단 아무 샘플이나 집어넣어두도록 하겠습니다</a></td>
								</tr>
								<tr>
									<td><a href="#">DB에서 최신순으로 5개 Subject랑 링크 탈 수 있는 주소 가져와서 입력하면 됩니다.</a></td>
								</tr>
						</table>
					</div>
				</div>
			</div>
			
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<div id="anchorboard" class="card-body">
						<a href="Main_FAQ.jsp" ><h2 class="card-title text-center">FAQ</h2></a>
						<hr class="card-divider">
						<table class="table" id="datatablesSimple">
								<tr>
									<td><a href="#">학교 등록금이 너무 비싸요</a></td>
								</tr>
								<tr>
									<td><a href="#">최근 국제정세에 기반한 한국 주류세금의 문제점에 대햐여</a></td>
								</tr>
								<tr>
									<td><a href="#">퇴학하고싶은데 서류를 어디에 제출하면 되나요</a></td>
								</tr>
								<tr>
									<td><a href="#">일단 아무 샘플이나 집어넣어두도록 하겠습니다</a></td>
								</tr>
								<tr>
									<td><a href="#">DB에서 최신순으로 5개 Subject랑 링크 탈 수 있는 주소 가져와서 입력하면 됩니다.</a></td>
								</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-4 mb-5">
				<div class="card h-100">
					<div id="anchorboard" class="card-body">
						<h2 class="card-title text-center">협력 기업</h2>
						<hr class="card-divider">
						<div class="card mb-4 text-center ">
							<a href="https://www3.chosun.ac.kr/chosun/index...do?main=Y">
								<p class="m-0">조선대학교</p>
							</a>
						</div>
						<div class="card mb-4 text-center ">
							<a href="http://www.kjca.co.kr/">
								<p class="m-0">국제직업전문학교</p>
							</a>
						</div>
						<div class="card mb-4 text-center ">
							<a href="http://www.naver.com/">
								<p class="m-0">넷잇버</p>
							</a>
						</div>
						<div class="card mb-4 text-center ">
							<a href="http://www.naver.com/">
								<p class="m-0">넷잇버</p>
							</a>
						</div>
						<div class="card mb-4 text-center ">
							<a href="http://www.naver.com/">
								<p class="m-0">넷잇버</p>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script src="./resources/js/slide.js"></script>
	
	<jsp:include page="Main_footer.jsp"></jsp:include>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>
