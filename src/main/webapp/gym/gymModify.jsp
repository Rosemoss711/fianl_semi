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
<!-- text area auto size -->        
<script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
<!-- 구글 아이콘 -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<!-- 다음 주소 -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=40927a14f44e1c75637977bc1c89c8a4&libraries=services"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<title>운동시설 등록페이지</title>
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

/* 버튼 */
.btnSpace {
	margin-bottom: 10px;
	font-family: 'LeferiPoint-WhiteObliqueA';
	font-weight: 600;
}

.btnBuy {
	width: 100%;
	height: 60px;
	font-weight: 600;
}

.btnAdd, .btnMainPic, .btnPics, .btnBuy, .btnCancle, .btnAddr, .btnDtailPics {
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

.btnAdd:hover, .btnMainPic:hover, .btnPics:hover, .btnBuy:hover, .btnCancle:hover, .btnAddr:hover, .btnDtailPics:hover {
	background-color: #F0FFC2;
	border: 1px solid #73b1a1;
	color: #73b1a1;
}

/* 목록 */
.title {
	color: #97C4B8;
	border-bottom: 1px solid #97C4B8;
	-bs-gutter-x: 0px;
	margin-bottom: 20px;
	margin-top: 10px;
	font-family: '양진체';
}

.list-item-wrap {
	margin-top: 40px;
	font-family: 'LeferiPoint-WhiteObliqueA';
	font-weight: 600;
	padding: 10px;
}
/* 디테일 헤더 */
.detailHeader {
	margin-bottom: 40px;
}

.form-select {
	font-weight: 600;
}

.detailPhotoWrap {
	height: 90%;
}

.detailPhoto img {
	width: 100%;
	height: 100%;
}

.gym_input {
	width: 100%;
	border: none;
	font-weight: 600;
	height: 50px;
}

.gym_input:focus {
	outline: none;
	border-bottom: 1px solid #b6e0db;
}

input::placeholder, textarea::placeholder {
	color: #adcabf;
}
.priceInput label{
	text-align:center;
	color: #97C4B8;
}

/* 디테일 바디 */
.detailBody {
	margin-bottom: 30px;
}

.gymContentsText {
	padding: 30px;
	font-weight: 600;
	text-align: center;
	color: #73b1a1;
}

.content {
	text-align: center;
}

.content_img {
	padding-inline: 10%;
	margin-bottom: 20px; -
	-bs-gutter-x: 1rem;
}

.btnAddPic {
	width: 100%;
}

.gym_textarea {
	width: 70%;
	height: 4rem;
	border: 1px solid #709c91;
	overflow: hidden;
	resize: none;
	font-weight: 600;
	text-align: center;
}

.gym_textarea:focus {
	outline: 1px solid #709c91;
}

.noticePic img {
	width: 100%;
	height: 100%;
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
		<div class="empty"></div>
		<!-- 타이틀 -->
		<div class="list-item-wrap">
			<form id="modifyForm" action="/modifyProc.gym" method="post" enctype="multipart/form-data">
			<div class="row detailHeader">
			<input class="d-none" type="text" name="gym_seq" value="${dto.gym_seq}">
                <div class="detailPhoto col-12 col-md-6">
                    <div class="row detailPhotoWrap">
                        <div class="col-12 detailPhoto d-flex justify-content-end">
                        	<c:if test="${empty dto.gym_src_main}">
                        		<input class="srcVal d-none" type="text" value="0">
								<img src="" id="gym_src_img">
							</c:if>
							<c:if test="${not empty dto.gym_src_main}">
								<input class="srcVal d-none" type="text" value="1">
								<img src="/files/${dto.gym_src_main}" id="gym_src_img">
							</c:if>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 d-flex justify-content-center">
                        <%-- 사진 등록 --%>
                        	<label class="btn btnPics" for="gym_src_main" style="width:100%;">사진 수정</label>
                            <input class="form-control" type="file" id="gym_src_main" name="gym_src_main" 
                            style="display: none;" value="${dto.gym_src_main}">
                        </div>
                    </div>
                </div>
                <div class="row d-md-none" style="margin-top: 50px;"></div>
                <div class="col-1"></div>
                <div class="col-12 col-md-5">
                    <div class="row">
                        <div class="col-8 gymTitle align-items-center">
                            <input class="gym_input" type="text" id="gym_name" name="gym_name" style="font-size: large;" placeholder="상호명 입력" value="${dto.gym_name}">
                        </div>
                        <div class="col d-flex justify-content-end">
                            <span class="material-symbols-outlined" style="padding-right: 5px;">mood</span>
                            <span class="material-symbols-outlined" style="padding-right: 5px;">wifi</span>
                        </div>
                        <hr style="height:2px; width:100%; border:none; background-color:#37b192;">
                        <div class="row">
                            <div class="col d-flex justify-content-end">
                                <input class="gym_input" type="text" id="gym_postcode" name="gym_postcode" style="width: 100px;" placeholder="우편번호" value="${dto.gym_postcode}" readonly >
                                <button class="btn btnAddr" type="button" onclick="daumPostcode()">주소찾기</button>
                            </div>
                            <div class="col-12">
                                <input class="gym_input" type="text" id="gym_roadAddr" name="gym_roadAddr" placeholder="도로명주소" value="${dto.gym_roadAddr}" readonly>
                                <input class="gym_input" type="text" id="gym_detailAddr" name="gym_detailAddr" placeholder="상세주소 입력" value="${dto.gym_detailAddr}">
                                <input class="gym_input" type="text" id="gym_extraAddr" name="gym_extraAddr" placeholder="표시될 주소" value="${dto.gym_extraAddr}" readonly>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-1 d-flex align-items-center">
                                <span class="material-symbols-outlined">
                                    call
                                </span>
                            </div>
                            <div class="col d-flex align-items-center">
                                <input class="gym_input" type="text" id="gym_phone" name="gym_phone" placeholder="전화번호 입력" value="${dto.gym_phone}">
                            </div>
                        </div>
                        <hr style="height:2px; width:100%; border:none; background-color:#37b192;">
                        <div class="row priceInput">
                            <label style="margin-top:20px;">회원권 가격 수정</label>
                            <div class="col-6 d-flex align-items-center"><label>개월수 수정 : </label></div>
                            <div class="col">
                             	<input class="gym_input" type="text" id="gym_month" name="gym_month1" placeholder="개월수(숫자만) 입력" value="${dto.gym_month}">
                             </div>
                             <div class="col-6 d-flex align-items-center"><label>가격 수정 : </label></div>
                            <div class="col">
                             	<input class="gym_input" type="text" id="gym_price" name="gym_price1" placeholder="가격(숫자만) 입력" value="${dto.gym_price}">
                        	</div>
                            
                            <%--<div class="col">
                            <label>옵션2</label>
                             <input class="gym_input" type="text" id="gym_month" name="gym_month2" style="text-align: center;" placeholder="개월수(숫자만) 입력" value="${dto.gym_month}">
                             <input class="gym_input" type="text" id="gym_price" name="gym_price2" style="text-align: center;" placeholder="가격(숫자만) 입력" value="${dto.gym_price}">
                        	</div>
                            <div class="col">
                            <label>옵션3</label>
                             <input class="gym_input" type="text" id="gym_month" name="gym_month3" style="text-align: center;" placeholder="개월수(숫자만) 입력" value="${dto.gym_month}">
                             <input class="gym_input" type="text" id="gym_price" name="gym_price3" style="text-align: center;" placeholder="가격(숫자만) 입력" value="${dto.gym_price}">
                        	</div> --%>
                        </div>
                       <%-- <div class="empty"></div>
                        <div class="col d-flex justify-content-center">
                            <button class="btn btnBuy" type="button">회원권 옵션 추가 등록</button>
                        </div> --%>
                    </div>
                </div>
            </div>
			<!-- 상세페이지 헤더 끝-->
			<div class="row detailBody">
				<hr
					style="height: 2px; width: 100%; border: none; background-color: #37b192;">
				<div class="notice">
					<div class="row">
						<div class="col">
							<h4 class="gymContentsText">공지사항</h4>
						</div>
					</div>
				<div class="row">
                        <div class="col content">
                            <textarea class="gym_textarea" name="gym_comment" placeholder="공백 포함 500글자 이내로 입력하세요.">${dto.gym_comment}</textarea>
                        </div>
                    </div>
                    <div class="empty"></div>
                </div>
				<hr style="height: 2px; width: 100%; border: none; background-color: #37b192; text-align: center; margin: auto;">
				<div class="noticeTime">
					<div class="row">
						<div class="col">
							<h4 class="gymContentsText">운영시간</h4>
						</div>
					</div>
					<div class="row">
						<div class="col content">
							<textarea class="gym_textarea" name="gym_time"
								placeholder="예)AM 08:00 ~ PM 22:00 연중무휴">${dto.gym_time}</textarea>
						</div>
					</div>
					<div class="empty"></div>
				</div>
				<hr
					style="height: 2px; width: 100%; border: none; background-color: #37b192; text-align: center; margin: auto;">
				<div class="noticeInfo">
					<div class="row">
						<div class="col" style="text-align: center;">
							<h4 class="gymContentsText">운영 프로그램</h4>
						</div>
					</div>
					<div class="row d-flex justify-content-center">
					
					
						<%--<div class="form-check">
  							<input class="form-check-input" type="checkbox" name="gym_program" value="헬스" id="flexCheckDefault">
  							<label class="form-check-label" for="flexCheckDefault">헬스</label>
						</div>
						<div class="form-check">
  							<input class="form-check-input" type="checkbox" name="gym_program" value="P.T" id="flexCheckChecked">
  							<label class="form-check-label" for="flexCheckChecked">P.T</label>
						</div>
						<div class="form-check">
  							<input class="form-check-input" type="checkbox" name="gym_program" value="G.X" id="flexCheckChecked">
  							<label class="form-check-label" for="flexCheckChecked">G.X</label>
						</div>
						<div class="form-check">
  							<input class="form-check-input" type="checkbox" name="gym_program" value="요가" id="flexCheckChecked">
  							<label class="form-check-label" for="flexCheckChecked">요가</label>
						</div>
						<div class="form-check">
  							<input class="form-check-input" type="checkbox" name="gym_program" value="필라테스" id="flexCheckChecked">
  							<label class="form-check-label" for="flexCheckChecked">필라테스</label>
						</div>
						<div class="form-check">
  							<input class="form-check-input" type="checkbox" name="gym_program" value="격투기" id="flexCheckChecked">
  							<label class="form-check-label" for="flexCheckChecked">격투기</label>
						</div> --%>
						
						
						<c:if test="${empty programDTO}">
                    		<textarea class="gym_textarea" name="gym_program"
								placeholder="예)무료
O.T(3개월 2회 / 6개월 4회 / 12개월 8회 세미 P.T 제공)"></textarea>
                    	</c:if>
                    	<c:if test="${not empty programDTO}">
                    		<c:forEach items="${programDTO}" var="programDTO">
                        		<textarea class="gym_textarea" name="gym_program"
								placeholder="예)무료
O.T(3개월 2회 / 6개월 4회 / 12개월 8회 세미 P.T 제공)">${programDTO.gym_program}</textarea>
                        	</c:forEach>
                        </c:if>
                        
					</div>
				<div class="empty"></div>
			</div>
				<hr
					style="height: 2px; width: 100%; border: none; background-color: #37b192; text-align: center; margin: auto;">
				<div class="noticePic">
					<div class="row">
						<div class="col-12">
							<h4 class="gymContentsText">운동시설 사진</h4>
						</div>
					</div>
					<div class="row content_img">
                    	<c:if test="${empty gymfolderDTO}">
                    		<div class="col srcImg">
                        	</div>
                        	<div class="col srcImg">
                        	</div>
                        	<div class="col srcImg">
                        	</div>
                    	</c:if>
                    	<c:if test="${not empty gymfolderDTO}">
                    		<c:forEach items="${gymfolderDTO}" var="gymfolderDTO">
                        		<div class="col-4" style="margin-bottom:20px;">
                            		<img class="rounded" id="gym_src_img" src="/files/${gymfolderDTO.gym_src}">
                        		</div>
                        	</c:forEach>
                        </c:if>
                    </div>
                    <div class="col d-flex justify-content-center">
						<div><label class="btn btnDtailPics" for="gym_src_add">추가사진 등록</label>
                            <input class="form-control" type="file" id="gym_src_add" name="gym_src_add" style="display: none;"></div>
						</div>
						<div><img id="gym_src_imgAdd" class="gym_srcLoad" src=""></div>
					<div class="empty"></div>
				</div>
				<hr
					style="height: 2px; width: 100%; border: none; background-color: #37b192; text-align: center; margin: auto;">
				<div class="noticeMap">
					<div class="row">
						<div class="col">
							<h4 class="gymContentsText">운동시설 위치</h4>
						</div>
						<!-- 카카오 맵 -->
						<div class="row">
							<div class="col content" id="map" style="width: 500px; height: 400px;"></div>
						</div>
						<!-- 카카오 맵 끝 -->
					</div>
						<div class="empty"></div>
				</div>
					<hr style="height: 2px; width: 100%; border: none; background-color: #37b192; text-align: center; margin: auto;">
				</div>
			</form>
				</div>
			<div class="row">
				<div class="col-12 d-flex justify-content-end">
					<button type="button" class="btn btnCancle">취소</button>
					<button type="button" class="btn btnAdd">완료</button>
				</div>
			</div>
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
                <div class="col"><a href="/user/information.jsp">센터등록요청하기</a></div>
                <div class="col"><a href="/user/information.jsp">문의하기</a></div>
            </div>
            <p>Copyright ⓒ Dangpert Co., Ltd. All rights reserved.</p>
        </div>
        <!-- footer 끝 -->
	</div>

	<script>
	$(".btnCancle").on("click", function(){
    	location.href = "/list.gym";
	})
	
	autosize($("textArea"));
	
	$(".btnAdd").on("click", function(){
		let regexPrice = /^[0-9]+$/;
		let nameReg = /^.{1,30}$/;
		let commentReg = /^.{1,666}/;
		
		if ($("#gym_name").val() === "") {
			alert("상호를 입력하세요.");
			$("#gym_name").focus();
			return;
		} else if ($("#gym_time").val() === ""){
			alert("운영 시간을 입력해주세요.");
			$("#gym_time").focus();
			return;
		} else if ($("#gym_comment").val() === "") {
			alert("설명을 입력하세요.");
			$("#gym_comment").focus();
			return;
		} else if($("#gym_program").val() === "") {
			alert("운영 프로그램을 입력해주세요.");
			$("#gym_program").focus();
			return;
		}else if (!regexPrice.test($("#gym_price").val())) {
			alert("가격을 숫자로 입력하세요.");
			$("#gym_price").focus();
			return;
		} else if (!regexPrice.test($("#gym_month").val())){
			alert("개월수는 숫자만 입력해주세요.");
			$("#gym_month").focus();
			return;
		} else if (!nameReg.test($("#gym_name").val())){
			alert("상호명이 너무 깁니다.");
			$("#gym_name").focus();
			return;
		} else if (!commentReg.test($("#gym_comment").val())){
			alert("공지사항 글자수를 줄여주세요.");
			$("#gym_comment").focus();
			return;
		} else if (!commentReg.test($("gym_program").val())){
			alert("운영 프로그램 글자수를 줄여주세요.");
			$("#gym_program").focus();
			return;
		}
		
		let answer = confirm("정말 수정하시겠습니까?");
		if(answer){
			$("#modifyForm").submit();
		}
	})
		
	// 이미지 미리보기
	$("#gym_src_main").change(function(){
    	setImageFromFile(this, "#gym_src_mainImg");
    	console.log(this.val());
	});

	$("#gym_src_add").change(function(){
    	setImageFromFile(this, "#gym_src_imgAdd");
	});
	function setImageFromFile(input, expression) {
    	if (input.files && input.files[0]) {
        	var reader = new FileReader();
        	reader.onload = function (e) {
          	  $(expression).attr("src", e.target.result);
        	}
        reader.readAsDataURL(input.files[0]);
    	}
	}
	
	/* 다음 주소 */
	function daumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== ''
								&& /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// ㅇㅇ시 ㅇㅇ구 엑스트라 주소
						if (extraRoadAddr !== '') {
							extraRoadAddr = data.sido + ' ' + data.sigungu;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('gym_postcode').value = data.zonecode;
						document.getElementById("gym_roadAddr").value = roadAddr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("gym_detailAddr").focus();
						
						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("gym_extraAddr").value = extraRoadAddr;
						} else {
							document.getElementById("gym_extraAddr").value = '';
						}
					}
				}).open();
	};

	/* 카카오 맵 */
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3 // 지도의 확대 레벨
	};

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	let gym_extraAddr = $("#gym_roadAddr").val();
	console.log(gym_extraAddr);
	geocoder
			.addressSearch(
					gym_extraAddr,
					function(result, status) {

						// 정상적으로 검색이 완료됐으면 
						if (status === kakao.maps.services.Status.OK) {

							var coords = new kakao.maps.LatLng(result[0].y,
									result[0].x);
							
							// 결과값으로 받은 위치를 마커로 표시합니다
							var marker = new kakao.maps.Marker({
								map : map,
								position : coords
							});

							// 인포윈도우로 장소에 대한 설명을 표시합니다
							var infowindow = new kakao.maps.InfoWindow(
									{
										content : '<div style="width:150px;text-align:center;padding:6px 0;">'
												+ $("#gym_name").val()
												+ '</div>'
									});
							infowindow.open(map, marker);

							// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							map.setCenter(coords);
						}
					});
	</script>
</body>
</html>