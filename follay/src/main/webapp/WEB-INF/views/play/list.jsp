<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_footer.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/play/list.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script> 
<%@ page import="kh.spring.follay.play.domain.Play"%>
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
	<div class="list_div">
		<table border="1">
			<tr>
<!-- 				<th>level</th> -->
<!-- 				<th>ref</th> -->
<!-- 				<th>rref</th> -->
<!-- 				<th>seq</th> -->
				<th>글번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>작성자</th>
				<th>조회수</th>
			</tr>
<c:forEach items="${playlist}" var="play">
			<tr id="play_td">
				<td id="playlist_no">${play.play_no}</td>
				<td id="playlist_title">
<%-- <c:forEach begin="1" end="${play.play_level}"> --%>
<!-- 				&#8627; -->
<%-- </c:forEach> --%>
<a href="<%=request.getContextPath()%>/play/read?play_no=${play.play_no}">
				<span class="list_title-span">${play.play_title} [${play.play_commentcnt}]</span></a>
				</td>
				<td id="playlist_date">${fn:substring(play.play_date,0,16)}</td>
				<td id="playlist_write">${play.member_id}</td>
				<td id="playlist_readcount">${play.play_readcount}</td>
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
<table>	
	<tr>
		<c:if test="${startPage > 1 }">
			<td><a href="list?page=${startPage-1}"><span>이전</span></a>&nbsp;&nbsp;&nbsp;</td>
		</c:if>
		<c:forEach begin="${startPage}" end="${endPage}" var="i"> 
			<td><a href="list?page=${i}"><span>${i}</span></a>&nbsp;&nbsp;&nbsp;</td>
		</c:forEach>
		<c:if test="${endPage < pageCnt}">
			<td><a href="list?page=${endPage+1}"><span>다음</span></a>&nbsp;&nbsp;&nbsp;</td>
		</c:if>
	</tr>
</table>
</section>
</div>
<%@ include file="/WEB-INF/views/common/template_footer.jsp" %>
</div>
<script>
	//마우스 오버시 각각의 클래스에 다른 효과 주기
	$("#play_td").mouseover(function() { 
			$("#playlist_no").css("background-color","#fce5cd");
			$("#playlist_title").css("background-color","#fce5cd");
			$("#playlist_date").css("background-color","#fce5cd");
			$("#playlist_write").css("background-color","#fce5cd");
			$("#playlist_readcount").css("background-color","#fce5cd");
	});
	
	//마우스 아웃시 원상태로 복구
	$("#play_td").mouseout(function() { 
			$("#playlist_no").css("background-color","");
			$("#playlist_title").css("background-color","");
			$("#playlist_date").css("background-color","");
			$("#playlist_write").css("background-color","");
			$("#playlist_readcount").css("background-color","");
	});
</script>
</body>
</html>