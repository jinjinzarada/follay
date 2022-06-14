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
	follay!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<div>
<button type="button" onclick="location.href='<%=request.getContextPath()%>/member/insert'">회원가입</button>
</div>
<div>
<button type="button" onclick="location.href='<%=request.getContextPath()%>/member/list'">회원목록</button>
</div>
<div>
<button type="button" onclick="location.href='<%=request.getContextPath()%>/member/login'">로그인</button>
</div>
<div>
<button type="button" onclick="location.href='<%=request.getContextPath()%>/play/write'">글쓰기</button>
</div>
<div>
<button type="button" onclick="location.href='<%=request.getContextPath()%>/play/list'">글목록</button>
</div>
</body>
</html>
