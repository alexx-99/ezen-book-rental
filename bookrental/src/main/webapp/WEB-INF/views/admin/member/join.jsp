<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../../includes/adm-header.jsp"%>
<link rel="stylesheet" href="/resources/css/admin/member.css">

<script>
// 아이디 중복확인부터 시작 
<%-- ajax 
		비동기식 데이터 처리 : 화면전환이나 새로 고침없이 
		데이터 전달 방법: 객체로 전달 (JSON형식)
		 
--%>
	// 제이쿼리 복습:
	// 함수
	// 익명함수: 문서를 다 읽고 나면(또는 이벤트가 감지되면) 실행, document.ready
	// val() : input요소의 값을 가져오는 메소드
$(function () { //익명함수 $(function(){}); 

    $('#idCheck').click(function() { 
        //var object = {key:value, key:value}는 제이쿼리에서 객체를 의미한다. JSON 
        // JSON (Java Script Object Notation) : 데이터를 속성과 속성값으로 이루어진 데이터 오브젝트를 전달하기 위해 사용하는 개방형 표준 텍스트 포맷(가벼움)이다. 
        // light weight 뭐요? 아무튼 경량화 데이터 전달 형식이다. 
        var query = {user_id: $('#user_id').val()}; //user_id 입력폼의 값을 얻음

        // 비동기식 데이터 처리 
        $.ajax({ 
            //요청 
            url: '/admin/member/idcheck' , //HTTP URL REQUEST : Controller가 처리 
            type: 'post', //데이터 전달 방식 : GET, POST 
            data: query, //서버단으로 전달할 데이터(JSON)를 지정

            // 응답 : 무조건 익명함수가 들어감 
            success: function(data) { // data는 Controller에서 전달한 결괏값(성공 : 'success')을 받는다. 
                if(data === 'success') { // 결과값이 있다면 중복되는 아이디가 있음 
                    $('#id-check-msg').text('※ 아이디가 중복되어 사용할 수 없습니다.'); 
                    $('#user_id').focus(); // 아이디 입력폼에 커서를 위치시킨다. 
                    $('#join-regBtn').attr('disabled', 'disabled'); // submit 버튼을 비활성화 시킨다. 
                } else { 
                    $('#id-check-msg').text('※ 사용가능한 아이디입니다.'); 
                    $('#idCheck').addClass('click'); // 아이디 중복 확인 버튼에 click 클래스명을 추가한다. 
                    // hasClass('click')는 클래스명이 요소에 있으면 true를 반환한다. 
                    if ($('#idCheck').hasClass('click') && $('#nickCheck').hasClass('click')) { 
                        $('#join-regBtn').removeAttr('disabled'); // submit 버튼을 활성화 시킨다. 
                    } 
                } 
            } 
        }); 
    }); 
    
    $('#nickCheck').click(function() { 
        var query = {user_nickname: $('#user_nickname').val()};
        

        $.ajax({ 
            url: '/admin/member/nickcheck', 
            type: 'post', 
            data: query, 
            success: function(data) { 
                if(data === 'success') { 
                    $('#nick-check-msg').text('※ 닉네임이 중복되어 사용할 수 없습니다.'); 
                    $('#user_nickname').focus(); 
                    $('#join-regBtn').attr('disabled', 'disabled'); 
                } else { 
                    $('#nick-check-msg').text('※ 사용가능한 아이디입니다.'); 
                    $('#nickCheck').addClass('click'); 
                    if ($('#idCheck').hasClass('click') && $('#nickCheck').hasClass('click')) { 
                        $('#join-regBtn').removeAttr('disabled'); 
                    } 
                } 
            } 
        }); 
    }); 
    
    
    $('#zip-searchBtn').click(function() { 
        var query = {user_nickname: $('#user_nickname').val()};
        

        $.ajax({ 
            url: '/admin/member/nickcheck', 
            type: 'post', 
            data: query, 
            success: function(data) { 
                if(data === 'success') { 
                    $('#nick-check-msg').text('※ 닉네임이 중복되어 사용할 수 없습니다.'); 
                    $('#user_nickname').focus(); 
                    $('#join-regBtn').attr('disabled', 'disabled'); 
                } else { 
                    $('#nick-check-msg').text('※ 사용가능한 아이디입니다.'); 
                    $('#nickCheck').addClass('click'); 
                    if ($('#idCheck').hasClass('click') && $('#nickCheck').hasClass('click')) { 
                        $('#join-regBtn').removeAttr('disabled'); 
                    } 
                } 
            } 
        }); 
    }); 
    
    $('#join-regBtn').click(function(){
    	$('#join-frm').attr('action', '/admin/member/join');
    	$('#join-frm').submit();
    });
    // end_$('#join-regBtn')
    
    
    
}); //제이쿼리 함수의 역할 : 1. 문서객체를 만들때 사용(append메소드로) 
 

</script>

<div class="bn bn-admin-member">
	<h2>member join</h2>
</div>
	<section>
		<form id="zip-frm" method="post">
			<div class="zip-search">
				<input type="search" name="area3" placeholder="동 입력" required>
				<button id="zip-searchBtn" type="button" >우편번호 찾기</button>
			</div>
		
			<ul class="zip-address">
			<c:forEach items="${addrList }" var="addr">
			<%-- 목록을 이용한 반복문
			 속성:
			 items : Collection 객체(List, Map) (필수 속성)
			 var : 사용할 변수명(필수 속성)
			 begin : 반복 시작 index. 정의되지 않을경우 기본값 0
			 end : 반복 종료 , 기본값 마지막 index
			 step : 반복할 때마다 건너뛸 index 개수
			 varStatus : 	반복 상태를 알 수 있는 변수
			 --%>
				<li>
					<a id="getAddr" href="#">
						<p id="zipcode">${addr.zipcode } </p>
						<p id="address">${addr.area1 } ${addr.area2 } ${addr.area3 } ${addr.area4 }</p>
					</a>
				</li>
			</c:forEach>
			</ul>
		</form>
	
		<form id="join-frm" method="post">
			<ul>
				<li>
					<input id="user_id" type="text" name="user_id" placeholder="회원 아이디 입력" required autofocus>
					<button id="idCheck" type="button">아이디 중복 확인</button>
					<p id="id-check-msg">※ 아이디중복확인 버튼을 클릭하여 아이디 중복 확인을 하세요.</p>
				</li>
				<li><input type="password" name="user_pwd" placeholder="회원 비밀번호 입력" required></li>
				<li><input type="text" name="user_name" placeholder="회원 이름 입력" required></li>
				<li>
					<input id="user_nickname" type="text" name="user_nickname" placeholder="닉네임 입력" required>
					<button id="nickCheck" type="button">닉네임 중복 확인</button>
					<p id="nick-check-msg">※ 닉네임중복확인 버튼을 클릭하여 닉네임 중복 확인을 하세요.</p>
				</li>
				<li>
					<input id="man" type="radio" name="user_gender" value="남자" checked>
					<label for="man">남 자</label>
					<input id="woman" type="radio" name="user_gender" value="여자" >
					<label for="woman">여 자</label>
				</li>
				<li><input type="email" name="user_mail" placeholder="회원 메일 입력" ></li>
				<li><input type="tel" name="user_phone" placeholder="회원 전화번호 입력" ></li>
				<li><input id="user_zipcode" type="text" name="user_zipcode" readonly></li>
				<li><input id="user_address" type="text" name="user_address"></li>
				<li>
					<button id="join-regBtn" type="button" disabled="disabled">회원등록</button>
					<a href="">회원목록</a>
				</li>
			</ul>
		</form>

	</section>
	
	<script>
		$('#zip-searchBtn').click(function(){
			$('#zip-frm').attr('action', '/admin/member/zipcode');
			$('#zip-frm').submit();
		});
		
		$('#getAddr').click(function(){
			var zipcode = $(this).find('#zipcode').text();
			var address = $(this).find('#address').text();
			
			$('#user_zipcode').val(zipcode);
			$('#user_address').val(address);
		});
	</script>

<%@include file="../../includes/adm-footer.jsp"%>



