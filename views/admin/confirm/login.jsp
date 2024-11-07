<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../includes/adm-header.jsp" %>
	<link rel="stylesheet" href="/resources/css/admin/member.css">
	
	<div class="bn bn-adm-confirm">
		<h2>member <span>login</span></h2>
	</div>
	
	<section>
		<div class="tabs cf-login-frm">
			<input id="tabs-1" type="radio" name="tabs-radio" checked>
			<label for="tabs-1" class="tabs-btn tabs-label-1">회원 로그인</label>
			<input id="tabs-2" type="radio" name="tabs-radio">
			<label for="tabs-2" class="tabs-btn tabs-label-2">직원 로그인</label>
			
			<div class="tabs-contents">
				<div class="tabs-content-1">
					<form action="/admin/confirm/login" method="post">
						<ul class="tabs-ul">
							<li><input type="text" name="user_id" placeholder="회원 아이디 입력" required autofocus class="input-frm input-cf"></li>
							<li><input type="password" name="user_pwd" placeholder="회원 비밀번호 입력" required class="input-frm input-cf"></li>
							<li>
								<button type="submit" class="btn btn-register">로그인</button>
								<a href="" class="btn btn-default">회원등록</a>
							</li>
						</ul>
					</form>
				</div>
				<div class="tabs-content-2">
					<form action="/admin/confirm/stafflogin" method="post">
						<ul class="tabs-ul">
							<li><input type="text" name="user_id" placeholder="직원 아이디 입력" required class="input-frm input-cf"></li>
							<li><input type="password" name="user_pwd" placeholder="직원 비밀번호 입력" required class="input-frm input-cf"></li>
							<li>
								<button type="submit" class="btn btn-register">로그인</button>
								<a href="" class="btn btn-default">회원등록</a>
							</li>
						</ul>
					</form>
				</div>
			</div>
		</div>
		
		<c:if test="${user_pwd == false}"><p class="confirm-msg">※ 비밀번호가 틀려 로그인에 실패했습니다.</p></c:if>
		<c:if test="${user_id == false}"><p class="confirm-msg">※ 아이디가 틀려 로그인에 실패했습니다.</p></c:if>
		<%-- test : if문의 조건식 --%>
		
	</section>
	
<%@ include file="../../includes/adm-footer.jsp" %>

















