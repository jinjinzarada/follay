<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_footer.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/member/findPw.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
<%@ include file="/WEB-INF/views/common/template_header.jsp" %>
<div class="findPw_cover">
<div class="title">비밀번호 찾기</div>
  <div class="findPw_form-cover">
    <form action="<%=request.getContextPath()%>/member/findPw" method="post" id="login_passwordfind" class="findPw_input-group">
         <div><input type="text" class="login_input-field" name="id_pwdfind" id="id_pwdfind" placeholder="아이디를 입력해주세요" required>
         <div><input type="email" class="login_input-field" name="email_pwdfind" id="email_pwdfind" placeholder="이메일 주소를 입력해주세요" required>
         <button type="submit" class="findPw_submit" onclick="">확인</button>
     </form>
  </div>
<%@ include file="/WEB-INF/views/common/template_footer.jsp" %>
</div>
</body>
</html>