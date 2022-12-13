<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>햑생 등록</title>

  <!-- <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  <style>
    body {
      min-height: 100vh;

      background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
      background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
    }

    .input-form {
      max-width: 680px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
  </style>
</head>

<body>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">학생 등록</h4>
        <form class="validation-form" action="MemberJoinController.do" method="post">
          <div>
	          <div class="row">
		            <div class="col-md-6 mb-3">
		              <label>한글 이름</label>
		              <input type="text" class="form-control" name="kr_name" placeholder="전창준" required>
		              <div class="invalid-feedback">
		                한글이름을 입력해주세요.
		              </div>
		            
		            </div>
		            <div class="col-md-6 mb-3">
		              <label>영문 이름</label>
		              <input type="text" class="form-control" name="en_name" placeholder="ChangJunJeon" required>
		              <div class="invalid-feedback">
		                영문이름을 입력해주세요.
		              </div>
		            </div>
	          </div>
	          
	          
				  <div class="mb-3">
		            <label>학번(ID)</label>
		            <input type="text" class="form-control" name="id" placeholder="2023021453" required>
		            <div class="invalid-feedback">
		              학번을 입력해주세요.
		            </div>
		          </div>
			
	
	          <div class="row">
		          	<div class="col-md-6 mb-3">
			            <label>비밀번호</label>
			            <input type="password" class="form-control" name="password1" required>
			            <div class="invalid-feedback">
			              비밀번호를 입력해주세요.
			            </div>
		          	</div>
		
		          <div class="col-md-6 mb-3">
		            <label>비밀번호 확인</label>
		            <input type="password" class="form-control" name="password2" required> 
		          </div>
	         </div>
	          
	          
	         <div class="row">
		          <div class="col-md-2 mb-3">
		              <label>성별</label>
		              <select class="custom-select d-block w-100" name="gender">
		                <option>성별</option>
		                <option value="남">남</option>
		                <option value="여">여</option>
		              </select>
		          </div>
		           
		           
		           <div class="col-md-2 mb-3">
		              <label>adminkey</label>
		              <select class="custom-select d-block w-100" name="admin_key">
		                <option>key</option>
		                <option value="1">학생</option>
		                <option value="0">관리자</option>
		              </select>
		           </div>
		         
		          
		          <div class="col-md-2 mb-3">
		              <label>나이</label>
						<input type="text" class="form-control" name="age" required>
		          </div>
	          </div>
	          
		          <div class="mb-3">
		            <label>입학년도</label>
		            <input type="text" class="form-control" name="col_reg_date" placeholder="2022-0213" required>
		            <div class="invalid-feedback">
		              입학년도를 입력해주세요.
		            </div>
		          </div>
	          
		          <div class="mb-3">
		            <label>주민등록번호</label>
		            <input type="text" class="form-control" name="private_num" placeholder="123456-1234556" required>
		            <div class="invalid-feedback">
		              주민등록번호를 입력해주세요.
		            </div>
		          </div>
	          
		           <div class="mb-3">
		            <label>핸드폰 번호</label>
		            <input type="text" class="form-control" name="phone_num" placeholder="123456-1234556" required>
		            <div class="invalid-feedback">
		              주민등록번호를 입력해주세요.
		            </div>
		          </div>
	
		          <div class="mb-3">
		            <label>이메일</label>
		            <input type="email" class="form-control" name="email" placeholder="you@example.com" required>
		            <div class="invalid-feedback">
		              이메일을 입력해주세요.
		            </div>
		          </div>
		
		          <div class="mb-3">
		            <label>주소</label>
		            <input type="text" class="form-control" name="address" placeholder="서울특별시 강남구" required>
		            <div class="invalid-feedback">
		              주소를 입력해주세요.
		            </div>
	          		</div>
	
	          	  <hr class="mb-4">
		          <div class="mb-6">
		            <label for="id_picture">증명사진</label><br>
						<form action="" method="post" entype="multipart/form-data">
	          				<input type="file" name="id_picture">
	          			</form><br><br>
		          </div>
	
	          		<div class="mb-4"></div>
					<input class="btn btn-primary btn-lg btn-block" type="submit" value="등록 완료">
	        </div>
	     	
        </form>
      </div>
    </div>
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; 2022 KR-</p>
    </footer>
  </div>
  
  <script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
  </script>
</body>

</html>