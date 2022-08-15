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
<title>일기 보기</title>
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
.title {
	border-bottom: 2px solid #97C4B8;
	width: 250px;
}

.title h3 {
	font-family: 'LeferiPoint-WhiteObliqueA';
	font-weight: 600;
}

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

.contentsBox {
	border: 2px solid #e5f7c9;
	background-color: #F0FFC2;
	width: 600px;
	height: 610px;
	border-radius: 0.25rem;
	color: grey;
	padding-top: 20px;
}

select, select> *{
	border: 1px solid #97C4B8;
	height: 26px;
	font-weight: 600;
	border-radius: 0.25rem;
}

select:focus {
	outline: none;
}

.textBox {
	border: 1px solid #97C4B8;
	width: 90%;
	height: 400px;
	margin-left: 24px;
	font-weight: 600;
	border-radius: 0.25rem;
	padding: 15px;
}

.textBox:focus, input:focus {
	outline: none;
}

.textBox::placeholder{
	color: #adcabf;
}

input{
	border: 1px solid #97C4B8;
	border-radius: 0.25rem;
	font-weight: 600;
	text-align: center;
}

.labels{
	display: inline;
	margin-bottom: 5px;
	padding-right: 30px;
}

select{
	margin-left: 30px;
}

/* 버튼 */
.btnSpace {
	margin-bottom: 80px;
	font-family: 'LeferiPoint-WhiteObliqueA';
	font-weight: 600;
	justify-content: center;
}

#btnWrite, #btnModify, #btnSave {
	background-color: #73b1a1;
	border: 1px solid #F0FFC2;
	border-radius: 50rem;
	padding: 3px;
	padding-top: 10px;
	padding-left: 10px;
	padding-right: 10px;
	font-family: 'LeferiPoint-WhiteObliqueA';
	color: white;
	margin: 5px;
}

#btnWrite:hover, #btnModify:hover, #btnSave:hover {
	background-color: #F0FFC2;
	border: 1px solid #73b1a1;
	color: #73b1a1;
}

#btnDelete{
	background-color: #e3bda1;
	border: 1px solid #F0FFC2;
	border-radius: 50rem;
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
</style>

<body>
	<div class="container">
		<!-- 헤더 -->
		<jsp:include page="/frame/header.jsp"/>
        <div class="empty"> </div>
        <!-- 바디 -->
        <div class="cls_body">
        	<div class="row justify-content-evenly">
				<div class="col-3">
					<h3 class="text-center mb-3" style="font-weight: 600; color: #97C4B8">My Page</h3>
				</div>
				<div class="col-6 d-flex justify-content-center">
					
				</div>
            <div class="row justify-content-evenly">
                <div class="col-3">
                    <div class="inner-container-left">
                        <div>
                        	<button type="button" id="modifyBtn" style="border:none; background:none;">정보수정</button>
                        </div>
                        <div>
                        	<button type="button" id="diaryBtn" style="border:none; background:none;">일기</button>
                        </div>
                    </div>
                </div>
                <div class="col-6">
                    <div class="row inner-container-right d-flex justify-content-center">
                    	<div class="title d-flex justify-content-center mb-4">
                            <h3 style="margin-top: 50px;">일기 보기</h3>
                    	</div>
                            <div class="contentsBox">
	                            <form id="formModify" action="/diaryModify.diary?diary_seq=${dto.diary_seq}" method="post">
	                            	<div class="col d-inline p-4" style="float: left;">기록한 날짜:<br>${dto.diary_date}</div>
	                            	<div class="col labels d-flex justify-content-end">
	                            		<label class="label">운동부위:&nbsp;${dto.diary_part}</label>
	                            		<select name="diary_part">
	                            			<option value="arm" selected>팔</option>
	                            			<option value="shoulder">어깨</option>
	                            			<option value="chest">가슴</option>
	                            			<option value="back">등</option>
	                            			<option value="belly">복근</option>
	                            			<option value="lowerBody">하체</option>
	                            			<option value="etc">기타</option>
	                            		</select>
	                            	</div>
	                            	<div class="col labels d-flex justify-content-end">
	                            		<label>목표 몸무게</label>
	                            		<input type="text" id="weight" name="diary_weight" value="${dto.diary_weight}" style="width: 60px; margin-left: 30px;" readonly>                        
	                                </div>
	                                <div class="col labels d-flex justify-content-end">
	                                	<label>이전 몸무게</label>
	                                	<input type="text" id="user_weight" name="user_weight" value="${dataDTO.weight}" style="width: 60px; margin-left: 30px;" readonly>
	                                </div>
	                                	<textarea class="textBox" style="resize: none;" id="diary_content" name="diary_content" placeholder="오늘을 기록하세요. :)" readonly>${dto.diary_content}</textarea>
                                </form>
                            </div>
                    </div>
                    <div class="btnSpace d-flex justify-content-end mt-4 gap-3">
                        <button class="btn" id="btnModify" type="button">일기 수정</button>
                        <button class="btn" id="btnSave" type="button" style="display:none;">수정 완료</button>
                        <button class="btn" id="btnDelete" type="button" value="${dto.diary_seq}">일기 삭제</button>
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
    $("#btnModify").on("click", function(e) {
		$("input").attr("readonly", false);
		$("textarea").attr("readonly", false);
		$("#btnModify").css("display", "none");
		$("#btnSave").css("display", "inline");
		$("#diary_content").focus();
	});
	
	$("#btnSave").on("click", function(e) {
		if($("#weight").val() === ""){
			alert("무게를 입력해주세요!");
			$("#weight").focus();
			return;
		} else if ($("#user_weight").val() === ""){
			alert("몸무게를 입력해주세요!");
			$("#user_weight").focus();
			return;
		} else if ($("#diary_content").val() === "") {
			alert("운동 내용을 입력해주세요!");
			$("#diary_content").focus();
			return;
		}
		
		$("#formModify").submit();
	});
		
	$("#btnDelete").on("click", function(e){
		if(confirm("정말 삭제하시겠습니까?")){
			location.href="/diaryDelete.diary?diary_seq="+$(e.target).val();
		}
	})
	
	document.getElementById("modifyBtn").onclick = function() {
        location.href = "/userModify.user";
    	}
		
    	document.getElementById("diaryBtn").onclick = function() {
        location.href = "/userDiary.user";
    	}
	</script>
</body>
</html>