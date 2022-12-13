<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>국제대학교 관리자 페이지</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="./resources/css/admin.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <script>
			function checkForm(){
				if(!document.grade_insert.member_id.value){
					alert("해당 학생의 학번을 입력해주세요.");
					document.grade_insert.member_id.focus(); // 해당 부분 발생하였을 시 포커스를 줄 수 있도록 설정
					return false;
				}
				if(!document.grade_insert.year_term.value){
					alert("입력할 성적의 이수학기를 입력해주세요.");
					document.grade_insert.year_term.focus(); // 해당 부분 발생하였을 시 포커스를 줄 수 있도록 설정
					return false;
				}
				if(!document.grade_insert.name.value){
					alert("해당 학생의 성명을 입력해주세요.");
					document.grade_insert.name.focus(); // 해당 부분 발생하였을 시 포커스를 줄 수 있도록 설정
					return false;
				}
				if(!document.grade_insert.major.value){
					alert("해당 학생의 전공을 입력해주세요.");
					document.grade_insert.major.focus(); // 해당 부분 발생하였을 시 포커스를 줄 수 있도록 설정
					return false;
				}
				
			}
		</script>
    </head>
    <body class="sb-nav-fixed">
    	<div>
             <%@ include file="infoAdmin.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">성적 입력</h1>
                        <hr>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active"><a href="Manager_page.jsp">관리자 페이지</a></li>
                            <li class="breadcrumb-item active">성적 관리</li>
                            <li class="breadcrumb-item active">성적 입력</li>
                        </ol>
                        <br>
                        <div class="row">
                            <div class="col-xl-10">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-table"></i>
                                        학생 성적 입력
                                    </div>
                                    
                                    <form action="grade.do?id=1" method="post" name="grade_insert" onsubmit="return checkForm()">
	                                    <div class="card-body">
	                                    	<table class="table table-hover">
	                                    	  <tr>
	                                    	  	<td rowspan="5">
	                                    	  	</td>
	                                    	  </tr>
											  <tr>
											    <th class="table-active">학번</th>
											    	<td><input type="text" name="member_id" /></td>
											    <th class="table-active">이수 학기</th>
											    	<td><input type="text" name="year_term" /></td>
											    <th class="table-active">이름</th>
											    	<td><input type="text" name="name" /></td>
											    <th class="table-active">전공</th>
											    	<td><input type="text" name="major" /></td>
											  </tr>
											  <tr>
											    <th class="table-active">과목</th>
											    	<td><input type="text" name="subject" /></td>
											    <th class="table-active">중간고사 성적</th>
											    	<td><input type="text" name="score1" /></td>
											    <th class="table-active">기말고사 성적</th>
											    	<td><input type="text" name="score2" /></td>
											    <th class="table-active">기타 성적</th>
											    	<td><input type="text" name="score3" /></td>
											  </tr>
											</table>
											<button type="submit" class="btn btn-primary">등록</button>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>