<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="/css/header.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>header</title>
</head>
<body>
	<div class="row cls_header">
		<div class="col-3 logoImg">
			<a href="/home"> <img id="logoImg" src="../imgs/dpt_Logo.png">
			</a>
		</div>
		<c:choose>
			<c:when test="${loginSession.user_auth eq 'member' || loginSession.user_auth eq 'admin'}">
				<div class="d-none d-md-block col-2"></div>
				<div class="col-3 p-0 headMenu d-flex justify-content-center">
					<span>${loginSession.user_name} 님 환영합니다!</span>
				</div>
				<div class="col p-0 headMenu d-flex justify-content-center">
					<a href="/toMypage.user" style="text-decoration: none;"> <span>마이페이지</span>
					</a>
				</div>
				<div class="col p-0 headMenu d-flex justify-content-center">
					<a href="/logout.user" style="text-decoration: none;"> <span>로그아웃</span>
					</a>
				</div>
			</c:when>
			<c:when test="${loginSession.user_auth eq 'manager'}">
				<div class="d-none d-md-block col-2"></div>
				<div class="col-3 p-0 headMenu d-flex justify-content-center">
					<span>관리자님 환영합니다!</span>
				</div>
				<div class="col p-0 headMenu d-flex justify-content-center">
					<a href="/toSendmail.manager" style="text-decoration: none;"> <span>메일보내기</span>
					</a>
				</div>
				<div class="col p-0 headMenu d-flex justify-content-center">
					<a href="/userSerch.manager?curPage=1"
						style="text-decoration: none;"> <span>회원 검색</span>
					</a>
				</div>
				<div class="col p-0 headMenu d-flex justify-content-center">
					<a href="/logout.user" style="text-decoration: none;"> <span>로그아웃</span>
					</a>
				</div>
			</c:when>
			<c:otherwise>
				<div class="d-none d-md-block col-5"></div>
				<div class="col p-0 headMenu d-flex justify-content-center">
					<a href="/login.user" style="text-decoration: none;"> <span>로그인</span>
					</a>
				</div>
				<div class="col p-0 headMenu d-flex justify-content-center">
					<a href="/toSignup.user" style="text-decoration: none;"> <span>회원가입</span>
					</a>
				</div>
			</c:otherwise>
		</c:choose>
		<div class="col p-0 headMenu d-flex justify-content-center">
			<button type="button" class="btn dropdownBtn dropdown-toggle"
				data-bs-toggle="dropdown" aria-expanded="false">고객센터</button>
			<ul class="dropdown-menu headDropdown">
				<li><a class="dropdown-item" href="/toInformation.info?curPage=1">자주
						묻는 질문</a></li>
				<c:if test="${loginSession.user_auth eq 'manager'}">
					<li><a class="dropdown-item" href="/modifyList.food?curPage=1">음식
							프로로션</a></li>
				</c:if>
			</ul>
		</div>
	</div>
	<!-- 네비 -->
	<div class="row cls_nav">
		<div class="col">
			<nav class="navbar navbar-expand-lg navbar-dark bg-warning">
				<div class="container-fluid">
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav me-auto mb-2 mb-lg-0">
							<li class="nav-item"><a class="nav-link active"
								aria-current="page" href="/toColumnPage.column?curPage=1">칼럼</a></li>
							<c:choose>
								<c:when
									test="${loginSession.user_auth eq 'member' || loginSession.user_auth eq 'admin' || loginSession.user_auth eq 'manager'}">
									<li class="nav-item"><a class="nav-link"
										href="/listLogin.gym">내 주변 운동시설</a></li>
									<li class="nav-item"><a class="nav-link"
										href="/listLogin.food">특가 식품</a></li>
								</c:when>
								<c:otherwise>
									<li class="nav-item"><a class="nav-link" href="/list.gym">내
											주변 운동시설</a></li>
									<li class="nav-item"><a class="nav-link" href="/list.food">특가
											식품</a></li>
								</c:otherwise>
							</c:choose>
							<li class="nav-item"><a class="nav-link" href="/toList.part">근육별
									운동법 </a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</div>
	<!-- 네비 끝 -->
</body>
</html>