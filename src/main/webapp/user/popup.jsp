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
<title>아이디 중복 확인</title>
</head>
<style>
@font-face {
    font-family: 'LeferiPoint-WhiteA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/LeferiPoint-WhiteA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

/* body */
.container{
	width: 500px;
	height: 300px;
	font-family: 'LeferiPoint-WhiteA';
	font-weight: 600;
	border: 1px dotted #73b1a1;
	margin-top: 25px;
}

/* 버튼 */
#checkId, #useBtn, #compareBtn {
	background-color: #73b1a1;
	border: 1px solid #F0FFC2;
	border-radius: 0.25rem;
	font-family: 'LeferiPoint-WhiteA';
	color: white;
	margin: 5px;
	padding-top: 5px;
	padding-bottom: 1px;
	align-items:center;
}

#checkId:hover, #useBtn:hover, #compareBtn:hover {
	background-color: #F0FFC2;
	border: 1px solid #73b1a1;
	color: #73b1a1;
}

#cancleBtn{
	background-color: #a8b3b0;
	border-radius: 0.25rem;
	font-family: 'LeferiPoint-WhiteA';
	color: white;
	margin: 5px;
	padding-top: 5px;
	padding-bottom: 1px;
	align-items:center;
}

#cancleBtn:hover{
	background-color: #898d8c;
}

/* input */
#user_id, #compare{
	border: none;
	border-bottom: 1px solid #73b1a1;
	border-radius: 0;
	font-weight: 600;
}

#compare:focus{
	outline: none !important;
}
#user_id::placeholder {
	color: #adcabf !important;
}
</style>
<body>
	<div class='container'>
		<form action="/idCheck.user" method="get" id="checkIdForm">
			<div class='row' style="margin-top: 20px; margin-left: 20px;">
				<div class="col m-2 d-flex justify-content-end">
					<input type="text" class="form-control shadow-none" value="${user_id}"
						id="user_id" pattern="^[a-zA-Z0-9_]{6,12}$" name="user_id" placeholder="사용할 e-mail 입력">
				</div>
				<div class='col-4 m-2 d-flex justify-content-start'>
					<button type="button" class="btn btn-success" id="checkId">중복확인</button>
				</div>
			</div>
		</form>
		<div class="row m-2 d-flex justify-content-center" style=" margin-left: 20px !important;">
			<div class="col-3 m-2 p-1">
				<span>확인 결과 : </span>
			</div>
			<div class="col d-flex align-items-center" style="text-align:center;">
				<c:if test="${rs eq 'ok'}">
					<span style="color:green;">사용 가능한 아이디입니다.</span>
				</c:if>
				<c:if test="${rs eq 'no'}">
					<span>사용 불가한 아이디입니다.</span>
				</c:if>
			</div>
		</div>
		<c:if test="${rs eq 'ok'}">
			<form action="/compare.user" method="post" id="compareForm">
				<div class="row m-2 d-flex justify-content-center" style=" margin-left: 20px !important;">
					<div>
						<input type="text" class="d-none" id="compareUser" name="compareUser" value="${user_id}">
					</div>
					<div class="col-4 d-flex align-items-center">
						<span>인증 번호 입력 : </span>
					</div>
					<div class="col-4">
						<input type="text" class="form-control shadow-none" id="compare" name="compare">
					</div>
					<div class="col-4 d-flex justify-content-start">
						<button type="button" id="compareBtn" class="btn">확인</button>
					</div>
				</div>
				<div class="row d-none" id="okMessage" style="margin-top: 20px; margin-left: 20px !important; text-align:center;">
					<div class="col-12"><span style="color:green;">인증이 완료되었습니다.</span></div>
				</div>
			</form>

		</c:if>
		<div class="row" style="margin-top: 20px;">
			<div class="col-6 d-flex justify-content-end">
				<button type="button" class="btn btn-primary" id="useBtn" disabled>사용</button>
			</div>
			<div class="col-6 d-flex justify-content-start">
				<button type="button" class="btn btn-secondary" id="cancleBtn">취소</button>
			</div>
		</div>
	</div>


	<script>
	
		let useBtn = document.getElementById("useBtn");
		$("#compareBtn").on("click",function(){
			compareRegex = /[0-9]{6}/;
			console.log(${compareNum});
			console.log($("#compare").val());
			if(!compareRegex.test($("#compare").val())){
				alert("인증번호를 정확히 입력해주세요");
				return;
			}
			if ("${compareNum}" === $("#compare").val()) { // 사용가능한 아이디라면
				useBtn.disabled = false; // disabled 속성 해지
				$("#okMessage").removeClass("d-none");
			} else {
				alert("인증번호가 올바르지 않습니다.");
				useBtn.disabled = true; // disabled 속성 적용
				return;
			}
			
		})
		
		/*
		if ("${rs}" === "ok") { // 사용가능한 아이디라면
			useBtn.disabled = false; // disabled 속성 해지
		} else {
			useBtn.disabled = true; // disabled 속성 적용
		}
		*/

		useBtn.onclick = function() { // 사용버튼 클릭
			let regexId = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;

			if (!regexId.test($("#user_id").val())) {
				alert("형식에 맞지 않는 아이디입니다.");
				ustBtn.disabled = true;
				return; // return을 만나면 그 즉시 함수가 종료
			}

			// 1. 팝업창을 열어줬던 부모창(opener)의 id input칸에 사용자가 입력한 id를 전달
			// 2. 팝업창을 닫음.
			// 팝업창을 열어줬던 부모를 칭하는 객체 opener
			// 왼쪽은 부모창(회원가입창)의 id input 요소  /  오른쪽은 팝업창의 id input 요소
			opener.document.getElementById("user_id").value = document
					.getElementById("user_id").value;
			self.close(); // 내 자신 창을 닫겠다!
		};

		document.getElementById("cancleBtn").onclick = function() {
			self.close(); // 취소버튼 클릭시 팝업 창 닫기
		};

		// 중복확인 버튼을 눌렀을 때 id 값이 유요한 값이 체크 후에 서버로 중복확인 요청
		$("#checkId").on("click",function() {
			let regexId = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;

			if (!regexId.test($("#user_id").val())) {
				alert("형식에 맞지 않는 아이디입니다.");
				return; // return을 만나면 그 즉시 함수가 종료
			}
			$("#checkIdForm").submit();
		})
	</script>
</body>
</html>