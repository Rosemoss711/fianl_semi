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
<title>회원정보 수정</title>
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
.cls_body{
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

.inner-container-right input {
	background-color: #80808030;
	width: 100%;
	border: none;
	font-weight: 600;
}

.inner-container-right div {
	margin: 20px;
}

input{
	padding-left: 5px;
}

/* 버튼 */
.btnSpace {
	margin-bottom: 10px;
	font-family: 'LeferiPoint-WhiteObliqueA';
	font-weight: 600;
	justify-content: center;
}

#submitBtn, #cancleBtn {
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

#submitBtn:hover, #cancleBtn:hover, #pwOk:hover {
	background-color: #F0FFC2;
	border: 1px solid #73b1a1;
	color: #73b1a1;
}

#pwOk{
	background-color: #73b1a1;
	border: 1px solid #F0FFC2;
	border-radius: 0.25rem;
	font-family: 'LeferiPoint-WhiteObliqueA';
	padding: 1px;
	padding-top: 5px;
	padding-left: 5px;
	padding-right: 5px;
	color: white;
	margin-top: 2px;
}

#deleteBtn{
	background-color: #a8b3b0;
	border-radius: 0.25rem;
	font-family: 'LeferiPoint-WhiteA';
	color: white;
	margin: 5px;
	padding-top: 5px;
	padding-bottom: 1px;
	align-items:center;
}

#deleteBtn:hover{
	background-color: #898d8c;
}
</style>

<body>
	<div class="container">
		<!-- 헤더 -->
		<jsp:include page="/frame/header.jsp"/>
		<div class="empty"></div>
		<!-- 바디 -->
		<div class="container cls_body">
			<div class="row justify-content-evenly">
				<div class="col-3">
					<h3 class="text-center mb-3" style="font-weight: 600; color: #97C4B8">My Page</h3>
				</div>
				<div class="col-6">
					<h3 class="text-center mb-3" style="font-weight:600; color: #97C4B8">회원 정보 수정</h3>
				</div>
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
							<form action="/pwOk.user" method="post" id="pwOkForm">
							<div class="mb-5">
								<input type="text" disabled placeholder="이메일 / 수정불가">
								<input type="text" value="${dto.getUser_id()}" name="user_id" disabled>
							</div>
							<div>
								<input type="text" disabled placeholder="현재 비밀번호">
								<input type="password" id="beforePw" name="beforPw" value="${user_pw}">
								<button type="button" id="pwOk" style="font-size:small;">비밀번호 확인</button>
							</div>
							</form>
							<c:choose>
								<c:when test="${rs eq 'no'}">
									<div>
										<span style="color: #d93737;">비밀번호가 일치하지 않습니다</span>
									</div>
								</c:when>
								<c:when test="${rs eq 'ok'}">
									<div>
										<span style="color: #06a992;">비밀번호가 일치합니다.</span>
									</div>
								</c:when>
							</c:choose>
						<form action="/userDataModify.user" method="post" id="modifyForm">
							<input type="text" class="d-none" value="${dto.user_id}" name="user_id">
							<div>
								<input type="text" disabled placeholder="변경 후 비밀번호">
								<input type="password" id="afterPw" name="user_pw">
							</div>
							<div class="mb-5">
								<input type="text" disabled placeholder="변경 후 비밀번호 확인">
								<input type="password" id="afterPwCheck" name="user_pw_check">
							</div>
							<div>
								<input type="text" disabled placeholder="몸무게 수정">
								<input type="text" id="weight" value="${data_dto.weight}" name="weight">
							</div>
							<div>
								<input type="text" disabled placeholder="목표 몸무게 수정">
								<c:choose>
									<c:when test="${data_dto eq null}">
										<input type="text" id="final_weight" name="final_weight">
									</c:when>
									<c:otherwise>
										<input type="text" id="final_weight" name="final_weight"
											value="${data_dto.final_weight}">
									</c:otherwise>
								</c:choose>
							</div>
							<div>
								<div class="d-flex justify-content-between">
									<button class="btn col-2" id="deleteBtn" type="button" style="">회원 탈퇴</button>
									<button class="btn col-2 invisible" type="button">더미</button>
									<button class="btn col-2" id="cancleBtn" type="button">취소</button>
									<c:choose>
										<c:when test="${rs eq 'ok'}">
											<button class="btn col-2" id="submitBtn" type="button">수정 완료</button>
										</c:when>
										<c:otherwise>
											<button class="btn col-2" id="submitBtn" type="button" disabled>수정 완료</button>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</form>
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
		
	
	    document.getElementById("modifyBtn").onclick = function(){
			location.href = "/userModify.user";
		}
		document.getElementById("diaryBtn").onclick = function(){
			location.href = "/userDiary.user";
		}
		document.getElementById("cancleBtn").onclick = function(){
			location.href = "/toMypage.user"
		}
		
		$("#pwOk").on("click", function(){
			$("#pwOkForm").submit();
		})
		
		
		$("#submitBtn").on("click", function(e){ 
         let numberReg = /^[0-9]+$/;
         if($("#afterPw").val() !== $("#afterPwCheck").val()){
            alert("변경후 비밀번호가 맞지않습니다.");
            return;
         }
         if($("#afterPw").val() === ""){
            $("#afterPw").val("empty");
         }
         if($("#weight").val() === ""){
            alert("몸무게를 입력해주세요.");
            return;
         } else if ($("#final_weight").val() === ""){
            alert("목표 몸무게를 입력해주세요.");
            return;
         }
         
         if(!numberReg.test($("#weight").val())) {
            alert("몸무게는 숫자만 입력해주세요.");
            $("#weight").focus();
            return;
         } else if (!numberReg.test($("#final_weight").val())){
            alert("목표 몸무게는 숫자만 입력해주세요.");
            $("#final_weight").focus();
            return;
         }
      
         $("#modifyForm").submit();   
      })
		
		$("#deleteBtn").on("click", function(e){
			if(confirm("정말 회원탈퇴 하시겠습니까?")){
				if(confirm("탈퇴시 모든 정보가 삭제됩니다.")){
					location.href = "/userDelete.user";
				}
				return;
			} else {
				return;
			}
		})
		
    </script>
</body>
</html>