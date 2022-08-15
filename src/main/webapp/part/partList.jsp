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
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<title>근육별 운동목록</title>
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

/* 공백 */
.empty {
	background-color: white;
	height: 20px;
}

.emptyTop {
	background-color: white;
	height: 50px;
}

/* 운동시설 목록 */
.title {
	color: #97C4B8;
	border-bottom: 1px solid #97C4B8;
	-bs-gutter-x: 0px;
	margin-bottom: 20px;
	margin-top: 10px;
	font-family: '양진체';
}

.row h4, h3, h1{
	font-family: '양진체';
	text-align: center;
}

#clickH3:hover {
	color: #97C4B8;
	transition-duration: 1s;
}

.card{
	border: 1px solid #daddd0;
}

.card-body{
	font-size: larger;
	background-color: #daddd0;
	padding: 0.5rem 0.5rem;
}

.card p{
	font-family: 'LeferiPoint-WhiteObliqueA';
	font-weight: 600;
	color: #76a99b;
}
</style>

</head>
<body>
	<div class="container">
		<!-- 헤더 -->
		<jsp:include page="/frame/header.jsp"/>
		<div class="container">
			<div class="row title">
				<div class="col-12 d-flex justify-content-center" style="margin-top: 50px;">
					<h1>근육별 운동목록</h1>
				</div>
			</div>
			<div class="empty"></div>
			<!-- 근육 목록 시작 -->
			<div class="pertList">
				<div class="row">
					<div class="col-4 d-flex justify-content-center">
						<a href="/list.part?part_class=상체&curPage=1" style="text-decoration: none; color: black;">
							<div class="card" style="height: 100%;">
								<img style="height: 100%;" src="../imgs/upperBody.jpg" class="card-img-top" id="upperBody">
								<div class="card-body">
									<p class="card-text d-flex justify-content-center">상체 운동</p>
								</div>
							</div>
						</a>
					</div>
					<div class="col-4 d-flex justify-content-center">
						<a href="/list.part?part_class=하체&curPage=1" style="text-decoration: none; color: black;">
							<div class="card" style="height: 100%;">
								<img style="height: 100%;" src="../imgs/rowerBody.jpg" class="card-img-top" id="rowerBody">
								<div class="card-body">
									<p class="card-text d-flex justify-content-center">하체 운동</p>
								</div>
							</div>
						</a>
					</div>
					<div class="col-4 d-flex justify-content-center">
						<a href="/list.part?part_class=유산소&curPage=1" style="text-decoration: none; color: black;">
							<div class="card" style="height: 100%;">
								<img style="height: 100%;" src="../imgs/run.jpg" class="card-img-top" id="rowerBody">
								<div class="card-body">
									<p class="card-text d-flex justify-content-center">유산소 운동</p>
								</div>
							</div>
						</a>
					</div>
				</div>
			</div>
			<div class="empty"></div>
			<div class="row title" style="margin-top: 40px;">
				<div class="col-12 d-flex justify-content-center">
					<h1>전체 보기</h1>
				</div>
			</div>
			<div class="empty"></div>
			<div class="row">
				<a href="/listSign.part?curPage=1" style="text-decoration: none; color: black;">
					<h3 id="clickH3">CLICK!</h3></a>
				<div class="col d-flex justify-content-center" style="margin-bottom: 80px;">
					<img src="../imgs/frogs.jpg" class="card-img-top rounded" id="upperBody">
				</div>
			</div>
		</div>
		<!-- 근육 목록 끝 -->
		<!-- footer -->
        <jsp:include page="/frame/footer.jsp"/>
	</div>
</body>
</html>