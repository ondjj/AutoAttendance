<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<script>
		method:"GET",
		url:"http://127.0.0.1:5000/",
		data: 
	</script>

	<form action="http://127.0.0.1:5000" method="post" name="data">
		<input type="text" value="data">
		<button>전송</button>
	</form>

<!-- 	<div align="center">
		<h2>회원 가입</h2>
		<form action="MemberJoinController.do" method="post">
			<table style="width: 500" border="1">
			
				<tr height="50">
					<td width="150" align="center">아이디</td>
					<td width="350" align="center"><input type="text" name="id"	size="40" placeholder="id를 입력하세요.">
					</td>
				</tr>
				
				<tr height="50">
					<td width="150" align="center">패스워드</td>
					<td width="350" align="center"><input type="password"
						name="password1" size="40" placeholder="영문과 숫자 특수 문자를 입력하세요."></td>
				</tr>
				
				<tr height="50">
					<td width="150" align="center">패스워드 확인</td>
					<td width="350" align="center"><input type="password"
						name="password2" size="40" placeholder="영문과 숫자 특수 문자를 입력하세요."></td>
				</tr>
				
				<tr height="50">
					<td width="150" align="center">이메일</td>
					<td width="350" align="center"><input type="email"
						name="email" size="40" placeholder="ondd@naver.com"></td>
				</tr>
				
				<tr height="50">
					<td width="150" align="center">전화번호</td>
					<td width="350" align="center"><input type="tel" name="phone_num"
						size="40"></td>
				</tr>
				
				<tr height="50">
					<td width="150" align="center">주민등록번호</td>
					<td width="350" align="center"><input type="text" name="private_num"
						size="40"></td>
				</tr>
				
				<tr height="50">
					<td width="150" align="center">한글이름</td>
					<td width="350" align="center">
					<input type="text" name="kr_name" size="40"></td>
				</tr>
				
				<tr height="50">
					<td width="150" align="center">영문이름</td>
					<td width="350" align="center"><input type="text" name="en_name" size="40"></td>
				</tr>
				
				<tr height="50">
					<td width="150" align="center">나이</td>
					<td width="350" align="center"><input type="text" name="age" size="40"></td>
				</tr>
				
				check box
				<tr height="50">
					<td width="150" align="center">관리자여부</td>
					<td width="150" align="center">
						<input type="checkbox"	name="admin_key" value="학생">학생 &nbsp;&nbsp; 
						<input	type="checkbox" name="admin_key" value="관리자">관리자 &nbsp;&nbsp; 
					</td>
				</tr>
				
				선택 목록
				<tr height="50">
					<td width="150" align="center">증명사진</td>
					<td width="350" align="center">
						<input type="text"	name="id_picture" value="학생">증명사진 &nbsp;&nbsp; 
					</td>
				</tr>
				
				raido 버튼
				<tr height="50">
					<td width="150" align="center">성별</td>
					<td width="350" align="center">
					<input type="radio" name="gender" value="남자">남자 &nbsp;&nbsp;
					<input type="radio" name="gender" value="여자">여자 &nbsp;&nbsp;
					</td>
				</tr>
					
				<tr height="50">
					<td width="150" align="center">주소</td>
					<td width="350" align="center"><input type="text" name="address" size="40"></td>
				</tr>
				
				<tr height="50">
					<td width="150" align="center">입학년도</td>
					<td width="350" align="center"><input type="text" name="col_reg_date" size="40"></td>
				</tr>
				
				<tr height="50">
					<td align="center" colspan="2">
					<input type="submit" value="회원 가입">
					<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</div> -->
</body>
</html>
