<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 로그인 여부에 따라 달라지는 화면을 구현 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 브라우저에 날짜 년월일의 형식을 바꿔서 출력하고 싶음 그래서 format의 fmt로 prefix지정 -->
<!-- 태그 라이브러리 jstl, 스파게티 코드 이제 안 씀 -->
<!-- 태그 라이브러리 jstl, 조건문 else 없음 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Rental</title>
<link href="/resources/css/reset.css">
<link href="/resources/css/common.css">
<script src="/resources/js/jquery-1.12.4.min.js"></script>
<%-- /는 webapp을 가르킨다 --%>


</head>
<body>
	<header>
		<nav>
			<h1>bookrental admin</h1>
			<ul class="main-menu">
				<li><a href="#">회원 관리</a>
					<ul class="sub-menu">
						<li><a href="/admin/member/join">회원 가입</a></li>
						<li><a href="/admin/member/list">회원 목록</a></li>
					</ul></li>
				<c:if test="${emp != null }">
					<c:if test="${emp.staff_pms == 1}">
						<!-- pms = permission  숫자가 작을 수록 높은 레벨-->
						<li><a href="">직원 관리</a>
							<ul class="sub-menu">
								<li><a href="/admin/staff/join">회원가입</a></li>
								<li><a href="/admin/staff/list">회원 목록</a></li>
							</ul></li>
					</c:if>
				</c:if>
				<li><a href="/admin/book">도서 관리</a></li>
			</ul>
			<c:if test="${emp == null }">
				<!-- 로그인 되지 않았으면 -->
				<ul class="top-menu">
					<li><a href="/admin/staff/login">로그인</a></li>
				</ul>
			</c:if>
			<c:if test="${emp != null }">

				<ul class="top-menu">
					<li><p>${ emp.staff_name}님</p></li>
					<li><a href="/admin/staff/logout">로그아웃</a></li>
					<li><a href="/admin/staff/mypage?adm_id=${emp.staff_id }">로그아웃</a></li>
				</ul>
			</c:if>
		</nav>
	</header>