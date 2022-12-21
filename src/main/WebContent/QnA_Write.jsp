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
				<h1 class="text-white m-0">Q&A 질문하기</h1>
			</div>
		</div>
		<div class="container-fluid px-4">
			<div class="card mb-4">
				<div class="card-header">
					<h4>
						<span class="icon">Q</span> <span style="color: #22B14C">&</span>
						<span class="icon" style="color: #ED1C24">A</span> 질문하기
					</h4>
				</div>
				<div class="card-body">
					<form name="WriteFrm" action="./qna_write.do" method="post"
						onsubmit="return check(this)">
						<div class="row">
							<table class="cont">
								<tr class="cont">
									<th>작성자(학번)</th>
									<th>내용</th>
								</tr>
								<tr>
									<td><input type="text" name="writer" size="12" value="${ id }" readonly></td>
									<td><textarea name="question" rows="10" cols="120" style="resize: none;"></textarea></td>
								</tr>
								<tr>
									<td colspan="2" align="center">
										<button class="btn btn-primary" type="submit">작성 완료</button>
										<button class="btn btn-warning" type="reset">초기화</button>
										<button class="btn btn-success" type="button"
											onclick="location.href='./qna_list.do';">목록</button>
									</td>
								</tr>
							</table>
						</div>
					</form>
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


	<script
		src="//ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
</body>
<script type="text/javascript">
	function check(form) {
		if (!form.writer.value.trim()) {
			alert("이름을 입력해 주세요.");
			form.writer.focus();
			return false;
		}
		if (!form.question.value.trim()) {
			alert("질문 내용을 입력하세요.");
			form.question.focus();
			return false;
		}
	}
</script>
<style>
.icon {
	font-size: 1.3em;
	font-weight: bold;
	margin: 2px 0;
	padding: 1px 3px;
	color: #0000FF;
}

.cate {
	font-size: 1.2em;
	color: #6BC273;
}

.sub {
	font-size: 1.1em;
}

.cont {
	text-align: center;
}
</style>
</html>
