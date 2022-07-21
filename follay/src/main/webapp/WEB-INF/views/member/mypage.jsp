<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_footer.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/member/mypage.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<div class="mypage_cover">
<div class="title">마이페이지</div>
  <div class="mypage_frmcover">
	<section>
	<form action="<%=request.getContextPath()%>/member/mypage" method="post" id="login_login" class="login_input-group">
		<div class="">
			<h4 class="mypage_my">나의</h4>
			<table class="table table-borderless" style="width=30%">
				<tbody>
					<tr>
						<th scope="row"><b>아이디</b></th>
						<td>${member.member_id}</td>
					</tr>
					<tr>
						<th scope="row"><b>생년월일</b></th>
						<td>${fn:substring(member.member_birth,0,10)}</td>
					</tr>
					<tr>
						<th scope="row"><b>이메일</b></th>
						<td>${member.member_email}</td>
					</tr>
					<tr>
						<th scope="row"><b>전화번호</b></th>
						<td>${member.member_phone}</td>
					</tr>
				</tbody>
			</table>
<!-- 			<input class="btn btn-primary" type="submit" value="메인으로"> -->
		</div>
	</form>
   </section>
  </div>
<%@ include file="/WEB-INF/views/common/template_footer.jsp" %>
</div>
</body>
</html>