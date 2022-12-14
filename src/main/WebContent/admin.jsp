<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="./resources/css/admin.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body class="sb-nav-fixed">
	<%@ include file="infoAdmin.jsp"%>
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">학생 관리 페이지</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item active">마이페이지</li>
				</ol>
				<div class="row">
					<div class="col-xl-12">
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-table me-2"></i> 인적 사항
							</div>
							<div class="card-body">
								<table id="datatablesSimple" style="text-align: center; margin: auto;">
									
									<tr>
										
										<c:choose>
											<c:when test="${face == null}">
												<th rowspan="4" width="17%" style="border: 2px solid black;">
													<img alt="pepe" src="./uploads/pepe.jpg" width="300" height="200">
												</th>
												
												<th rowspan="4" width="17%" style="border: 2px solid black;">
												<input type="text" value="${face}" disabled> <br><br>
													<button type="button" class="btn btn-outline-dark" onclick="javascript:btn();">얼굴인증</button>
												</th>
											</c:when>
											
											<c:when test="${face eq mdto.getEn_name()}">
												<th rowspan="5" width="17%" style="border: 2px solid green;">
													<img alt="pepe" src="./uploads/${img}" width="300" height="200">
												<tr>
												<th rowspan="4" width="17%" style="border: 2px solid green;">
												<input type="text" value="${face}" disabled> <br><br>
													<button type="button" class="btn btn-outline-dark" onclick="javascript:btn();">인증완료</button>
												</th>
												
											</c:when>

											<c:when test="${face ne mdto.getEn_name()}">
												<th rowspan="4" width="17%" style="border: 2px solid red;">
													<img alt="pepe" src="./uploads/sadpepe.jpg" width="300" height="200">
												</th>
												<th rowspan="4" width="17%" style="border: 2px solid red;">
												<input type="text" value="${face}" disabled> <br><br>
													<button type="button" class="btn btn-outline-dark" onclick="javascript:btn();">재시도</button>
												</th>
											</c:when>
											
										</c:choose>
							
										<th>학번(ID)</th>
										<th><input type="text" value="${mdto.getId()}" disabled></th>
										<th>이름(kr)</th>
										<th><input type="text" value="${mdto.getKr_name()}" disabled></th>
										<th>이름(en)</th>
										<th><input type="text" value="${mdto.getEn_name()}" disabled></th>
									</tr>
									<tr>
										<th>이메일</th>
										<th><input type="text" value="${mdto.getEmail()}"  readonly disabled></th>
										<th>나이</th>
										<th><input type="text" value="${mdto.getAge()}" disabled></th>
										<th>이수학기</th>
										<th><input type="text" value="${cdto.getCol_complete()}" disabled></th>
									</tr>
									<tr>
										<th>전화번호</th>
										<th><input type="text" value="${mdto.getPhone_num()}" disabled></th>
										<th>성별</th>
										<th><input type="text" value="${mdto.getGender()}" disabled></th>
										<th>전공</th>
										<th><input type="text" value="${cdto.getCol_major()}" disabled></th>
									</tr>
									<tr>
										<th>주소</th>
										<th colspan="5"><input type="text" value="${mdto.getAddress()}" size="90" disabled></th>
									</tr>
									
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xl-3 col-md-6">
						<div class="card bg-primary text-white mb-4">
							<div class="card-body">총 출석 일수</div>
							<div class="card-footer d-flex align-items-center justify-content-between">
								<a class="small text-white stretched-link" href="#">더보기</a>
								<div class="small text-white">
									<i class="fas fa-angle-right"></i>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-md-6">
						<div class="card bg-warning text-white mb-4">
							<div class="card-body">지각 및 조퇴 일수</div>
							<div
								class="card-footer d-flex align-items-center justify-content-between">
								<a class="small text-white stretched-link" href="#">더보기</a>
								<div class="small text-white">
									<i class="fas fa-angle-right"></i>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-md-6">
						<div class="card bg-success text-white mb-4">
							<div class="card-body">출석률</div>
							<div
								class="card-footer d-flex align-items-center justify-content-between">
								<a class="small text-white stretched-link" href="#">더보기</a>
								<div class="small text-white">
									<i class="fas fa-angle-right"></i>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-md-6">
						<div class="card bg-danger text-white mb-4">
							<div class="card-body">결석 일수</div>
							<div
								class="card-footer d-flex align-items-center justify-content-between">
								<a class="small text-white stretched-link" href="#">더보기</a>
								<div class="small text-white">
									<i class="fas fa-angle-right"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xl-6">
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-chart-area me-1"></i> 지난 학기 성적
							</div>
							<!--  성적 테이블  -->
                                    <div class="card-body">
                                    	<table class="table table-sm" id="datatablesSimple">
											<thead>
												<tr>
													<th>년도-학기</th>
													<th>수강 과목 수</th>
													<th>학기 평균 점수</th>
													<th>학기 평균 등급</th>
												</tr>
											</thead>
												<c:choose>
													<c:when test="${ empty dashList }"> <%--  아직 성적이 입력되지 않음 --%>
														<tbody>
															<tr>
																<td colspan="6" align="center">
																	등록된 성적이 존재하지 않습니다.
																</td>
															</tr>
														</tbody>
													</c:when>
													<c:otherwise> <%-- 입력된 성적이 존재할 시 --%>
														<tbody>
															<c:forEach items="${ dashList }" var="row" varStatus="loop">
																	<tr align="center">
																		<td>${row.target_term}</td>
																		<td>${row.total_lecture}</td>
																		<td>${row.score_avg}</td>
																		<td>${row.result_grade}</td>
																	</tr>
															</c:forEach>
														</tbody>	
														<tfoot>
															<tr align="center">
																<td>총 이수 과목 수</td>
																<td><%=request.getAttribute("total_lecture") %></td>
																<td>전체 평균 등급</td>
																<td><%=request.getAttribute("total_grade") %><td>
															</tr>
														</tfoot>
													</c:otherwise>
												</c:choose>
											</tbody>
											
										</table>
                                    </div>
						</div>
					</div>
					<div class="col-xl-6">
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-chart-bar me-1"></i> 출석 기록
							</div>
							<div class="card-body">
								<c:choose>
									<c:when test="${face eq mdto.getEn_name()}">
										<label>[출석] ${rd}</label>
									</c:when>									
									<c:when test="${face ne mdto.getEn_name()}">
										<label>[인증 실패] ${rd}</label>
									</c:when>
								</c:choose>
								
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
		<%@ include file="footerAdmin.jsp"%>
	</div>
	
	<script>
		function btn(){
		    alert('얼굴 인식을 시작합니다. ');
		    $.ajax({
		    	type : 'POST',
		    	async : true,
		    	url : 'http://127.0.0.1:5000',
		    	data : "",
		    	dataType : "text",
		    	success : function(data){
					alert("얼굴 인식을 완료했습니다. ");
					location.href=data;
									
				},
				error  : function() {
					alert("전송오류!!");
				}
		    })
		}
	</script>
	
	<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"	crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
</body>
</html>
