<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
	<!-- Navbar Brand-->
	<a class="navbar-brand ps-3" href="admin.jsp">학생 관리 페이지</a>
	<!-- Sidebar Toggle-->
	<!-- <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
		id="sidebarToggle" href="#!">
		<i class="fas fa-bars"></i>
	</button> -->
	<!-- Navbar Search-->
	<form
		class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link" href="MainPage.jsp">Main Page</a></li>
			</ul>
		</div>
	</form>
	<!-- Navbar-->
	<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown"
			aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
			<ul class="dropdown-menu dropdown-menu-end"
				aria-labelledby="navbarDropdown">
				<li><a class="dropdown-item" href="#!">Settings</a></li>
				<li><a class="dropdown-item" href="#!">Activity Log</a></li>
				<li><hr class="dropdown-divider" /></li>
				<li><a class="dropdown-item" href="#!">Logout</a></li>
			</ul>
		</li>
	</ul>
</nav>
<div id="layoutSidenav">
	<div id="layoutSidenav_nav">
		<nav class="sb-sidenav accordion sb-sidenav-dark"
			id="sidenavAccordion">
			<div class="sb-sidenav-menu">
				<div class="nav">
					<div class="sb-sidenav-menu-heading">전체정보</div>
					<a class="nav-link" href="dashboard.do?id=20150069">
						<div class="sb-nav-link-icon">
							<i class="fas fa-tachometer-alt"></i>
						</div> DashBoard
					</a>

						<div class="sb-sidenav-menu">
							<div class="nav">
								<div class="sb-sidenav-menu-heading">학적</div>
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#collapseLayouts" aria-expanded="false"
									aria-controls="collapseLayouts">
									<div class="sb-nav-link-icon">
										<i class="fas fa-book-open"></i>
									</div> 출결관리
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								
								<div class="collapse" id="collapseLayouts"
									aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="AttendanceManagement.jsp">출결현황</a>
										<a class="nav-link" href="AttendanceManagement_Objection.jsp">출결정정신청</a>
										관리자 로그인 시 내역
										<a class="nav-link" href="AttendanceManagement_ObjectionHistory.jsp">출결정정신청내역(관리자)</a>
									</nav>
								</div>
								
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#collapseLayouts2" aria-expanded="false"
									aria-controls="collapseLayouts">
									<div class="sb-nav-link-icon">
										<i class="fas fa-columns"></i>
									</div> 학적관련신청
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="collapseLayouts2"
									aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="CollegeRegister.jsp">학생인적사항 등록</a>
										<a class="nav-link" href="updateCollege.jsp">학적변동신청</a>
										<a class="nav-link" href="certificate.jsp">학생증명서발급신청</a> 
										<a class="nav-link" href="401.jsp">전공변경신청</a>
									</nav>
								</div>
								
							<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts3" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                성적관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts3" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="grade.do?id=20150069">성적열람</a>
                                    <a class="nav-link" href="GradeManagement_Objection.jsp">성적정정신청</a>
									관리자 로그인 시 내역
                                    <a class="nav-link" href="GradeManagement_Insert.jsp">성적입력(관리자)</a>
                                    <a class="nav-link" href="404.jsp">성적수정(관리자)</a>
                                    <a class="nav-link" href="GradeManagement_ObjectionHistory.jsp">성적정정신청내역(관리자)</a>
                                </nav>
                            </div>
								
								
                            <div class="sb-sidenav-menu-heading">기타</div>
                            <a class="nav-link" href="/data_lib_list.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                자료실
                            </a>
                            <a class="nav-link" href="/UserDetail.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                개인정보수정
                            </a>
                            <a class="nav-link" href="#p">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                내 강의실
                            </a>
								

							</div>
						</div>
						
						
						<div class="sb-sidenav-footer">
							<div class="small">Logged in as:</div>
							국제 대학교
						</div>
					
					
					</nav>
				</div>