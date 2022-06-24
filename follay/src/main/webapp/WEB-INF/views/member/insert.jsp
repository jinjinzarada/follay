<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_footer.css">
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
	<form action="<%=request.getContextPath()%>/member/insert" method="post">
		<div>아이디 : <input type="text" name="member_id" required></div>
		<div>비밀번호 : <input type="password" name="member_password" required></div>
		<div>이메일 : <input type="email" name="member_email" required></div>
		<div>휴대폰 : <input type="tel" name="member_phone" required></div>
		<div>생년월일 : <input type="date" name="member_birth" required></div>
		<button type="submit">회원가입</button>
	</form>
<%@ include file="/WEB-INF/views/common/template_footer.jsp" %>
</body>
</html>