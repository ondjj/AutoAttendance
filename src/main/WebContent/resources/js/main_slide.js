
var main_obTimeOut;    // clearTimeout() 함수를 이용하여 Timeout 을 취소하기위해 사용됨

function ShowMainDefaultRotate() {    // 스스로 자신을 호출하는 재귀함수 (Recursive Function)
	var mainImageArray = new Array();
	var mainImageCnt = 0;
	
	mainImageArray[0] = "./resources/img/main_image01.jpg";
	mainImageArray[1] = "./resources/img/1900x400_1.jpg";

	if (mainImageCnt < mainImageArray.length) {    // 배열의 갯수 이내일때만 실행
		document.getElementById("main_image_slide").src = mainImageArray[mainImageCnt];
		main_obTimeOut = setTimeout("ShowMainDefaultRotate()", 2000);    // 2초후에 자기자신을 호출
		mainImageCnt++;
	} else {
		mainImageCnt = 0;
		startAnimation(); // Cnt 를 0으로 바꾸고 다시 시작
		// clearTimeout(obTimeOut); // 배열의 갯수만큼 반복하여 변환시킨 후에는 Timeout 을 중지시킨다
	}
}

function startMainAnimation() {
    main_obTimeOut = window.setTimeout(ShowMainDefaultRotate, 100);    // 윈도우 로드 후 0.1초 후에 반복함수를 호출합니다.
}

window.onload = startMainAnimation;    // 윈도우 로드시 이미지 변환함수 실행