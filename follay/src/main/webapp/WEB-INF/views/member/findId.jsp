<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_footer.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/member/findId.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>
<%@ include file="/WEB-INF/views/common/template_header.jsp" %>
<div class="findId_cover">
<div class="title">아이디 찾기</div>
  <div class="findId_form-cover">
	<form action="<%=request.getContextPath()%>/member/findId" method="post" id="findId_findId" class="findId_input-group">
        <div><input type="email" name="email_idfind" id="email_idfind" class="findId_input-field" placeholder="이메일 주소를 입력해주세요" required>
        <button type="submit" class="idfind_submit" onclick="">확인</button>
    </form>
  </div>
<%@ include file="/WEB-INF/views/common/template_footer.jsp" %>
</div>

</body>
</html>