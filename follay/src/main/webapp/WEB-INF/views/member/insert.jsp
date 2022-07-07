<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_footer.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/member/insert.css">
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
<div class="signup_cover">
  <div class="title">회원가입</div>
  <div class="signup_form-cover">
	<form action="<%=request.getContextPath()%>/member/insert" method="post" class="signup_input-group">
		<div>
			<input type="text" name="member_id" class="signup_input-field" placeholder="아이디를 입력해주세요." required>
			<button type="button" class="idcheck" onclick="id_check()">중복확인</button>
            <input type="hidden" id="idCheck_yn" value="">
		</div>
		<div>
			<div class="guide">비밀번호</div>
			<input type="password" name="member_password" class="signup_input-field" placeholder="영문자+숫자+특수문자 조합으로 8~12자리 입력해주세요." required>
		</div>
		<div>
			<input type="email" name="member_email" class="signup_input-field" placeholder="이메일 주소를 입력해주세요." required>
			<button type="button" class="emailcheck" onclick="email_check()">중복확인</button>
            <input type="hidden" id="emailCheck_yn" value="">
		</div>
		<div>
			<input type="tel" name="member_phone" class="signup_input-field" placeholder="휴대폰 번호를 입력해주세요." required>
		</div>
		<div>
			<div class="guide">생년월일</div>
			<input type="date" name="member_birth" class="signup_input-field" required>
		</div>
	</form>
		<button type="submit" class="signup_submit">회원가입</button>
  </div>
<%@ include file="/WEB-INF/views/common/template_footer.jsp" %>
</div>
</body>
</html>