<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!-- jstl -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>버스톡톡</title>
<!-- jquery(공통) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<!-- CSS 부트스트랩 적용(공통) -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<!-- font(공통) -->
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gothic+A1:wght@200&family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<!-- Font Awesome 라이브러리(공통) -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
<!-- CSS(공통) -->
<link rel="stylesheet" href="/resources/css/busStyle.css" type="text/css">

<!-- 자바스크립트 부분(개인) -->
<script src="/resources/js/manager.js"></script>
<script src="/resources/js/reserve.js"></script>
<!-- <script src="/resources/js/pay.js"></script> -->
</head>
<body>
<!-- header 시작 -->
<div id="header">
	<div id="header_top_nav">
		<div id="info_nav">
			<ul>
				<!-- 인증된(로그인한) 사용자에게 보임 -->
				<sec:authorize access="isAuthenticated()">
					<li>
						<span class="top_name">
							<span>
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
									 class="bi bi-person-fill" viewBox="0 0 16 16">
									<path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
								</svg>
								<sec:authentication property="principal.user.name"/>
							</span>
							님 환영합니다.
						</span>
					</li>
				</sec:authorize>

				<!-- 인증되지 않은(로그인하지 않은) 사용자에게 보임 -->
				<sec:authorize access="isAnonymous()">
					<li><a href="/member/login">로그인</a></li>
					<li><a href="/member/memberjoin">회원가입</a></li>
				</sec:authorize>

				<!-- 인증된(로그인한) 사용자에게 보임 -->
				<sec:authorize access="isAuthenticated()">
					<li><a href="/member/logout">로그아웃</a></li>
				</sec:authorize>

				<!-- 인증된(MEMBER) 사용자에게 보임 -->
				<sec:authorize access="hasRole('ROLE_MEMBER')">
					<li><a href="/mypage/mypage_info">마이페이지</a></li>
				</sec:authorize>

				<!-- 인증된(ADMIN) 사용자에게 보임 -->
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<li><a href="/manager/manager_info">관리자페이지</a></li>
				</sec:authorize>
			</ul>
		</div>
		<div id="logo"><a href="/reserve/reserve_main"><img src="/resources/img/logo.png"/></a></div>
		<div id="menu_nav">
			<ul>
				<li><a href="../reserve/reserve_main">승차권예매</a></li>
				<!-- 인증되지 않은(로그인하지 않은) 사용자에게 보임 -->
				<sec:authorize access="isAnonymous()">
					<li><a href="/reserve/reserve_login">조회/변경/취소</a></li>
				</sec:authorize>
				<!-- 인증된(로그인한) 사용자에게 보임 -->
				<sec:authorize access="isAuthenticated()">
					<li><a href="/reserve/reserve_list">조회/변경/취소</a></li>
				</sec:authorize>
			</ul>
		</div>
	</div>
</div>
<!-- content_wrap시작(70%) -->
<div id="content_wrap">