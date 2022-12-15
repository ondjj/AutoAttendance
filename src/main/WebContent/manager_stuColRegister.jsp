<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>햑생 등록</title>

<!-- <!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<style>
body {
	min-height: 100vh;
	background: -webkit-gradient(linear, left bottom, right top, from(#92b5db),
		to(#1d466c));
	background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
}

.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}
</style>
</head>

<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">학적사항 등록</h4>
				<div align="center">
					<form class="validation-form" action="ColJoinCon.do?id=${id}" method="post">
						<table>

							<tr class="row">
								<td class="col-md-6 mb-3"><label>학번(ID)</label> <input
									type="text" class="form-control" name="id"
									value="${id}" disabled>
							</tr>


							<tr class="mb-6">
								<td><label>학적상태</label> <input type="text"
									class="form-control" name="col_status" placeholder="재학"
									required>
									<div class="invalid-feedback">학적 상태를 입력하세요.</div></td>
							</tr>


							<tr class="row">
								<td class="col-md-6 mb-3"><label>학부</label> <input
									type="text" class="form-control" name="col_faculty" required>
									<div class="invalid-feedback">학부를 입력하세요.</div></td>

								<td class="col-md-6 mb-10"><label>전공</label> <input
									type="text" class="form-control" name="col_major" required>
									<div class="invalid-feedback">전공을 입력하세요.</div>
								</td>
								<td>
								</td>
							</tr>
							
							<tr class="mb-6">
								<td><label>복수전공</label> <input type="text"
									class="form-control" name="col_second_faculty"
									placeholder="컴퓨터공학" required>
									<div class="invalid-feedback">복수전공을 입력해주세요.</div></td>
							</tr>
							
							<tr class="row">
								<td class="col-md-3 mb-3"><label>입학구분</label> <select
									class="custom-select d-block w-100" name="col_type">
										<option>구분</option>
										<option value="편입">편입</option>
										<option value="정시">정시</option>
										<option value="수시">수시</option>
								</select></td>
							</tr>

							<tr class="mb-3">
								<td><label>이수학기</label> <input type="text"
									class="form-control" name="col_complete"
									placeholder="2022-0213" required>
									<div class="invalid-feedback">이수학기를 입력하세요.</div></td>
							</tr>

							<tr class="mb-4">
							
								<td>
								<br>
									<input class="btn btn-primary btn-lg btn-block"	type="submit" value="등록 완료">
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<footer class="my-3 text-center text-small">
			<p class="mb-1">&copy; 2022 KR-</p>
		</footer>
	</div>
</body>
</html>