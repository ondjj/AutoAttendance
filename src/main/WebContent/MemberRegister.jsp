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
                        
                        
                        
                       
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                         <b>인적사항</b>
                                    </div>
                                    
								<form action="/Register.do" method="post"  name="member" onsubmit="return checkForm()">
                                    <div class="card-body">
                                    	<table class="table table-hover">
										  <tr>
										    <th class="table-active">학번</th>
										    	<td><input type="text" name="id" /></td>
										    <th class="table-active">한글 이름</th>
										    	<td><input type="text" name="kr_name" /></td>
										    <th class="table-active">영문 이름</th>
										    	<td><input type="text" name="en_name" /></td>
										    <th class="table-active">성별</th>
										    	<td><input type="text" name="gender" /></td>
										  </tr>
										  <tr>
										    <th class="table-active">주민번호</th>
										    	<td><input type="text" name="private_num" /></td>
										    <th class="table-active">나이</th>
										    	<td><input type="text" name="age" /></td>
										    <th class="table-active">주소</th>
										    	<td><input type="text" name="address" /></td>
										    <th class="table-active">핸드폰</th>
										    	<td><input type="text" name="phone_num" /></td>
										  </tr>
										  <tr>
										    <th class="table-active">학부</th>
										    	<td><input type="text" name="col_faculty" /></td>
										    <th class="table-active">전공</th>
										    	<td><input type="text" name="col_major" /></td>
										    <th class="table-active">이수학기</th>
										    	<td><input type="text" name="col_complete" /></td>
										    <th class="table-active">입학년도</th>
										    	<td><input type="text" name="college_year"/></td>	
										  </tr>
										 <tr>
										    <th class="table-active">입학구분</th>
										    	<td><input type="text" name="col_type" /></td>
										    <th class="table-active">학적상태</th>
										    	<td><input type="text" name="col_status"/></td>
										    <th class="table-active">복수전공</th>
										    	<td><input type="text" name="col_second_faculty"/></td>
										    <th class="table-active">이메일</th>
										    	<td><input type="text" name="email"/></td>
										  </tr>
										  <tr>
										  	<th class="table-active">사진</th>
										    	<td><input type="file" name="id_picture"/></td>
										    <th class="table-active">비밀번호</th>
										    	<td><input type="password" name="password"/></td>
										    <th class="table-active">비밀번호 확인</th>
										    	<td><input type="password" name="password_confirm"/></td>
										    <th class="table-active">관리자 여부 확인</th>
										    	<td><input type="text" name="admin_key"/></td>
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
<script type="text/javascript">
   function checkForm() {
      if (document.member.password.value != document.member.password_confirm.value) {
         alert("비밀번호를 확인하세요.");
         return false;
      }
   }
</script>
    
    
</html>
