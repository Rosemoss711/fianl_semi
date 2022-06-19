<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<title>Home</title>
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
	height: 50px;
}

/* 칼럼 */
.cls_column img {
	width: 100%;
	height: 600px;
}

/* 목록 타이틀 */
.title {
	height: 100px;
	background-color: #BFFFF0;
	color: #97C4B8;
	text-align: center;
	font-size: 50px;
	padding: 15px;
	font-family: '양진체';
}
/* 핸드폰사이즈 */
.smTitle {
	height: 100px;
	background-color: #BFFFF0;
	color: #97C4B8;
	text-align: center;
	padding: 15px;
	font-family: '양진체';
}

/* 근육별 운동 텍스트 효과 */
@import url('https://fonts.googleapis.com/css2?family=Alfa+Slab+One&display=swap');

    .waviy {
        position: relative;
        -webkit-box-reflect: below -20px linear-gradient(transparent, rgba(142, 168, 159, 0.377));
        font-size: 40px;
    }

    .waviy span {
        position: relative;
        display: inline-block;
        color: #97C4B8;
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
/* 근육별 운동 텍스트 효과 끝 */

/*그림자 효과*/
.title_promo .title-part, smTitle_promo .title-part {
        font-family: "양진체";
        text-transform: uppercase;
        display: block;
        color: #ffffd9;
    }
    .title_promo .title-part.line-4 {
        text-shadow: #035bb2 1px 1px, #055db2 2px 2px, #085eb1 3px 3px, #0a60b1 4px 4px, #0d61b0 5px 5px, #0f63b0 6px 6px, #1264af 7px 7px, #1466af 8px 8px, #1767ae 9px 9px, #1a68ae 10px 10px, #1c6aad 11px 11px, #1f6bad 12px 12px, #216dac 13px 13px, #246eac 14px 14px, #2670ab 15px 15px, #2971ab 16px 16px, #2b72aa 17px 17px, #2e74aa 18px 18px, #3075a9 19px 19px, #3377a9 20px 20px, #3678a8 21px 21px, #387aa8 22px 22px, #3b7ba7 23px 23px, #3d7da7 24px 24px, #407ea6 25px 25px, #427fa6 26px 26px, #4581a5 27px 27px, #4782a5 28px 28px, #4a84a4 29px 29px, #4d85a4 30px 30px, #4f87a3 31px 31px, #5288a3 32px 32px, #548aa2 33px 33px, #578ba2 34px 34px, #598ca1 35px 35px, #5c8ea1 36px 36px, #5e8fa0 37px 37px, #6191a0 38px 38px, #63929f 39px 39px, #66949f 40px 40px, #69959e 41px 41px, #6b969e 42px 42px, #6e989d 43px 43px, #70999d 44px 44px, #739b9c 45px 45px, #759c9c 46px 46px, #789e9b 47px 47px, #7a9f9b 48px 48px, #7da19a 49px 49px, #80a29a 50px 50px, #82a399 51px 51px, #85a598 52px 52px, #87a698 53px 53px, #8aa897 54px 54px, #8ca997 55px 55px, #8fab96 56px 56px, #91ac96 57px 57px, #94ae95 58px 58px, #96af95 59px 59px, #99b094 60px 60px, #9cb294 61px 61px, #9eb393 62px 62px, #a1b593 63px 63px, #a3b692 64px 64px, #a6b892 65px 65px, #a8b991 66px 66px, #abba91 67px 67px, #adbc90 68px 68px, #b0bd90 69px 69px, #b3bf8f 70px 70px, #b5c08f 71px 71px, #b8c28e 72px 72px, #bac38e 73px 73px, #bdc58d 74px 74px, #bfc68d 75px 75px, #c2c78c 76px 76px, #c4c98c 77px 77px, #c7ca8b 78px 78px, #c9cc8b 79px 79px, #cccd8a 80px 80px, #cfcf8a 81px 81px, #d1d089 82px 82px, #d4d289 83px 83px, #d6d388 84px 84px, #d9d488 85px 85px, #dbd687 86px 86px, #ded787 87px 87px, #e0d986 88px 88px, #e3da86 89px 89px, #e6dc85 90px 90px, #e8dd85 91px 91px, #ebde84 92px 92px, #ede084 93px 93px, #f0e183 94px 94px, #f2e383 95px 95px, #f5e482 96px 96px, #f7e682 97px 97px, #fae781 98px 98px, #fce981 99px 99px, #ffea80 100px 100px, #005ab3 0px 0px;
    }
    .smTitle_promo .title-part.line-4 {
        text-shadow: #035bb2 1px 1px, #055db2 2px 2px, #085eb1 3px 3px, #0a60b1 4px 4px, #0d61b0 5px 5px, #0f63b0 6px 6px, #1264af 7px 7px, #1466af 8px 8px, #1767ae 9px 9px, #1a68ae 10px 10px, #1c6aad 11px 11px, #1f6bad 12px 12px, #216dac 13px 13px, #246eac 14px 14px, #2670ab 15px 15px, #2971ab 16px 16px, #2b72aa 17px 17px, #2e74aa 18px 18px, #3075a9 19px 19px, #3377a9 20px 20px, #3678a8 21px 21px, #387aa8 22px 22px, #3b7ba7 23px 23px, #3d7da7 24px 24px, #407ea6 25px 25px, #427fa6 26px 26px, #4581a5 27px 27px, #4782a5 28px 28px, #4a84a4 29px 29px, #4d85a4 30px 30px, #4f87a3 31px 31px, #5288a3 32px 32px, #548aa2 33px 33px, #578ba2 34px 34px, #598ca1 35px 35px, #5c8ea1 36px 36px, #5e8fa0 37px 37px, #6191a0 38px 38px, #63929f 39px 39px, #66949f 40px 40px, #69959e 41px 41px, #6b969e 42px 42px, #6e989d 43px 43px, #70999d 44px 44px, #739b9c 45px 45px, #759c9c 46px 46px, #789e9b 47px 47px, #7a9f9b 48px 48px, #7da19a 49px 49px, #80a29a 50px 50px, #82a399 51px 51px, #85a598 52px 52px, #87a698 53px 53px, #8aa897 54px 54px, #8ca997 55px 55px, #8fab96 56px 56px, #91ac96 57px 57px, #94ae95 58px 58px, #96af95 59px 59px, #99b094 60px 60px, #9cb294 61px 61px, #9eb393 62px 62px, #a1b593 63px 63px, #a3b692 64px 64px, #a6b892 65px 65px, #a8b991 66px 66px, #abba91 67px 67px, #adbc90 68px 68px, #b0bd90 69px 69px, #b3bf8f 70px 70px, #b5c08f 71px 71px, #b8c28e 72px 72px, #bac38e 73px 73px, #bdc58d 74px 74px, #bfc68d 75px 75px, #c2c78c 76px 76px, #c4c98c 77px 77px, #c7ca8b 78px 78px, #c9cc8b 79px 79px, #cccd8a 80px 80px, #cfcf8a 81px 81px, #d1d089 82px 82px, #d4d289 83px 83px, #d6d388 84px 84px, #d9d488 85px 85px, #dbd687 86px 86px, #ded787 87px 87px, #e0d986 88px 88px, #e3da86 89px 89px, #e6dc85 90px 90px;
    }
/* 그림자 효과 */

/* 프로모션 타이틀 */
.title_promo {
	height: 100px;
	background-color: #d9eca2;
	padding: 15px;
	text-align: center;
	font-size: 3rem;
	padding: 15px;
	font-family: '양진체';
}

.title_promo_gym {
	height: 100px;
	background-color: #ffea80;
	color: #1f6bad;
	text-align: center;
	font-size: 3rem;
	padding: 15px;
	font-family: '양진체';
	text-shadow: -1px 0px #ffea80, 0px 1px #ffea80, 1px 0px #ffea80, 0px -1px #ffea80;
}

/* 핸드폰사이즈 */
.smTitle_promo {
	height: 100px;
	background-color: #d9eca2;
	color: #ffffd9;
	padding: 15px;
	text-align: center;
	font-size: 2.5rem;
	padding: 15px;
	font-family: '양진체';
}
.smTitle_promo_gym {
	height: 100px;
	background-color: #ffea80;
	color: #1f6bad;
	text-align: center;
	font-size: 2rem;
	padding: 15px;
	font-family: '양진체';
	text-shadow: -1px 0px #ffea80, 0px 1px #ffea80, 1px 0px #ffea80, 0px -1px #ffea80;
}

/* 칼럼 */
.carousel-inner{
	font-family: 'LeferiPoint-WhiteObliqueA';
	font-weight: 600;
}

/* 부위별 */
.cls_partEx *{
	font-weight: 600;
}

/* 헬스장 목록 */
.promo_gym {
	overflow: hidden; -
	-bs-gutter-x: 0px;
	margin-top: 20px;
	margin-bottom: 100px;
	font-family: 'LeferiPoint-WhiteObliqueA';
	font-weight: 600;
}

.promo_gym .card-body {
	padding: 0px;
	padding-left: 10px;
	padding-top: 10px;
}

.card_gym {
	border: 1px solid #97C4B8;
	margin-bottom: 10px;
}

.list-group-item {
	border: none;
	padding: 2px;
	margin-left: 10px;
}

/* 식품 목록*/
.title_promo_food {
	height: 100px;
	background-color: #FFE4C0;
	color: #e2b34e;
	text-align: center;
	font-size: 3rem;
	padding: 15px;
	font-family: '양진체';
}
/* 핸드폰사이즈 */
.smTitle_promo_food {
	height: 100px;
	background-color: #FFE4C0;
	color: #e2b34e;
	text-align: center;
	font-size: 2.5rem;
	padding: 15px;
	font-family: '양진체';
}

.promo_food, .cls_partEx {
	margin-top: 20px;
	margin-bottom: 100px;
	font-family: 'LeferiPoint-WhiteObliqueA';
	font-weight: 600;
}
.promo_food img{
	height: 15rem;
}
.card{
	margin-bottom: 20px;
}
.card-title {
	font-family: 'LeferiPoint-WhiteObliqueA';
	font-weight: 600;
}
.card_text{
	margin-bottom: 10px;
}

/* 음식 프로모션 텍스트 효과 */
@import url("https://fonts.googleapis.com/css?family=Baloo+Thambi");

    .title_promo_food > span {
        text-transform: uppercase;
        animation: glow 2s ease-in-out infinite;
    }
    .smTitle_promo_food > span {
        text-transform: uppercase;
        animation: glow 2s ease-in-out infinite;
    }

    @keyframes glow {
        0%,
        100% {
            color: #e65b49;
            text-shadow: 0 0 10px #fdde30;
            /* , 0 0 50px #f8ede0, 0 0 100px #fac585; */
            }
        10%,
        90% {
            color: #e2b34e;
            text-shadow: none;
        }
    }
    .text-container > span:nth-child(2) {
        animation-delay: 0.25s;
    }
/* 음식 프로모션 텍스트 효과 끝 */

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
		<div class="empty"></div>
        <!-- 칼럼 -->
        <div class="row cls_column">
            <div class="col">
                <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0"
                            class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
                            aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"
                            aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <a href="/view.column?column_seq=${columnList[17].column_seq}"><img id="calumn_src" name="calumn_src" src="/files/${columnList[17].column_src}" class="d-block w-100"></a>
                            <div class="carousel-caption d-none d-md-block">
                                <h3 id="calumn_title" style="font-weight:600;">${columnList[17].column_title}</h3>
                                <%--<p>${columnList[0].column_content}</p> --%>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <a href="/view.column?column_seq=${columnList[15].column_seq}"><img id="calumn_src" name="calumn_src" src="/files/${columnList[15].column_src}" class="d-block w-100"></a>
                            <div class="carousel-caption d-none d-md-block">
                                <h3 id="calumn_title" style="font-weight:600;">${columnList[15].column_title}</h3>
                                <%-- <p>${columnList[1].column_content}</p> --%>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <a href="/view.column?column_seq=${columnList[10].column_seq}"><img id="calumn_src" name="calumn_src" src="/files/${columnList[10].column_src}" class="d-block w-100"></a>
                            <div class="carousel-caption d-none d-md-block">
                                <h3 id="calumn_title" style="font-weight:600;">${columnList[10].column_title}</h3>
                                <%-- <p>${columnList[2].column_content}</p> --%>
                            </div>
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions"
                        data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions"
                        data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </div>
        <!-- 칼럼 끝 -->
        <div class="empty"> </div>
        <!-- 부위별 운동-->
        <div class="smTitle d-sm-none">
            <div class="waviy">
                <span style="--i:1">오늘</span>
                <span style="--i:2">할</span>
                <span style="--i:3">운동은&nbsp;</span>
                <span style="--i:5">?</span>
            </div>
        </div>
        <div class="title d-none d-sm-block">
            <div class="waviy">
                <span style="--i:1">오늘은</span>
                <span style="--i:2">어떤&nbsp;</span>
                <span style="--i:3">운동을&nbsp;</span>
                <span style="--i:4">할까&nbsp;</span>
                <span style="--i:5">?</span>
            </div>
        </div>
        <div class="row cls_partEx">
        
        	<div class="col-12 d-flex justify-content-center">
				<a href="/list.part?part_class=유산소&curPage=1" style="text-decoration: none; color: black;">
					<div class="card" style="height: 100%;">
						<img style="height: 100%; " src="../imgs/run.jpg" class="card-img-top" id="rowerBody">
						<div class="card-body">
							<h2 class="card-text d-flex justify-content-center">효율적인 유산소 운동</h2>
						</div>
					</div>
				</a>
			</div>
			<div class="col-6 d-flex justify-content-center" style="padding-right: 0px;">
				<a href="/list.part?part_class=상체&curPage=1" style="text-decoration: none; color: black;">
					<div class="card" style="height: 100%;">
						<img style="height: 100%;" src="../imgs/upperBody.jpg" class="card-img-top" id="upperBody">
						<div class="card-body">
							<h2 class="card-text d-flex justify-content-center">상체 운동</h2>
						</div>
					</div>
				</a>
			</div>
			<div class="col-6 d-flex justify-content-center" style="padding-left: 0px;">
				<a href="/list.part?part_class=하체&curPage=1" style="text-decoration: none; color: black;">
					<div class="card" style="height: 100%;">
						<img style="height: 100%;" src="../imgs/rowerBody.jpg" class="card-img-top" id="rowerBody">
						<div class="card-body">
							<h2 class="card-text d-flex justify-content-center">하체 운동</h2>
						</div>
					</div>
				</a>
			</div>
			
        </div>
        <!-- 부위별 운동 끝 -->
        <!-- 프로모션 -->
        <div class="smTitle_promo d-sm-none">
            <div class="content">
                  <span class="title-part line-4">6월 프로모션</span>
            </div>
        </div>
        <div class="smTitle_promo_gym d-sm-none">
            여름대비 할인 진행 중!
        </div>
        <div class="title_promo d-none d-sm-block">
            <div class="content">
                  <span class="title-part line-4">6월 프로모션</span>
            </div>
        </div>
        <div class="title_promo_gym d-none d-sm-block">
            여름대비 할인 진행 중!
        </div>
        <!-- 헬스장 -->
        <div class="row promo_gym">
        	<c:choose>
            	<c:when test="${gymList.size() == 0}">
            		<div>등록된 프로모션이 없습니다.</div>
            	</c:when>
            	<c:otherwise>
            		<c:forEach items="${gymList}" var="dtoGymPromo">
            			<div class="col-6 col-sm-3 d-flex justify-content-center" style="margin-botton: 20px;">
               				<div class="card card_gym" style="width: 18rem;">
                    			<a href="/detail.gym?gym_seq=${dtoGymPromo.gym_seq}" style="text-decoration: none; color:black; height: 100%;">
                        			<img id="gym_src" src="/files/${dtoGymPromo.gym_src_main}" class="card-img-top" style="height: 100%;">
                    			</a>
                        			<div class="card-body">
                            			<h5 class="card-title" id="gym_name">${dtoGymPromo.gym_name}</h5>
                        			</div>
                    			<ul class="list-group list-group-flush">
                        			<li class="list-group-item d-flex justify-content-end" id="gym_month">${dtoGymPromo.gym_month}개월</li>
                        			<li class="list-group-item d-flex justify-content-end" id="gym_price">${dtoGymPromo.gym_price}원</li>
                        			<li class="list-group-item d-flex justify-content-end">★당퍼트 쿠폰 OK★</li>
                    			</ul>
                			</div>
            			</div>
            		</c:forEach>
            	</c:otherwise>
            </c:choose>
        </div>
        <!-- 헬스장 끝 -->
        <!-- 식품 -->
        <div class="smTitle_promo_food d-sm-none">
            식단관리도
            <span>맛있게!</span>
        </div>
        <div class="title_promo_food d-none d-sm-block">
            식단관리도
            <span>맛있게!</span>
        </div>
        <div class="row promo_food">
            <c:choose>
            	<c:when test="${foodList.size() == 0}">
            		<div>등록된 프로모션이 없습니다.</div>
            	</c:when>
            	<c:otherwise>
            		<c:forEach items="${foodList}" var="dtoFoodPromo">
                		<div class="col-6 col-sm-3 d-flex justify-content-center">
                			<div class="card">
                				<c:choose>
                					<c:when test="${loginSession.user_auth eq 'member' || loginSession.user_auth eq 'admin' || loginSession.user_auth eq 'manager'}">
                        				<a href="/listLogin.food" style="text-decoration: none; color:black;">
                        				<img src="/files/${dtoFoodPromo.food_src}" id="food_src" class="card-img-top"></a>	
                        			</c:when>
                        			<c:otherwise>
                        				<a href="/list.food" style="text-decoration: none; color:black;">
                            			<img src="/files/${dtoFoodPromo.food_src}" id="food_src" class="card-img-top"></a>
                            		</c:otherwise>
                            	</c:choose>
                            	<div class="card-body">
                            		<h5 class="card-title card_text" id="food_title" style="height:40%;">${dtoFoodPromo.food_title}</h5>
                        			<p class="card-text card_text" id="food_name" style="height:35%;">${dtoFoodPromo.food_name}</p>
                        			<p class="card-text d-flex justify-content-end"><small class="text-muted" id="food_price">${dtoFoodPromo.food_price}&nbsp;원</small></p>
                    			</div>
                    		</div>
                		</div>
                	</c:forEach>
            	</c:otherwise>
            </c:choose>
        </div>
        <!-- 식품 끝 -->
        <!-- 프로모션 끝 -->
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

</body>
</html>