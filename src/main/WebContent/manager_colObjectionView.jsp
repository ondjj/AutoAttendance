<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>국제대학교 관리자 페이지</title>
        <link href="resources/css/admin.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
      <%@ include file="info_manager.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">학적 변경 신청</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="Manager_page.jsp">관리자 페이지</a></li>
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
                                    <form name="updateCol" action="ObjectionListCon.do?view_del=${dto.obj_num }&&view_type=${dto.obj_type}" class="form-horizontal" method="post">
                                    	<table class="table table-hover">
                                    	  <tr>
                                    	  	<td rowspan="5">
                                    	  	</td>
                                    	  </tr>
										  <tr>
										    <th class="table-active">학번</th>
										    	<td><input type="text" name="idMEMBER" value="${dto.obj_memberid }" readonly/></td>
										    <th class="table-active">이름</th>
										    	<td><input type="text" name="name" value="${dto.obj_name }" readonly/></td>
										  </tr>
										  <tr>
										  <%-- 학적 관련 DTO다시 확인 후 입력할 것 --%>
										    <th class="table-active">학부</th>
										    	<td><input type="text" name="*" readonly/></td>
										    <th class="table-active">전공</th>
										    	<td><input type="text" name="*" readonly/></td>
										    <th class="table-active">이수학기</th>
										    	<td><input type="text" name="*" readonly/></td>
										  </tr>
										 <tr>
										    <th class="table-active">입학구분</th>
										    	<td><input type="text" name="*" readonly/></td>
										    <th class="table-active">학적상태</th>
										    	<td><input type="text" name="*" readonly/></td>
										    <th class="table-active">복수전공</th>
										    	<td><input type="text" name="*" readonly/></td>
										  </tr>
										<!-- </table> -->
										<tr><td><b>변경 정보</b></td></tr>
										
										<!-- <table class="table table-hover"> -->
                                    	  <tr>
                                    	  	<td rowspan="6">
                                    	  	</td>
                                    	  </tr>
										  <tr>
										    <th class="table-active">신청학기</th>
										    	<td><input type="text" name="obj_start_term" value="${dto.obj_start_term }" readonly/></td>
										    <th class="table-active">성명</th>
										    	<td><input type="text" name="obj_name" value="${dto.obj_name }" readonly/></td>
										    <th></th>
										    	<td></td>
										  </tr>
										  <tr>
										    <th class="table-active">학적변동</th>
										    	<td><input type="text" name="obj_name" value="${dto.obj_col_type }" readonly/></td>
										    <th></th>
										   <th class="table-active">등록금</th>
										    	<td><input type="text" name="obj_name" value="${dto.obj_tuition }" readonly/></td>
										    <th></th>
										    <th></th>
										    	<td></td>
										  </tr>
										  <tr>
										    <th class="table-active">복학예정년도</th>
										    	<td><input type="text" name="obj_back_year" value="${dto.obj_back_year }" readonly/></td>
										    <th class="table-active">복학예정학기</th>
										    	<td><input type="text" name="obj_back_term" value="${dto.obj_back_term }" readonly/></td>
										    <th></th>
										    	<td></td>
										  </tr>
										 <tr>
										    <th class="table-active">환불예금주</th>
										    	<td><input type="text" name="obj_refund_name" value="${dto.obj_refund_name }" readonly/></td>
										    <th class="table-active">환불은행</th>
										    	<td><input type="text" name="obj_refund_bank" value="${dto.obj_refund_bank }" readonly/></td>
										    <th class="table-active">환불계좌번호</th>
										    	<td><input type="text" name="obj_refund_num" value="${dto.obj_refund_num }" readonly/></td>
										  </tr>
										<!-- <tr>
											<td><input type="submit" class="btn btn-success" value="제출" /> <input
											type="reset" class="btn btn-danger" value="취소" />
											</td>
										</tr> -->
										</table>
										<div class="col-sm-offset-2 col-sm-10">
									<input type="submit" class="btn btn-danger" value="삭제" />
								</div>
										</form>
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
