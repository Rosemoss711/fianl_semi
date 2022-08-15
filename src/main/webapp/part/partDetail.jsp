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
<!-- text area auto size -->
<script
	src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
<title>근육별 상세페이지</title>
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

.empty1 {
	background-color: white;
	height: 10px;
}

.emptyTop {
	background-color: white;
	height: 50px;
}

/*컨텐츠*/
.title {
	color: #97C4B8;
	border-bottom: 1px solid #97C4B8;
	-bs-gutter-x: 0px;
	margin-bottom: 20px;
	margin-top: 50px;
	font-family: 'LeferiPoint-WhiteObliqueA';
}

input {
	width: 70%;
	height: 4rem;
	overflow: hidden;
	border: none;
	resize: none;
	font-weight: 600;
	text-align: center;
}

.partTextarea {
	width: 70%;
	height: 4rem;
	overflow: hidden;
	resize: none;
	text-align: center;
	border: none;
	border-top: 1px solid #97C4B8;
	border-bottom: 1px solid #97C4B8;
	font-family: 'LeferiPoint-WhiteA';
	font-weight: 600;
	font-size: large;
}

.partTextarea:focus {
	outline: none;
}

.figure-caption{
		font-family: 'LeferiPoint-WhiteA';
    	font-weight: 600;
	}
img{
	width: 600px;
}

/*버튼*/
.btnSpace {
	margin-bottom: 10px;
	font-family: 'LeferiPoint-WhiteObliqueA';
	font-weight: 600;
	justify-content: center;
}

.btnModify, #btnDelete, #btnModify, #btnList {
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

.btnModify:hover, #btnDelete:hover, #btnModify:hover, btnList:hover {
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
			<div class="partDetail">
				<form action="/toPartModify.part?part_seq=${dto.part_seq}" method="post" id="partModifyForm" style="text-align:center;">
					<div class="row title style="text-align:center;"">
						<div class="col">
							<h1 class="class d-flex justify-content-center">
								<input type="text" id="part_title" name="part_title"
									value="${dto.part_title}" readonly>
							</h1>
						</div>
					</div>
					<figure class="figure d-felx justify-content-center">
						<img src="/files/${FolderDTO.part_src}"
							onerror="this.style.display='none'"
							class="figure-img img-fluid rounded">
						<figcaption class="figure-caption text-end">참고이미지</figcaption>
					</figure>
					<div class="row">
						<div class="col content d-flex justify-content-center">
							<textarea class="partTextarea" id="part_content" name="part_content" readonly>${dto.part_content}</textarea>
						</div>
					</div>
					<div class="empty"></div>
				</form>
				<div class="row">
					<div class="col d-flex justify-content-center">
						<button type="button" class="btnList" id="btnList">뒤로가기</button>
					</div>
					<c:if test="${loginSession.user_auth eq 'manager'}">
						<div class="col d-flex justify-content-end">
							<button type="button" class="btn btn-warning" id="btnModify">수정</button>
						</div>
						<div class="col-3 d-flex justify-content-start">
							<button type="button" class="btn btn-danger" id="btnDelete" value="${dto.part_seq}">삭제</button>
						</div>
					</c:if>
				</div>
			</div>
		</div>
		<div class="empty" style="margin: 40px;"></div>
		<!-- footer -->
        <jsp:include page="/frame/footer.jsp"/>
	</div>
	<script>
	$("#btnList").on("click", function(){
		location.href="/listSign.part?curPage=1";
	})
	
	$("#btnModify").on("click", function(){
		$("#partModifyForm").submit();
	})
	
	$("#btnDelete").on("click", function(e){
		if(confirm("정말 삭제하시겠습니까?")){
			location.href ="/delete.part?part_seq="+$(e.target).val();
		}
	})
	
	autosize($("textArea"));
	</script>

</body>
</html>