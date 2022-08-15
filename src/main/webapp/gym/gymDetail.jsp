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
<!-- text area auto size -->        
<script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>    
<!-- 카카오 맵 -->
<script type="text/javascript"
                            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=40927a14f44e1c75637977bc1c89c8a4&libraries=services"></script>    
<link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<title>운동시설 상세정보</title>
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

    /* 버튼 */
    .btnSpace {
        margin-bottom: 10px;
        font-family: 'LeferiPoint-WhiteObliqueA';
        font-weight: 600;
    }

    .btnBuy {
        width: 100%;
        height: 60px;
        font-weight: 600;
    }

    .btnAdd, .btnBuy, .btnModify, .btnDel {
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

    .btnAdd:hover, .btnBuy:hover, .btnModify:hover, .btnDel:hover {
        background-color: #F0FFC2;
        border: 1px solid #73b1a1;
        color: #73b1a1;
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
    .list-item-wrap {
        margin-top: 40px;
        font-family: 'LeferiPoint-WhiteObliqueA';
        font-weight: 600;
        padding: 10px;
    }
    /* 디테일 헤더 */
    .detailHeader{
        margin-bottom: 40px;
    }
    .gymTitle{
        margin-bottom: 20px;
    }
    .form-select {
        font-weight: 600;
    }

    .mainPhoto>img {
        width: 100%;
        height: 100%;
    }

    /* 디테일 바디 */
    .detailBody {
        margin-bottom: 30px;
    }
    .gymContentsText {
        padding: 30px;
        font-weight: 600;
        text-align: center;
        color: #73b1a1;
    }
    .content{
        text-align: center;
    }
    .content_img{
        padding-inline: 10%;
        margin-bottom: 20px;
        --bs-gutter-x: 1rem;
    }
    
    .gym_textarea {
	width: 70%;
	height: 4rem;
	overflow: hidden;
	border: none;
	resize: none;
	font-weight: 600;
	text-align: center;
	}
	
	.gym_textarea:focus {
	outline: none;
	}
	
    .noticePic img{
        width: 100%;
        height: 100%;
    }
    
    .noticePic img:hover{
        transform: scale(2);
    }
    
    /* 구글 아이콘 */
    .material-symbols-outlined {
        font-variation-settings:
            'FILL' 0,
            'wght' 400,
            'GRAD' 0,
            'opsz' 48
    }
</style>
</head>

<body>
    <div class="container">
		<!-- 헤더 -->
		<jsp:include page="/frame/header.jsp"/>
		<!-- 타이틀 -->
        <div class="list-item-wrap">
            <div class="row detailHeader">
                <div class="mainPhoto col-12 col-sm-6">
                	<c:if test="${empty dto.gym_src_main}">
                    	사진 없음
                    </c:if>
                    <c:if test="${not empty dto.gym_src_main}">
                    	<img src="/files/${dto.gym_src_main}" name="gym_src_main">
                    </c:if>
                </div>
                <div class="row d-sm-none" style="height: 30px;"></div>
                <div class="col-1"></div>
                <div class="col-12 col-sm-5">
                    <div class="row">
                        <div class="col-8 gymTitle">
                            <h2 style="margin: 0px; padding-left: 10px; font-weight: 600;" id="gym_name">${dto.gym_name}</h2>
                        </div>
                        <div class="col d-flex justify-content-end">
                            <span class="material-symbols-outlined" style="padding-right: 5px;">mood</span>
                            <span class="material-symbols-outlined" style="padding-right: 5px;">wifi</span>
                        </div>
                        <hr style="height:2px; width:100%; border:none; background-color:#37b192;">
                        <div class="row">
                            <div class="empty"></div>
                            <div class="col">
                                <h5 style="padding-left: 10px; font-weight: 600;" id="gym_extraAddr">${dto.gym_extraAddr}</h5>
                                <input type="text" id="mapAddr" value="${dto.gym_roadAddr} ${dto.gym_detailAddr}" style="display: none">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-1">
                                <span class="material-symbols-outlined">
                                    call</span>
                            </div>
                            <div class="col">
                                <p>${dto.gym_phone}</p>
                            </div>
                        </div>
                        <hr style="height:2px; width:100%; border:none; background-color:#37b192;">
                        <form id="formCoupon" name="formCoupon">
                        <div class="row-12">
                            <div class="col-12">
                                <h5 style="padding-left: 10px; font-weight: 600; color:#709c91">당퍼트 프로모션 가격</h5>
                            </div>
                            <div class="col-12 d-flex justify-content-center">
                            	${dto.gym_month}개월&nbsp; &nbsp; &nbsp; &nbsp; : &nbsp; &nbsp; &nbsp; &nbsp;${dto.gym_price}원
                               <%-- <select class="form-select" name="option">
                                	<c:if test="${empty gymPriceDTO}">
                                		<option style="text-align: center;" value="3">준비 중 입니다.</option>
                                	</c:if>
                                	<c:if test="${not empty gymPriceDTO}">
                                		<c:forEach items="${gymPriceDTO}" var="gymPriceDTO">
                                   		<option style="text-align: center;" value="${gymPriceDTO.gym_price_seq}">${dto.gym_month}개월&nbsp; &nbsp; &nbsp; &nbsp; : &nbsp; &nbsp; &nbsp; &nbsp;${dto.gym_price}원</option>
                                		<input style="display:none;" name="gym_price_seq" value="${gymPriceDTO.gym_price_seq}">
                                    	</c:forEach>
                                    </c:if>
                                </select> --%>
                            </div>
                        </div>
                        <div class="empty"></div>
                        <c:if test=""></c:if>
                        <div class="col d-flex justify-content-center">
                            <button class="btn btnBuy" type="button">쿠폰 발급</button>
                            <input type="text" style="display:none;" name="user_seq" value="${loginSession.user_seq}">
                            <input type="text" style="display:none;" name="gym_seq" value="${dto.gym_seq}">
                        </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- 상세페이지 헤더 끝-->
            <div class="row detailBody">
                <hr style="height:2px; width:100%; border:none; background-color:#37b192;">
                <div class="notice">
                    <div class="row">
                        <div class="col">
                            <h4 class="gymContentsText">공지사항</h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col content">
                            <textarea class="gym_textarea" name="gym_comment" readonly>${dto.gym_comment}</textarea>
                        </div>
                    </div>
                    <div class="empty"></div>
                </div>
                <hr style="height:2px; width:100%; border:none; background-color:#37b192; text-align:center; margin:auto;">
                <div class="noticeTime">
                    <div class="row">
                        <div class="col">
                            <h4 class="gymContentsText">운영시간</h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col content">
                            <textarea class="gym_textarea" name="gym_time" readonly>${dto.gym_time}</textarea>
                        </div>
                    </div>
                    <div class="empty"></div>
                </div>
                <hr style="height:2px; width:100%; border:none; background-color:#37b192; text-align:center; margin:auto;">
                <div class="noticeInfo">
                    <div class="row">
                        <div class="col">
                            <h4 class="gymContentsText">운영 프로그램</h4>
                        </div>
                    </div>
                    <div class="row">
                    	<c:if test="${empty programDTO}">
                    		<div class="col content"> 준비 중 입니다. </div>
                    	</c:if>
                    	<c:if test="${not empty programDTO}">
                    		<c:forEach items="${programDTO}" var="programDTO">
                        		<div class="col content">${programDTO.gym_program}
                        		</div>
                        	</c:forEach>
                        </c:if>
                    </div>
                    <div class="empty"></div>
                </div>
                <hr style="height:2px; width:100%; border:none; background-color:#37b192; text-align:center; margin:auto;">
                <div class="noticePic">
                    <div class="row">
                        <div class="col">
                            <h4 class="gymContentsText">운동시설 사진</h4>
                        </div>
                    </div>
                    <div class="row content_img">
                    	<c:if test="${empty gymfolderDTO}"> 준비중입니다.
                    		<div class="col srcImg">
                        	</div>
                        	<div class="col srcImg">
                        	</div>
                        	<div class="col srcImg">
                        	</div>
                    	</c:if>
                    	<c:if test="${not empty gymfolderDTO}">
                    		<c:forEach items="${gymfolderDTO}" var="gymfolderDTO">
                        		<div class="col-4" style="margin-bottom:20px;">
                            		<img class="rounded" id="gym_src" src="/files/${gymfolderDTO.gym_src}">
                        		</div>
                        	</c:forEach>
                        </c:if>
                    </div>
                    <div class="empty"></div>
                </div>
                <hr style="height:2px; width:100%; border:none; background-color:#37b192; text-align:center; margin:auto;">
                <div class="noticeMap">
                    <div class="row">
                        <div class="col">
                            <h4 class="gymContentsText">운동시설 위치</h4>
                        </div>
                        <!-- 카카오 맵 -->
                        <div class="row">
                            <div class="col content" id="map" style="width:500px;height:400px;"></div>
                        </div>
                        <!-- 카카오 맵 끝 -->
                    </div>
                    <div class="empty"></div>
                </div>
                <hr style="height:2px; width:100%; border:none; background-color:#37b192; text-align:center; margin:auto;">
            </div>
            <div class="row">
                <div class="col-12 d-flex justify-content-end">
                <c:if test="${loginSession.user_seq eq user_seq || loginSession.user_auth eq 'manager'}">
                    <button type="button" class="btn btnModify"> 수정 </button>
                    <button type="button" class="btn btnDel"> 삭제 </button>
                </c:if> 
                </div>
            </div>
        </div>
    <div class="empty"> </div>
    	<!-- footer -->
        <jsp:include page="/frame/footer.jsp"/>
    </div>
	<script>
		$(".btnDel").on("click", function() {
			let answer = confirm("정말 삭제하시겠습니까?");
			console.log(answer);
			if (answer) {
				location.href = "/deleteProc.gym?gym_seq=${dto.gym_seq}";
			}
		})
		$(".btnModify").on("click", function() {
			location.href = "/modify.gym?gym_seq=${dto.gym_seq}";
		})
		
		autosize($("textArea"));
		
		/* 쿠폰번호 발급 */
		$("#formCoupon").on("click", ".btnBuy", function(){
			
			$(".btnBuy").attr("disabled", "disabled");
			
			$.ajax({
				url: "/getCoupon.gym"
				, type: "post"
				, data: {gym_price: "${dto.gym_price}", user_seq: "${loginSession.user_seq}", gym_seq: "${dto.gym_seq}"}
				,success: function(data){
					if(!data == ""){
						alert("쿠폰이 발급되었습니다.\n쿠폰번호: " + data);
					}else if(data == 0){
						alert("쿠폰 발급 실패.");
					}
				}, error: function(){
					alert("회원 전용 메뉴입니다.");
					console.log(e);
				}
			})
		})
		
		/* 카카오 맵 */
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		let gym_extraAddr = $("#mapAddr").val();
		console.log(gym_extraAddr);
		geocoder
				.addressSearch(
						gym_extraAddr,
						function(result, status) {

							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {

								var coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);

								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new kakao.maps.Marker({
									map : map,
									position : coords
								});

								// 인포윈도우로 장소에 대한 설명을 표시합니다
								var infowindow = new kakao.maps.InfoWindow(
										{
											content : '<div style="width:150px;text-align:center;padding:6px 0;">'
													+ $("#gym_name").html()
													+ '</div>'
										});
								infowindow.open(map, marker);

								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
							}
						});
		
	</script>
</body>
</html>