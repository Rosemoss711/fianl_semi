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
<title>식품 프로모션 관리리스트</title>
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
	padding: 3px;
	padding-left: 10px;
	padding-right: 10px;
	padding-top: 8px;
	font-family: 'LeferiPoint-WhiteObliqueA';
	font-size: small;
	color: white;
	margin: 5px;
}

.btnAdd:hover {
	background-color: #F0FFC2;
	border: 1px solid #73b1a1;
	color: #73b1a1;
}

/* 목록 */
.tblBorder {
	border-right: 1px solid #e6ebd8;
}

.table td {
	border-bottom: 1px solid #e6ebd8;
}

.tableTitle {
	background-color: #F0FFC2;
	color: #74a598;
	text-align: center;
	border-bottom: 2px solid #74a598;
}

.title {
	color: #97C4B8;
	border-bottom: 1px solid #97C4B8;
	-bs-gutter-x: 0px;
	margin-bottom: 20px;
	margin-top: 10px;
	font-family: '양진체';
}

.page-item.active .page-link {
	color: white;
	background-color: #73b1a1;
	border: 1px solid #e6ebd8;
}

.page-link {
	color: #5a9284;
	margin-bottom: 50px;
	border: 1px solid #e6ebd8;
}

.page-link:focus {
	color: #5a9284;
}

.page-link:hover {
	color: #5a9284;
	background-color: #F0FFC2;
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
				<h1>식품 프로모션 등록</h1>
			</div>
		</div>
		<div class="row">
			<div class="col btnSpace">
				<button class="btn btnAdd" type="button">신규</button>
			</div>
		</div>
		<table class="table">
			<thead>
				<tr class="tableTitle">
					<th class="col-2 tblBorder">No.</th>
					<th class="col">프로모션 제목</th>
				</tr>
			</thead>
			<tbody class="bodyFood">
				<c:choose>
					<c:when test="${list.size() == 0}">
						<tr>
							<td colspan=5>등록된 프로모션이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list}" var="dto">
							<tr>
								<td class="tblBorder" style="text-align: center;">
									${dto.food_seq}</td>
								<td style="text-align: center;"><a
									href="/modify.food?food_seq=${dto.food_seq}"
									style="text-decoration: none; color: black;">${dto.food_name}</a>
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<%--  페이징 --%>
		<div class="row">
			<div class="col d-flex justify-content-center">
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<c:if test="${naviMap.needPrev eq true}">
							<li class="page-item"><a class="page-link"
								href="/modifyList.food?curPage=${naviMap.startNavi-1}">←</a></li>
						</c:if>
						<c:forEach var="pageNum" begin="${naviMap.startNavi}"
							end="${naviMap.endNavi}" step="1">
							<li class="page-item"><a class="page-link"
								href="/modifyList.food?curPage=${pageNum}">${pageNum}</a></li>
						</c:forEach>
						<c:if test="${naviMap.needNext eq true}">
							<li class="page-item"><a class="page-link"
								href="/modifyList.food?curPage=${naviMap.endNavi+1}">→</a></li>
						</c:if>
					</ul>
				</nav>
			</div>
		</div>
		<!-- footer -->
        <jsp:include page="/frame/footer.jsp"/>
	</div>
	<script>
		$(".btnAdd").on("click", function(){
			location.href = "/add.food";
		})
		
    </script>
</body>
</html>