<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="./resources/css/style.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id='headLine'>
  		<span style='font-size: 2em'></span>
	</div>
       
	<img id="image_slide" src="">
</body>
<script>
var obTimeOut;    // clearTimeout() 함수를 이용하여 Timeout 을 취소하기위해 사용됨

var imageArray = new Array();

imageArray[0] = "./resources/img/1900x400.jpg";
imageArray[1] = "./resources/img/1900x400_1.jpg";
imageArray[2] = "./resources/img/1900x400_2.jpg";
imageArray[3] = "./resources/img/1900x400_3.jpg";

var headLineArray = new Array();

headLineArray[0] = "사이즈는 1900x400 입니다.";
headLineArray[1] = "학교 사진입니다.";
headLineArray[2] = "참 예쁘네요";
headLineArray[3] = "안녕하세요?";

var imageCnt = 0;
var headLineCnt = 0;

function ShowDefaultRotate() {    // 스스로 자신을 호출하는 재귀함수 (Recursive Function)

    if (imageCnt < imageArray.length) {    // 배열의 갯수 이내일때만 실행
        document.getElementById("image_slide").src = imageArray[imageCnt];
        deleteText();
        appendDiv();
        obTimeOut = setTimeout("ShowDefaultRotate()", 2000);    // 2초후에 자기자신을 호출
        imageCnt++;
        headLineCnt++;
    } else {
    	imageCnt = 0;
    	headLineCnt = 0;
        startAnimation(); // Cnt 를 0으로 바꾸고 다시 시작
        // clearTimeout(obTimeOut); // 배열의 갯수만큼 반복하여 변환시킨 후에는 Timeout 을 중지시킨다
    }
}

function startAnimation() {
    obTimeOut = window.setTimeout(ShowDefaultRotate, 100);    // 윈도우 로드 후 0.1초 후에 반복함수를 호출합니다.
}

window.onload = startAnimation;    // 윈도우 로드시 이미지 변환함수 실행

	// div 태그 추가	
	function appendDiv() {
		
		const element = document.getElementById('headLine');
			  
		// new div 생성
		const newDiv = document.createElement('div');
			  
		// new div에 style 추가
		newDiv.style.fontSize = '2em';
			  
		// new div에 추가할 text node 생성
		const newText = document.createTextNode(headLineArray[headLineCnt]);
			  
		// text node를 new div에 추가
		newDiv.appendChild(newText);
	  
		// new div를 기존 div에 추가
		element.appendChild(newDiv);
	}
	
	// 텍스트 삭제
	function deleteText() {
		const element = document.getElementById('headLine');
		  
		element.innerText = '';
	}
</script>
</html>