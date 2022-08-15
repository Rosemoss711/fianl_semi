<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>칼럼 목록</title>
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

.emptyTop {
	background-color: white;
	height: 50px;
}

/* 칼럼 목록 */
.title {
	color: #97C4B8;
	border-bottom: 1px solid #97C4B8;
	-bs-gutter-x: 0px;
	margin-bottom: 20px;
	margin-top: 10px;
	font-family: '양진체';
}

.column{
	position: relative;
}

.btnAddCls{
	position: absolute;
	left: 1rem;
}

.row h4, h1{
	font-family: '양진체';
	text-align: center;
}

.card{
	border: none;
}

.card-body{
	font-size: larger;
}

.card p{
	font-family: 'LeferiPoint-WhiteObliqueA';
	font-weight: 600;
}

/* 버튼 */

.btnAdd {
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

.btnAdd:hover {
	background-color: #F0FFC2;
	border: 1px solid #73b1a1;
	color: #73b1a1;
}
</style>

</head>
<body>
	<div class="container">
		<!-- 헤더 -->
		<jsp:include page="/frame/header.jsp"/>
		
		<div class="container">
			<div class="row title">
				<div class="col-12 d-flex justify-content-center column" style="margin-top: 50px;">
					<h1>칼럼</h1>
					<c:if test="${loginSession.user_auth eq 'manager'}">
					<div class="col d-flex btnAddCls">
						<button class="btn btnAdd" type="button">칼럼 등록</button>
					</div>
					</c:if>
				</div>
			</div>
			<div class="empty"></div>
			<!-- 근육 목록 시작 -->
			<div class="pertList">
				<div class="row">
					<c:choose>
						<c:when test="${empty list}">
							<div>저장된 내용이 없습니다.</div>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="dto" varStatus="listStatus" end="6">
								<div class="col-6 d-flex justify-content-center">
									<a href="/view.column?column_seq=${dto.column_seq}" style="text-decoration: none; color: black;">
										<div class="card" style="height: 100%;">
											<img style="height: 100%;" src="/files/${dto.column_src}" class="card-img-top">
											<div class="card-body">
												<p class="card-text">${dto.column_title}</p>
											</div>
										</div>
									</a>
								</div>
							</c:forEach>
						</c:otherwise>
						</c:choose>
					</div>
				</div>
			<div class="empty"></div>
			<%--  페이징 --%>
			<div class="row">
				<div class="col d-flex justify-content-center">
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<c:if test="${naviMap.needPrev eq true}">
								<li class="page-item"><a class="page-link"
								href="/toColumnPage.column?curPage=${naviMap.startNavi-1}">←</a></li>
							</c:if>
							<c:forEach var="pageNum" begin="${naviMap.startNavi}" end="${naviMap.endNavi}" step="1">
								<li class="page-item"><a class="page-link" href="/toColumnPage.column?curPage=${pageNum}">${pageNum}</a></li>
							</c:forEach>
							<c:if test="${naviMap.needNext eq true}">
								<li class="page-item"><a class="page-link" href="/toColumnPage.column?curPage=${naviMap.endNavi+1}">→</a></li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
		</div>
		<!-- 근육 목록 끝 -->
		<!-- footer -->
        <jsp:include page="/frame/footer.jsp"/>
	</div>
	<script>
		$(".btnAdd").on("click", function(){
			location.href="/write.column";
		})
	</script>
</body>
</html>