<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<button type="button" onclick="location.href='<%=request.getContextPath()%>/member/insert'">회원가입</button>
<button type="button" onclick="location.href='<%=request.getContextPath()%>/member/list'">회원목록</button>
</body>
</html>
