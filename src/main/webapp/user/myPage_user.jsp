<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- text area auto size -->        
<script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script> 
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
<title>마이페이지</title>
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
	height: 80px;
}

/* 바디 */
.bodyContainer{
	font-family: 'LeferiPoint-WhiteA';
	font-weight: 600;
}

.inner-container-left {
	margin: auto;
	border: 1px solid #F0FFC2;
	box-sizing: border-box;
	height: 100%;
	background-color: #F0FFC2;
}

.inner-container-left * {
	margin: 20px;
	font-weight: 600;
	color: #80bdb7;
}

.inner-container-right {
	height: 100%;
}

.inner-container-right h5 {
	border-bottom: 2px solid #97C4B8;
	width: 400px;
	text-align: center;
	font-weight: 600;
}

.inner-container-right button {
	margin-right: 40px;
	font-weight: 600;
	padding-top: 9px;
	border: 1px solid #97C4B8;
	color: #5b7272;
}

.bookmark {
	margin-top: 10px;
	border: 1px solid #97C4B8;
	height: 600px;
	border-radius: 0.25rem;
	overflow-y: scroll;
	padding: 20px;
	margin-bottom: 50px;
}

.bookmark img{
	width: 150px;
	height: 100px;
	margin-bottom: 2px;
}

.favBox{
	border: 1px dotted #c9d4a9;
	margin-left: 20px;
	margin-right: 20px;
	margin-bottom: 10px;
	padding: 5px;
	border-radius: 0.25rem;
}
.favLabel{
	color: #89b3a8;
	
}
</style>

<body>
	<div class="container">
		<!-- 헤더 -->
		<jsp:include page="/frame/header.jsp"/>
		<div class="empty"></div>
		<!-- 바디 -->
		<div class="container bodyContainer">
			<div class="row justify-content-evenly">
				<div class="col-3">
					<h3 class="text-center mb-3" style="font-weight: 600; color: #97C4B8">My Page</h3>
				</div>
				<div class="col-6"></div>
			<div class="row justify-content-evenly">
				<div class="col-3">
					<div class="inner-container-left">
						<div>
							<button type="button" id="modifyBtn"
								style="border: none; background: none;">정보수정</button>
						</div>
						<div>
							<button type="button" id="diaryBtn"
								style="border: none; background: none;">일기</button>
						</div>
					</div>
				</div>
				<div class="col-6">
					<div class="inner-container-right">
						<div class="d-flex justify-content-center">
							<h5>목표 몸무게까지 ${userWeight}kg 남았습니다.</h5>
						</div>
						<div class="d-flex justify-content-center">
							<button type="button" class="btn btn-sm" disabled>마지막 접속일</button>
							<span style="align-self: center;">${dto.signup_date}</span>
						</div>
						<!-- 즐겨찾기 목록 시작 -->
						<div style="margin-top: 50px;"><h3 style="font-weight: 600; color: #97C4B8;">즐겨찾기 List</h3></div>
						<div class="bookmark">
							<div class="interestBox"><label class="favLabel">식품 즐겨찾기</label>
								<c:choose>
									<c:when test="${listInterest.size() == 0}">
										<div>등록된 푸드 프로모션이 없습니다.</div>
									</c:when>
									<c:otherwise>
										<c:forEach items="${listPromo}" var="listPromo">
											<c:set var="checkInterestP" value="false" />
											<c:forEach items="${listInterest}" var="listInterest">
												<c:if test="${listPromo.food_seq eq listInterest.food_seq}">
													<c:set var="checkInterestP" value="true" />
												</c:if>
											</c:forEach>
											<c:if test="${checkInterestP}">
												<div class="row favBox">
													<div class="col-6" style="align-self: center;">
														<label>${listPromo.food_name}</label><br>
														<label>${listPromo.food_price}원</label>
													</div>
													<div class="col-6 d-flex justify-content-end">
														<a href="${listPromo.food_com}">
														<img src="/files/${listPromo.food_src}"></a>
													</div>
												</div>
											</c:if>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="interestBox"><label class="favLabel">운동시설 즐겨찾기</label>
								<c:choose>
									<c:when test="${ugi_dto.size() == 0}">
										<div>등록된 헬스장 프로모션이 없습니다.</div>
									</c:when>
									<c:otherwise>
										<c:forEach items="${gym_dto}" var="gym_dto">
											<c:set var="checkInterest" value="false" />
											<c:forEach items="${ugi_dto}" var="interestG">
												<c:if test="${interestG.gym_seq eq gym_dto.gym_seq}">
													<c:set var="checkInterest" value="true" />
												</c:if>
											</c:forEach>
											<c:if test="${checkInterest}">
												<div class="row favBox">
													<div class="col-6" style="align-self: center;">
														<label>${gym_dto.gym_name}</label><br>
														<label>${gym_dto.gym_month}개월 ${gym_dto.gym_price}원</label>
													</div>
													<div class="col-6 d-flex justify-content-end">
														<a href="/detail.gym?gym_seq=${gym_dto.gym_seq}">
														<img src="/files/${gym_dto.gym_src_main}"></a>
													</div>
												</div>
											</c:if>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<!-- 즐겨찾기 끝 -->
						
					</div>
				</div>
			</div>
		</div>
		</div>
		<!-- 바디 끝 -->
		<!-- footer -->
        <jsp:include page="/frame/footer.jsp"/>
	</div>
	<script>
		document.getElementById("modifyBtn").onclick = function() {
			location.href = "/userModify.user";
		}
		document.getElementById("diaryBtn").onclick = function() {
			location.href = "/userDiary.user";
		}
		
		autosize($("textArea"));
	</script>
</body>
</html>