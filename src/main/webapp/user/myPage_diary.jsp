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
<title>일기</title>
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
	padding:none;
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

.contentWrapper {
	margin: none;
	border: 1px solid black;
	height: 500px;
	border: 1px solid #97C4B8;
	border-radius: 0.25rem;
	font-weight: 600;
	padding: 10px;
	overflow-y: auto;
}

.diaryWrapper{
	border-bottom: 1px dotted #97C4B8;
	margin-top: 10px;
}

.seqTitle{
	 color: #54af97;
	
}

/* 버튼 */
.btnSpace {
	margin-bottom: 80px;
	font-family: 'LeferiPoint-WhiteObliqueA';
	font-weight: 600;
	justify-content: center;
}

#btnWrite, #btnModify {
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

#btnWrite:hover, #btnModify:hover {
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
		<div class="empty"></div>
        <!-- 바디 -->
        <div class="cls_body">
        	<div class="row justify-content-evenly">
				<div class="col-3">
					<h3 class="text-center mb-3" style="font-weight: 600; color: #97C4B8">My Page</h3>
				</div>
				<div class="col-6 d-flex justify-content-center"></div>
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
                	<div class="row d-flex justify-content-center mb-4">
                		<div class="row title d-flex justify-content-center mb-4 text-center">
                    		<h3 style="margin-top: 50px;">오늘의 기록!</h3>
                    	</div>
                    	<div class="row inner-container-right d-flex justify-content-center">
                        	<div class="col contentWrapper">
                                <c:forEach items="${list}" var="dto">
                                    <div class="diaryWrapper text-center">
                                    	<span style="color:gray;">${dto.diary_date}</span><br>
                                    	<a style="text-decoration:none; color:gray;" href="/toDiaryDetail.diary?diary_seq=${dto.diary_seq}">
                                    	<span class="seqTitle">${dto.diary_seq}번째,&nbsp;</span>
                                    	<span class="seqTitle" style="font-size: large;">-&nbsp;${dto.getDiary_part()}&nbsp;-</span><br>
                                    	<span style="color:gray;">${dto.getDiary_content()}</span></a>
                                    </div>
                                 </c:forEach>
                        	</div>
                    	</div>
                    </div>
                    <div class="btnSpace d-flex justify-content-end mt-4 gap-3">
                        <button class="btn" id="btnWrite" type="button">일기 쓰기</button>
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
	document.getElementById("btnWrite").onclick = function(){
		location.href = "/userDiaryWrite.user";
	}
    </script>
</body>
</html>