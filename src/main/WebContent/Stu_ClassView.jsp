<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="kr">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>강의 목록</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="./resources/assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="./resources/css/style.css" rel="stylesheet" />
</head>
<body>
	<!-- Responsive navbar-->
	<%@ include file="Main_menu.jsp"%>
	<!-- Page Content-->
	<div class="container px-4 px-lg-5">
		<!-- Call to Action-->
		<div class="card text-white bg-secondary my-5 py-4 text-center">
			<div class="card-body">
				<h1 class="text-white m-0">강의실</h1>
			</div>
		</div>
		<div class="container-fluid px-4">
			<div class="card mb-4">
				<div class="card-header">
					<h3>강의실 목록</h3>
				</div>
				<div class="card-body">
					<table class="table table-hover" id="datatablesSimple">
						<thead>
							<tr>
								<th width="*">강의명</th>
								<th width="15%">담당교수</th>
								<th width="15%">수강하기</th>
								<c:if test="${admin_key == '0' }">
									<th width="15%">수정</th>
									<th width="15%">삭제</th>
								</c:if>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${list}" var="list">
							<tr>
								<td>${list.lecture_name}</td>
								<td>${list.professor}</td>
								<td><button onclick="showPop();" type="button">재생하기</button></td>
								<c:if test="${admin_key == '0' }">
									<td><button type="button" class="btn btn-success btn-lg" onclick="location.href='./ClassUpdateList.do?num=${list.postNum}';">수정하기</button></td>
									<td><button type="button" class="btn btn-danger btn-lg" onclick="location.href='./ClassDelCon.do?lecture_name=${list.lecture_name}&subject=${list.subject}';">삭제</button></td>
								</c:if>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<button type="button" class="btn btn-primary btn-lg" onclick="location.href='./ClassListCon.do';">목록</button>
					
					<br>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="Main_footer.jsp"></jsp:include>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<script>
	function button_event(){
		  if (confirm("정말 삭제하시겠습니까?") == true){    //확인
		      document.removeCla.submit();
		  }else{   //취소
		      return;
		  }
		}
	</script>
	<script>
   
      //창 크기 지정
      var width = 575;
      var height = 336;
      
      //pc화면기준 가운데 정렬
      var left = (screen.width / 2) - (width/2);
      var top = (screen.height / 4);
      
          //윈도우 속성 지정
      var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';
      
      function showPop() {
      var link = "./video_Play.jsp";
         window.open(link, "", windowStatus);
      }
      
   </script>
</body>
</html>
