<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<title>식품 프로모션 등록페이지</title>
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

    /* 목록 */
    .title {
        color: #97C4B8;
        border-bottom: 1px solid #97C4B8;
        --bs-gutter-x: 0px;
        margin-bottom: 20px;
        margin-top: 10px;
        font-family: '양진체';
    }
    .card{
        width: 35rem;
        border: 1px solid #c9d4a9;
        font-family: 'LeferiPoint-WhiteObliqueA';
        font-weight: 600;
    }
    .card img{
        width : 100%;
        height: 20rem;
    }
    .card-title{
        margin-bottom: 0px;
        font-family: 'LeferiPoint-WhiteObliqueA';
        font-weight: 600;
    }
    .card a{
        text-decoration: none;
        color: black;
    }
    .card h5{
        padding: 20px;
    }
    .foodPromo{
        margin-bottom: 80px;
    }
    .btnSpace {
        margin-bottom: 10px;
        font-family: 'LeferiPoint-WhiteObliqueA';
        font-weight: 600;
    }
    .input-group{
    	width: 100%;
    	margin-bottom: 10px;
	}
    .input-group-text{
    	color: #97C4B8;
    	background-color: #F0FFC2;
    	font-family: 'LeferiPoint-WhiteObliqueA';
        font-weight: 600;
    }
	.inputCls{
		width: 100%;
        font-weight: 600;
        border: 1px solid #c9d4a9;
	}
	.inputCls:focus{
        outline: none;
    }
    textarea{
    	resize: none;
    	height: 150px;
    }
    input::placeholder, textarea::placeholder{
        color: #adcabf;
    }
    .btnSave, .btnAddPic, .btnCancle, .btnDel, .btnPics {
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

    .btnSave:hover, .btnAddPic:hover, .btnCancle:hover, .btnDel:hover, .btnPics:hover {
        background-color: #F0FFC2;
        border: 1px solid #73b1a1;
        color: #73b1a1;
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
                <h1>프로모션 수정</h1>
            </div>
        </div>
        <div class="foodPromo">
        <form id="modifyForm" action="/modifyProc.food" method="post" enctype="multipart/form-data">
            <div class="row cardList">
                <div class="col d-flex justify-content-center">
                    <div class="card">
                            <c:if test="${empty dtoPic}">
								<div class="col p-4" style="text-align: center;">사진 없음</div>
								<label class="btn btnPics" for="food_src" style="width:100%;">사진 등록</label>
                            	<input type="file" class="form-control inputCls" id="food_src" name="food_src" style="display: none;">
							</c:if>
							<c:if test="${not empty dtoPic}">
									<img src="/files/${dtoPic.food_src}" class="card-img-top" id="food_src_img">
									<%-- 사진 등록 --%>
									<label class="btn btnPics" for="food_src">사진 수정</label>
                            		<input type="file" class="form-control inputCls" id="food_src" name="food_src" value="${dtoPic.food_src}" style="display: none;">
							</c:if>
                        <div class="card-body">
                        	<div class="input-group">
                        		<span class="input-group-text">제품명</span>
                            	<input class="form-control inputCls p-3" type="text" id="food_name" name="food_name" value="${dto.food_name}">
                            	<input class="form-control inputCls d-none" type="text" id="food_seq" name="food_seq" value="${dto.food_seq}">
                        	</div>
                        	<div class="input-group">
                        		<span class="input-group-text">설명</span>
                        		<input class="form-control inputCls" type="text" id="food_title" name="food_title" value="${dto.food_title}">
                        	</div>
                        	<div class="input-group">
                        		<span class="input-group-text">가격</span>
                        		<input class="form-control inputCls" type="text" id="food_price" name="food_price" value="${dto.food_price}">
                        	</div>
                        	<div class="input-group">
                        		<span class="input-group-text">링크주소</span>
                        		<textarea class="form-control inputCls" id="food_com" name="food_com">${dto.food_com}</textarea>
                        	</div>
                        </div>
                    </div>
                </div>
        	</div>
        	</form>
        	<div class="empty"> </div>
        <div class="row">
            <div class="col btnSpace d-flex justify-content-center">
                <button class="btn btnCancle" type="button">취소</button>
            </div>
            <div class="col btnSpace d-flex justify-content-center">
                <button class="btn btnSave" type="button">저장</button>
            </div>
            <div class="col btnSpace d-flex justify-content-center">
                <button class="btn btnDel" type="button">삭제</button>
            </div>
        </div>
        </div>
        <div class="empty"> </div>
        <!-- footer -->
        <jsp:include page="/frame/footer.jsp"/>
    </div>
    <script>
    $(".btnCancle").on("click", function(){
    	location.href = "/modifyList.food?curPage=1";
	})
	
	$(".btnSave").on("click", function(){
		if ($("#food_name").val() === "") {
			alert("제품명을 입력하세요.");
			$("#food_name").focus();
			return;
		}
		if ($("#food_title").val() === "") {
			alert("설명을 입력하세요.");
			$("#food_title").focus();
			return;
		}
		if ($("#food_price").val() === "") {
			alert("가격을 입력하세요.");
			$("#food_price").focus();
			return;
		}
		if ($("#food_com").val() === "") {
			alert("링크주소를 입력하세요.");
			$("#food_com").focus();
			return;
		}
		let answer = confirm("정말 수정하시겠습니까?");
		if(answer){
			$("#modifyForm").submit();
		}
	})
	
	$(".btnDel").on("click", function(){
		let answer = confirm("정말 삭제하시겠습니까?");
		console.log(answer);
		if(answer){
			location.href = "/deleteProc.food?food_seq=${dto.food_seq}";
		}
	})
		
	// 이미지 미리보기
	$("#food_src").change(function(){
    	setImageFromFile(this, "#food_src_img");
	});

	function setImageFromFile(input, expression) {
    	if (input.files && input.files[0]) {
        	var reader = new FileReader();
        	reader.onload = function (e) {
          	  $(expression).attr("src", e.target.result);
        	}
        reader.readAsDataURL(input.files[0]);
    	}
	}
    </script>
</body>
</html>