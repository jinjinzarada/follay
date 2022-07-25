<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_footer.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/work/insert.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kh.spring.follay.work.domain.Work"%>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/template_header.jsp" %>
<div class="work_cover">
<div class="title">종이접기</div>
<div class="work_frmcover">
<section>
	<form action="<%=request.getContextPath()%>/work/write" method="post" id="work_write" 
		enctype="multipart/form-data">
	<table>
		<tr>
			<td class="tablewr"><input type="radio"
				name="show_category" value="1" class="category"
				required="required"><span id="category">동물&nbsp;&nbsp;</span><input type="radio"
				name="show_category" value="2" class="category"
				required="required"><span id="category">식물&nbsp;&nbsp;</span><input type="radio"
				name="show_category" value="3" class="category"
				required="required"><span id="category">곤충&nbsp;&nbsp;</span><input type="radio"
				name="show_category" value="4" class="category"
				required="required"><span id="category">이동수단&nbsp;&nbsp;</span><input type="radio"
				name="show_category" value="5" class="category"
				required="required"><span id="category">도형&nbsp;&nbsp;</span><input type="radio"
				name="show_category" value="6" class="category"
				required="required"><span id="category">기타&nbsp;&nbsp;</span></td>
		</tr>
		<tr>
			<td><input type="text"
				class="work_title" name="work_title" placeholder="제목을 입력해주세요."
				required="required"></td>
		</tr>

		<tr>
			<td class="tablewr"><textarea id="textarea"
					name="work_content" class="work_content" placeholder="내용을 입력해주세요."
					required="required"></textarea></td>
		</tr>

		<tr>
			<td id="files" class="tablewr"><input
				type="file" name="uploadFile" id="file_btn"
				required="required"></td>
		</tr>
<!-- 		<tr> -->
<!-- 			<td class="tablewr"> -->
<!-- 				<button type="button" id="addfile">파일 추가</button> -->
<!-- 			</td> -->
<!-- 		</tr> -->
		<tr>
			<th id="submit">
				<button type="submit" class="work_insert">글등록</button>
			</th>
		</tr>
	</table>
	</form>
</section>	
</div>
<%@ include file="/WEB-INF/views/common/template_footer.jsp" %>
</div>
</body>
</html>