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
                        <h1 class="mt-4">인적사항 등록</h1>
                        
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="admin.jsp">마이페이지</a></li>
                        </ol>
                        
                        
                       
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                         <b>인적 사항</b>
                                    </div>
                                    
								<form action="/CollegeRegister.do" method="post">
                                    <div class="card-body">
                                    	<table class="table table-hover">
                                    	  <tr>
                                    	  	<td rowspan="5">
                                    	  	</td>
                                    	  </tr>
										  <tr>
										    <th class="table-active">학번</th>
										    	<td><input type="text" name="idMEMBER" /></td>
										    <th class="table-active">한글 이름</th>
										    	<td><input type="text" name="K_name" /></td>
										    <th class="table-active">영문 이름</th>
										    	<td><input type="text" name="E_name" /></td>
										    <th class="table-active">성별</th>
										    	<td><input type="text" name="sex" /></td>
										  </tr>
										  <tr>
										    <th class="table-active">주민번호</th>
										    	<td><input type="text" name="privateNumber" /></td>
										    <th class="table-active">나이</th>
										    	<td><input type="text" name="age" /></td>
										    <th class="table-active">학년</th>
										    	<td><input type="text" name="grade" /></td>
										    <th class="table-active">핸드폰</th>
										    	<td><input type="text" name="phoneNumber" /></td>
										  </tr>
										  <tr>
										    <th class="table-active">학부</th>
										    	<td><input type="text" name="college" /></td>
										    <th class="table-active">전공</th>
										    	<td><input type="text" name="major" /></td>
										    <th class="table-active">이수학기</th>
										    	<td><input type="text" name="semester" /></td>
										  </tr>
										 <tr>
										    <th class="table-active">입학구분</th>
										    	<td><input type="text" name="division" /></td>
										    <th class="table-active">학적상태</th>
										    	<td><input type="text" name="C_state"/></td>
										    <th class="table-active">복수전공</th>
										    	<td><input type="text" name="dual_major"/></td>
										  </tr>
										</table>
										<button type="submit" class="btn btn-success">등록</button>
										<button type="reset" class="btn btn-danger">초기화</button>
                                    </div>
                                </form> 
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
