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
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="./resources/css/admin.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
    	<div>
          <%@ include file="infoAdmin.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">출결 정정 신청 내역</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active"><a href="admin.jsp">마이페이지</a></li>
                            <li class="breadcrumb-item active">출결 관리</li>
                            <li class="breadcrumb-item active">출결 정정 신청 내역</li>
                        </ol>
                        
                        
                        <!--  성적 정정 신청이 존재할 시 신청한 내역을 불러와서 출력 
                         그렇게 된다면 성적 정정 신청 내역에 대한 DB테이블을 추가로 작성할 필요가 있음 -->
                        
                        <div class="row">
                            <div class="col-xl-7">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-table"></i>
                                        출결 정정 신청 내역
                                    </div>
                                    <div class="card-body"><canvas id="myAreaChart" width="100%" height="50"></canvas></div>
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