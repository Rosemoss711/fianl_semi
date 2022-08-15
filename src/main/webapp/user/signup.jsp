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

<title>회원가입</title>
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
	height: 20px;
}

.empty2 {
	background-color: white;
	height: 40px;
}

/* 버튼 */
.overBtn, .submitBtn {
	background-color: #73b1a1;
	border: 1px solid #F0FFC2;
	border-radius: 0.25rem;
	padding: 3px;
	padding-top: 10px;
	padding-left: 10px;
	padding-right: 10px;
	color: white;
	font-family: 'LeferiPoint-WhiteA';
}

.overBtn:hover, .submitBtn:hover {
	background-color: #F0FFC2;
	border: 1px solid #73b1a1;
	color: #73b1a1;
}

/* 바디 타이틀 */
.title {
	color: #97C4B8;
	border-bottom: 1px solid #97C4B8;
	-bs-gutter-x: 0px;
	margin-bottom: 50px;
	margin-top: 50px;
	font-family: '양진체';
}
.cls_body {
	width: 40em;
	margin: auto;
	font-family: 'LeferiPoint-WhiteA';
	font-weight: 600;
}

/* 바디 input 영역 */
.inputDiv{
	margin-bottom: 10px;
}

input {
	font-family: 'LeferiPoint-WhiteA';
	font-weight: 600 !important;
	vertical-align: middle;
	padding-top: 10px !important;
}

input::placeholder {
	color: #adcabf !important;
}

#user_id{
	width: 80%;
}

.textInput {
	width: 85%;
}

.checkBox {
	background-color: #d4d4d450;
	width: 80%;
	border-radius: 10px;
	padding: 10px;
}

.checkBox_inner>span {
	margin: 10px;
}

.submitBtn {
	height: 40px;
}
</style>
<body>
	<div class="container">
		<!-- 헤더 -->
		<jsp:include page="/frame/header.jsp"/>
		<div class="container">
			<div class="row title" style="margin-bottom:70px;">
				<div class="col d-flex justify-content-center">
					<h1>회원 가입</h1>
				</div>
			</div>
		<form action="/signup.user" id="joinForm">
			<div class="row cls_body d-flex align-items-center justify-content-center">
				<div class="row d-flex align-items-center justify-content-center">
					<div class="col-9 inputDiv d-flex align-items-center justify-content-center">
						<input type="text" class="form-control" id="user_id"
							name="user_id" placeholder="이메일" readonly>
					</div>
					<div class="col inputDiv">
						<button type="button" class="btn overBtn">중복확인</button>
					</div>
				</div>
				<div class="row">
					<div class="col-12 inputDiv d-flex align-items-center justify-content-center">
						<input type="text" class="form-control textInput" id="user_name"
							name="user_name" placeholder="이름">
					</div>
				</div>
				<div class="row">
					<div class="col-12 inputDiv d-flex align-items-center justify-content-center">
						<input type="password" class="form-control textInput" id="user_pw"
							name="user_pw" placeholder="비밀번호 (6~20자 특수문자(~!@#$%^&*))">
					</div>
				</div>
				<div class="row">
					<div class="col-12 inputDiv d-flex align-items-center justify-content-center">
						<input type="password" class="form-control textInput"
							id="user_pwOk" placeholder="비밀번호 확인">
					</div>
				</div>
				<div class="row">
					<div class="col-12 inputDiv d-flex align-items-center justify-content-center">
						<input type="text" class="form-control textInput" id="user_phone"
							name="user_phone" placeholder="핸드폰 번호 (-제외)">
					</div>
				</div>
				<div class="empty2"></div>
				<div class="row checkBox">
					<div class="row">
						<div class="col-12 form-checkd-flex d-flex align-items-center justify-content-center checkBox_inner">
							<input class="form-check-input check1" type="checkbox" value=""
								id="flexCheckChecked"> <span style="padding-top: 10px;">서비스 이용 약관 및 개인정보 취급방침에 동의합니다.</span>
						</div>
					</div>
					<div class="row">
						<div class="col-12 form-checkd-flex d-flex align-items-center justify-content-center checkBox_inner">
							<input class="form-check-input check2" type="checkbox" value=""
								id="flexCheckChecked"> <span style="padding-top: 10px;">위치기반 서비스 이용약관에 동의합니다.</span>
						</div>
					</div>
				</div>
				<div class="empty2"></div>

				<div class="row">
					<div
						class="col-12 d-flex align-items-center justify-content-center">
						<button type="button" class="btn submitBtn">가입 완료</button>
					</div>
				</div>
			</div>
		</form>
	</div>

		<div class="empty"></div>
		 <!-- footer -->
        <jsp:include page="/frame/footer.jsp"/>
	</div>
	<script>
		$(".overBtn").on("click", function() { // 아이디 팝업창 띄우기
			let url = "/idCheckPopup.user";
			let name = "아이디 중복검사";
			let option = "width=600, height=350, left=500, top=300";

			window.open(url, name, option);
		})

		$(".submitBtn").on("click", function() { // 
			let regexPw = /[a-zA-Z0-9~!@#$%^&*]{6,20}/;
			let regexPhone = /[0-9]{11}/;
			// select 박스에서 선택된 값을 가져오는 방법
			console.log($("#user_phone").val());
			// 유효성 검사
			if ($("#user_id").val() === "") {
				alert("아이디를 입력해 주세요.");
				return;
			} else if (!regexPw.test($('#user_pw').val())) {
				alert("형식에 맞지 않는 비밀번호입니다.");
				return;
			} else if ($("#user_pwOk").val() !== $("#user_pw").val()) {
				alert("비밀번호와 비밀번호 확인값이 일치하지 않습니다.");
				return;
			} else if (!regexPhone.test($("#user_phone").val())) {
				alert("형식에 맞지 않는 휴대폰번호입니다.");
				return;
			}

			$("#joinForm").submit();
		})
	</script>

</body>
</html>