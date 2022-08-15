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
<title>Column</title>
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
/* 폰트 끝 */
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
	font-family: '양진체';
}

.container {
	margin: auto;
}

/* 공백 */
.empty {
	background-color: white;
	height: 20px;
}

/* 바디 */
.title {
	border-bottom: 2px solid grey;
	width: 250px;
}
</style>

<body>
	<div class="container">
		<!-- header -->
		<jsp:include page="/frame/header.jsp"/>
		
		<div class="empty"></div>

		<!-- Column 시작 -->
		<div class="cls_body">
			<div class="d-flex justify-content-center">
				<div class="title d-flex justify-content-center">
					<h3>칼럼</h3>
				</div>
			</div>
			<div class="container">
				<c:if test="${loginSession.user_auth eq 'manager'}">
					<div class="row boxBtn-top">
						<div class="col d-flex justify-content-end">
							<button class="btn btn-warning" id="btnWrite" type="button">글쓰기</button>
						</div>
					</div>
				</c:if>
			</div>
			
			<div class="row row-cols-1 row-cols-md-3 g-4 mb-5">
				<div class="col">
					<div class="card w-75 h-100">
						<img src="/imgs/560.jpg" class="card-img-top h-100">
						<div class="card-body">
							<h5 class="card-title text-center">거북목 교정 운동법</h5>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card w-75 h-100">
						<img src="/imgs/alora-griffiths-WX7FSaiYxK8-unsplash.jpg"
							class="card-img-top h-100">
						<div class="card-body">
							<h5 class="card-title text-center">부상 위험을 줄이는 운동 전 스트레칭</h5>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card w-75 h-100">
						<img src="/imgs/back-pain-g7ebabea1c_640.jpg"
							class="card-img-top h-100">
						<div class="card-body">
							<h5 class="card-title text-center">허리디스크가 의심되세요?</h5>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card w-75 h-100">
						<img src="/imgs/fitsum-admasu-oGv9xIl7DkY-unsplash.jpg"
							class="card-img-top h-100">
						<div class="card-body">
							<h5 class="card-title text-center">규칙적인 운동의 영향</h5>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card w-75 h-100">
						<img src="/imgs/hermes-rivera-Ww8eQWjMJWk-unsplash (1).jpg"
							class="card-img-top h-100">
						<div class="card-body">
							<h5 class="card-title text-center">간헐적 단식! 누가, 어떻게 해야 효과적인가?</h5>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card w-75 h-100">
						<img src="/imgs/근육통.jpg" class="card-img-top h-100">
						<div class="card-body">
							<h5 class="card-title text-center">근육통 있을 때 운동해도 될까?</h5>
						</div>
					</div>
				</div>
			</div>
			<div>
				<nav aria-label="Page navigation example">
					<ul class="pagination d-flex justify-content-center">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<li class="page-item active"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</div>
		</div>
		<script>
			$("#btnWrite").on("click", function() {
				location.href = "/write.column";
			})
		</script>
		<!-- Column 끝 -->
		<div class="empty"></div>
		<!-- footer -->
		<jsp:include page="/frame/footer.jsp"/>
	</div>
</body>
</html>