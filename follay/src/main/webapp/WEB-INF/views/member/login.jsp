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
<title>로그인</title>
</head>
<body>
<%@ include file="/WEB-INF/views/common/template_header.jsp" %>
	<form action="<%=request.getContextPath()%>/member/login" method="post">
		<div>아이디:<input type="text" name="id" required></div>
		<div>비밀번호:<input type="password" name="passwd" required></div>
		<button type="submit">로그인</button>
	</form>
<%@ include file="/WEB-INF/views/common/template_footer.jsp" %>
</body>
</html>