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
        <title>국제대학교 학생 관리 페이지</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="./resources/css/admin.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
      <%@ include file="infoAdmin.jsp" %>
            
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">성적 열람</h1>
                        <hr>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active"><a href="admin.jsp">마이페이지</a></li>
                            <li class="breadcrumb-item active">성적 관리</li>
                            <li class="breadcrumb-item active">성적 열람</li>
                        </ol>
                        <br>
                        
                        <div class="row">
                            <div class="col-xl-7">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-table"></i>
                                        이번 학기 성적
                                    </div>
                                    
                                    <!--  성적 테이블  -->
                                    <div class="card-body">
                                    	<table class="table table-sm" id="datatablesSimple">
											<thead>
												<tr>
													<th>년도-학기</th>
													<th>과목명</th>
													<th>중간평가점수</th>
													<th>기말평가점수</th>
													<th>과제평가점수</th>
													<th>성적</th>
												</tr>
											</thead>
												<c:choose>
													<c:when test="${ empty gradeList }"> <%--  아직 성적이 입력되지 않음 --%>
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
															<c:forEach items="${ gradeList }" var="row" varStatus="loop">
																	<tr align="center">
																		<td>${row.year_term}</td>
																		<td>${row.subject}</td>
																		<td>${row.score1}</td>
																		<td>${row.score2 }</td>
																		<td>${row.score3 }</td>
																		<td>${row.grade }</td>
																	</tr>
															</c:forEach>
														</tbody>	
														<tfoot>
															<tr align="center">
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td>전체 등수</td>
																<td>33/48<td>
															</tr>
														</tfoot>
													</c:otherwise>
												</c:choose>
											</tbody>
											
										</table>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                        
                        <!-- 이전 성적 데이터 존재 시 추가 출력을 위함 -->
                        <div class="row">
                        	<div class="col-xl-7">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-table"></i>
                                        직전 학기 성적
                                    </div>
									
									<!--  성적 테이블  -->
                                    <div class="card-body">
                                    	<table class="table table-sm" id="datatablesSimple">
											<thead>
												<tr>
													<th>년도-학기</th>
													<th>과목명</th>
													<th>중간평가점수</th>
													<th>기말평가점수</th>
													<th>과제평가점수</th>
													<th>성적</th>
												</tr>
											</thead>
											<c:choose>
												<c:when test="${ empty past_gradeList }"> <%--  아직 성적이 입력되지 않음 --%>
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
															<c:forEach items="${ past_gradeList }" var="row" varStatus="loop">
															
																<tr align="center">
																	<td>${row.year_term}</td>
																	<td>${row.subject}</td>
																	<td>${row.score1}</td>
																	<td>${row.score2 }</td>
																	<td>${row.score3 }</td>
																	<td>${row.grade }</td>
																</tr>
															
															</c:forEach>
															</tbody>
														<tfoot>
															<tr align="center">
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td>전체 등수</td>
																<td>42/48<td>
															</tr>
														</tfoot>
													</c:otherwise>
												</c:choose>
										</table>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>