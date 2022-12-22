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
				<h1 class="text-white m-0">Q&A</h1>
			</div>
		</div>
		<div class="container-fluid px-4">
			<div class="card mb-4">
				<div class="card-header">
					<div class="row">
						<div class="col-md-10">
							<form>
								<select name="searchField" disabled>
									<option value="qna_writer">작성자(학번)</option>
								</select> <input type="text" name="searchWord" value="${ searchWord }"
									size="10">
								<button class="btn btn-primary btn-sm" type="submit">검색</button>
							</form>
						</div>
						<div class="col-md-2" style="text-align: right;">
							<c:if test="${ admin_key == '1' }">
								<!-- 학생만 질문 등록 가능 -->
								<button type="button" class="btn btn-success btn-sm"
									onclick="location.href='/QnA_Write.jsp';">질문하기</button>
							</c:if>
						</div>
					</div>
				</div>
				<div class="card-body">
					<c:if test="${ empty datalist }">
						<label class="answait">&nbsp;검색한 학번으로 등록된 글이 없습니다.&nbsp;</label>
					</c:if>

					<!--  여기부터 수정함  -->
					<div id="menu">
						<c:forEach items="${datalist}" var="list" varStatus="loop">
							<h3>
								<div class="row">
									<div class="col-md-1">
										<span class="icon" style="color: #0000FF;">Q</span><br> <label
											class="wri">${ list.qna_date }</label>
									</div>
									<div class="col-md-1">
										<span class="wri">작성자(학번)<br>${ list.qna_writer }</span>
									</div>
									<div class="col-md-1">
										<c:choose>
											<c:when test="${ list.qna_answer == null }">
												<!-- 답변이 등록되지 않았을때 -->
												<div class="ansdiv">
													<span class="ans">&nbsp;답변 대기&nbsp;</span>
												</div>
											</c:when>
											<c:otherwise>
												<!-- 답변이 등록되면 -->
												<div class="ansdiv">
													<span class="ans" style="background-color: #B5E61D">&nbsp;답변
														완료&nbsp;</span>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
									<div class="col-md-8">
										<span class="sub">${ list.qna_question }</span>
									</div>
									<div class="col-md-1">
										<c:choose>
											<c:when test="${ list.qna_answer == null }">
												<!-- 답변이 등록되지 않았을 때 -->
												<!-- 작성자이거나 관리자만 삭제 가능 -->
												<c:if test="${ id == list.qna_writer || admin_key == '0' }">
													<button type="submit" class="btn btn-danger btn-sm"
														onclick="location.href='./qna_delete.do?num=${ list.qna_num }';">삭제</button>
												</c:if>
											</c:when>
											<c:otherwise>
												<!-- 답변이 등록되었을 때 -->
												<c:if test="${ list.qna_answer != null }">
													<!-- 관리자만 삭제 가능 -->
													<c:if test="${ admin_key == '0' }">
														<button type="submit" class="btn btn-danger btn-sm"
															onclick="location.href='./qna_delete.do?num=${ list.qna_num }';">삭제</button>
													</c:if>
												</c:if>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</h3>
							<c:choose>
								<c:when test="${ list.qna_answer != null }">
									<!-- 답변이 등록되었을 때 -->
									<div>
										<p>
											<c:if test="${ admin_key == '0' }">
												<!-- 관리자는 답변 수정 가능 -->
												<form name="answerUpdate" action="./qna_update.do"
													method="post">
													<strong> <input type="hidden" name="num"
														value="${ list.qna_num }"> <span class="cont">
															<span class="icon" style="color: #ED1C24">A</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<span class="sub">└─&gt; <input type="text"
																name="answer" size="74" value="${ list.qna_answer }"
																placeholder="답변 수정"></span>
															<button type="submit" class="btn btn-warning btn-sm"
																onclick="location.href='./qna_update.do?num=${ list.qna_num }';">수정</button>
													</span>
													</strong>
												</form>
											</c:if>
											<!-- 관리자가 아니면 답변 내용만 표시 -->
											<c:if test="${ admin_key != '0' }">
												<strong> <span class="cont"> <span
														class="icon" style="color: #ED1C24">A</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<span class="sub">└─&gt; ${ list.qna_answer }</span>
												</span>
												</strong>
											</c:if>
										</p>
									</div>
								</c:when>
								<c:otherwise>
									<div>
										<p>
											<!-- 답변이 아직 등록되지 않았을 때 -->
											<c:if test="${ list.qna_answer == null && admin_key != '0' }">
												<span class="cont"> <span class="icon"
													style="color: #ED1C24">A</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<span class="sub cont">└─&gt;</span> <label class="answait">&nbsp;답변
														준비중입니다.&nbsp;</label>
												</span>
											</c:if>
											<c:if test="${ admin_key == '0' }">
												<!-- 관리자만 답변 가능 -->
												<form name="answerWrite" action="./qna_update.do"
													method="post">
													<input type="hidden" name="num" value="${ list.qna_num }">
													<span class="cont"> <span class="icon"
														style="color: #ED1C24">A</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<span class="sub cont">└─&gt; <input type="text"
															name="answer" size="74" placeholder="답변 입력"></span>
														<button type="submit" class="btn btn-warning btn-sm"
															onclick="location.href='./qna_update.do?num=${ list.qna_num }';">완료</button>
													</span>
												</form>
											</c:if>
											<c:if test="${ id == list.qna_writer }">
												<!-- 작성자만 수정이 가능 -->
												<form name="questionUpdate" action="./qna_update.do"
													method="post">
													<input type="hidden" name="num" value="${ list.qna_num }">
													<span class="sub"> <label>작성한 질문 내용 수정하기 ─┐</label>
														<input type="text" name="question" size="81"
														value="${ list.qna_question }" placeholder="질문 수정">
													</span>
													<button type="submit" class="btn btn-warning btn-sm"
														onclick="location.href='./qna_update.do?num=${ list.qna_num }';">수정완료</button>
												</form>
											</c:if>
										</p>
									</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
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
