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
<title>전체 회원 목록</title>
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

/* 바디 타이틀 */
.title {
	color: #97C4B8;
	border-bottom: 1px solid #97C4B8;
	-bs-gutter-x: 0px;
	margin-bottom: 50px;
	margin-top: 50px;
	font-family: '양진체';
	text-align:center;
}

/* 바디 서치 */
.search_input>input {
	position: relative;
	right: 10px;
	width: 200px;
}

/* 바디 테이블 */
.cls_body{
	font-family: 'LeferiPoint-WhiteA';
	font-weight: 600;
}

.cls_table {
	width: 100%;
	margin: auto;
}

/* update table */
.thTitle{
	background-color: #61becd !important;
	text-align: center;
	color: white;
	border-bottom: 2px solid #9fd9df !important;
	vertical-align: middle;
}

td{
	vertical-align: middle;
	text-align: center;
}

.update_table {
	margin: auto;
	width: 80%;
}

.update_col {
	width: 20%;
}

.insert_col {
	width: 40%;
}

.update_table>tr {
	text-align: center;
}

.update_table>tr>th {
	background-color: rgb(231, 231, 231);
}

/* 버튼, 인풋 */
.btnSpace {
	margin-bottom: 10px;
	font-family: 'LeferiPoint-WhiteObliqueA';
	font-weight: 600;
}

.btnAdd {
	background-color: #73b1a1;
	border: 1px solid #F0FFC2;
	border-radius: 80rem;
	padding-top: 5px;
	padding-bottom: 2px;
	padding-left: 10px;
	padding-right: 10px;
	font-family: 'LeferiPoint-WhiteObliqueA';
	font-size: small;
	color: white;
	margin: 5px;
}

.btnAdd:hover {
	background-color: #F0FFC2;
	border: 1px solid #73b1a1;
	color: #73b1a1;
}

#userSearch {
	background-color: #61becd;
	color: white;
}

#userSearch:hover {
	background-color: #31a6b9;
}

#search_input {
	border: 1px solid #61becd;
	border-radius: 0;
	right: -10px;
}

#search_input::placeholder {
	color: #adcabf;
	text-align: center;
}

#search_input:focus {
	outline: #adcabf !important;
}

input, select, option{
	font-weight: 600 !important;
}
</style>

<body>
	<div class="container">
		<!-- 헤더 -->
		<jsp:include page="/frame/header.jsp"/>
		
		<div class="container cls_body">
			<div class="row title">
				<h2>전체 회원 목록</h2>
			</div>
			<div class="row cls_search">
				<div class="col-10 d-flex justify-content-end search_input">
					<input type="text" class="form-control" id="search_input"
						name="search_input" placeholder="이름검색">
				</div>
				<div class="col-2 search_btn d-flex justify-content-end">
					<button type="button" id="userSearch" class="btn">찾기</button>
				</div>
			</div>
			<div class="empty"></div>

			<!-- body영역 -->
			<div class="row cls_table">
				<table class="table">
					<thead>
						<tr>
							<th scope="col" class="thTitle">이메일</th>
							<th scope="col" class="thTitle">이름</th>
							<th scope="col" class="thTitle">휴대폰번호</th>
							<th scope="col" class="thTitle">마지막 접속 날짜</th>
							<th scope="col" class="thTitle">등급</th>
							<th scope="col" class="thTitle">수정 하기</th>
						</tr>
					</thead>
					<tbody id="user_table">
						<c:choose>
							<c:when test="${list.size() == 0}">
								<tr>
									<td colspan="6">등록된 회원이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${list}" var="dto">
									<tr>
										<td>${dto.user_id}</td>
										<td>${dto.user_name}</td>
										<td>${dto.user_phone}</td>
										<td>${dto.signup_date}</td>
										<td>${dto.user_auth}</td>
										<td><button type="button" class="clickBtn btn btnAdd"
												value="${dto.user_seq}">수정</button></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<nav>
					<ul class="pagination justify-content-center">
						<c:if test="${naviMap.needPrev eq true}">
							<li class="page-item"><a class="page-link" href="">←</a></li>
						</c:if>

						<c:forEach var="pageNum" begin="${naviMap.startNavi}"
							end="${naviMap.endNavi}" step="1">
							<li class="page-item"><a class="page-link"
								href="/search.user?curPage=${pageNum}">${pageNum}</a></li>
						</c:forEach>

						<c:if test="${naviMap.needNext eq true}">
							<li class="page-item"><a class="page-link" href="">→</a></li>
						</c:if>
					</ul>
				</nav>
				<form action="/user_update.manager" method="post" id="updateForm">
					<table class="update_table cls_table table" border="1">
						<thead class="update_table">
							<tr>
								<th class="update_col"></th>
								<th class="insert_col">수정 전</th>
								<th class="insert_col">수정 내용</th>
							</tr>
						</thead>
						<tbody class="update_table" id="modify_table">
							<tr>
								<th class="update_col">이메일</th>
								<td class="insert_col"><input type="text"
									class="form-control user_id" readonly></td>
								<td class="insert_col"><input type="text"
									class="form-control user_id" name="user_id" readonly></td>
							</tr>
							<tr>
								<th class="update_col">이름</th>
								<td class="insert_col"><input type="text"
									class="form-control" readonly></td>
								<td class="insert_col"><input type="text"
									class="form-control user_name" name="user_name"
									class="update_input"></td>
							</tr>
							<tr>
								<th class="update_col">휴대폰 번호</th>
								<td class="insert_col"><input type="text"
									class="form-control" readonly></td>
								<td class="insert_col"><input type="text"
									class="form-control user_phone" class="update_input"
									placeholder="-제외"></td>
							</tr>
							<tr>
								<th class="update_col">등급</th>
								<td class="insert_col"><input type="text"
									class="form-control" readonly></td>
								<td class="insert_col"><select
									class="form-select user_auth" name="user_auth">
										<option value="" selected>등급 선택</option>
										<option value="member">Member</option>
										<option value="admin">Admin</option>
										<option value="manager">Manager</option>
								</select></td>
							</tr>
							<tr>
								<th class="update_col">메모</th>
								<td class="insert_col"><input type="text"
									class="form-control" value="" readonly></td>
								<td class="insert_col"><input type="text"
									class="form-control update_input user_memo" id="" value=""></td>
							</tr>
						</tbody>
					</table>
					<div class="empty"></div>
					<div class="row btn-before">
						<div class="col-10 d-flex justify-content-end"></div>
						<div class="col-2">
							<button type="button" class="btn btnAdd" id="modify_btn">수정</button>
						</div>
					</div>
				</form>
				<div class="row btn-after d-none">
					<div class="col-10 d-flex justify-content-end">
						<button type="button" class="btn btnAdd toModify_btn">수정완료</button>
					</div>
					<div class="col-2">
						<button type="button" class="btn btnAdd" id="cancel_btn">취소</button>
					</div>
				</div>
			</div>
		</div>
		<!-- footer -->
        <jsp:include page="/frame/footer.jsp"/>
	</div>

	<script>
	let clickBtnFunction = function(e){
		let user_seq = $(e.target).val();

		$.ajax({
			url : "/managerUpdate.manager?user_seq=" + user_seq,
			type : "get",
			dataType : "json",
			success : function(data) {
				$("#modify_table").empty();
				let tr1 = $("<tr>");
				let th1_1 = $("<th>").addClass("update_col").html("이메일");
				let td1_1 = $("<td>").addClass("insert_col");
				let input1_1 = $("<input>").addClass("form-control").attr({
					type : "text",
					value : data.user_id,
					readonly : true
				});
				td1_1.append(input1_1);
				let td1_2 = $("<td>").addClass("insert_col");
				let input1_2 = $("<input>").addClass("form-control user_id").attr({
					type : "text",
					value : data.user_id,
					name : "user_id",
					readonly : true
				});
				td1_2.append(input1_2);
				tr1.append(th1_1, td1_1, td1_2);

				let tr2 = $("<tr>");
				let th2_1 = $("<th>").addClass("update_col").html(
						"이름");
				let td2_1 = $("<td>").addClass("insert_col");
				let input2_1 = $("<input>").addClass(
						"form-control").attr({
					type : "text",
					value : data.user_name,
					readonly : true
				});
				td2_1.append(input2_1);
				let td2_2 = $("<td>").addClass("insert_col");
				let input2_2 = $("<input>").addClass(
						"form-control user_name").attr({
					type : "text",
					name : "user_name"
				});
				td2_2.append(input2_2);
				tr2.append(th2_1, td2_1, td2_2);

				let tr3 = $("<tr>");
				let th3_1 = $("<th>").addClass("update_col").html(
						"휴대폰 번호");
				let td3_1 = $("<td>").addClass("insert_col");
				let input3_1 = $("<input>").addClass(
						"form-control").attr({
					type : "text",
					value : data.user_phone,
					readonly : true
				});
				td3_1.append(input3_1);
				let td3_2 = $("<td>").addClass("insert_col");
				let input3_2 = $("<input>").addClass(
						"form-control user_phone").attr({
					type : "text",
					name : "user_phone",
					placeholder : "-제외"
				});
				td3_2.append(input3_2);
				tr3.append(th3_1, td3_1, td3_2);

				let tr4 = $("<tr>");
				let th4_1 = $("<th>").addClass("update_col").html(
						"등급");
				let td4_1 = $("<td>").addClass("insert_col");
				let input4_1 = $("<input>").addClass(
						"form-control").attr({
					type : "text",
					value : data.user_auth,
					readonly : true
				});
				td4_1.append(input4_1);
				let td4_2 = $("<td>").addClass("insert_col");
				let select4_1 = $("<select>").addClass(
						"form-select user_auth").attr({
					name : "user_auth"
				})
				let option4_1 = $("<option>").attr({
					value : data.user_auth,
					selected : true
				}).text("등급 선택");
				let option4_2 = $("<option>").attr({
					value : "member"
				}).text("member");
				let option4_3 = $("<option>").attr({
					value : "admin"
				}).text("admin");
				let option4_4 = $("<option>").attr({
					value : "manager"
				}).text("manager");
				select4_1.append(option4_1, option4_2, option4_3,
						option4_4);
				td4_2.append(select4_1);
				tr4.append(th4_1, td4_1, td4_2);

				let tr5 = $("<tr>");
				let th5_1 = $("<th>").addClass("update_col").html(
						"메모");
				let td5_1 = $("<td>").addClass("insert_col");
				let input5_1 = $("<input>").addClass(
						"form-control user_memo").attr({
					type : "text",
					value : data.user_memo,
					readonly : true
				});
				td5_1.append(input5_1);
				let td5_2 = $("<td>").addClass("insert_col");
				let input5_2 = $("<input>").addClass(
						"form-control user_memo").attr({
					type : "text",
					name : "user_memo"
				});
				td5_2.append(input5_2);
				tr5.append(th5_1, td5_1, td5_2);

				$("#modify_table").append(tr1, tr2, tr3, tr4, tr5);

			},
			error : function(e) {
				console.log(e);
			}
		})
	} ;
	
	
	
		// 수정 버튼 눌렀을때 수정완료 취소 생성
		$("#modify_btn").on("click", function() {
			$(".btn-before").css("display", "none");
			$(".btn-after").removeClass("d-none");
		})
		// 취소 누르면 다시 원래대로 돌리기
		$("#cancel_btn").on("click", function() {
			$(".btn-after").addClass("d-none");
			$(".btn-before").css("display", "flex");
		})

		$(".toModify_btn").on("click", function() {
			if($(".user_name").val() === ""){
				alert("이름을 입력해주세요.");
				$(".user_name").focus();
				return;
			} else if ($(".user_phone").val() === ""){
				alert("핸드폰 번호를 입력해주세요.");
				$(".user_phone").focus();
				return;
			}
			$("#updateForm").submit();
		})
	
		$("#userSearch").on("click", function(e){
			let user_name = $("#search_input").val();
			
			$.ajax({
				url : "/managerSearch.user?user_name="+user_name,
				type : "get",
				dataType : "json",
				success : function(data){
					$("#user_table").empty();
					if(data.length > 0){
						for(var dto of data){
							let tr1 = $("<tr>");
							let td1 = $("<td>").html(dto.user_id);
							let td2 = $("<td>").html(dto.user_name);
							let td3 = $("<td>").html(dto.user_phone);
							let td4 = $("<td>").html(dto.signup_date);
							let td5 = $("<td>").html(dto.user_auth);
							let td6 = $("<td>");
							let btn = $("<button>").attr({
								type : "button",
								value : dto.user_seq
							}).addClass("clickBtn btn btnAdd").html("수정");
							td6.append(btn);
							tr1.append(td1, td2, td3, td4, td5, td6);
							$("#user_table").append(tr1);
						}
						$(function(){$(".clickBtn").on("click",function(e) {
							clickBtnFunction(e);

							})
						})
						
					} else {
						let tr = $("<tr>");
						let td = $("<td>").attr("colspan", "6").html("등록된 회원이 없습니다.");
						tr.append(td);
						$("#user_table").append(tr);
					}
				},
				error : function(e){
					console.log(e);
				}
				
			});
			
		});
		
		
		$(".clickBtn").on("click",function(e) {
			clickBtnFunction(e);	
		})
	</script>
</body>

</html>