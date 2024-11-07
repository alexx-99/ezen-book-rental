<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!doctype html>
<html lang="ko">
<head>
<title>book rental</title>

<link rel="stylesheet" href="/resources/css/reset/css">
<link rel="stylesheet" href="/resources/css/admin/common.css">
<link rel="stylesheet" href="/resources/css/admin/member.css">

</head>
<body>
 	<div class="addr-container">
		<form action="/admin/member/reg-address" method="post">
			<div class="search-wrap">
				<input type="search" name="area3" placeholder="동 입력" required class="input-frm input-mb ">
				<button type="submit" class="btn btn-register">우편번호 찾기</button>
				<button onclick="self.close()" class="btn btn-delete">닫기</button>
			</div>				
		</form>
		<div class="addr-list">
			<c:forEach items="${addrList }" var="addr">
				<a
					href="javascript:sendAddr('${addr.zipcode }', '${addr.area1}', '${addr.area2}', '${addr.area3}', '${addr.area4}')">
					${addr.zipcode} ${addr.area1} ${addr.area2} ${addr.area3}
					${addr.area4} 
					
				</a>
			</c:forEach>
		</div>
		
		<p class="addr-msg">※ 주소를 클릭하면 우편번호 입력폼과 주소 입력폼에 자동으로 입력됩니다.</p>

</div>
</body>
<script>
	function sendAddr(zipcode, area1, area2, area3, area4) {
			var address = area1 + ' ' + area2 + ' ' + area3 + ' ' + area4;
			opener.document.mbRegFrm.user_zipcode.value=zipcode;
			opener.document.mbRegFrm.user_address.value=address;
			self.close();
	}
</script>
</html>