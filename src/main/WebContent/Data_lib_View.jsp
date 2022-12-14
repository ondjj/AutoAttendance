<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:set var="ad" value="${session.ad}" scope="session"/>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>자료실</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="./resources/css/admin.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<div>
	<c:choose>
	<c:when test="${admin_key == '1' }">
		<%@ include file="infoAdmin.jsp" %>
	</c:when>
	<c:when test="${ admin_key == '0' }">
		<%@ include file="info_manager.jsp" %>
	</c:when>
	</c:choose>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
				<c:choose>
				<c:when test="${admin_key == '1' }">
					<h1 class="mt-4">자료실</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="admin.jsp">마이페이지</a></li>
						<li class="breadcrumb-item active">기타</li>
						<li class="breadcrumb-item active">자료실</li>
					</ol>
				</c:when>
				<c:when test="${ admin_key == '0' }">
					<h1 class="mt-4">자료실(관리자)</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="Manager_page.jsp">관리자 페이지</a></li>
						<li class="breadcrumb-item active">기타</li>
						<li class="breadcrumb-item active">자료실</li>
					</ol>
				</c:when>
				</c:choose>
					<div class="card mb-4">
						<div class="card-header">
							<h4>${ dto.data_subject }</h4>
						</div>
						<div class="card-body">
							<table class="table table-bordered" id="datatablesSimple">
								<thead style="border-top: 3px solid #336699;">
									<tr>
										<th style="border-right: 3px solid #336699; border-bottom: 1px solid #336699">작성자</th>
										<th style="border-right: 3px solid #336699; border-bottom: 1px solid #336699">작성일</th>
										<th style="border-right: 3px solid #336699; border-bottom: 1px solid #336699">조회수</th>
										<th style="border-right: 3px solid #336699; border-bottom: 1px solid #336699">첨부 파일</th>
										<td style="border-right: 3px solid #336699; border-bottom: 1px solid #336699">
											<a href="./data_lib_download.do?ofile=${ dto.data_ofile }&sfile=${ dto.data_sfile }&num=${ dto.data_num }">
												${ dto.data_ofile }
											</a>
										</td>
									</tr>
									<tr>
										<td style="border-right: 3px solid #336699;">${ dto.data_writer }</td>
										<td style="border-right: 3px solid #336699;">${ dto.data_date }</td>
										<td style="border-right: 3px solid #336699;">${ dto.data_view }</td>
										<th style="border-right: 3px solid #336699;">다운로드 횟수</th>
										<td style="border-right: 3px solid #336699;">${ dto.data_down }</td>
									</tr>
								</thead>
								<tbody style="border: 3px solid #336699;">
									<tr>
										<th style="border-right: 1px solid #336699;" rowspan="2">내용</th>
										<td colspan="5" rowspan="2" style="text-align: left;" width="*">${ dto.data_content }</td>
								</tbody>
							</table>
							<br>
							<div>
								<button type="button" class="btn btn-primary btn-lg" onclick="location.href='./data_lib_list.do';">목록</button>
								<c:choose>
									<c:when test="${admin_key == '0' }">
										<button type="button" class="btn btn-success btn-lg" onclick="location.href='./data_lib_update.do?num=${ dto.data_num }';">수정하기</button>
										<button type="button" class="btn btn-danger btn-lg" onclick="location.href='./data_lib_delete.do?num=${ dto.data_num }';">삭제하기</button>
									</c:when>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</main>
			<%@ include file="footerAdmin.jsp"%>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
</body>
</html>
