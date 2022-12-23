<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="dto.*"%>
<%@ page import="dao.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%
	AnouncementDAO dao = new AnouncementDAO(); // DAO 객체 생성
	QnA_DAO qdao = new QnA_DAO(); // QnA_DAO 객체 생성
	
	CalendarDAO cal_dao = new CalendarDAO(); // Calendar DAO 객체 생성
	List<CalendarDTO> cal_list = new ArrayList<>(); // Calendar list 객체 생성
	LocalDate now = LocalDate.now();
	String today = now.toString();
	cal_list = cal_dao.main_cal(today);
	request.setAttribute("cal_list", cal_list);
	cal_dao.close();
	
	Map<String, Object> map = new HashMap<String, Object>();
	String main = "";
	map.put("main", main);
	// 게시물 목록 받기
	List<AnouncementDTO> am_list = dao.selectListPage(map);
	List<QnA_DTO> qa_list = qdao.selectListPage(map);
	dao.close();
	
	request.setAttribute("am_list", am_list);
	request.setAttribute("qa_list", qa_list);
	
	// 뉴스 링크연결을 위해!
	news_DAO n_dao = new news_DAO();
	News_DTO n_dto = new News_DTO();
	n_dto = n_dao.news();
	Map<String,Object> n_map = new HashMap<String,Object>();
	String n_main = "";
	n_map.put("n_main", n_main);
	// 뉴스 목록 받기
	List<News_DTO> n_list = n_dao.selectListPage(n_map);
	
	request.setAttribute("n_list", n_list);
	request.setAttribute("n_dto", n_dto);
	n_dao.close();

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
  width: 1920px;
  height: 1080px;
	margin: 0;
	padding: 0;
}

head {
	margin: 0px;
	padding: 0px;
}

a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<!-- Responsive navbar-->
	<%@ include file="Main_menu.jsp"%>

	<!-- Page Content-->
	<div id="slideShow">
		<ul class="slides" id="testid">
			<li><img src="./resources/img/main_image01.jpg"
				class="img img-responsive" alt="Responsive image"></li>
			<li><img src="./resources/img/main_slide1.jpg"
				class="img img-responsive" alt="Responsive image"></li>
			<li><img src="./resources/img/main_slide2.jpg"
				class="img img-responsive" alt="Responsive image"></li>
			<li><img src="./resources/img/main_slide3.png"
				class="img img-responsive" alt="Responsive image"></li>
			<li><img src="./resources/img/main_slide4.jpg"
				class="img img-responsive" alt="Responsive image"></li>
		</ul>
		<p class="controller">

			<!-- &lang: 왼쪽 방향 화살표
        &rang: 오른쪽 방향 화살표 -->
			<span class="prev">&lang;</span> <span class="next">&rang;</span>
		</p>
	</div>
	
	<div class="ccc">
			<div id="anchorboard"
				class="card text-white bg-secondary my-5 py-3 text-center"></div>
			<!-- Content Row-->
			<div class="row" style="margin-bottom: 50px;">
				<div class="col">
					<div class="card h-100" style="border: solid 3px #F27C02; border-radius: 10px;">
						<div id="anchorboard" class="card-body">
							<a href="./Anouncement_List2.do">
							<h2	class="card-title text-center">
									공지사항</h2></a>
							<hr class="card-divider">
							<table class="table" id="datatablesSimple">
								<!-- 이쪽 부분에 대해 DB에서 파일 제목을 최신순으로 5개 받아오면서 해당 링크로도 같이 받아올 수 있도록 생성 -->
								<tr style="border-top: 1px solid #DEE2E6;">
									<th width="15%" style="border-right: 1px solid #DEE2E6;">작성일</th>
									<th style="border-right: 1px solid #DEE2E6;">제목</th>
									<th width="10%">조회</th>
								</tr>
								<c:forEach items="${am_list}" var="list">
									<tr style="background-color: #F9F9F8;">
										<td style="border-right: 1px solid #DEE2E6;">${ list.anounce_date }</td>
										<td
											style="text-align: left; border-right: 1px solid #DEE2E6; padding-left: 15px;">
											<a href="./Anouncement_View2.do?num=${ list.anounce_num }">
												${list.anounce_subject}
											</a>
										</td>
										<td>${ list.anounce_view }</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card h-100" style="border: solid 3px #F27C02; border-radius: 10px;">
						<div id="anchorboard" class="card-body">
							<a href="Main_Calendar.jsp"><h2
									class="card-title text-center">학사일정</h2></a>
							<hr class="card-divider">
							<a href="Main_Calendar.jsp">
							<table class="table" id="datatablesSimple">
								<!-- 이쪽 부분에 대해 DB에서 파일 제목을 최신순으로 5개 받아오면서 해당 링크로도 같이 받아올 수 있도록 생성 -->
								<tr style="border-top: 1px solid #DEE2E6;">
									<th style="border-right: 1px solid #DEE2E6;">일자</th>
									<th style="border-right: 1px solid #DEE2E6;">일정</th>
								</tr>
								<c:forEach items="${cal_list}" var="list">
									<tr style="background-color: #F9F9F8;">
										<td style="border-right: 1px solid #DEE2E6;">
											${ list.start } - ${ list.end }
										</td>
										<td width="40%" style="text-align: center; border-right: 1px solid #DEE2E6;">
												${list.title}
										</td>
									</tr>
								</c:forEach>
							</table>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="row" style="margin-bottom: 50px;">
				<div class="col">
					<div class="card h-100" style="border: solid 3px #F27C02; border-radius: 10px;">
						<div id="anchorboard" class="card-body">
							<!-- 헤드라인 -->
							<div id='headLine' style="text-align: center;">
    							<span style='font-size: 1.5em;'></span>
							 </div>
							 <hr class="card-divider">
							<!-- 그림 -->
							<div id="news_img">
								<a href="" id="news_num">
									<img id="news_image_slide" src="" class="news_img" 
										style="width: 900px;
										height: 250px;
									  	object-fit: fill;
									  	max-width: 100%;
									  	display: block;">
								</a>
							</div>
						</div>
					</div>
				</div>

				<div class="col">
					<div class="card h-100" style="border: solid 3px #F27C02; border-radius: 10px;">
						<div id="anchorboard" class="card-body">
							<a href="qna_list.do"><h2 class="card-title text-center">Q&A</h2></a>
							<hr class="card-divider">
								<table class="table" id="datatablesSimple">
									<!-- 이쪽 부분에 대해 DB에서 파일 제목을 최신순으로 5개 받아오면서 해당 링크로도 같이 받아올 수 있도록 생성 -->
									<tr style="border-top: 1px solid #DEE2E6;">
										<th width="15%" style="border-right: 1px solid #DEE2E6;">작성일</th>
										<th style="border-right: 1px solid #DEE2E6;">질문</th>
										<th width="15%">상태</th>
									</tr>
									<c:forEach items="${qa_list}" var="list">
										<tr style="background-color: #F9F9F8;">
											<td style="border-right: 1px solid #DEE2E6;">${ list.qna_date }</td>
											<td style="text-align: left; border-right: 1px solid #DEE2E6; padding-left: 15px;">
													${list.qna_question}
											</td>
											<td>
											<c:choose>
												<c:when test="${ list.qna_answer == null }">
													<span class="ans">&nbsp;답변 대기&nbsp;</span>
												</c:when>
												<c:otherwise>
													<span class="ans" style="background-color: #B5E61D">&nbsp;답변 완료&nbsp;</span>
												</c:otherwise>
											</c:choose>
											</td>
										</tr>
									</c:forEach>
								</table>
						</div>
					</div>
				</div>
			</div>
			<div id="anchorboard"
				class="card text-white bg-secondary my-5 py-3 text-center"></div>
	</div>
	
	<script type="text/javaScript" src="./resources/js/slide.js"></script>
	
	
	<script language="javaScript">
		var news_obTimeOut;    // clearTimeout() 함수를 이용하여 Timeout 을 취소하기위해 사용됨
		
		var headLineArray = new Array(); // 헤드라인 배열
		var headLineCnt = 0; // 헤드라인 배열 인덱스를 찾기 위한 변수
		
		var newsImageArray = new Array(); // 이미지 배열
		var newsImageCnt = 0; // 이미지 배열 인덱스를 찾기 위한 변수
		
		var hrefArray = new Array(); // 링크 텍스트 배열
		var hrefCnt = 0; // 링크 텍스트 배열 인덱스를 찾기 위한 변수
		
		
		headLineArray[0] = "${n_dto.news_subject1}";
		headLineArray[1] = "${n_dto.news_subject2}";
		headLineArray[2] = "${n_dto.news_subject3}";
		// DB에서 news_subject를 삽입
		   
		newsImageArray[0] = "./resources/img/${n_dto.news_oimg1}";
		newsImageArray[1] = "./resources/img/${n_dto.news_oimg2}";
		newsImageArray[2] = "./resources/img/${n_dto.news_oimg3}";
		// DB에서 news_oimg를 삽입
		   
		hrefArray[0] = "./news_View2.do?num=${n_dto.news_num1}";
		hrefArray[1] = "./news_View2.do?num=${n_dto.news_num2}";
		hrefArray[2] = "./news_View2.do?num=${n_dto.news_num3}";
		// DB에서 news_num을 삽입
		
		
		function ShowNewsDefaultRotate() {    // 스스로 자신을 호출하는 재귀함수 (Recursive Function)
		   
		   // 배열의 갯수 이내일때만 실행
		   if (newsImageCnt < newsImageArray.length) {
		      // 페이지 내에 ID가 괄호 안의 문자와 동일한 ID값을 찾아서 배열에 있는 텍스트를 적용시킴
		      document.getElementById("news_image_slide").src = newsImageArray[newsImageCnt];
		      document.getElementById("news_num").setTEXT_NODE = hrefArray[hrefCnt];
		      deleteText(); // div , a href 삭제
		      appendDiv(); // div , a href 생성
		      news_obTimeOut = setTimeout("ShowNewsDefaultRotate()", 2000);    // 2초후에 자기자신을 호출
		      newsImageCnt++;
		      headLineCnt++;
		      hrefCnt++;
		   } else {
		      newsImageCnt = 0;
		      headLineCnt = 0;
		      hrefCnt = 0;
		      startAnimation(); // Cnt 를 0으로 바꾸고 다시 시작
		        // clearTimeout(obTimeOut); // 배열의 갯수만큼 반복하여 변환시킨 후에는 Timeout 을 중지시킨다 // 한바퀴만 돌때 사용
		   }
		}
		
		function startAnimation() { // 윈도우 로드 후 0.1초 후에 반복함수를 호출합니다.
		    news_obTimeOut = window.setTimeout(ShowNewsDefaultRotate, 100);    
		}
		
		window.onload = startAnimation;    // 윈도우 로드시 이미지 변환함수 실행
		
		// 헤드라인 div 태그 추가/삭제 부분 / a href 도 같이
		function appendDiv() {
		   
		   // id값 찾기
		   const news_element = document.getElementById('headLine');
		   const href_element = document.getElementById('news_num');
		   
		   // new div 생성 / new a href 생성
		   const newDiv = document.createElement('div');
		   const newhref = document.createElement('a');
		   
		   // new div에 style 추가
		   newDiv.style.fontSize = '1.5em';
		   
		   // new div에 추가할 text node 생성
		   const newText = document.createTextNode(headLineArray[headLineCnt]);
		   
		   // text node를 new div에 추가
		   newDiv.appendChild(newText);
		   
		   // new div를 기존 div에 추가 / new a href를 기존 a href에 추가
		   news_element.appendChild(newDiv);
		   href_element.href = hrefArray[hrefCnt];
		}
		
		// 헤드라인 텍스트 삭제 / href 텍스트 삭제
		function deleteText() {
		   const element = document.getElementById('headLine');
		   element.innerText = '';
		}
		
	</script>
	<jsp:include page="Main_footer.jsp"></jsp:include>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>
