<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_footer.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/show/insert.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>
<%@ include file="/WEB-INF/views/common/template_header.jsp" %>
<div class="show_cover">
<div class="title">뽐내기</div>
<div class="show_frmcover">
<section>
	<form action="<%=request.getContextPath()%>/show/write" method="post" id="show_write" 
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
				class="show_title" name="show_name" placeholder="제목을 입력해주세요."
				required="required"></td>
		</tr>

		<tr>
			<td class="tablewr"><textarea id="textarea"
					name="show_content" class="show_content" placeholder="내용을 입력해주세요."
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
				<button type="submit" class="show_insert">글등록</button>
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