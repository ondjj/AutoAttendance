<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>학생 목록</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="./resources/css/admin.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
    <div>
         <%@ include file="info_manager.jsp" %>

            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">학생 목록</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="manager_page.jsp">관리자 페이지</a></li>
                            <li class="breadcrumb-item active">학적</li>
                            <li class="breadcrumb-item active">학생</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                학생 목록<br><br>
                                <span>
	                            	<select>
										<option value="title">id</option>
										<option value="content">kr_name</option>
									</select>
									<input type="text">
									<button class="btn btn-primary btn-sm" type="button" onclick="">검색하기</button>
								</span>
                            </div>
                         <div class="container px-12 col-xs-3">
                            <div class="card-body">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>PW</th>
                                            <th>PRIVATE_NUM</th>
                                            <th>KR_NAME</th>
                                            <th>EN_NAME</th>
                                            <!-- <th>증명사진</th> -->
                                            <th>PHONE_NUM</th>
                                            <th>EMAIL</th>
                                            <th>ADDRESS</th>
                                            <th>AGE</th>
                                            <th>REGISTER DATE</th>
                                            <th>GENDER</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                    <c:forEach var="arr" items="${arr}">
                                        <tr>
                                        	<td onClick="location.href='MemberInfoCon.do?id=${arr.id}'">${arr.id}</td>
                                        	<td>${arr.password}</td>
                                        	<td>${arr.private_num}</td>
                                        	<td>${arr.kr_name}</td>
                                        	<td>${arr.en_name}</td>
                                        	<%-- <td>${dto.id_picture}</td> --%>
                                        	<td>${arr.phone_num}</td>
                                        	<td>${arr.email}</td>
                                        	<td>${arr.address}</td>
                                        	<td>${arr.age}</td>
                                        	<td>${arr.college_year}</td>
                                        	<td>${arr.gender}</td>
                           				</tr>
                           			</c:forEach>
                                    </tbody>
                                </table>
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
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
