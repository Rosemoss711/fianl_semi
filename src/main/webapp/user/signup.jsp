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

/* 헤더 */
.cls_header {
	height: 150px;
	width: 100%;
	margin: 0%;
	background-color: #BFFFF0;
	color: #97C4B8;
	align-items: center;
	font-family: '양진체';
	text-align: center;
}

.cls_header a {
	color: #97C4B8;
}

.cls_header a:hover {
	color: #c9d4a9;
}

.dropdownBtn {
	background-color: #F0FFC2 !important;
	color: #97C4B8;
	border: 1px solid white;
}

.dropdownBtn:hover {
	color: #9be5d2;
}

.headDropdown {
	background-color: #F0FFC2 !important;
}

.headMenu {
	justify-content: end;
}

/* 로고 */
.logoImg {
	padding: 0%;
	filter: invert(87%) sepia(8%) saturate(806%) hue-rotate(113deg)
		brightness(86%) contrast(86%);
}

.logoImg:hover {
	filter: invert(75%) sepia(12%) saturate(803%) hue-rotate(52deg)
		brightness(99%) contrast(80%);
}
/* 로고 이미지 사이즈 */
.logoImg #logoImg {
	width: 50%;
	height: 50%;
}
/* 로고 효과 */
@import url('https://fonts.googleapis.com/css2?family=Alfa+Slab+One&display=swap');
    .logoImg {
        position: relative;
        display: inline-block;
        color: #fff;
        text-transform: uppercase;
        animation: waviy 1s infinite;
        animation-delay: calc(.1s * var(--i));
    }
    @keyframes waviy {
        0%,
        40%,
        100% {
            transform: translateY(0)
        }
        20% {
            transform: translateY(-20px)
        }
    }
/* 로고 효과 끝 */
/* 네비바 */
.navbar {
	background-color: #F0FFC2 !important;
	font-family: '양진체';
}

.container-fluid a {
	color: #97C4B8 !important;
}

.container-fluid a:hover {
	color: #9be5d2 !important;
}

.container-fluid button {
	background-color: #F0FFC2 !important;
	color: #97C4B8 !important;
}

.navDropdown {
	border: 1px solid white;
	background-color: #d5fcf3 !important;
}

.container-fluid button:hover {
	background-color: #97C4B8 !important;
	color: #F0FFC2 !important;
}

.container-fluid span {
	filter: invert(40%) sepia(4%) saturate(3907%) hue-rotate(113deg)
		brightness(103%) contrast(66%);
}

.navSearchInput {
	border: 1px solid white;
}

.navSearchInput::placeholder {
	color: #FFE4C0;
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

/* footer */
.footer {
	font-family: 'LeferiPoint-WhiteObliqueA';
	font-weight: 600;
	font-size: small;
	color: #709c91;
	border-top: 1px solid #c9d4a9;
}

.footer .row {
	border-bottom: 1px solid #c9d4a9;
}

.footer .footerInfo {
	padding-block: 3%;
	text-align: center;
}

.footerMenu {
	padding-block: 2%;
	text-align: center;
}

.footerMenu a {
	color: #709c91;
	text-decoration: none;
}
/* footer 끝 */
</style>
<body>
	<div class="container">
		<!-- 헤더 -->
	<div class="row cls_header">
			<div class="col-3 logoImg">
				<a href="/home"> <img id="logoImg" src="../imgs/dpt_Logo.png">
				</a>
			</div>
			<c:choose>
				<c:when
					test="${loginSession.user_auth eq 'member' || loginSession.user_auth eq 'admin'}">
					<div class="d-none d-md-block col-2"></div>
					<div class="col-3 p-0 headMenu d-flex justify-content-center">
						<span>${loginSession.user_name} 님 환영합니다!</span>
					</div>
					<div class="col p-0 headMenu d-flex justify-content-center">
						<a href="/toMypage.user" style="text-decoration: none;"> <span>마이페이지</span>
						</a>
					</div>
					<div class="col p-0 headMenu d-flex justify-content-center">
						<a href="/logout.user" style="text-decoration: none;"> <span>로그아웃</span>
						</a>
					</div>
				</c:when>
				<c:when test="${loginSession.user_auth eq 'manager'}">
					<div class="d-none d-md-block col-2"></div>
					<div class="col-3 p-0 headMenu d-flex justify-content-center">
						<span>관리자님 환영합니다!</span>
					</div>
					<div class="col p-0 headMenu d-flex justify-content-center">
						<a href="/toSendmail.manager" style="text-decoration: none;">
							<span>메일보내기</span>
						</a>
					</div>
					<div class="col p-0 headMenu d-flex justify-content-center">
						<a href="/userSerch.manager?curPage=1"
							style="text-decoration: none;"> <span>회원 검색</span>
						</a>
					</div>
					<div class="col p-0 headMenu d-flex justify-content-center">
						<a href="/logout.user" style="text-decoration: none;"> <span>로그아웃</span>
						</a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="d-none d-md-block col-5"></div>
					<div class="col p-0 headMenu d-flex justify-content-center">
						<a href="/login.user" style="text-decoration: none;"> <span>로그인</span>
						</a>
					</div>
					<div class="col p-0 headMenu d-flex justify-content-center">
						<a href="/toSignup.user" style="text-decoration: none;"> <span>회원가입</span>
						</a>
					</div>
				</c:otherwise>
			</c:choose>
			<div class="col p-0 headMenu d-flex justify-content-center">
				<button type="button" class="btn dropdownBtn dropdown-toggle"
					data-bs-toggle="dropdown" aria-expanded="false">고객센터</button>
				<ul class="dropdown-menu headDropdown">
					<li><a class="dropdown-item" href="/toInformation.info">자주
							묻는 질문</a></li>
					<c:if test="${loginSession.user_auth eq 'manager'}">
						<li><a class="dropdown-item"
							href="/modifyList.food?curPage=1">음식 프로로션</a></li>
					</c:if>
				</ul>
			</div>
		</div>
		<!-- 헤더 끝 -->
		<!-- 네비 -->
		<div class="row cls_nav">
			<div class="col">
				<nav class="navbar navbar-expand-lg navbar-dark bg-warning">
					<div class="container-fluid">
						<button class="navbar-toggler" type="button"
							data-bs-toggle="collapse"
							data-bs-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarSupportedContent">
							<ul class="navbar-nav me-auto mb-2 mb-lg-0">
								<li class="nav-item"><a class="nav-link active"
									aria-current="page" href="/toColumnPage.column?curPage=1">칼럼</a></li>
								<c:choose>
									<c:when
										test="${loginSession.user_auth eq 'member' || loginSession.user_auth eq 'admin' || loginSession.user_auth eq 'manager'}">
										<li class="nav-item"><a class="nav-link"
											href="/listLogin.gym">내 주변 운동시설</a></li>
										<li class="nav-item"><a class="nav-link"
											href="/listLogin.food">특가 식품</a></li>
									</c:when>
									<c:otherwise>
										<li class="nav-item"><a class="nav-link" href="/list.gym">내
												주변 운동시설</a></li>
										<li class="nav-item"><a class="nav-link"
											href="/list.food">특가 식품</a></li>
									</c:otherwise>
								</c:choose>
								<li class="nav-item"><a class="nav-link" href="/toList.part">근육별 운동법
										</a></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>
		</div>
		<!-- 네비 끝 -->
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
        <div class="container footer">
            <div class="row footerInfo">
                <div class="col-6">
                    제휴 및 서비스 이용문의<br>
                    <h3 style="margin-top: 10px; font-weight: 600;">1588-0000</h3>
                    AM 09:00 - PM 06:00<br>
                    토 일 공휴일 휴무
                </div>
                <div class="col-6">
                    (주)당퍼트<br>
                    서울특별시 영등포구 선유동2로 57<br>
                    대표 : 홍신영<br>
                    사업자번호 : 123-45-67890<br>
                    통신판매번호 : 제2000-서울영등포구-0000호<br>
                    kh.projectmail@gmail.com<br>
                </div>
            </div>
            <div class="row footerMenu">
                <div class="col"><a href="/footer/ToS.jsp">이용약관</a></div>
                <div class="col"><a href="/footer/privacyPolicy.jsp">개인정보처리방침</a></div>
                <div class="col"><a href="/footer/location-based-service.jsp">위치정보이용약관</a></div>
                <div class="col"><a href="/toInformation.info?curPage=1">센터등록요청하기</a></div>
                <div class="col"><a href="/toInformation.info?curPage=1">문의하기</a></div>
            </div>
            <p>Copyright ⓒ Dangpert Co., Ltd. All rights reserved.</p>
        </div>
        <!-- footer 끝 -->
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