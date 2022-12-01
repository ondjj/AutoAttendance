<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Charts - SB Admin</title>
        <link href="resources/css/admin.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
    <div>
	 <%@ include file="infoAdmin.jsp" %>
       
            
            <div id="layoutSidenav_content">
                <form action="#" method="post">
                    <div class="container">
                    
	                    <h1 class="mt-4">개인정보변경</h1>
		                     
		                <div class="panel panel-default">
	  					 	<div class="panel-heading">
	  					 		<h3 class="panel-title">아이디</h3>
	  					 	</div>
	  							<div class="panel-body">
	  								 <input type="text" name="ID"  value="" disabled="disabled">
	  							</div>
						</div>
						
						<div class="panel panel-default">
	  					 	<div class="panel-heading">
	  					 		<h3 class="panel-title">이름</h3>
	  					 	</div>
	  							<div class="panel-body">
	  								 <input type="text" name="Name"  value="" disabled="disabled">
	  							</div>
						</div>
						
						<div class="panel panel-default">
	  					 	<div class="panel-heading">
	  					 		<h3 class="panel-title">주민번호</h3>
	  					 	</div>
	  							<div class="panel-body">
	  								 <input type="text" name="PrivateNumber"  value="" disabled="disabled"> - <input type="text" name="PrivateNumber" value="" disabled="disabled">
	  							</div>
						</div>
	                     
						<div class="panel panel-default">
	  					 	<div class="panel-heading">
	  					 		<h3 class="panel-title">비밀번호</h3>
	  					 	</div>
	  							<div class="panel-body">
	  								 <input type="text" name="Password"  value="">
	  							</div>
						</div>
	                     
	                    <div class="panel panel-default">
	  					 	<div class="panel-heading">
	  					 		<h3 class="panel-title">나이</h3>
	  					 	</div>
	  							<div class="panel-body">
	  								 <input type="text" name="Age"  value="">
	  							</div>
						</div>
				        
				        <div class="panel panel-default">
	  					 	<div class="panel-heading">
	  					 		<h3 class="panel-title">핸드폰 번호</h3>
	  					 	</div>
	  							<div class="panel-body">
	  								<input type="tel" name="PoneNumber1"  placeholder="010" size=3 disabled="disabled"> - <input type="tel" name="PoneNumber2" size=8> - <input type="tel" name="PoneNumber3" size=8>
	  							</div>
						</div>             
	                    
	                    <div class="panel panel-default">
	  					 	<div class="panel-heading">
	  					 		<h3 class="panel-title">이메일</h3>
	  					 	</div>
	  							<div class="panel-body">
	  								<input type="text" name="email_id"  value="" size=15> @ <input type="text" name="email_domain" value="" size=15>
	  						   </div>
						</div>
						
	                    <div class="panel panel-default">
	  					 	<div class="panel-heading">
	  					 		<h3 class="panel-title">주소</h3>
	  					 	</div>
	  							<div class="panel-body">
	  								 <input type="text" name="Address"  value="">
	  							</div>
						</div>
	                     
	                    <div class="panel panel-default">
	  					 	<div class="panel-heading">
	  					 		<h3 class="panel-title">사진</h3>
	  					 	</div>
	  							<div class="panel-body">
	  								 <input type="file" name="Img"  value="">
	  							</div>
						</div>
	                     
	                    <button type="reset" class="btn btn-success">초기화</button>
	                    <button type="button" class="btn btn-primary" onclick="">수정하기</button>
	                    <button type="button" class="btn btn-warning" onclick="location.href='admin.jsp'">돌아가기</button>
	                     
                    </div>
                </form>
                
                
                <%@ include file="footerAdmin.jsp" %>

            </div> 
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="assets/demo/chart-pie-demo.js"></script>
    </body>
</html>