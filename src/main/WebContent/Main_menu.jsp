<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 학교로고(클릭시 메인 페이지로 이동) -->
 	 <c:set var="ad" value="${session.ad}" scope="session"/>
 <header>
	<a href="MainPage.jsp"><img src="./resources/img/logo.jpg" style="width: 100x; height: 130px; margin-left: 100px;" ></a>
 	 <div id="nav_menu" style="height: 0px;">
 		 	<ul>
 				<li><a href="Main_IntroUniv.jsp">대학 소개</a></li>
 				<li><a href="Main_Calendar.jsp">학사 일정</a></li>
 				<li><a href="Main_Anouncement.jsp">공지사항</a></li>
				<c:choose>
					<c:when test="${admin_key == '0' }">
						<li><a href="Manager_page.jsp">관리자 페이지</a></li>
					</c:when>
					<c:when test="${admin_key == '1' }">
						<li><a href="admin.jsp">마이페이지</a></li> 
					</c:when>
				</c:choose>
 				<c:choose>
					<c:when test="${ id == null }">
 						<li><a href="Main_Login.jsp">로그인</a></li> 
 					</c:when>
					<c:otherwise>
						<li><a href="LogoutCon.do">로그아웃</a></li>
					</c:otherwise>
				</c:choose>
				
 			</ul>
	 </div>
</header>

<style>
header{
	margin-bottom: 0px;
	padding-bottom: 0px;
	border-bottom: 0px;
}
#nav_menu ul{
	list-style-type:none;
	/* 검은 배경색을 입히고, 보다 넓은 범위에 배경색을 넣기 위해 margin값을 약간 크게 잡아줌 */
	padding:1px 5px 5px 1px;
	background-color:white;
	position: relative;
	left: 1000px;
	bottom: 60px;
}

#nav_menu ul li{
	display:inline;
	
	/* li요소의 좌측에 1px의 테두리 만들기 */
	border-left: 1px solid #c0c0c0;
	
	/*테두리와 메뉴 간격 벌리기. padding: 위 오른쪽 아래 왼쪽; */
	padding: 0px 10px 0px 10px;
	
	/* 메뉴와 테두리 사이 간격 벌리기. margin: 위 오른쪽 아래 왼쪽;*/
	margin: 5px 0px 5px 0px;
	
	/* 검은 글씨와 13포인트의 글자로 변경함*/
	color:black;
	font-size:13pt;
}

#nav_menu ul li:first-child{
	/* li의 첫번째 요소의 좌측에는 테두리 없애기*/
	border-left:none;
}

/* 특별하게 정해지지 않은 링크 속성에 모두 적용할 스타일: 흰글씨/밑줄제거*/
#nav_menu a{
	text-decoration: none;
	color:black;
}
#nav_menu a:hover {
	color:#D4F4FA;
	border-bottom: 3px solid yellow;
}

</style>




<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container px-5">
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div>
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
			 	<li class="nav-item"><a class="nav-link active" aria-current="page" href="educational_aim.jsp">교육 목표</a></li>
				<li class="nav-item"><a class="nav-link active" href="college.jsp">단과 대학 소개</a></li>
				<li class="nav-item"><a class="nav-link active" href="#">대학입학</a></li>
				<li class="nav-item"><a class="nav-link active" href="#">대학 일자리센터</a></li> 
				<li class="nav-item"><a class="nav-link active" href="location.jsp">오시는 길</a></li> 
			</ul>
		</div>
	</div>
</nav>

<style>
 .navbar-nav li{
 	font-size: 1.5em;
 	column-gap: 100px;
 	columns: 100px 5;
 }
</style>