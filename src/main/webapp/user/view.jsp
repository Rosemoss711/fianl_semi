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
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<title>FAQ 수정</title>
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

/* 버튼 영역 */
.boxBtn {
	margin-top: 30px;
	margin-bottom: 80px;
	font-family: 'LeferiPoint-WhiteObliqueA';
	font-weight: 600;
	text-align: center;
}

#btnBack, #modifyBtn, #btnSave {
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

#btnBack:hover, #modifyBtn:hover, #btnSave:hover {
	background-color: #F0FFC2;
	border: 1px solid #73b1a1;
	color: #73b1a1;
}

#btnDelete{
	background-color: #e3bda1;
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

#btnDelete:hover {
	background-color: #d5752ebf;
	border: 1px solid #f1d78f;
	color: white;
}

/* content */
.title {
	color: #97C4B8;
	border-bottom: 1px solid #97C4B8;
	-bs-gutter-x: 0px;
	margin-bottom: 50px;
	margin-top: 50px;
	font-family: '양진체';
	text-align:center;
}

#content {
	height: 500px;
}

.contentInput {
	height: 100%;
	padding-left: 10%;
	padding-right: 10%;
}

input {
	font-family: 'LeferiPoint-WhiteA';
	font-weight: 600 !important;
	border: none;
	border-bottom: 1px solid #c9d4a9 !important;
	width: 100%;
	height: 50px;
	text-align: center;
	font-size: x-large;
}

input::placeholder, textarea::placeholder {
	color: #adcabf !important;
}

textarea {
	width: 100%;
	height: 100%;
	resize: none;
	border-radius: 0.25rem;
	font-family: 'LeferiPoint-WhiteA';
	font-weight: 600 !important;
	border: 1px solid #c9d4a9 !important;
	font-size: large;
}

input, textarea:focus{
	outline: none;
}

/* 버튼 영역 끝 */
</style>

<body>
	<div class="container">
		<!-- 헤더 -->
		<jsp:include page="/frame/header.jsp"/>
		<div class="empty"></div>

	<!-- FAQ 보기 -->
	<div class="container cls_body">
			<div class="row title">
				<h3>FAQ</h3>
			</div>
		<form id="formModify" action="/modifyProc.info" method="post">
			<div class="row d-flex justify-content-center">
				<div class="col-10 p-2">
					<input type="text" id="qna_seq" class="form-control d-none" name="qna_seq" value="${dto.qna_seq}"> 
					<input type="text" id="qna_title" class="" name="qna_title"
							value="${dto.qna_title}" readonly>
				</div>
				<div class="col-10 p-2">
					<textarea id="content" class="" id="content" name="qna_content" placeholder="내용을 입력하세요." readonly>${dto.qna_content}</textarea>
				</div>
			</div>
		</form>
		<!-- FAQ 보기 끝-->
		<div class="boxBtn">
			<button type="button" class="btn" id="btnBack">뒤로가기</button>
			<c:if test="${loginSession.user_auth eq 'manager'}">
				<button type="button" class="btn" id="btnSave" style="display:none;">수정완료</button>
				<button type="button" class="btn" id="modifyBtn">수정하기</button>
				<button type="button" class="btn" id="btnDelete">삭제</button>
			</c:if>
		</div>
	</div>
		<!-- footer -->
        <jsp:include page="/frame/footer.jsp"/>
	</div>
	<script>
		const btnBack = document.getElementById("btnBack");

		btnBack.addEventListener("click", function(e) {
			location.href = "/toInformation.info?curPage=1";
		});

		$("#modifyBtn").on("click", function(e) {
			$("input").attr("readonly", false);
			$("textarea").attr("readonly", false);
			$("#modifyBtn").css("display", "none");
			$("#btnSave").css("display", "inline");
		});
		
		$("#btnSave").on("click", function(e) {
			$("#formModify").submit();
		});

		let btnDelete = document.getElementById("btnDelete");

		btnDelete.addEventListener("click", function(e) {
			let qna_seq = $("#qna_seq").val();
			let answer = confirm("지금 삭제하시면 복구가 불가합니다. 정말 삭제하겠습니까?");
			console.log(answer);
			if (answer) {
				location.href = "/deleteProc.info?qna_seq=${dto.qna_seq}";
			}
		})
	</script>
</body>
</html>