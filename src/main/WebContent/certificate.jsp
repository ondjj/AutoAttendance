<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>국제대학교 학생 관리 페이지</title>
<link href="resources/css/admin.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
</head>
<body>
      <%@ include file="infoAdmin.jsp" %>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">학생 증명서 발급 신청</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="admin.jsp">마이페이지</a></li>
						<li class="breadcrumb-item active">학적 관련 신청</li>
						<li class="breadcrumb-item active">학생 증명서 발급 신청</li>
					</ol>


					<div class="card mb-4">
						<div class="card-body"></div>
					</div>

					<div class="row">
						<div class="col-xl-12">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-chart-area me-1"></i> <b>증명서 목록</b>
								</div>
								<div class="card-body">

									<table class="table table-hover"">
										<thead>
											<tr>
												<th scope="col">No.</th>
												<th scope="col">증명서명</th>
												<th scope="col">신청매수</th>
												<th scope="col">신청사유</th>
												<th scope="col">신청/발급</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">1</th>
												<td>교육비납입증명서</td>
												<td><input type="text" size="3"> 매</td>
												<td><input type="text" size="30"></td>
												<td><button>신청</button></td>
											</tr>
											<tr>
												<th scope="row">2</th>
												<td>성적증명서</td>
												<td><input type="text" size="3"> 매</td>
												<td><input type="text" size="30"></td>
												<td><button>신청</button></td>

											</tr>
											<tr>
												<th scope="row">3</th>
												<td>수강신청확인서</td>
												<td><input type="text" size="3"> 매</td>
												<td><input type="text" size="30"></td>
												<td><button>신청</button></td>
											</tr>
											<tr>
												<th scope="row">4</th>
												<td>수기증명서</td>
												<td><input type="text" size="3"> 매</td>
												<td><input type="text" size="30"></td>
												<td><button>신청</button></td>
											</tr>
											<tr>
												<th scope="row">5</th>
												<td>수료증명서</td>
												<td><input type="text" size="3"> 매</td>
												<td><input type="text" size="30"></td>
												<td><button>신청</button></td>
											</tr>
											<tr>
												<th scope="row">6</th>
												<td>장학금수혜확인서</td>
												<td><input type="text" size="3"> 매</td>
												<td><input type="text" size="30"></td>
												<td><button>신청</button></td>
											</tr>
											<tr>
												<th scope="row">7</th>
												<td>졸업예정증명서</td>
												<td><input type="text" size="3"> 매</td>
												<td><input type="text" size="30"></td>
												<td><button>신청</button></td>
											</tr>
											<tr>
												<th scope="row">8</th>
												<td>휴학증명서</td>
												<td><input type="text" size="3"> 매</td>
												<td><input type="text" size="30"></td>
												<td><button>신청</button></td>
											</tr>
											<tr>
												<th scope="row">9</th>
												<td>학력인정증명서</td>
												<td><input type="text" size="3"> 매</td>
												<td><input type="text" size="30"></td>
												<td><button>신청</button></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
       	<%@ include file="footerAdmin.jsp" %>
		</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
</body>
</html>
