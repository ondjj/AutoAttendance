<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>로그인</title>
        <link href="resources/css/admin.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="bg-secondary">
    <% request.setCharacterEncoding("UTF-8"); %>
    
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">로그인</h3></div>
                                    <div class="card-body">
                                        <form action="LoginCon.do" method="post"> 
                                            <div class="form-floating mb-3">
                                                <input class="form-control" name="id" type="text" placeholder="name@example.com" />
                                                <label for="inputEmail">아이디(학번 또는 교수번호)</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" name="password" type="password" placeholder="Password" />
                                                <label for="inputPassword">비밀번호</label>
                                            </div>
											
                                            <div class="form-check mb-3">
                                                <input class="form-check-input" id="inputRememberPassword" type="checkbox" value="" />
                                                <label class="form-check-label" for="inputRememberPassword">아이디 기억하기</label>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a class="small" href="password.jsp">비밀번호를 잊어버리셨나요?</a>
                                               
                                                <input class="btn btn-primary" type="submit" value="로그인">
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small">※계정이 아직 생성되지 않은 경우 담당교수에게 문의바랍니다.</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <jsp:include page="Main_footer.jsp"/>
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
