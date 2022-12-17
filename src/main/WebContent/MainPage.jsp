<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="dto.AnouncementDTO"%>
<%@ page import="dao.AnouncementDAO"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	AnouncementDAO dao = new AnouncementDAO(); // DAO 객체 생성
	
	Map<String, Object> map = new HashMap<String, Object>();
	String main = "";
	map.put("main", main);
	// 게시물 목록 받기
	List<AnouncementDTO> am_list = dao.selectListPage(map);
	dao.close();
	
	request.setAttribute("am_list", am_list);
%>
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

body {
	margin: 0;
	padding: 0;
}

head {
	margin: 0px;
	padding: 0px;
}
</style>

</head>
<body>
	<!-- Responsive navbar-->
	<%@ include file="Main_menu.jsp"%>

	<!-- Page Content-->
	<div id="slideShow">
		<ul class="slides" id="testid">
			<li><img src="./resources/img/1900x400.jpg"
				class="img img-responsive" alt="Responsive image"></li>
			<li><img src="./resources/img/1900x400_1.jpg"
				class="img img-responsive" alt="Responsive image"></li>
			<li><img src="./resources/img/1900x400_2.jpg"
				class="img img-responsive" alt="Responsive image"></li>
			<li><img src="./resources/img/1900x400_3.jpg"
				class="img img-responsive" alt="Responsive image"></li>
		</ul>
		<p class="controller">

			<!-- &lang: 왼쪽 방향 화살표
        &rang: 오른쪽 방향 화살표 -->
			<span class="prev">&lang;</span> <span class="next">&rang;</span>
		</p>
	</div>
	<div class="ccc">
		<div class="ccc">


			<div id="anchorboard"
				class="card text-white bg-secondary my-5 py-4 text-center"></div>
			<!-- Content Row-->
			<div class="row" style="margin-bottom: 50px;">
				<div class="col">
					<div class="card h-100">
						<div id="anchorboard" class="card-body">
							<a href="./Anouncement_List2.do"><h2
									class="card-title text-center">공지사항</h2></a>
							<hr class="card-divider">
							<table class="table" id="datatablesSimple">
								<!-- 이쪽 부분에 대해 DB에서 파일 제목을 최신순으로 5개 받아오면서 해당 링크로도 같이 받아올 수 있도록 생성 -->
								<tr>
									<th width="15%" style="border-right: 1px solid #DEE2E6;">작성일</th>
									<th style="border-right: 1px solid #DEE2E6;">제목</th>
									<th width="10%">조회</th>
								</tr>
								<c:forEach items="${am_list}" var="list">
									<tr>
										<td style="border-right: 1px solid #DEE2E6;">${ list.anounce_date }</td>
										<td
											style="text-align: left; border-right: 1px solid #DEE2E6; padding-left: 30px"><a
											href="./Anouncement_View2.do?num=${ list.anounce_num }">${list.anounce_subject}</a></td>
										<td>${ list.anounce_view }</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card h-100">
						<div id="anchorboard" class="card-body">
							<a href="Main_Calendar.jsp"><h2
									class="card-title text-center">학사일정</h2></a>
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
			</div>
			<div class="row" style="margin-bottom: 50px;">
				<div class="col">
					<div class="card h-100">
						<div id="anchorboard" class="card-body">
							<a href="Main_News.jsp"><h2 class="card-title text-center">학교뉴스</h2></a>
							<hr class="card-divider">
							<table class="table" id="datatablesSimple">
								<tr>
									<td><a href="#">2022.11.4 외국인 유학생 조기 적응 프로그램</a></td>
								</tr>
								<tr>
									<td><a href="#">2022.11.2 데이트 폭력 예방 교육</a></td>
								</tr>
								<tr>
									<td><a href="#">2022.10.20 국제대학교 총동창회 정기총회 및 회장 이취임식</a></td>
								</tr>
								<tr>
									<td><a href="#">2022.10.13 2022학년도 고위직 대상 인권 및
											폭력예방교육(2)</a></td>
								</tr>
								<tr>
									<td><a href="#">2022.9.30 아시아문화장학재단 장학금 전달식</a></td>
								</tr>
							</table>
						</div>
					</div>
				</div>

				<div class="col">
					<div class="card h-100">
						<div id="anchorboard" class="card-body">
							<a href="Main_QnA.jsp"><h2 class="card-title text-center">Q&A</h2></a>
							<hr class="card-divider">
							<table class="table" id="datatablesSimple">
								<tr>
									<td><a href="#">학교 등록금이 너무 비싸요</a></td>
								</tr>
								<tr>
									<td><a href="#">최근 국제정세에 기반한 한국 주세법의 방향성에 대햐여</a></td>
								</tr>
								<tr>
									<td><a href="#">학적 관련 서류 제출 위치 관련 질문 (자퇴)</a></td>
								</tr>
								<tr>
									<td><a href="#">현 국내 주류시장의 주류에 따른 증류주 및 수입주류에 대한 관세
											책정에 관하여</a></td>
								</tr>
								<tr>
									<td><a href="#">DB에서 최신순으로 5개 Subject랑 링크 탈 수 있는 주소
											가져와서 입력하면 됩니다.</a></td>
								</tr>
							</table>
						</div>
					</div>
				</div>

			</div>
			<div id="anchorboard"
				class="card text-white bg-secondary my-5 py-4 text-center"></div>
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
