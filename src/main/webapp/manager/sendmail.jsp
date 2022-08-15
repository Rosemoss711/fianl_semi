<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<title>전체 메일 보내기</title>
</head>
<style>
/* 폰트 */
@font-face {
	font-family: '양진체';
	src:
		url('https://cdn.jsdelivr.net/gh/supernovice-lab/font@0.9/yangjin.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'LeferiPoint-WhiteObliqueA';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/LeferiPoint-WhiteObliqueA.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
    font-family: 'LeferiPoint-WhiteA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/LeferiPoint-WhiteA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
/* 폰트 끝 */
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

.container {
	margin: auto;
}

/* 공백 */
.empty {
	background-color: white;
	height: 40px;
}

/* 바디 타이틀 */
.cls_title {
	height: 100px;
}

.title_div {
	height: 100%;
	width: 100%;
}

.title_div h2 {
	border-bottom: 2px solid rgb(221, 218, 218);
	width: 300px;
	height: 45px;
	text-align: center;
	font-family: '양진체';
}

/* 타이틀 */
.title {
	color: #97C4B8;
	border-bottom: 1px solid #97C4B8;
	-bs-gutter-x: 0px;
	margin-bottom: 20px;
	margin-top: 10px;
	font-family: '양진체';
}


/* 메일 내용 */
.mail-title>input {
	width: 50%;
	height: 4rem;
	overflow: hidden;
	border: none;
	resize: none;
	font-weight: 600;
	text-align: center;
	border-bottom: 1px solid #97C4B8;
	font-family: 'LeferiPoint-WhiteA';
	font-weight: 600;
	font-size: large;
}

.mail-content>textarea {
	width: 70%;
	height: 4rem;
	overflow: hidden;
	resize: none;
	font-weight: 600;
	text-align: center;
	border: 1px solid #97C4B8;
	font-family: 'LeferiPoint-WhiteA';
	font-weight: 600;
	height: 500px;
	font-size: large;
}

textarea:focus, input:focus {
	outline: none;
}

textarea::placeholder, input::placeholder {
	color: #adcabf !important;
}

/* 보내기 버튼 */
#sendMailBtn, #backBtn {
	width: 100px;
}

#sendMailBtn, #backBtn {
	background-color: #73b1a1;
	border: 1px solid #F0FFC2;
	border-radius: 0.25rem;
	padding: 3px;
	padding-top: 10px;
	padding-left: 10px;
	padding-right: 10px;
	font-family: 'LeferiPoint-WhiteObliqueA';
	color: white;
	margin: 5px;
}

#sendMailBtn:hover, #backBtn:hover {
	background-color: #F0FFC2;
	border: 1px solid #73b1a1;
	color: #73b1a1;
}
</style>

<body>
	<div class="container">
		<!-- 헤더 -->
		<jsp:include page="/frame/header.jsp"/>
		
		<div class="empty"></div>

		<!-- 메인 영역 -->
		<div class="container row cls_body">
			<div class="row title">
				<div class="col-12 d-flex justify-content-center" style="margin-top: 50px;">
					<h1>공지 메일 보내기</h1>
				</div>
			</div>
			<div class="empty"></div>
			<form action="/sendMail.manager" method="post" id="mailForm">
				<div class="row">
					<div class="col-12 d-flex justify-content-center mail-title">
						<input type="text" class="" id="mail-title"
							name="mail-title" placeholder="제목 입력">
					</div>
				</div>
				<div class="empty"></div>
				<div class="row">
					<div class="col-12 d-flex justify-content-center mail-content">
						<textarea class="" id="mail-content"
							name="mail-content"></textarea>
					</div>
				</div>
				<div class="empty"></div>
				<div class="row">
					<div class="col btnSpace d-flex justify-content-center">
						<button type="submit" id="sendMailBtn" class="btn btnAdd">보내기</button>
						<button type="button" id="backBtn" class="btn btnAdd">취소</button>
					</div>

				</div>
			</form>
			<div class="empty"></div>
		</div>
		<!-- footer -->
        <jsp:include page="/frame/footer.jsp"/>
	</div>
</body>
</html>