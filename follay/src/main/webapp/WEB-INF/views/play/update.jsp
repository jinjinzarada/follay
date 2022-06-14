<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정</title>
</head>
<body>
<div><button type="button" onclick="location.href='<%=request.getContextPath() %>/'">홈</button></div>
<c:choose>
<c:when test="${empty play }">
	<script>
		alert("해당글이없습니다. 글목록으로 이동합니다.");
		location.href="<%=request.getContextPath()%>/play/list";
	</script>
</c:when>
<c:otherwise>
	<div>
	<form action="<%=request.getContextPath() %>/play/updateDo" method="post"
		enctype="multipart/form-data">
		<table border="1">
			<tr>
				<td>level</td>	
				<td>ref</td>	
				<td>rref</td>	
				<td>seq</td>			
				<td>번호</td>
				<td>작성일</td>
				<td>작성자</td>
				<td>조회수</td>
			</tr>
			<tr>
				<td>${play.play_level }</td>	
				<td>${play.play_ref }</td>	
				<td>${play.play_reply_ref }</td>	
				<td>${play.play_reply_seq }</td>			
				<td>${play.play_num }</td>
				<td>${play.play_date }</td>
				<td>${play.play_writer }</td>
				<td>${play.play_readcount }</td>	
			</tr>
		</table>
		<input type="hidden" name="play_no" value="${play.play_no }">
		<div>
			제목:<input type="text" name="play_title" value="${play.play_title }">
		</div>		
		<div>
			내용: <input type="text" name="play_content" value="${play.play_content }">
		</div>
		<div>변경할첨부파일:<input type="file" name="uploadfile"></div>
		
	<c:if test="${not empty play.play_original_filename }">
		<input type="hidden" name="play_rename_filename" value="${play.play_rename_filename }">
		<div>
		기존첨부파일: <input type="text" name="play_original_filename" value="${play.play_original_filename }" id="orgFile" readonly ]>
		<button type="button" onclick="document.getElementById('orgFile').value='';">기존파일삭제</button></div>
		<div><img src="<%=request.getContextPath() %>/${play.play_rename_filename }" width="500"></div>
	</c:if>
		<button type="reset">원래대로</button>
		<button type="submit">수정하기</button>
	</form>
	</div>
</c:otherwise>
</c:choose>
</body>
</html>