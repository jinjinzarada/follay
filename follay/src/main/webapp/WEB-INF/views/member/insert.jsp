<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_footer.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/member/insert.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<%@ include file="/WEB-INF/views/common/template_header.jsp" %>
<div>
  <div class="title">회원가입</div>
  <div>
	<form action="<%=request.getContextPath()%>/member/insert" method="post">
		<div>
			아이디 : <input type="text" name="member_id"  placeholder="아이디 입력하세요" required>
			<button type="button" class="idcheck" onclick="id_check()">중복확인</button>
            <input type="hidden" id="idCheck_yn" value="">
		</div>
		<div>
			비밀번호 : <input type="password" name="member_password" placeholder="영문자+숫자+특수문자 조합으로 8~12자리 입력" required>
		</div>
		<div>
			이메일 : <input type="email" name="member_email" placeholder="이메일 주소 입력하세요" required>
			<button type="button" class="emailcheck" onclick="email_check()">중복확인</button>
            <input type="hidden" id="emailCheck_yn" value="">
		</div>
		<div>
			휴대폰 : <input type="tel" name="member_phone" placeholder="휴대폰 번호 입력하세요" required>
		</div>
		<div>
			생년월일 : <input type="date" name="member_birth" required>
		</div>
		<button type="submit" class="button_submit">회원가입</button>
	</form>
  </div>
</div>
<%@ include file="/WEB-INF/views/common/template_footer.jsp" %>
</body>
</html>