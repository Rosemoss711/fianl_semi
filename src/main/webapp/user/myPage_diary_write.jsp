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
<title>일기쓰기</title>
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

#writeBtn, #backBtn {
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

#writeBtn:hover, #backBtn:hover {
	background-color: #F0FFC2;
	border: 1px solid #73b1a1;
	color: #73b1a1;
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
                            <h3 style="margin-top: 50px;">오늘의 기록!</h3>
                    	</div>
                            <div class="contentsBox">
                            	<div></div>
	                            <form action="/diaryWrite.diary" method="post" id="diaryForm">
	                            	<div class="col labels d-flex justify-content-end" style="float:left;">
	                            	<label class="label" style="padding-left: 30px;">운동부위:&nbsp;</label>
	                            		<select name="diary_part" style="margin-right: 20px;">
	                            			<option value="arm" selected>팔</option>
	                            			<option value="shoulder">어깨</option>
	                            			<option value="chest">가슴</option>
	                            			<option value="back">등</option>
	                            			<option value="belly">복근</option>
	                            			<option value="lowerBody">하체</option>
	                            			<option value="etc">기타</option>
	                            		</select>
	                            	</div>
	                            	<div class="col labels d-flex justify-content-end" style="padding-right: 30px;">
	                            		<label>무게</label>
	                            		<input type="text" id="diary_weight" name="diary_weight" style="width: 60px; margin-left: 30px;"><br>                  
	                                </div>
	                                <div class="col labels d-flex justify-content-end" style="padding-right: 30px;">
	                                	<label>오늘의 몸무게</label>
	                                	<input type="text" id="user_weight" name="user_weight" style="width: 60px; margin-left: 30px;">
	                                </div>
	                                <textarea class="textBox" style="resize: none;" id="diary_content" name="diary_content" placeholder="오늘을 기록하세요. :)"></textarea>
                                </form>
                            </div>
                    </div>
                    <div class="btnSpace d-flex justify-content-end mt-4 gap-3">
                        <button class="btn btn-primary" id="writeBtn" type="button">일기 올리기</button>
                        <button class="btn btn-secondary" id="backBtn" type="button">뒤로 가기</button>
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
    $("#writeBtn").on("click", function(){
        let numberReg = /^[0-9]+$/;
        if($("#diary_weight").val() === ""){
           alert("무게를 입력해주세요 !");
           $("#diary_weight").focus();
           return;
        } else if ($("#user_weight").val() === ""){
           alert("오늘의 몸무게를 입력해주세요 !");
           $("#user_weight").focus();
           return;
        } else if ($("#diary_content").val() === ""){
           alert("운동 내용을 적아주세요!");
           $("#diary_content").focus();
           return;
        }
        
        if(!numberReg.test($("#diary_weight").val())){
           alert("무게는 숫자만 입력해주세요.");
           $("#diary_weight").focus();
           return;
        } else if (!numberReg.test($("#user_weight").val())){
           alert("몸무게는 숫자만 입력해주세요.");
           $("#user_weight").focus();
           return;
        }
        console.log("true");
        $("#diaryForm").submit();
     })
		
		$("#backBtn").on("click", function(){
			location.href = "/toDiarypage.diary";
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