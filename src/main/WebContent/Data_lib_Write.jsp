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
    </head>
    <body class="sb-nav-fixed">
    <div>
         <%@ include file="info_manager.jsp" %>

            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">자료실(관리자)</h1>
                        <ol class="breadcrumb mb-4">
                           <li class="breadcrumb-item"><a href="Manager_page.jsp">관리자페이지</a></li>
                            <li class="breadcrumb-item active">기타</li>
                            <li class="breadcrumb-item active">자료실</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                게시물 작성
                            </div>
                            <div class="card-body">
                                <form name="WriteFrm" action="./data_lib_write.do" method="post" enctype="multipart/form-data" onsubmit="return check(this)">
                                	<table>
                                		<tr>
                                			<th>작성자</th>
											<td><input type="text" name="name" id="name"></td>
										<tr>
											<th class="w">제목</th>
											<td><input type="text" name="subject" id="subject" size="78"></td>
										</tr>
										<tr>
											<th class="w">내용</th>
											<td><textarea rows="3" cols="80" name="content" id="content" style="resize: none;"></textarea>
										</tr>
										<tr>
											<th class="w">첨부 파일</th>
											<td><input type="file" name="ofile"></td>
										</tr>
										<tr>
											<td colspan="2" align="center">
												<button class="btn btn-primary" type="submit">작성 완료</button>
												<button class="btn btn-warning" type="reset">초기화</button>
												<button class="btn btn-success" type="button" onclick="location.href='./data_lib_list.do';">목록</button>
											</td>
                                		</tr>
                                	</table>
                                </form>
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
<script type="text/javascript">
 	function check(form) {
		if (!form.name.value.trim()) {
			alert("작성자 이름을 입력하세요.");
			form.name.focus();
			return false;
		}
		if (!form.subject.value.trim()) {
			alert("제목을 입력하세요.");
			form.subject.focus();
			return false;
		}
		if (!form.content.value.trim()) {
			alert("내용을 입력하세요.");
			form.content.focus();
			return false;
		}
	}
</script>
</html>
