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
        <title>증명서신청내역</title>
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
                        <h1 class="mt-4">증명서 신청내역</h1>
                        <hr>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="manager_page.jsp">관리자 페이지</a></li>
                            <li class="breadcrumb-item active">학적</li>
                            <li class="breadcrumb-item active">증명서 신청</li>
                        </ol>
                        <br>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                               증명서 신청내역 목록<br><br>
                               <form method="get" action="ObjectionListCon.do?type=4">
								<span>
									<select name="searchField">
										<option value="obj_memberid">학번</option>
									</select>
									<input type="text" id="searchWord" name="searchWord" value="${ searchWord }">
									<input type="hidden" id="type" name="type" value="4"/>
									<button class="btn btn-primary btn-sm" onclick="return filter()" type="submit">검색하기</button>
								</span>
							</form>
                            </div>
                            <div class="card-body">
                                    	<table class="table table-sm" id="datatablesSimple">
											<thead>
												<tr>
													<th>번호</th>
													<th>이름</th>
													<th>학번</th>
													<th>증명서 종류</th>
													<th>매수</th>
													<th>내용</th>
												</tr>
											</thead>
												<c:choose>
													<c:when test="${ empty objList }"> <%--  아직 성적이 입력되지 않음 --%>
														<tbody>
															<tr>
																<td colspan="6" align="center">
																	증명서 신청 내역이 존재하지 않습니다.
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
																		<td>${row.obj_certifi_type }</td>
																		<td>${row.obj_certifi_count }</td>
																		<td><a href="ObjectionListCon.do?obj_num=${row.obj_num }&&obj_type=${row.obj_type}&&type_name=${row.obj_col_type}">${row.obj_col_type } 신청</a></td>
																	</tr>
															</c:forEach>
														</tbody>	
													</c:otherwise>
												</c:choose>
											</tbody>
										</table>
										<br>
										<c:if test="${ empty searchWord }">
											<table style="width: 100%;">
												<tr align="center">
													<td> ${ map.pagingImg } </td>
												</tr>
											</table>
										</c:if>
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
    <script>
	function filter() {
		var content = document.getElementById("searchWord").value;
		if (content.trim() === "") {
			alert("내용을 입력해 주세요.");
			return false;
		}
	}
</script>
</html>
