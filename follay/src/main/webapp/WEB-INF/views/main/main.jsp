<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_footer.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/main.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ page session="false" %>
<html>
<head>
	<title>Follay!</title>
</head>
<body>

<%@ include file="/WEB-INF/views/common/template_header.jsp" %>

<div>
<button type="button" onclick="location.href='<%=request.getContextPath()%>/member/list'">회원목록</button>
</div>
<div>
<button type="button" onclick="location.href='<%=request.getContextPath()%>/play/write'">글쓰기</button>
</div>
<div>
<button type="button" onclick="location.href='<%=request.getContextPath()%>/play/list'">글목록</button>
</div>

<%@ include file="/WEB-INF/views/common/template_footer.jsp" %>
</body>
</html>
