<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_footer.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/show/read.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="kh.spring.follay.show.domain.Show"%>
<%@ page import="kh.spring.follay.show.domain.ShowImage"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글읽기</title>
</head>
<body>
<%@ include file="/WEB-INF/views/common/template_header.jsp" %>
<div class="show_cover">
<div class="title">뽐내기</div>
<div class="show_frmcover">
<form action="<%=request.getContextPath()%>/show/read" method="post" id="show_show" class="show_input-group"></form>
<section>
<script>
	var msg="${msg}";
  	if(msg){ 
 		alert(msg); 
 	} 
</script>
<c:choose>
<c:when test="${empty showlist}"> 
 	<div>작성된 글이 없습니다.</div> 
 </c:when> 
 <c:otherwise>
 <table>
 <c:forEach items="${showlist}" var="show">
 <td id="showlist_no">${show.show_content}</td>
 </c:forEach>
 </table>
</c:otherwise>
</c:choose>
</section>
</div>
<%@ include file="/WEB-INF/views/common/template_footer.jsp" %>
</div>
</body>
</html>