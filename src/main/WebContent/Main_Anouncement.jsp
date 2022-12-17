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
<title>공지사항</title>
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
				<h1 class="text-white m-0">공지사항</h1>
			</div>
		</div>
		<div class="container-fluid px-4">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i>공지사항 목록<br><br>
					<form method="get">
						<span>
							<select name="searchField">
								<option value="anounce_subject">제목</option>
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
								<c:when test="${ empty am_list }">
									<!-- 게시물이 없을 때 -->
									<tr>
										<td colspan="6" align="center">등록된 게시물이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<!-- 게시물이 있을 때 -->
									<c:forEach items="${am_list}" var="list" varStatus="loop">
										<tr>
											<!-- 번호 ㄱ -->
											<td>${ map.totalCount - (((map.pageNum - 1) * map.pageSize) + loop.index) }</td>
											<!-- 제목 ㄱ -->
											<td><a
												href="./Anouncement_View2.do?num=${ list.anounce_num }">${ list.anounce_subject }</a></td>
											<!-- 작성자 ㄱ -->
											<td>${ list.anounce_writer }</td>
											<!-- 작성일 ㄱ -->
											<td>${ list.anounce_date }</td>
											<!-- 첨부 파일 ㄱ -->
											<td><c:if test="${ not empty list.anounce_ofile }">
													<a
														href="./Anouncement_Download.do?ofile=${ list.anounce_ofile }&sfile=${ list.anounce_sfile }&num=${ list.anounce_num }">${ list.anounce_ofile }</a>
												</c:if></td>
											<!-- 조회수 ㄱ -->
											<td>${ list.anounce_view }</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					<br>
					<c:if test="${ empty searchWord }">
								<table style="width: 100%;">
									<tr align="center">
										<td> ${ map.pagingImg } </td>
									</tr>
								</table>
					</c:if>
					<div class="d-grid gap-2 col-1">
						 <c:if test="${admin_key == '0'}">
							<button type="button" class="btn btn-primary" onclick="location.href='./Anouncement_Write.do';">글쓰기</button>
						 </c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="Main_footer.jsp"></jsp:include>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
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
