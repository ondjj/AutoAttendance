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
                            <li class="breadcrumb-item"><a href="AdminDashBoard.do">마이페이지</a></li>
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
                                    <form name="updateCol" action="objection.do?obj_type=2" class="form-horizontal" method="post">
                                    	<table class="table table-hover">
                                    	  <tr>
                                    	  	<td rowspan="5">
                                    	  	</td>
                                    	  </tr>
										  <tr>
										    <th class="table-active">학번</th>
										    	<td><input type="text" name="idMEMBER" value="${member_dto.id }" readonly/></td>
										    <th class="table-active">한글 이름</th>
										    	<td><input type="text" name="kr_name" value="${member_dto.kr_name }" readonly/></td>
										    <th class="table-active">영문 이름</th>
										    	<td><input type="text" name="en_name" value="${member_dto.en_name }" readonly/></td>
										  </tr>
										  <tr>
										    <th class="table-active">주민번호</th>
										    	<td><input type="text" name="private_num" value="${member_dto.private_num }"  readonly/></td>
										    <th class="table-active">성별</th>
										    	<td><input type="text" name="gender" value="${member_dto.gender }" readonly/></td>
										    <th class="table-active">핸드폰</th>
										    	<td><input type="text" name="phone_num" value="${member_dto.phone_num }" readonly/></td>
										  </tr>
										  <tr>
										  <%-- 학적 관련 DTO다시 확인 후 입력할 것 --%>
										    <th class="table-active">학부</th>
										    	<td><input type="text" name="col_faculty" value="${col_dto.col_faculty }" readonly/></td>
										    <th class="table-active">전공</th>
										    	<td><input type="text" name="col_manager" value="${col_dto.col_major }" readonly/></td>
										    <th class="table-active">이수학기</th>
										    	<td><input type="text" name="col_complete" value="${col_dto.col_complete }" readonly/></td>
										  </tr>
										 <tr>
										    <th class="table-active">입학구분</th>
										    	<td><input type="text" name="col_type" value="${col_dto.col_type }" readonly/></td>
										    <th class="table-active">학적상태</th>
										    	<td><input type="text" name="col_status" value="${col_dto.col_status }" readonly/></td>
										    <th class="table-active">복수전공</th>
										    	<td><input type="text" name="col_second_faculty" value="${col_dto.col_second_faculty }" readonly/></td>
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
										    	<td><input type="text" name="obj_start_term"/></td>
										    <th class="table-active">성명</th>
										    	<td><input type="text" name="obj_name" value="${member_dto.kr_name }" disabled/></td>
										    <th></th>
										    	<td></td>
										  </tr>
										  <tr>
										    <th class="table-active">학적변동</th>
										    	<td>
													<select name="obj_col_type" id="pet-select">
    													<option value="/">선택</option>
    													<option value="1">병역휴학</option>
    													<option value="2">해외연수휴학</option>
    													<option value="3">해외근무</option>
    													<option value="4">임신출산</option>
    													<option value="5">육아휴학</option>
    													<option value="6">장기요양</option>
    													<option value="7">가족간호</option>
    													<option value="8">기타총장인정사유</option>
													</select>
                                    	  		</td>
										    <th class="table-active">등록금</th>
										    	<td>
										    		<input type="radio" id="1" name="obj_tuition" value="환불" checked>
                                    	  				<label for="1">환불</label>
                                    	  			<input type="radio" id="2" name="obj_tuition" value="유보">
                                    	  			    <label for="2">유보</label>
										    	</td>
										    <th></th>
										    	<td></td>
										  </tr>
										  <tr>
										    <th class="table-active">복학예정년도</th>
										    	<td><input type="text" name="obj_back_year"/></td>
										    <th class="table-active">복학예정학기</th>
										    	<td><input type="text" name="obj_back_term"/></td>
										    <th></th>
										    	<td></td>
										  </tr>
										 <tr>
										    <th class="table-active">환불예금주</th>
										    	<td><input type="text" name="obj_refund_name"/></td>
										    <th class="table-active">환불은행</th>
										    	<td><input type="text" name="obj_refund_bank"/></td>
										    <th class="table-active">환불계좌번호</th>
										    	<td><input type="text" name="obj_refund_num"/></td>
										  </tr>
										<!-- <tr>
											<td><input type="submit" class="btn btn-success" value="제출" /> <input
											type="reset" class="btn btn-danger" value="취소" />
											</td>
										</tr> -->
										</table>
										<div class="col-sm-offset-2 col-sm-10">
									<input type="submit" class="btn btn-success" value="제출" /> <input
										type="reset" class="btn btn-danger" value="취소" />
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
