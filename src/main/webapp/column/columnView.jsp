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
<title>칼럼 상세페이지</title>
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
    
.columnDetail{
	font-family: 'LeferiPoint-WhiteA';
	font-weight: 600;
}

  #column_title {
	width: 70%;
	height: 4rem;
	overflow: hidden;
	border: none;
	resize: none;
	font-weight: 600;
	text-align: center;
	font-family: 'LeferiPoint-WhiteA' !important;
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
	font-family: 'LeferiPoint-WhiteA';
    font-weight: 600;
    padding-top: 20px;
    padding-bottom: 20px;    
	}
	
	.figure-caption{
		font-family: 'LeferiPoint-WhiteA';
    	font-weight: 600;
	}
	
	.columnTextarea:focus, #column_title:focus {
	outline: none;
	}
	
	.content{
		position:relative;
	}
	
	.dateLabel{
		position:absolute;
	}
	
	img{
		width: 800px;
	}

/*버튼*/
	.btnSpace {
        margin-bottom: 10px;
        font-family: 'LeferiPoint-WhiteObliqueA';
        font-weight: 600;
        justify-content: center;
    }

    .btnModify, #btnDelete, #btnModify, #btnList{
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

    .btnModify:hover, #btnDelete:hover, #btnModify:hover, btnList:hover{
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
		<div class="columnDetail">
			<div class="row title">
				<div class="col" style="margin-top: 40px; text-align: center;">
					<figure class="figure d-felx justify-content-center">
  						<img src="/files/${dto.column_src}" onerror="this.style.display='none'" class="figure-img img-fluid rounded">
  						<figcaption class="figure-caption text-end">참고이미지</figcaption>
					</figure>
				</div>
			</div>
				<h1 class="class d-flex justify-content-center">
					<input type="text" id="column_title" name="column_title" value="${dto.column_title}" readonly>
				</h1>
				
			<div class="row">
                <div class="col content d-flex justify-content-center">
                	<div><label class="figure-caption dateLabel text-end" name="column_date">${dto.column_date}</label></div>
                	<textarea class="columnTextarea" name="column_content" readonly>${dto.column_content}</textarea>
                </div>
            </div>
			<div class="empty"></div>
			<div class="row btnSpace">
				<div class="col d-flex justify-content-center">
					<button type="button" class="btnList" id="btnList">목록으로</button>
				</div>
			<c:if test="${loginSession.user_auth eq 'manager'}">
				<div class="col d-flex justify-content-end">
					<button type="button" class="btn btn-warning" id="btnModify" value="${dto.column_seq}">수정</button>
				</div>
				<div class="col-3 d-flex justify-content-start">
					<button type="button" class="btn btn-danger" id="btnDelete" value="${dto.column_seq}">삭제</button>
				</div>
			</c:if>
			</div>
		</div>
	</div>
	<div class="empty" style="margin: 20px;"></div>
		<!-- footer -->
        <jsp:include page="/frame/footer.jsp"/>
    </div>
	<script>
	$("#btnList").on("click", function(){
		location.href="/toColumnPage.column?curPage=1";
	})
	
	$("#btnModify").on("click", function(e){
		location.href="/modify.column?column_seq="+${dto.column_seq};
	})
	
	$("#btnDelete").on("click", function(e){
		if(confirm("정말 삭제하시겠습니까?")){
			location.href="/deleteProc.column?column_seq="+$(e.target).val();
		}
		
	})
	
	autosize($("textArea"));
	
	




	</script>
</body>
</html>	