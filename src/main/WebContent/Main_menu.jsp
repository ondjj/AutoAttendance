<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container px-5">
		<a class="navbar-brand" href="MainPage.jsp">International College</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link"
					aria-current="page" href="Main_IntroUniv.jsp">대학 소개</a></li>
				<li class="nav-item"><a class="nav-link" href="Main_Calendar.jsp">학사 안내</a></li>
				<li class="nav-item"><a class="nav-link" href="Main_Anouncement.jsp">공지사항</a></li>
				<!-- 세션 정보가 존재하는지 판단유무로 지정 -->
				<li class="nav-item"><a class="nav-link active" href="/UserDetail.do">마이페이지(로그인시)</a></li> 
				<li class="nav-item"><a class="nav-link active" href="Main_Login.jsp">로그인</a></li>
			</ul>
		</div>
	</div>
</nav>