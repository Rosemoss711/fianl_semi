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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>로그인 페이지</title>
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
	height: 50px;
}
.emptyTop {
	background-color: white;
	height: 50px;
}

/*로그인*/
.LoginBox {
	width: 600px;
	height: 600px;
}
#ment{
	font-family: 'LeferiPoint-WhiteObliqueA';
	font-weight: 600 !important;
	color: #97C4B8;
}

#loginLogo {
	width: 100px;
	height: 100px;
	margin-top: 20px;
}
input {
	width: 400px !important;
	font-family: 'LeferiPoint-WhiteA';
	font-weight: 600 !important;
}

input:focus {
	outline: none;
	border-bottom: 1px solid #b6e0db;
}

input::placeholder {
	color: #d6dfad !important;
}
/*버튼*/
#loginBtn {
	background-color: #73b1a1;
	border: 1px solid #F0FFC2;
	border-radius: 0.25rem;
	padding: 3px;
	padding-left: 10px;
	padding-right: 10px;
	font-family: 'LeferiPoint-WhiteA';
	font-weight: 600;
	color: white;
	margin: 5px;
	width: 400px;
	height: 40px;
}
#searchIdBtn {
	margin-right: 15px;
	border-radius: 0.25rem;
	padding: 3px;
	padding-left: 10px;
	padding-right: 10px;
	font-family: 'LeferiPoint-WhiteA';
	font-weight: 600;
	font-size: small;
	margin: 5px;
}
#searchPwBtn {
	margin-right: 15px;
	border-radius: 0.25rem;
	padding: 3px;
	padding-left: 10px;
	padding-right: 30px;
	font-family: 'LeferiPoint-WhiteA';
	font-weight: 600;
	font-size: small;
	margin: 5px;
}
#signupBtn {
	margin-right: 15px;
	background-color: white;
	border: 1px solid #73b1a1;
	border-radius: 0.25rem;
	padding: 3px;
	padding-left: 10px;
	padding-right: 10px;
	font-family: 'LeferiPoint-WhiteA';
	font-weight: 600;
	color: gray;
	margin: 0;
	margin-right: 10px;
	width: 200px;
	height: 49.17px;
	width: 200px;
}
#loginBtn:hover, #signupBtn:hover {
	background-color: #F0FFC2;
	border: 1px solid #73b1a1;
	color: #73b1a1;
}

#kakaoImg {
	margin-right: 15px;
	margin: 5px;
	height: 33px;
}
</style>
</head>
<body>
	<div class="container">
       	<!-- 헤더 -->
		<jsp:include page="/frame/header.jsp"/>
		<div class="empty"></div>

		<div class="emptyTop"></div>
		<form action="/loginOk.user" method="post" id="loginForm">
        <!-- body -->
        <div class="row">
            <div class="col-12 d-flex justify-content-center">
                <div class="LoginBox">
                    <div class="row">
                        <div class="col-3 p-1 loginLogo d-flex justify-content-end">
                            <img id="loginLogo" src="/imgs/dpt_Logo.png">
                        </div>
                        <div class="col-9 p-5 d-flex justify-content-start">
                            <h4 id="ment">안녕하세요 :) <br> 당신의 퍼스널 트레이너입니다.</h4>
                        </div>
                    </div>
                    <div class="empty"></div>
                    <div class="row">
                        <div class="col m-1 d-flex justify-content-center">
                            <input class="form-control" type="text" placeholder="이메일을 입력하세요" id="user_id" name="user_id">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col m-1 d-flex justify-content-center">
                            <input class="form-control" type="password" id="user_pw" name="user_pw" placeholder="비밀번호를 입력하세요">
                        </div>
                    </div>
                    <div class="row m-2">
                        <div class="col d-flex justify-content-center">
                            <button class="btn" type="button" id="loginBtn">로그인</button>
                        </div>
                    </div>
                    <div class="row m-2">
                        <div class="col-11 d-flex justify-content-end">
                            <button type="button" class="btn" id="searchIdBtn">로그인 이메일 찾기</button>
                            <button type="button" class="btn" id="searchPwBtn">비밀번호 찾기</button>
                        </div>
                    </div>
                    <div class="empty"></div>
                    <div class="row m-2">
                        <div class="col-12 d-flex justify-content-center">
                            <button type="button" id="signupBtn">회원가입 하기</button>
                            <%--<img id="kakaoImg" src="../imgs/kakao_login_medium_narrow.png"> --%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</form>
		<!-- footer -->
        <jsp:include page="/frame/footer.jsp"/>
	</div>	
	<script>
		$("#searchIdBtn").on("click", function(){
			let url = "/searchIdPopup.user";
			let name = "아이디 찾기";
			let option = "width=600, height=300, left=500, top=300";
			window.open(url, name, option);
		});
			
		$("#searchPwBtn").on("click", function(){
			let url = "/searchPwPopup.user";
			let name = "비밀번호 찾기";
			let option = "width=600, height=350, left=400, top=400";
			window.open(url, name, option);
		});
		
		$("#loginBtn").on("click", function() {
			if ($("#user_id").val() === "") {
				alert("아이디를 입력해주세요.")
				return;
			} else if ($("#user_pw").val() === "") {
				alert("비밀번호를 입력해주세요.")
				return;
			}
			$("#loginForm").submit();
		});
		$("#signupBtn").on("click", function() {
			location.href = "/toSignup.user";
		})
	</script>
</body>
</html>