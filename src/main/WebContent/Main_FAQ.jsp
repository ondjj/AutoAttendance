<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ad" value="${session.ad}" scope="session" />
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel='stylesheet' type='text/css'
	href='http://code.jquery.com/ui/1.9.1/themes/base/jquery-ui.css' />
<title>International College</title>
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
				<h1 class="text-white m-0">FAQ</h1>
			</div>
		</div>
		<div class="container-fluid px-4">
			<div class="card mb-4">
				<div class="card-header">
					<form>
						<select name="category">
							<option value="0">전체</option>
							<option value="1">출결</option>
							<option value="2">성적</option>
							<option value="3">등록금</option>
							<option value="4">정보변경</option>
						</select>
						<button class="btn btn-primary btn-sm" type="submit">검색</button>
					</form>
				</div>
				<div class="card-body">
					<c:choose>
						<c:when test="${ empty datalist }">
							<!-- 게시물이 없을 때 -->
							<tr>
								<td colspan="6" align="center">등록된 게시물이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<!-- 게시물이 있을 때 -->
							<!--  여기부터 수정함  -->


							<div id="menu">
								<c:forEach items="${datalist}" var="list" varStatus="loop">
									<h3>
										<div class="row">
											<div class="col-md-2">
												<span class="icon" style="color: #0000FF;">Q</span>&nbsp;&nbsp;&nbsp;&nbsp; <span
													class="cate"> <c:choose>
														<c:when test="${ list.faq_category == '1' }">
															출결
														</c:when>
														<c:when test="${ list.faq_category == '2' }">
															성적
														</c:when>
														<c:when test="${ list.faq_category == '3' }">
															등록금
														</c:when>
														<c:when test="${ list.faq_category == '4' }">
															정보변경
														</c:when>
														<c:otherwise>
															<jsp:forward page="/Main_FAQ.jsp" />
														</c:otherwise>
													</c:choose>
												</span>
											</div>
											<div class="col-md-9">
												<span class="sub"> ${ list.faq_subject } </span>
											</div>
											<div class="col-md-1">
												<c:if test="${admin_key == '0' }">
													<button type="button" class="btn btn-danger btn-sm"
														onclick="location.href='./faq_delete.do?num=${ list.faq_num }';">삭제</button>
												</c:if>
											</div>
										</div>
									</h3>
									<p>
										<strong>
												<span class="icon" style="color: #ED1C24">A</span>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<span class="sub">└─&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													${ list.faq_content }
												</span>
										</strong>
									</p>
								</c:forEach>
							</div>
						</c:otherwise>
					</c:choose>
				</div>

			</div>

			<!--  여기까지 -->
		</div>
	</div>

	<br>

	<div class="d-grid gap-2 col-1"></div>

	</div>
	</div>

	<jsp:include page="Main_footer.jsp"></jsp:include>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>

	<script src="http://code.jquery.com/jquery-latest.js"></script>

	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

	<script type='text/javascript'>
		$(document).ready(function() {
			$('#menu').accordion();
		});
	</script>
	<script
		src="//ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
</body>
</html>
