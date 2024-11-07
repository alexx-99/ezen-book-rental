<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../includes/adm-header.jsp" %>
	<link rel="stylesheet" href="/resources/css/admin/member.css">

	<script>
		$(function(){
			
			$('#idCheck').click(function(){
				// var object = {key: value, key: value}는 제이쿼리에서 '객체'를 의미한다.
				// JSON(JavaScript Object Notation)은 데이터를 속성과 속성값으로 이루어진 데이터 오브젝트를 전달하기위해 사용하는 개방형 표준 텍스트 포맷이다.
				var query = {user_id: $('#user_id').val()};
				
				$.ajax({ // 비동기식 데이터 처리
					url: '/admin/member/idcheck', // HTTP URL REQUSET > Controller에서 요청 처리
					type: 'post', // 데이터 전달 방식(get or post)
					data: query, // 서버단으로 전달할 데이터(JSON)를 지정
					
					success: function(data) { // data는 Controller에서 전달한 결괏값(성공:'success')을 받는다.
						if (data === 'success') {
							$('#id-check-msg').text('※ 아이디가 중복되어 사용할 수 없습니다.');
							$('#user_id').focus(); // 아이디 입력폼에 커서를 위치시킨다.
							$('#register-btn').attr('disabled', 'disabled'); // 서브밋 버튼을 비활성화 시킨다.
						} else {
							$('#id-check-msg').text('※ 사용 가능한 아이디입니다.');
							$('#idCheck').addClass('click'); // 아이디 중복 확인 버튼에 click 클래스명을 추가한다.
							// hasClass('click')는 click 클래스명이 요소에 있으면 true를 반환한다.
							if ($('#idCheck').hasClass('click') && $('#nickCheck').hasClass('click')) {
								$('#register-btn').removeAttr('disabled'); // 서브밋 버튼을 활성화 시킨다.
							}
						}
					}
				});
			});
			
			
			$('#nickCheck').click(function(){
				var query = {user_nickname: $('#user_nickname').val()};
				
				$.ajax({
					url: '/admin/member/nickcheck',
					type: 'post',
					data: query,
					
					success: function(data) {
						if (data === 'success') {
							$('#nick-check-msg').text('※ 닉네임이 중복되어 사용할 수 없습니다.');
							$('#user_nickname').focus();
							$('#register-btn').attr('disabled', 'disabled');
						} else {
							$('#nick-check-msg').text('※ 사용 가능한 닉네임입니다.');
							$('#nickCheck').addClass('click');
							if ($('#idCheck').hasClass('click') && $('#nickCheck').hasClass('click')) {
								$('#register-btn').removeAttr('disabled');
							}
						}
					}           
				});
			});
		});
		function getAddress(){
			window.open("/admin/member/reg-address","AddressSearch","width=350,height=400,scrollbars=yes");
			// 요청받은 url은 컨트롤러에서 처리된다.
		}
		
	</script>
	
	<div class="bn bn-adm-member">
		<h2>member <span>register</span></h2>
	</div>
	
	<section>
		
	
		<form name="mbRegFrm" action="/admin/member/register" method="post">
			<ul class="mb-reg-frm">
				<li>
					<input id="user_id" type="text" name="user_id" placeholder="회원 아이디 입력" required autofocus class="input-frm input-mb">
					<button id="idCheck" type="button" class="btn btn-register">아이디 중복 확인</button>
				</li>
				<li><p id="id-check-msg">※ 아이디중복확인 버튼을 클릭하여 아이디 중복 확인을 하세요.</p></li>
				<li><input type="password" name="user_pwd" placeholder="회원 비밀번호 입력" required class="input-frm input-mb"></li>
				<li><input type="text" name="user_name" placeholder="회원 이름 입력" required class="input-frm input-mb"></li>
				<li>
					<input id="user_nickname" type="text" name="user_nickname" placeholder="닉네임 입력" required class="input-frm input-mb">
					<button id="nickCheck" type="button" class="btn btn-register">닉네임 중복 확인</button>
				</li>
				<li><p id="nick-check-msg">※ 닉네임중복확인 버튼을 클릭하여 닉네임 중복 확인을 하세요.</p></li>
				<li>
					<input id="man" type="radio" name="user_gender" value="남자" checked>
					<label for="man" class="btn btn-default">남 자</label>
					<input id="woman" type="radio" name="user_gender" value="여자" >
					<label for="woman" class="btn btn-default">여 자</label>
				</li>
				<li><input type="email" name="user_mail" placeholder="회원 메일 입력" class="input-frm input-mb"></li>
				<li><input type="tel" name="user_phone" placeholder="회원 전화번호 입력" class="input-frm input-mb"></li>
				<li>
					<input type="text" name="user_zipcode" placeholder="회원 우편번호" readonly class="input-frm input-mb">
					<button type="button" onclick="getAddress()" class="btn btn-register">우편번호 찾기</button>
				</li>
				
				<li><input type="text" name="user_address" placeholder="회원 주소" class="input-frm input-mb"></li>
				<li>
					<button id="register-btn" type="submit" disabled="disabled" class="btn btn-register">회원등록</button>
					<a href="" class="btn btn-default">회원목록</a>
				</li>
			</ul>
		</form>

	</section>


<%@ include file="../../includes/adm-footer.jsp" %>



















