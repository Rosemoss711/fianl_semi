<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 다음 주소 -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
<title>운동시설 프로모션</title>
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
/* 운동시설 목록 */
.title {
	color: #97C4B8;
	border-bottom: 1px solid #97C4B8; -
	-bs-gutter-x: 0px;
	margin-bottom: 20px;
	margin-top: 10px;
	font-family: '양진체';
}
/* 버튼 */
.btnSpace {
	margin-bottom: 10px;
	font-family: 'LeferiPoint-WhiteObliqueA';
	font-weight: 600;
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
/* 운동시설 목록 */
#searchLocation {
	text-align: end;
	width: 25%;
	font-weight: 600;
	height: 40px;
	border: 1px solid #97C4B8;
	margin-right: 10px;
}

#searchLocation:focus {
	outline: none;
	border-bottom: 1px solid #b6e0db;
}

#searchLocation::placeholder {
	color: #adcabf;
}

#location {
	color: #97C4B8;
}

.card {
	width: 30rem;
	border: 1px solid #c9d4a9;
	font-family: 'LeferiPoint-WhiteObliqueA';
	font-weight: 600;
	margin-bottom: 20px;
}

.card img {
	width: 100%;
	height: 15rem;
}

.card-title {
	margin-bottom: 0px;
	font-family: 'LeferiPoint-WhiteObliqueA';
	font-weight: bold;
}

.card a {
	text-decoration: none;
	color: black;
}

.card h5 {
	padding-left: 10px;
	padding-top: 10px;
}

.card-body {
	padding: 20px;
	padding-bottom: 10px;
}

.gymPromo {
	margin-bottom: 80px;
}

.gymPlace {
	margin-bottom: 80px;
}
/* 즐겨찾기 버튼 */
.btnFavorite {
	border: none;
	background-color: white;
}
/* 즐겨찾기 하트 */
.material-symbols-outlined {
	font-variation-settings: 'FILL' 1, 'wght' 400, 'GRAD' 200, 'opsz' 48
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

/* 종류 표시 버튼 */
.buttonImg {
	background-color: #73b1a1;
	width: 50px;
	height: 20px;
	border-radius: 45%;
	color: white;
	text-align: center;
	align-items: center;
	/* font-family: 'SuncheonB'; */
	font-size: small;
}
</style>

<body>
	<div class="container">
		<!-- 헤더 -->
		<jsp:include page="/frame/header.jsp"/>
	<div class="container">
		<div class="row title" style="margin-top: 50px;">
			<div class="col d-flex justify-content-center">
				<h1>내 주변 운동시설 둘러보기</h1>
			</div>
		</div>
		<div class="gymPlace">
			<!-- 주변 운동시설 목록 -->
			<div class="row btnSpace">
				<div class="col d-flex justify-content-end">
					<input class="form-control" type="text" id="searchLocation"
						name="searchLocation" placeholder="관심 지역 검색"> <span
						class="material-symbols-outlined d-flex align-items-center"
						id="location" style="cursor: pointer;">add_circle</span>
				</div>
				<div class="row d-flex justify-content-end align-items-end">
				<c:if test="${loginSession.user_auth eq 'manager' || loginSession.user_auth eq 'admin'}">
					<div class="col">
						<button class="btn btnAdd" type="button" id="btnAdd" name="btnAdd">신규 등록</button>
					</div>
				</c:if>
				</div>
			</div>
			<div class="row cardListLocation">
				<c:choose>
					<c:when test="${gym_dto.size() == 0}">
						<div>등록된 프로모션이 없습니다.</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${gym_dto}" var="dtoPromo" varStatus="listStatus" end="5">
							<div class="col-6 col-md-4 d-flex justify-content-center">
								<div class="card">
									<a href="/detail.gym?gym_seq=${dtoPromo.gym_seq}"> <img
										src="/files/${dtoPromo.gym_src_main}" class="card-img-top">
										<h5 class="card-title">${dtoPromo.gym_name}</h5>
									</a>
									<div class="card-body">
										<p class="card-text d-flex justify-content-end">${dtoPromo.gym_month}개월
											${dtoPromo.gym_price}원</p>
										<div class="col btnImg d-flex">
											<span class="buttonImg" style="margin-right: 5px;">헬스</span>
											<span class="buttonImg" style="margin-right: 5px;">P.T</span>
											<span class="buttonImg" style="margin-right: 5px;">G.X</span>
											<span class="buttonImg" style="margin-right: 5px;">요가</span>
											<!-- 즐겨찾기 버튼 시작 -->
											<div class="col d-flex justify-content-end favorite">
												<c:set var="checkInterestG" value="false" />
													<c:forEach items="${ugi_dto}" var="interestG">
														<c:if test="${interestG.gym_seq eq dtoPromo.gym_seq}">
															<c:set var="checkInterestG" value="true"/>
														</c:if>
													</c:forEach>
												<div class="ImgFavorite">
													<c:if test="${loginSession.user_auth eq 'member' || loginSession.user_auth eq 'admin' || loginSession.user_auth eq 'manager'}">
														<c:if test="${checkInterestG}">
															<button type="button" class="heartBtn redHeartBtn" id="redHeartBtn">
																<input type="text" class="d-none" value="${dtoPromo.gym_seq}"> 
																<img id="redHeart" src="../imgs/red heart.png">
															</button>
														</c:if>
														<c:if test="${not checkInterestG}">
															<button type="button" class="heartBtn emptyHeartBtn" id="emptyHeartBtn">
																<input type="text" class="d-none" value="${dtoPromo.gym_seq}">
																<img id="emptyHeart" src="../imgs/empty heart.png">
															</button>
														</c:if>
													</c:if>
												</div>
											</div>
											<!-- 즐겨찾기 버튼 끝 -->
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<!-- 주변 운동시설 목록 끝 -->
		<div class="empty"></div>
		<!-- 운동시설 프로모션 목록 -->
		<div class="row title">
			<div class="col d-flex justify-content-center">
				<h1>나에게 맞는 운동시설은?</h1>
			</div>
		</div>
		<!-- <div class="row">
			<div class="col-6 text-start"><button class="" type="button">왼쪽</button></div>
			<div class="col-6 text-end"><button class="" type="button">오른쪽</button></div>
		</div> -->
		<div class="gymPromo">
			<div class="row cardList">
				<c:choose>
					<c:when test="${gym_dto.size() == 0}">
						<div>등록된 프로모션이 없습니다.</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${gym_dto}" var="dtoPromo" end="5">
							<div class="col-6 col-md-4 d-flex justify-content-center">
								<div class="card">
									<a href="/detail.gym?gym_seq=${dtoPromo.gym_seq}"> <img
										src="/files/${dtoPromo.gym_src_main}" class="card-img-top">
										<h5 class="card-title">${dtoPromo.gym_name}</h5>
									</a>
									<div class="card-body">
										<p class="card-text d-flex justify-content-end">${dtoPromo.gym_month}개월
											${dtoPromo.gym_price}원</p>
										<div class="col btnImg d-flex">
											<span class="buttonImg" style="margin-right: 5px;">헬스</span>
											<span class="buttonImg" style="margin-right: 5px;">P.T</span>
											<span class="buttonImg" style="margin-right: 5px;">G.X</span>
											<span class="buttonImg" style="margin-right: 5px;">요가</span>
											<!-- 즐겨찾기 -->
											<div class="col d-flex justify-content-end favorite">
												<c:set var="checkInterestG" value="false"/>
												<c:forEach items="${ugi_dto}" var="interestG">
													<c:if test="${interestG.gym_seq eq dtoPromo.gym_seq}">
														<c:set var="checkInterestG" value="true"/>
													</c:if>
												</c:forEach>
												
											<div class="ImgFavorite">
											<c:if test = "${loginSession.user_auth eq 'member' || loginSession.user_auth eq 'admin' || loginSession.user_auth eq 'manager'}">
												<c:if test="${checkInterestG}">
													<button type="button" class="heartBtn redHeartBtn" id="redHeartBtn">
														<input type="text" class="d-none" value="${dtoPromo.gym_seq}"> 
														<img id="redHeart" src="../imgs/red heart.png">
													</button>
												</c:if>
												<c:if test="${not checkInterestG}">
													<button type="button" class="heartBtn emptyHeartBtn" id="emptyHeartBtn">
														<input type="text" class="d-none" value="${dtoPromo.gym_seq}"> 
														<img id="emptyHeart" src="../imgs/empty heart.png">
													</button>
												</c:if>
											</c:if>
											</div>	
											</div>
											<!-- 즐겨찾기 끝 -->
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
		<!-- 운동시설 프로모션 목록 끝 -->
		<div class="empty"></div>
		<!-- footer -->
        <jsp:include page="/frame/footer.jsp"/>
	</div>
	<script>
        $(".btnAdd").on("click", function(){
        	location.href = "/add.gym";
        })
        
        
        $("#location").on("click", function(){
        	let location = $("#searchLocation").val();
        	console.log(location);
        	
        	$.ajax({
        		url: "/searchProc.gym?searchLocation="+location
        		, type: "get"
        		, dataType: "json"
        		, success: function(data){
        			console.log(data);
        			$(".cardListLocation").empty();
        			if(data.length == 0){
        				let div = $("<div>").html("아직 준비중인 지역입니다.");
        				$(".cardListLocation").append(div);
        			}else {
        				for(let dtoPromo of data){
        					console.log(dtoPromo);
        					
        					let img = $('<img class="card-img-top">').attr("src", "/files/"+dtoPromo.gym_src_main)
        					let h5 = $('<h5 class="card-title">').html(dtoPromo.gym_name)
        					let a = $('<a>').attr("href", "/detail.gym?gym_seq="+dtoPromo.gym_seq).append(img, h5);
        					
        					//let spanFavorite = $('<span class="material-symbols-outlined">').html('favorite');
        					//let button = $('<button type="button" class="btnFavorite">').append(spanFavorite);
        					let div3 = $('<div class="col d-flex justify-content-end favorite">').append();
        					let span1 = $('<span class="buttonImg" style="margin-right:5px;">').html('헬스');
        					let span2 = $('<span class="buttonImg" style="margin-right:5px;">').html('P.T');
        					let span3 = $('<span class="buttonImg" style="margin-right:5px;">').html('G.X');
        					let span4 = $('<span class="buttonImg" style="margin-right:5px;">').html('요가');
        					let div4 = $('<div class="col btnImg d-flex">').append(span1, span2, span3, span4, div3);
        					let p = $('<p class="card-text d-flex justify-content-end">').html(dtoPromo.gym_month + '개월 ' + dtoPromo.gym_price + '원');
        					let div5 = $('<div class="card-body">').append(p, div4);
        					
        					let div2 = $('<div class="card">').append(a, div5);
        					
        					let div = $('<div class="col-6 col-md-4 d-flex justify-content-center">').append(div2);
        					
        					$(".cardListLocation").append(div);
        				}
        			}
        		}, error: function(e){
        			console.log(e);
        		}
        	})
        })
        
        
		/*즐겨찾기 버튼 효과*/
        $(".emptyHeartBtn").on("click", function(e) {
			let yn = confirm("즐겨찾기에 추가하시겠습니까?");
			if (yn) {
				location.href = "/interest.gym?gym_seq="+ $(e.target).prev().val();
			}
		})
		$(".redHeartBtn").on("click", function(e){
			alert("즐겨찾기에서 삭제하시겠습니까?");
			location.href="/delInterest.gym?gym_seq="+ $(e.target).prev().val();
		})
		
    </script>
</body>
</html>