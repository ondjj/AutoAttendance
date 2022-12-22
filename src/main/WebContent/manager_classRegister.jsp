<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>강의 등록</title>

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
				<h4 class="mb-3">강의 등록</h4>
				<div align="center">
					<form class="validation-form" action="ClassJoinCon.do" enctype="multipart/form-data" method="post">
						<table>

							<tr class="mb-3">
								<td><label>강의명</label> <input type="text"
									class="form-control" name="subject" placeholder="자료구조 / 알고리즘"
									required>
									<div class="invalid-feedback">강의 제목을 입력해주세요.</div>
									<br>	
								</td>
									
							</tr>
							
							<tr class="mb-3">
								<td><label>담당 교수</label> <input type="text"
									class="form-control" name="professor" value="${kr_name}" required>
									<div class="invalid-feedback">담당 교수를 입력해주세요.</div>
									<br>	
								</td>
									
							</tr>
							
							<tr class="row">
								<td class="col-md-4 mb-3"><label>신설 여부</label> <select
									class="custom-select d-block w-100" name="check">
										<option>--</option>
										<option value="1">신설</option>
										<option value="0">기존</option>
								</select>
								</td>
							</tr>

							<tr class="mb-3">
								<td><label>커리큘럼</label> <input type="text"
									class="form-control" name="lecture_name" placeholder="Stack overFlow"
									required>
									<div class="invalid-feedback">커리큘럼을 입력해주세요.</div>
									<br>
								</td>
							</tr>
							
							<tr class="mb-3">
								<td><label>개설 일자</label> <input type="date"
									class="form-control" name="class_date" value="2022-12-20" min="2022-12-21" max="2023-12-31" 
									required>
									<div class="invalid-feedback">개설 일을 입력하세요.</div>
									<br>
								</td>
							</tr>
							

							<tr class="mb-3">
								<td>
									<label>대표이미지</label>
									<br>
										<input type="file" name="subject_img">
										<br><br>
								</td>
							</tr>

							<tr class="mb-4">
								<td>
									<input class="btn btn-primary btn-lg btn-block"	type="submit" value="강의 등록 완료">
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

	<script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
  </script>
</body>

</html>