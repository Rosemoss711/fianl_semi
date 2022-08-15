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
<title>식품 프로모션</title>
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
/* 목록 */
.title {
	color: #97C4B8;
	border-bottom: 1px solid #97C4B8; -
	-bs-gutter-x: 0px;
	margin-bottom: 20px;
	margin-top: 10px;
	font-family: '양진체';
}

.card {
	width: 35rem;
	border: 1px solid #c9d4a9;
	font-family: 'LeferiPoint-WhiteObliqueA';
	font-weight: 600;
	margin-bottom: 20px;
}

.card img {
	width: 100%;
	height: 20rem;
}

.card-title {
	margin-bottom: 0px;
	font-family: 'LeferiPoint-WhiteObliqueA';
	font-weight: 600;
}

.card a {
	text-decoration: none;
	color: black;
}

.card h5 {
	padding: 20px;
}

.foodPromo {
	margin-bottom: 80px;
}

.btnAdd {
	background-color: #73b1a1;
	border: 1px solid #F0FFC2;
	border-radius: 0.25rem;
	padding: 5px;
	padding-top: 10px;
	padding-left: 10px;
	padding-right: 10px;
	font-family: 'LeferiPoint-WhiteObliqueA';
	font-weight: 600;
	color: white;
}

.btnAdd:hover {
	background-color: #F0FFC2;
	border: 1px solid #73b1a1;
	color: #73b1a1;
}

/* 즐겨찾기 버튼 */
.btnFavorite {
	border: none;
	background-color: white;
}
/* 즐겨찾기 하트 */
.material-symbols-outlined {
	font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 48
}

.ImgFavorite {
	width: 20px;
	height: 20px;
}

#redHeart {
	width: 20px;
	height: 20px;
}

#emptyHeart {
	width: 20px;
	height: 20px;
}

.heartBtn {
	border: none;
	background-color: white;
}
</style>

<body>
	<div class="container">
		<!-- 헤더 -->
		<jsp:include page="/frame/header.jsp"/>
		<!-- 식품 프로모션 목록 -->
		<div class="empty"></div>
		<div class="row title">
			<div class="col d-flex justify-content-center">
				<h1>이달의 프로모션!</h1>
			</div>
			<img src="/imgs/banner.jpg">
		</div>
		<div class="foodPromo">
			<div class="row cardList">
				<div class="empty"></div>
				<%-- 홈관리자만 버튼 노출 --%>
				<c:if test="${loginSession.user_auth eq 'manager'}">
					<div class="col">
						<button class="btn btnAdd" type="button" id="btnAdd" name="btnAdd">신규 등록</button>
					</div>
				<div class="empty"></div>
				</c:if>
				<%-- 홈관리자만 버튼 노출 끝 --%>
				<c:choose>
					<c:when test="${listPromo.size() == 0}">
						<div>등록된 프로모션이 없습니다.</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${listPromo}" var="dtoPromo" end="3">
							<div class="col-6 d-flex justify-content-center">
								<div class="card" onclick="guestMsg()" style="cursor:pointer;">
									<a href="${dtoPromo.food_com}"> <img
										src="/files/${dtoPromo.food_src}" class="card-img-top">
										<h5 class="card-title">${dtoPromo.food_name}</h5> <input
										type="text" class="d-none" value="${dtoPromo.food_seq}">
									</a>
									<div class="card-body">
										<p id="food_title" class="card-text">${dtoPromo.food_title}</p>
										<p class="card-text food_price d-flex justify-content-end">${dtoPromo.food_price}&nbsp;원</p>
										<div class="col favorite d-flex justify-content-end">
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<div class="empty"></div>
				<div class="empty"></div>
			</div>
			<!-- 식품 프로모션 목록 끝 -->
			<!-- 헬린이 프로모션 목록 -->
			<div class="row title">
				<div class="col d-flex justify-content-center">
					<h1>헬린이 안성맞춤 세트</h1>
				</div>
			</div>
			<div class="foodPromo">
				<div class="row cardList">
					<c:choose>
						<c:when test="${list.size() == 0}">
							<div>등록된 프로모션이 없습니다.</div>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="dto" end="3">
								<div class="col-6 d-flex justify-content-center">
									<div class="card" onclick="guestMsg()" style="cursor:pointer;">
										 <a href="${dtoPromo.food_com}"> <img
											src="/files/${dto.food_src}" class="card-img-top">
											<h5 class="card-title">${dto.food_name}</h5> <input
											type="text" class="d-none" value="${dto.food_seq}">
										</a>
										<div class="card-body">
											<p id="food_title" class="card-text">${dto.food_title}</p>
											<p class="card-text d-flex food_price justify-content-end">${dto.food_price}&nbsp;원</p>
											<div class="col favorite d-flex justify-content-end">
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<!-- 헬린이 프로모션 목록 끝 -->
		<div class="empty"></div>
		<!-- footer -->
        <jsp:include page="/frame/footer.jsp"/>
	</div>
	<script>
	$(".btnAdd").on("click", function(){
    	location.href = "/modifyList.food?curPage=1";
    })
	
    $("#emptyHeartBtn").on("click", function(e) {
		let yn = confirm("즐겨찾기에 추가하시겠습니까?");

		if (yn) {
			location.href = "/interest.food";
		}else {
			return false;
		}

	})
	
	$("#redHeartBtn").on("click", function(e){
		alert("즐겨찾기에서 삭제하시겠습니까?");
		location.href="/delInterest.food";
	})
        
	function guestMsg(){
		let answer = confirm("회원 전용 메뉴입니다. 로그인하시겠습니까?");
		if(answer){
			$("a").attr("href", "/user/login.jsp");
			return;
		}else{
			$("a").attr("href", "/list.food");
			return;
		}
	}
         
        /* let num =  $(".food_price").html();
        function numbeComma(num){
        	return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }
        console.log(numbeComma(15315)); */
        
        
    </script>
</body>
</html>