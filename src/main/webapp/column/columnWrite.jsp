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
<title>칼럼 수정페이지</title>
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
    margin-top: 10px;
    font-family: '양진체';
    }

  #column_title {
	width: 70%;
	height: 4rem;
	overflow: hidden;
	border: none;
	resize: none;
	font-weight: 600;
	text-align: center;
	font-family: 'LeferiPoint-WhiteObliqueA' !important;
    font-weight: 600;
	}
	
  .columnTextarea {
	width: 70%;
	height: 4rem;
	overflow: hidden;
	resize: none;
	font-weight: 600;
	text-align: center;
	border: none;
	border-top: 1px solid #b4ddd2;
	border-bottom: 1px solid #97C4B8;
	font-family: 'LeferiPoint-WhiteObliqueA';
    font-weight: 600;
    padding-top: 20px;
    padding-bottom: 20px;    
	}
	
	.columnTextarea:focus {
	outline: none;
	}
	
	.content{
		position:relative;
	}
	
	.dateLabel{
		position:absolute;
	}

/*버튼*/
	.btnSpace {
        margin-bottom: 10px;
        font-family: 'LeferiPoint-WhiteObliqueA';
        font-weight: 600;
        justify-content: center;
    }

    #btnCancle, #btnSave, .btnPics{
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

    #btnCancle:hover, #btnSave:hover, .btnPics:hover{
        background-color: #F0FFC2;
        border: 1px solid #73b1a1;
        color: #73b1a1;
    }

</style>

<body>
	<div class="container">
		<!-- 헤더 -->
		<jsp:include page="/frame/header.jsp"/>
		
		<div class="empty"></div>
		<div class="container">
		<div class="partDetail">
		<form action="/register.column" id="addForm" method="post" enctype="multipart/form-data">
			<div class="row title d-flex justify-content-center">
				<div class="col d-flex justify-content-center" style="margin-top: 40px;">
					<figure class="figure d-felx justify-content-center">
  						<img src="" id="column_src_img" class="figure-img img-fluid rounded">
  						<figcaption class="figure-caption text-end">참고이미지</figcaption>
  						<label class="btn btnPics" for="column_src" style="width:10rem;">사진 등록</label>
                        <input class="form-control" type="file" id="column_src" name="column_src" style="display: none;">
					</figure>
				</div>
			</div>
				<h1 class="class d-flex justify-content-center">
					<input type="text" id="column_title" name="column_title" placeholder="제목을 입력하세요.">
				</h1>
			<div class="row">
                <div class="col content d-flex justify-content-center">
                	<div><label class="figure-caption dateLabel text-end"></label></div>
                	<textarea class="columnTextarea" id="column_content" name="column_content" placeholder="내용을 입력하세요."></textarea>
                </div>
            </div>
            </form>
			<div class="empty"></div>
			<div class="row">
				<div class="col d-flex justify-content-end">
					<button type="button" class="btn" id="btnCancle">취소</button>
				</div>
				<div class="col-3 d-flex justify-content-start">
					<button type="button" class="btn" id="btnSave">저장</button>
				</div>
			</div>
		</div>
	</div>
	<div class="empty" style="margin: 40px;"></div>
		<!-- footer -->
        <jsp:include page="/frame/footer.jsp"/>
    </div>
    <script>
    	$("#btnCancle").on("click", function(){
    		location.href="/toColumnPage.column?curPage=1";
    	})
    	
    	let lengthReg = /.{1,666}/;
        let titleReg = /.{1,30}/;
    	
    	$("#btnSave").on("click", function(){
    		if($("#column_src").val() === "") {
    			alert("사진등록은 필수입니다.");
    			return;
    		} else if ($("#column_title").val() === ""){
    			alert("제목을 입력해주세요.");
    			$("#column_title").focus();
    			return;
    		} else if ($("#column_content").val() === ""){
    			alert("내용을 입력해주세요.");
    			$("#column_content").focus();
    			return;
    		} else if (!titleReg.test($("#column_title").val())){
    			alert("제목이 너무 깁니다.");
    			$("#column_title").focus();
    			return;
    		}else if (!lengthReg.test($("#column_content").val())){
    			alert("내용이 너무 깁니다.");
    			$("#column_content").focus();
    			return;
    		}
    		
    		$("#addForm").submit();
    	})
    	
    	autosize($("textArea"));
    	
    	// 이미지 미리보기
		$("#column_src").change(function(){
    		setImageFromFile(this, "#column_src_img");
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