<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>출결정정신청내역</title>
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
                        <h1 class="mt-4">출결정정 신청내역</h1>
                        <hr>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="manager_page.jsp">관리자 페이지</a></li>
                            <li class="breadcrumb-item active">출결</li>
                            <li class="breadcrumb-item active">출결정정신청</li>
                        </ol>
                        <br>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                               출결정정신청내역 목록<br><br>
                                <span>
	                            	<select>
										<option value="title">제목</option>
										<option value="content">내용</option>
									</select>
									<input type="text">
									<button class="btn btn-primary btn-sm" type="button" onclick="">검색하기</button>
								</span>
                            </div>
                            <div class="card-body">
                                    	<table class="table table-sm" id="datatablesSimple">
											<thead>
												<tr>
													<th>번호</th>
													<th>이름</th>
													<th>학번</th>
													<th>전공</th>
													<th>과목</th>
													<th>내용</th>
												</tr>
											</thead>
												<c:choose>
													<c:when test="${ empty objList }"> <%--  아직 성적이 입력되지 않음 --%>
														<tbody>
															<tr>
																<td colspan="6" align="center">
																	출결 정정 신청 내역이 존재하지 않습니다.
																</td>
															</tr>
														</tbody>
													</c:when>
													<c:otherwise> <%-- 입력된 성적이 존재할 시 --%>
														<tbody>
															<c:forEach items="${ objList }" var="row" varStatus="loop">
																	<tr align="center">
																		<td>${row.obj_num}</td>
																		<td>${row.obj_name}</td>
																		<td>${row.obj_memberid}</td>
																		<td>${row.obj_faculty }</td>
																		<td>${row.obj_subject }</td>
																		<td><a href="ObjectionListCon.do?obj_num=${row.obj_num }&&obj_type=${row.obj_type}">출결 정정 신청</a></td>
																	</tr>
															</c:forEach>
														</tbody>	
													</c:otherwise>
												</c:choose>
											</tbody>
											
										</table>
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
