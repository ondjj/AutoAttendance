<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                        <h1 class="mt-4">출결정정신청내역</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="manager_page.jsp">관리자 페이지</a></li>
                            <li class="breadcrumb-item active">학적</li>
                            <li class="breadcrumb-item active">출결</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                출경정정신청 목록<br><br>
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
                                <table class="table table-hover" id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>제목</th>
                                            <!-- <th>내용</th> -->
                                            <th>작성자</th>
                                            <th>작성일</th>
                                            <th>첨부파일</th>
                                            <th>조회수</th>
                                        </tr>
                                    </thead>
                                    <!-- <tfoot>
                                        <tr>
                                            <th>번호</th>
                                            <th>제목</th>
                                            <th>내용</th>
                                            <th>작성자</th>
                                            <th>작성일</th>
                                            <th>첨부파일</th>
                                            <th>조회수</th>
                                        </tr>
                                    </tfoot> -->
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td><a href="#">제목 테스트</a></td>
                                            <!-- <td>내용내용긴글내용내용긴글내용내용긴글내용내용</td> -->
                                            <td>관리자</td>
                                            <td>2022-11-30</td>
                                            <td><a href="#">파일 테스트</a></td>
                                            <td>40</td>

                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td><a href="#">제목</a></td>
                                       <!--      <td>내용내용</td> -->
                                            <td>관리자</td>
                                            <td>2022-12-01</td>
                                            <td><a href="#">test.txt</a></td>
                                            <td>1234</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td><a href="#">1234ABCDㄱㄴㄷㄹabcd1234</a></td>
                                      <!--       <td>내용내용</td> -->
                                            <td>관리자</td>
                                            <td>2023-01-01</td>
                                            <td><a href="#">양식.hwp</a></td>
                                            <td>0</td>
                                        </tr>
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
