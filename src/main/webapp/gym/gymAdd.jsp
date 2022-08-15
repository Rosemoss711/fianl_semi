<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- text area auto size -->        
<script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script> 
<!-- 구글 아이콘 -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<!-- 다음 주소 -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=40927a14f44e1c75637977bc1c89c8a4&libraries=services"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<title>운동시설 등록페이지</title>
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

.btnAdd, .btnMainPic, .btnPics, .btnBuy, .btnCancle, .btnAddr, .btnDtailPics {
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

.btnAdd:hover, .btnMainPic:hover, .btnPics:hover, .btnBuy:hover, .btnCancle:hover, .btnAddr:hover, .btnDtailPics:hover {
	background-color: #F0FFC2;
	border: 1px solid #73b1a1;
	color: #73b1a1;
}

/* 목록 */
.list-item-wrap {
	margin-top: 40px;
	font-family: 'LeferiPoint-WhiteObliqueA';
	font-weight: 600;
	padding: 10px;
}

/* 디테일 헤더 */
.detailHeader {
	margin-bottom: 40px;
}

.form-select {
	font-weight: 600;
}

.detailPhotoWrap {
	height: 90%;
}

.detailPhoto img {
	width: 100%;
	height: 100%;
}

.gym_input {
	width: 100%;
	border: none;
	font-weight: 600;
	height: 50px;
}

.gym_input:focus {
	outline: none;
	border-bottom: 1px solid #b6e0db;
}

input::placeholder, textarea::placeholder {
	color: #adcabf;
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

.content {
	text-align: center;
}

.content_img {
	padding-inline: 10%;
	margin-bottom: 20px;
	-bs-gutter-x: 1rem;
}

.btnAddPic {
	width: 100%;
}

	.gym_textarea {
	width: 70%;
	height: 4rem;
	border: 1px solid #709c91;
	overflow: hidden;
	resize: none;
	font-weight: 600;
	text-align: center;
	}

	.gym_textarea:focus {
	outline: 1px solid #709c91;
	}

#images_container{
	width: 100%;
}

#images_container img{
	width : 100%;
}

.detailPic{
	margin-bottom: 80px;
}

.detailPic img {
	width: 100%;
	height: 100%;
}
</style>

<body>
	<div class="container">
		<!-- 헤더 -->
		<jsp:include page="/frame/header.jsp"/>
		<!-- 타이틀 -->
		<div class="list-item-wrap">
			<form id="addForm" action="/addProc.gym" method="post" enctype="multipart/form-data">
			<div class="row detailHeader">
                <div class="detailPhoto col-12 col-md-6">
                    <div class="row detailPhotoWrap">
                        <div class="col-12 detailPhoto d-flex justify-content-end">
                        	<img src="" id="gym_src_mainImg">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 d-flex justify-content-center">
                        <%-- 사진 등록 --%>
                        	<label class="btn btnPics" for="gym_src_main" style="width:100%;">사진 등록</label>
                            <input class="form-control" type="file" id="gym_src_main" name="gym_src_main" 
                            style="display: none;">
                        </div>
                    </div>
                </div>
                <div class="row d-md-none" style="margin-top: 50px;"></div>
                <div class="col-1"></div>
                <div class="col-12 col-md-5">
                    <div class="row">
                        <div class="col-8 gymTitle align-items-center">
                            <input class="gym_input" type="text" id="gym_name" name="gym_name" style="font-size: large;" placeholder="상호명 입력">
                        </div>
                        <div class="col d-flex justify-content-end">
                            <span class="material-symbols-outlined" style="padding-right: 5px;">mood</span>
                            <span class="material-symbols-outlined" style="padding-right: 5px;">wifi</span>
                        </div>
                        <hr style="height:2px; width:100%; border:none; background-color:#37b192;">
                        <div class="row">
                            <div class="col d-flex justify-content-end">
                                <input class="gym_input" type="text" id="gym_postcode" name="gym_postcode" style="width: 100px;" placeholder="우편번호" readonly>
                                <button class="btn btnAddr" type="button" onclick="daumPostcode()">주소찾기</button>
                            </div>
                            <div class="col-12">
                                <input class="gym_input" type="text" id="gym_roadAddr" name="gym_roadAddr" placeholder="도로명주소" readonly>
                                <input class="gym_input" type="text" id="gym_detailAddr" name="gym_detailAddr" placeholder="상세주소 입력">
                                <input class="gym_input" type="text" id="gym_extraAddr" name="gym_extraAddr" placeholder="표시될 주소" readonly>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-1 d-flex align-items-center">
                                <span class="material-symbols-outlined">
                                    call <!-- android_dialer 갑자기 안먹힘 -->
                                </span>
                            </div>
                            <div class="col d-flex align-items-center">
                                <input class="gym_input" type="text" id="gym_phone" name="gym_phone" placeholder="전화번호 입력"><p></p>
                            </div>
                        </div>
                        <hr style="height:2px; width:100%; border:none; background-color:#37b192;">
                        <div class="row">
                            <%-- <div class="col-12">
                                <h5 style="padding-left: 10px; font-weight: 600; color:#709c91">옵션 선택</h5>
                            </div>
                            <div class="col-12 d-flex justify-content-center">
                                <select class="form-select" name="option">
                                    <option value="1month">1개월</option>
                                    <option value="3month">3개월</option>
                                    <option value="6month">6개월</option>
                                    <option value="12month">12개월</option>
                                </select>
                            </div> --%>
                            <div class="col">
                             <input class="gym_input" type="text" id="gym_month" name="gym_month" style="text-align: center;" placeholder="개월수(숫자만) 입력">
                             <input class="gym_input" type="text" id="gym_price" name="gym_price" style="text-align: center;" placeholder="가격(숫자만) 입력">
                        	</div>
                        </div>
                        <div class="empty"></div>
                        <div class="col d-flex justify-content-center">
                            <button class="btn btnBuy d-none" type="button">가격 등록</button>
                        </div>
                    </div>
                </div>
            </div>
			<!-- 상세페이지 헤더 끝-->
			<div class="row detailBody">
				<hr
					style="height: 2px; width: 100%; border: none; background-color: #37b192;">
				<div class="notice">
					<div class="row">
						<div class="col">
							<h4 class="gymContentsText">공지사항 및 소개</h4>
						</div>
					</div>
					<div class="row">
						<div class="col content">
							<textarea class="gym_textarea" name="gym_comment" id="gym_comment"
								placeholder="공백 포함 500글자 이내로 입력하세요."></textarea>
						</div>
					</div>
					<div class="empty"></div>
				</div>
				<hr
					style="height: 2px; width: 100%; border: none; background-color: #37b192; text-align: center; margin: auto;">
				<div class="noticeTime">
					<div class="row">
						<div class="col">
							<h4 class="gymContentsText">운영시간</h4>
						</div>
					</div>
					<div class="row">
						<div class="col content">
							<textarea class="gym_textarea" name="gym_time" id="gym_time"
								placeholder="예)AM 08:00 ~ PM 22:00 연중무휴"></textarea>
						</div>
					</div>
					<div class="empty"></div>
				</div>
				<hr
					style="height: 2px; width: 100%; border: none; background-color: #37b192; text-align: center; margin: auto;">
				<div class="noticeInfo">
					<div class="row">
						<div class="col">
							<h4 class="gymContentsText">운영 프로그램</h4>
							<div class="row">
								<div class="col content">
									<textarea class="gym_textarea" name="gym_program" id="gym_program"
										placeholder="예)무료
O.T(3개월 2회 / 6개월 4회 / 12개월 8회 세미 P.T 제공)"></textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="empty"></div>
				</div>
				<hr
					style="height: 2px; width: 100%; border: none; background-color: #37b192; text-align: center; margin: auto;">
				<div class="detailPic">
					<div class="row">
						<div class="col-12">
							<h4 class="gymContentsText">운동시설 사진</h4>
						</div>
					</div>
					
					<%-- 보류 --%>
					<div class="d-none" id='image_preview'>
    						<input type='file' id='btnAtt' name="gym_src" multiple='multiple' multiple>
    						<div id='att_zone'></div>
  					</div>
  					<%-- 보류 --%>
  					
					<div class="row content_img">
						<div class="col justify-content-center" style="text-align:center;">
							<div><img id="gym_src_img" src=""></div>
							<div><label class="btn btnDtailPics" for="gym_src">상세사진 등록</label>
                            <input class="form-control" type="file" id="gym_src" name="gym_src" style="display: none;"></div>
						</div>
					</div>
				</div>
				<hr
					style="height: 2px; width: 100%; border: none; background-color: #37b192; text-align: center; margin: auto;">
				<div class="noticeMap">
					<div class="row">
						<div class="col">
							<h4 class="gymContentsText">운동시설 위치</h4>
						</div>
						<!-- 카카오 맵 -->
						<div class="row">
							<div class="col content" id="map"
								style="width: 500px; height: 400px;"></div>
						</div>
						<!-- 카카오 맵 끝 -->
					</div>
					<div class="empty"></div>
				</div>
				<hr
					style="height: 2px; width: 100%; border: none; background-color: #37b192; text-align: center; margin: auto;">
			</div>
			</form>
			<div class="row">
				<div class="col-12 d-flex justify-content-end">
					<button type="button" class="btn btnCancle">취소</button>
					<button type="button" class="btn btnAdd">완료</button>
				</div>
			</div>
		</div>
		<div class="empty"></div>
		<!-- footer -->
        <jsp:include page="/frame/footer.jsp"/>
	</div>

	<script>
	$(".btnCancle").on("click", function(){
    	location.href = "/list.gym";
	})
	
	autosize($("textArea"));
	
	$(".btnAdd").on("click", function(){
	      let regexPrice = /^[0-9]+$/;
	      let nameReg = /^.{1,30}$/;
	      let commentReg = /^.{1,666}/;
	      
	      if ($("#gym_src_main").val() === "") {
	         alert("사진 등록은 필수입니다.");
	         $("#gym_src").focus();
	         return;
	      } else if ($("#gym_name").val() === "") {
	         alert("상호를 입력하세요.");
	         $("#gym_name").focus();
	         return;
	      }  else if($("#gym_postcode").val() === ""){
	          alert("주소지를 등록해주세요.");
	          $("#gym_postcode").focus();
	          return;
	      } else if($("#gym_phone").val() === "") {
	          alert("전화번호를 입력해주세요.");
	          $("#gym_phone").focus();
	          return;
	      } else if ($("#gym_comment").val() === "") {
	         alert("공지사항을 입력하세요.");
	         $("#gym_comment").focus();
	         return;
	      } else if ($("#gym_time").val() === ""){
	         alert("운영 시간을 입력해주세요.");
	         $("#gym_time").focus();
	         return;
	      } else if($("#gym_program").val() === "") {
	         alert("운영 프로그램을 입력해주세요.");
	         $("#gym_program").focus();
	         return;
	      }else if (!regexPrice.test($("#gym_price").val())) {
	         alert("가격을 숫자로 입력하세요.");
	         $("#gym_price").focus();
	         return;
	      } else if (!regexPrice.test($("#gym_month").val())){
	         alert("개월수는 숫자만 입력해주세요.");
	         $("#gym_month").focus();
	         return;
	      } else if (!nameReg.test($("#gym_name").val())){
	         alert("상호명이 너무 깁니다.");
	         $("#gym_name").focus();
	         return;
	      } else if (!commentReg.test($("#gym_comment").val())){
	         alert("공지사항 글자수를 줄여주세요.");
	         $("#gym_comment").focus();
	         return;
	      } else if (!commentReg.test($("gym_program").val())){
	         alert("운영 프로그램 글자수를 줄여주세요.");
	         $("#gym_program").focus();
	         return;
	      }
	      
	      
	      
	      $("#addForm").submit();
	   })

		
	// 이미지 미리보기
	$("#gym_src_main").change(function(){
    	setImageFromFile(this, "#gym_src_mainImg");
	});

	$("#gym_src").change(function(){
    	setImageFromFile(this, "#gym_src_img");
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
	
	// 이미지 여러개
	( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
			  imageView = function imageView(att_zone, btn){

			    var attZone = document.getElementById(att_zone);
			    var btnAtt = document.getElementById(btn)
			    var sel_files = [];
			    
			    // 이미지와 체크 박스를 감싸고 있는 div 속성
			    var div_style = 'display:inline-block;position:relative;'
			                  + 'width:150px;height:120px;margin:5px;border:1px solid #00f;z-index:1';
			    // 미리보기 이미지 속성
			    var img_style = 'width:100%;height:100%;z-index:none';
			    // 이미지안에 표시되는 체크박스의 속성
			    var chk_style = 'width:30px;height:30px;position:absolute;font-size:24px;'
			                  + 'right:0px;bottom:0px;z-index:999;background-color:rgba(255,255,255,0.1);color:#f00';
			  
			    btnAtt.onchange = function(e){
			      var files = e.target.files;
			      var fileArr = Array.prototype.slice.call(files)
			      for(f of fileArr){
			        imageLoader(f);
			      }
			    }  
			    
			    /*첨부된 이미리즐을 배열에 넣고 미리보기 */
			    imageLoader = function(file){
			      sel_files.push(file);
			      var reader = new FileReader();
			      reader.onload = function(ee){
			        let img = document.createElement('img')
			        img.setAttribute('style', img_style)
			        img.src = ee.target.result;
			        attZone.appendChild(makeDiv(img, file));
			      }
			      reader.readAsDataURL(file);
			    }
			    
			    /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
			    makeDiv = function(img, file){
			      var div = document.createElement('div')
			      div.setAttribute('style', div_style)
			      
			      var btn = document.createElement('input')
			      btn.setAttribute('type', 'button')
			      btn.setAttribute('value', 'x')
			      btn.setAttribute('delFile', file.name);
			      btn.setAttribute('style', chk_style);
			      btn.onclick = function(ev){
			        var ele = ev.srcElement;
			        var delFile = ele.getAttribute('delFile');
			        for(var i=0 ;i<sel_files.length; i++){
			          if(delFile== sel_files[i].name){
			            sel_files.splice(i, 1);      
			          }
			        }
			        
			        dt = new DataTransfer();
			        for(f in sel_files) {
			          var file = sel_files[f];
			          dt.items.add(file);
			        }
			        btnAtt.files = dt.files;
			        var p = ele.parentNode;
			        attZone.removeChild(p)
			      }
			     div.appendChild(img)
			     div.appendChild(btn)
			     return div
			   }
			 }
		)('att_zone', 'btnAtt')
		
	
	/* 다음 주소 */
	function daumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== ''
								&& /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// ㅇㅇ시 ㅇㅇ구 엑스트라 주소
						if (extraRoadAddr !== '') {
							extraRoadAddr = data.sido + ' ' + data.sigungu;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('gym_postcode').value = data.zonecode;
						document.getElementById("gym_roadAddr").value = roadAddr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("gym_detailAddr").focus();
						
						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("gym_extraAddr").value = extraRoadAddr;
						} else {
							document.getElementById("gym_extraAddr").value = '';
						}
					}
				}).open();
	};

	/* 카카오 맵 */
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3 // 지도의 확대 레벨
	};

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	let gym_extraAddr = $("#gym_roadAddr").val();
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