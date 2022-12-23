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
						<li class="breadcrumb-item"><a href="AdminDashBoard.do">마이페이지</a></li>
						<li class="breadcrumb-item active">기타</li>
						<li class="breadcrumb-item active">자료실</li>
					</ol>
				</c:when>
				<c:when test="${ admin_key == '0' }">
					<h1 class="mt-4">자료실(관리자)</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="ObjectionListCon.do?type=1">관리자 페이지</a></li>
						<li class="breadcrumb-item active">기타</li>
						<li class="breadcrumb-item active">자료실</li>
					</ol>
				</c:when>
				</c:choose>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 게시물 목록<br><br>
							<form method="get">
								<span>
									<select name="searchField" disabled>
										<option value="data_subject">제목</option>
									</select>
									<input type="text" id="searchWord" name="searchWord" value="${ searchWord }">
									<button class="btn btn-primary btn-sm" onclick="return filter()" type="submit">검색하기</button>
								</span>
							</form>
						</div>
						<div class="card-body">
							<table class="table table-hover" id="datatablesSimple">
								<thead>
									<tr>
										<th width="10%">번호</th>
										<th width="*">제목</th>
										<th width="15%">작성자</th>
										<th width="15%">작성일</th>
										<th width="15%">첨부파일</th>
										<th width="10%">조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${ empty datalist }">
											<!-- 게시물이 없을 때 -->
											<tr>
												<td colspan="6" align="center">등록된 게시물이 없습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>
											<!-- 게시물이 있을 때 -->
											<c:forEach items="${datalist}" var="list" varStatus="loop">
												<tr>
													<!-- 번호 ㄱ -->
													<td>${ list.data_num }</td>
													<!-- 제목 ㄱ -->
													<td><a href="./data_lib_view.do?num=${ list.data_num }">${ list.data_subject }</a></td>
													<!-- 작성자 ㄱ -->
													<td>${ list.data_writer }</td>
													<!-- 작성일 ㄱ -->
													<td>${ list.data_date }</td>
													<!-- 첨부 파일 ㄱ -->
													<td>
														<c:if test="${ not empty list.data_ofile }">
															<a href="./data_lib_download.do?ofile=${ list.data_ofile }&sfile=${ list.data_sfile }&num=${ list.data_num }">${ list.data_ofile }</a>
														</c:if>
													</td>
													<!-- 조회수 ㄱ -->
													<td>${ list.data_view }</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
							<br>
							<%-- <c:if test="${ empty searchWord }"> --%>
								<table style="width: 100%;">
									<tr align="center">
										<td> ${ map.pagingImg } </td>
									</tr>
								</table>
							<%-- </c:if> --%>
							<c:if test="${ admin_key == '0' }">
								<div class="d-grid gap-2 col-1">
									<button type="button" class="btn btn-primary" 
										onclick="location.href='./data_lib_write.do';">글쓰기</button>
								</div>
							</c:if>
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
<script>
	function filter() {
		var content = document.getElementById("searchWord").value;
		if (content.trim() === "") {
			alert("내용을 입력해 주세요.");
			return false;
		}
	}
</script>
</html>
