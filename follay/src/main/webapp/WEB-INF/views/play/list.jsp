<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_footer.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/play/list.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글목록</title>
</head>
<body>
<%@ include file="/WEB-INF/views/common/template_header.jsp" %>
<div class="play_cover">
<div class="title">놀이터</div>
<div class="play_form-cover">
<form action="<%=request.getContextPath()%>/play/list" method="post" id="play_play" class="play_input-group"></form>
<section>
<script>
	var msg="${msg}";
	if(msg){
		alert(msg);
	}
</script>
<c:choose>
<c:when test="${empty playlist}">
	<div>작성된 글이 없습니다.</div>
</c:when>
<c:otherwise>
	<div>
		<table border="1">
			<tr>
				<td>level</td>
				<td>ref</td>
				<td>rref</td>
				<td>seq</td>
				<td>번호</td>
				<td>제목</td>
				<td>작성일</td>
				<td>작성자</td>
				<td>조회수</td>
			</tr>
<c:forEach items="${playlist}" var="play">
			<tr>
				<td>${play.play_level}</td>	
				<td>${play.play_ref}</td>	
				<td>${play.play_reply_ref}</td>	
				<td>${play.play_reply_seq}</td>			
				<td><a href="<%=request.getContextPath()%>/play/read?play_no=${board.board_num }">${play.play_no }</a></td>
				<td>
<c:forEach begin="1" end="${play.play_level}">
				&#8627;
</c:forEach>
				${play.play_title}
				</td>
				<td>${play.play_date}</td>
				<td>${play.play_writer}</td>
				<td>${play.play_readcount}</td>
			</tr>
</c:forEach>
		</table>
	</div>
</c:otherwise>
</c:choose>
<div>
	<button type="button" class="play_write" onclick="location.href='<%=request.getContextPath()%>/play/write'">글쓰기</button>
</div>
<!-- 페이징처리 -->
<div class="p_section_container">
	<nav aria-label="Page navigation example">
		<ul class="pagination">
		<c:if test="${startPage > 1}">
		<li class="page-item">
			<a class="page-link" href="event?pageNum=${startPage-1}" aria-label="Previous">
			 <span aria-hidden="true">&laquo;</span>
			</a></li>
		</c:if>
		<c:forEach begin="${startPage}" end="${endPage}" step="1" var="i">
			<li class="page-item"><a class="page-link" href="list?pageNum=${i}">${i}</a></li>
		</c:forEach>
		<c:if test="${endPage < pageCnt}">
		<li class="page-item">
			<a class="page-link" href="list?pageNum=${endPage+1}" aria-label="Next">
			<span aria-hidden="true">&raquo;</span>
			</a></li>
		</c:if>
	</ul>
	</nav>
	</div>
</section>
</div>
<%@ include file="/WEB-INF/views/common/template_footer.jsp" %>
</div>
</body>
</html>