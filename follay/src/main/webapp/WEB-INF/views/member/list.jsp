<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
</head>
<body>
<table border="1">
	<tr>
		<td>id</td>
		<td>email</td>
		<td>삭제</td>
	</tr>
	<c:forEach items="${memberlist}" var="member">
	<tr>
		<td>${member.member_id}</td>
		<td>${member.member_email}</td>
		<td>
		<form action="<%=request.getContextPath() %>/member/delete" method="post"> 
			<input type="hidden" name="id" value="${member.member_id}">
			<button type="submit" >삭제</button>
		</form>
		</td>
	</tr>
	</c:forEach>	
</table>
</body>
</html>