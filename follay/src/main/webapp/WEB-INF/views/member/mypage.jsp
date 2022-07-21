<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_footer.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/member/mypage.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/template_header.jsp" %>
<div class="login_cover">
<div class="title">마이페이지</div>
  <div class="login_form-cover">
	 <section>
	<form action="<%=request.getContextPath()%>/member/mypage" method="post" id="login_login" class="login_input-group">
		<div><input type="text" name="member_id" class="login_input-field" placeholder="아이디를 입력해주세요." required></div>
		<div><input type="password" name="member_password" class="login_input-field" name="passwd" placeholder="비밀번호를 입력해주세요." required></div>
		<button type="submit" class="login_submit">로그인</button> 
		<button type="button" class="login_find find_id" onclick="location.href='<%=request.getContextPath()%>/member/findId'">아이디 찾기</button>
        <button type="button" class="login_find" onclick="location.href='<%=request.getContextPath()%>/member/findPw'">비밀번호 찾기</button>
	</form>
   </section>
  </div>
<%@ include file="/WEB-INF/views/common/template_footer.jsp" %>
</div>
</body>
</html>