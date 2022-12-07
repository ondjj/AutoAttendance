<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>국제대학교 학생 관리 페이지</title>
        <link href="resources/css/admin.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
      <%@ include file="infoAdmin.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">학적 변경</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="admin.jsp">마이페이지</a></li>
                            <li class="breadcrumb-item active">학적 관련 신청</li>
                            <li class="breadcrumb-item active">학적 변경 신청</li>
                        </ol>
                        
                        
                        <div class="card mb-4">
                            <div class="card-body"></div>
                        </div>
                       
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                         <b>인적 사항</b>
                                    </div>
                                    <div class="card-body">
                                    	<table class="table table-hover">
                                    	  <tr>
                                    	  	<td rowspan="5">
                                    	  	</td>
                                    	  </tr>
										  <tr>
										    <th class="table-active">학번</th>
										    	<td><input type="text" name="idMEMBER" disabled/></td>
										    <th class="table-active">성명</th>
										    	<td><input type="text" name="name" disabled/></td>
										    <th class="table-active">성별</th>
										    	<td><input type="text" name="sex" disabled/></td>
										  </tr>
										  <tr>
										    <th class="table-active">주민번호</th>
										    	<td><input type="text" name="privateNumber" disabled/></td>
										    <th class="table-active">학년</th>
										    	<td><input type="text" name="grade" disabled/></td>
										    <th class="table-active">핸드폰</th>
										    	<td><input type="text" name="phoneNumber" disabled/></td>
										  </tr>
										  <tr>
										    <th class="table-active">학부</th>
										    	<td><input type="text" name="*" disabled/></td>
										    <th class="table-active">전공</th>
										    	<td><input type="text" name="*" disabled/></td>
										    <th class="table-active">이수학기</th>
										    	<td><input type="text" name="*" disabled/></td>
										  </tr>
										 <tr>
										    <th class="table-active">입학구분</th>
										    	<td><input type="text" name="*" disabled/></td>
										    <th class="table-active">학적상태</th>
										    	<td><input type="text" name="*" disabled/></td>
										    <th class="table-active">복수전공</th>
										    	<td><input type="text" name="*" disabled/></td>
										  </tr>
										</table>
										<b><p>변경 정보</p></b>
										<table class="table table-hover">
                                    	  <tr>
                                    	  	<td rowspan="6">
                                    	  	</td>
                                    	  </tr>
										  <tr>
										    <th class="table-active">신청학기</th>
										    	<td><input type="text" name="*"/></td>
										    <th class="table-active">성명</th>
										    	<td><input type="text" name="*" disabled/></td>
										    <th></th>
										    	<td></td>
										  </tr>
										  <tr>
										    <th class="table-active">학적변동</th>
										    	<td>
													<select name="pets" id="pet-select">
    													<option value="/">선택</option>
    													<option value="/">병역휴학</option>
    													<option value="/">해외연수휴학</option>
    													<option value="/">해외근무</option>
    													<option value="/">임신출산</option>
    													<option value="/">육아휴학</option>
    													<option value="/">장기요양</option>
    													<option value="/">가족간호</option>
    													<option value="/">총장인정사유</option>
													</select>
                                    	  		</td>
										    <th class="table-active">등록금</th>
										    	<td>
										    		<input type="radio" id="1" name="" value="환불" checked>
                                    	  				<label for="1">환불</label>
                                    	  			<input type="radio" id="2" name="" value="유보">
                                    	  			    <label for="2">유보</label>
										    	</td>
										    <th></th>
										    	<td></td>
										  </tr>
										  <tr>
										    <th class="table-active">복학예정년도</th>
										    	<td><input type="text" name="*"/></td>
										    <th class="table-active">복학예정학기</th>
										    	<td><input type="text" name="*"/></td>
										    <th></th>
										    	<td></td>
										  </tr>
										 <tr>
										    <th class="table-active">환불예금주</th>
										    	<td><input type="text" name="*"/></td>
										    <th class="table-active">환불은행</th>
										    	<td><input type="text" name="*"/></td>
										    <th class="table-active">환불계좌번호</th>
										    	<td><input type="text" name="*"/></td>
										  </tr>
										</table>
										<button type="button" class="btn btn-success">제출</button>
										<button type="button" class="btn btn-danger">취소</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                      </div>
                </main>
            <%@ include file="footerAdmin.jsp" %>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
