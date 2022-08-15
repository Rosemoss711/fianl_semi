<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<title>FAQ</title>
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

#btnWrite, .btnModify, .btnDelete {
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

#btnWrite:hover, .btnModify:hover, .btnDelete:hover {
	background-color: #F0FFC2;
	border: 1px solid #73b1a1;
	color: #73b1a1;
}

/* 목록 */
.accordion{
	width: 80%;
	margin: auto;
	}
.accordion-button {
    color: #97C4B8;
    background-color: #f9ffe7;
    font-family: 'LeferiPoint-WhiteA';
    font-weight: 600;
    }
.accordion-button:not(.collapsed) {
    color: #97C4B8;
    background-color: #f9ffe7;
    font-family: 'LeferiPoint-WhiteA';
    font-weight: 600;
    }
.accordion-body{
	font-family: 'LeferiPoint-WhiteA';
    font-weight: 600;
	}
    
.title {
	color: #97C4B8;
	border-bottom: 1px solid #97C4B8;
	-bs-gutter-x: 0px;
	margin-bottom: 20px;
	margin-top: 50px;
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
		<!-- FAQ 리스트 -->
		<div class="container cls_body">
		<div class="d-flex justify-content-center">
			<div class="title d-flex justify-content-center">
				<h3>FAQ</h3>
			</div>
		</div>
		<c:if test="${loginSession.user_auth eq 'manager'}">
			<div class="row boxBtn-top">
				<div class="col d-flex justify-content-end">
					<button class="btn" id="btnWrite" type="button" style="margin-right: 130px;">글쓰기</button>
				</div>
			</div>
		</c:if>
			<div class="accordion justify-content-center" id="accordionExample">
				<c:choose>
					<c:when test="${list.size() == 0}">
						<tr>
							<td colspan=5>등록된 게시글이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list}" var="dto">
  							<div class="accordion-item">
    							<h2 class="accordion-header" id="headingOne">
      							<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" 
      								data-bs-target="#collapse${dto.qna_seq}" aria-expanded="false">
        							${dto.qna_title}
      							</button>
    							</h2>
    							<div id="collapse${dto.qna_seq}" class="accordion-collapse collapse" aria-labelledby="headingOne" 
    								data-bs-parent="#accordionExample">
      								<div class="accordion-body">
        								${dto.qna_content}
        								<c:if test="${loginSession.user_auth eq 'manager'}">
											<div class="row btnBox-M">
												<div class="col d-flex justify-content-end">
													<a class="btnModify" style="text-decoration: none;" href="/view.info?qna_seq=${dto.qna_seq}">수정</a>
												</div>
											</div>
										</c:if>
      								</div>
    							</div>
 							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
  			</div>
		</div>
		<%--  페이징 --%>
		<div class="row mt-5">
			<div class="col d-flex justify-content-center">
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<c:if test="${naviMap.needPrev eq true}">
							<li class="page-item"><a class="page-link"
								href="/toInformation.info?curPage=${naviMap.startNavi-1}">←</a></li>
						</c:if>
						<c:forEach var="pageNum" begin="${naviMap.startNavi}"
							end="${naviMap.endNavi}" step="1">
							<li class="page-item"><a class="page-link"
								href="/toInformation.info?curPage=${pageNum}">${pageNum}</a></li>
						</c:forEach>
						<c:if test="${naviMap.needNext eq true}">
							<li class="page-item"><a class="page-link"
								href="/toInformation.info?curPage=${naviMap.endNavi+1}">→</a></li>
						</c:if>
					</ul>
				</nav>
			</div>
		</div>
		<!-- FAQ 리스트 끝-->
		<!-- footer -->
        <jsp:include page="/frame/footer.jsp"/>
	</div>
	<script>
		$("#btnWrite").on("click", function() {
			location.href = "/write.info";
		})
		
	</script>
</body>
</html>