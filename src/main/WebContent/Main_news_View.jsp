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
<title>뉴스</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="./resources/assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="./resources/css/style.css" rel="stylesheet" />
</head>
<body>
 <c:set var="ad" value="${session.ad}" scope="session"/>
	<!-- Responsive navbar-->
	<%@ include file="Main_menu.jsp"%>
	<!-- Page Content-->
	<div class="container px-4 px-lg-5">
		<!-- Call to Action-->
		<div class="card text-white bg-secondary my-5 py-4 text-center">
			<div class="card-body">
				<h1 class="text-white m-0">뉴스</h1>
			</div>
		</div>
		<div class="container-fluid px-4">
			<div class="card mb-4">
						<div class="card-header">
							<h4>제목 : ${ dto.news_subject}</h4>
						</div>
						<div class="card-body">
							<table class="table table-bordered" id="datatablesSimple">
								<thead style="border-top: 3px solid #336699;">
									<tr align="center">
										<td colspan="5" style="border: 3px solid #336699;">
											<img src="./resources/img/${dto.news_oimg}">
										</td>
									</tr>
									<tr>
										<th style="border-right: 3px solid #336699; border-bottom: 1px solid #336699; border-left: 3px solid #336699;">작성자</th>
										<th style="border-right: 3px solid #336699; border-bottom: 1px solid #336699">작성일</th>
										<th style="border-right: 3px solid #336699; border-bottom: 1px solid #336699">조회수</th>
										<th style="border-right: 3px solid #336699; border-bottom: 1px solid #336699">첨부 파일</th>
										<td style="border-right: 3px solid #336699; border-bottom: 1px solid #336699">
											<a href="./Anouncement_Download.do?ofile=${ dto.news_oimg }&sfile=${ dto.news_simg }&num=${ dto.news_num }">
												${ dto.news_oimg }
											</a>
										</td>
									</tr>
									<tr>
										<td style="border-right: 3px solid #336699; border-left: 3px solid #336699;">${ dto.news_writer }</td>
										<td style="border-right: 3px solid #336699;">${ dto.news_date }</td>
										<td style="border-right: 3px solid #336699;">${ dto.news_view }</td>
										<th style="border-right: 3px solid #336699;">다운로드 횟수</th>
										<td style="border-right: 3px solid #336699;">${ dto.news_down }</td>
									</tr>
								</thead>
								<tbody style="border: 3px solid #336699;">
									<tr>
										<th style="border-right: 1px solid #336699;" rowspan="2">내용</th>
										<td colspan="5" rowspan="2" style="text-align: left;" width="*">${ dto.news_content }</td>
								</tbody>
							</table>
							<br>
							<div>
								<button type="button" class="btn btn-primary btn-lg" onclick="location.href='./news_List2.do';">목록</button>
								<c:choose>
									<c:when test="${admin_key == '0' }">
										<button type="button" class="btn btn-success btn-lg" onclick="location.href='./news_Update.do?num=${ dto.news_num }';">수정하기</button>
										<button type="button" class="btn btn-danger btn-lg" onclick="location.href='./news_Delete.do?num=${ dto.news_num }';">삭제하기</button>
									</c:when>
								</c:choose>
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
</html>
