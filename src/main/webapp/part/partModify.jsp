<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!-- text area auto size -->        
<script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>    
<title>근육별 수정페이지</title>
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
.empty1{
background-color: white;
	height: 10px;
}
.emptyTop{
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
    font-family: 'LeferiPoint-WhiteA';
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
	font-weight: 600;
	text-align: center;
	border: none;
	border-top: 1px solid #97C4B8;
	border-bottom: 1px solid #97C4B8;
	font-family: 'LeferiPoint-WhiteA';
	font-weight: 600;
	}
	
	.partTextarea:focus {
	outline: none;
	}

/*버튼*/
.btnSpace {
        margin-bottom: 10px;
        font-family: 'LeferiPoint-WhiteObliqueA';
        font-weight: 600;
        justify-content: center;
    }

    .btnModify, .btnPics, #btnModify, #btnList, #btnSave{
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

    .btnModify:hover, .btnPics:hover, #btnModify:hover, btnList:hover{
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
	<div class="container" style="margin-top: 80px;">
		<div class="partDetail">
			<form action="/partModify.part" method="post" id="modifyForm" enctype="multipart/form-data">
				<div class="row title">
					<div class="col-2 d-flex align-items-center">
					<input type="text" class="d-none" name="part_seq" value="${dto.part_seq}">
						<select name="part_class" class="form-select">
							<option selected>${dto.part_class}</option>
							<option value="상체">상체</option>
							<option value="하체">하체</option>
							<option value="유산소">유산소</option>
						</select>
					</div>
					<div class="col-10">
						<h2 class="class d-flex justify-content-center">
							<input type="text" id="part_title" name="part_title" value="${dto.part_title}">
						</h2>
					</div>
				</div>
				<div class="row d-flex justify-content-center">
					<figure class="figure text-center">
							<img src="/files/${FolderDTO.part_src}" id="part_src_img"
								class="figure-img img-fluid rounded">
							<figcaption class="figure-caption text-end">참고이미지</figcaption>
							<label class="btn btnPics" for="part_src" style="width: 10rem;">사진
								등록</label>
							<input class="form-control" type="file" id="part_src"
								name="part_src" style="display: none;">
						</figure>
				</div>
				<div class="row">
                	<div class="col content d-flex justify-content-center">
                		<textarea class="partTextarea" name="part_content">${dto.part_content}</textarea>
                	</div>
                </div>
				<div class="empty"></div>
				</form>
				<div class="row">
					<div class="col d-flex justify-content-end">
						<button type="button" class="btnList" id="btnList" value="${dto.part_seq}">취소</button>
					</div>
					<div class="col d-flex justify-content-start">
						<button type="button" class="btn" id="btnSave">수정</button>
					</div>
				</div>
			</div>
		</div>
		<div class="empty" style="margin: 40px;"></div>
		<!-- footer -->
        <jsp:include page="/frame/footer.jsp"/>
	</div>
	<script>
	$("#btnList").on("click", function(e){
		location.href="/partDetail.part?part_seq="+$(e.target).val();
	})
	
	$("#btnSave").on("click", function(){
		if($("#part_class option:selected").val() === "목록 선택"){
			alert("부위를 선택해주세요.");
			$("#part_class").focus();
			return;
		} else if ($("#part_title").val() === ""){
			alert("제목을 입력해주세요.");
			$("#part_title").focus();
			return;
		} else if($("#part_src").val() === "") {
			alert("사진등록을 재등록 해주시기 바랍니다.");
			return;
		} else if ($("#part_content").val() === ""){
			alert("내용을 입력하세요.");
			$("#part_content").focus();
			return;
		} 
		
		$("#modifyForm").submit();
		
	})
	
	autosize($("textArea"));
	
	// 이미지 미리보기
	$("#part_src").change(function(){
    	setImageFromFile(this, "#part_src_img");
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