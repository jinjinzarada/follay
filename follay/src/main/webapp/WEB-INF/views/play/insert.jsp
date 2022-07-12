<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_footer.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/play/insert.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kh.spring.follay.play.domain.Play"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>
<%@ include file="/WEB-INF/views/common/template_header.jsp" %>
<div class="play_cover">
<div class="title">놀이터</div>
<div class="play_form-cover">
<section>
	<form action="<%=request.getContextPath()%>/play/write" method="post" id="play_write" 
		enctype="multipart/form-data">
		<input type="hidden" name="refnum" value="${refnum}">
		<div><input type="text" name="play_title" class="play_title" placeholder="제목를 적어주세요." required></div>
		<div><input type="text" name="play_content" class="play_content" placeholder="내용을 적어주세요."required></div>
		<div>
		<label for ="play_uploadfile">사진 업로드</label>
<!-- 		<input class="upload-name" value="파일선택" disabled="disabled" > -->
		<input type="file" name="uploadfile" id="play_uploadfile" class="play_uploadfile">
		</div>
		<button type="submit" class="play_insert">글등록</button>
	</form>
</section>	
</div>
<%@ include file="/WEB-INF/views/common/template_footer.jsp" %>
</div>
</body>
</html>