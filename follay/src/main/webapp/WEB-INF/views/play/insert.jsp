<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/play/write" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="refnum" value="${refnum}">
		<div>제목:<input type="text" name="play_title" required></div>
		<div>내용:<input type="text" name="play_content" required></div>
		<div>첨부파일:<input type="file" name="uploadfile"></div>
		<button type="submit">글등록</button>
	</form>
</body>
</html>