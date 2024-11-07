<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Rental</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/admin/common.css">
<script src="/resources/js/jquery-1.12.4.min.js"></script>
<script>
	$(function(){
		$('#main-menu > li').mouseenter(function(){
			$(this).find('.sub-menu').stop().slideDown();
			// find() 하위요소를 찾는다.
			// stop() 이전에 하고 있는 애니메이션 효과를 멈춘다.
		});
		$('#main-menu > li').mouseleave(function(){
			$(this).find('.sub-menu').stop().slideUp();
		});
	});
	// 제이쿼리로 요소를 선택하고 요소를 추가 할 수 있다
	
	
	/*
	

	$(function(){
		$('#main-menu > li  ').mouseenter(function(){
		$(this).find('.sub-menu').slideDown(); find 메소드는 요소를 찾는 메소드이고(형제관계는 찾을수 없고, 자식관계만 찾음), 이벤트 효과메소드 9가지
		}); find메소드는 하위요소만 선택이 가능함 (요소선택을 잘해야함)
		$('#main-menu > li  ').mouseleave(function(){
			$(this).find('.sub-menu').stop().slideUp();
			});
	});
	
	*/
</script>


</head>
<body>
	<header>
		<nav>
			<h1><a href="/admin">bookrental admin</a></h1>
			<ul id="main-menu">
				<li>
					<a href="#">회원관리</a>
					<ul class="sub-menu">
						<li><a href="/admin/member/register">회원등록</a></li>
						<li><a href="/admin/member/list">회원목록</a></li>
					</ul>
				</li>
				<li>
					<a href="#">직원관리</a>
					<ul class="sub-menu">
						<li><a href="/admin/staff/register">직원등록</a></li>
						<li><a href="/admin/staff/list">직원목록</a></li>
					</ul>
				</li>
				<li><a href="/admin/book">도서관리</a>
					<ul class="sub-menu">
						<li><a href="/admin/book/register">도서 등록</a></li>
						<li><a href="/admin/book/list ">도서 목록</a></li>
					</ul>
				</li>
			</ul>
			
			<c:if test="${member == null}">
			<ul class="top-menu">
				<li><a href="/admin/confirm/login">로그인</a></li>
			</ul>
			</c:if>
			
			<c:if test="${member != null}">
			<ul class="top-menu">
				<li>${member.nickname} 님</li>
				<li><a href="/admin/confirm/logout">로그아웃</a></li>
				<li><a href="/admin/staff/mypage?adm_id=${member.user_id}">마이페이지</a></li>
			</ul>
			</c:if>
		</nav>
	</header>
	
	
	
	
	
	
	
	
	
	
	
	
	
