<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_footer.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/play/read.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="kh.spring.follay.play.domain.Play"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글읽기</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/template_header.jsp" %>
<div class="play_cover">
<div class="title">놀이터</div>
<div class="play_form-cover">
<script>
	var msg="${msg}";
	if(msg){
		alert(msg);
	}
</script>
<c:choose>
<c:when test="${empty play}">
	<script>
		alert("해당글이 없습니다. 글목록으로 이동합니다. ");
		location.href="<%=request.getContextPath()%>/play/list";
	</script>
</c:when>
<c:otherwise>

<c:if test="${play.member_id eq loginSsInfo}">
	<div>
		<form id="frmNum">
		<!-- post방식일때 form 태그 사용한다.	-->
			<input type="hidden" name="play_no" value="${play.play_no}">
			<button type="button" class="btn update">수정</button>	
			<button type="button" class="btn delete">삭제</button>	
		</form>
		
		<script>
		$(".btn.update").click(function(){
			if($(this).hasClass("update")){
				frmNum.action="<%=request.getContextPath() %>/play/update";
			}else {
				frmNum.action="<%=request.getContextPath() %>/play/delete";
			}
			frmNum.method="post";
			frmNum.submit();
		});
		
		$(".btn.delete").click(function(){
			$.ajax({
				url:"<%=request.getContextPath()%>/play/delete"
				,type:"post"
				,data:{play_no:"${play.play_no}"}
				,success:function(result){
					console.log(result);
					if(result){
						alert(result);
					}
					location.href="<%=request.getContextPath()%>/play/list";
				}
				,error:function(errcode){
					console.log(errcode);
				}
			});
		});
		</script>
	</div>
</c:if>
	<div>
		<table border="1">
			<tr>
				<th>${play.play_title}</th>
			</tr>
			<tr>
				<td>${play.member_id}</td>
				<td>${play.play_readcount}</td>
				<td>${fn:substring(play.play_date,0,16)}</td>
			</tr>
		</table>
		<div>${play.play_content}</div>
	<c:if test="${not empty play.play_original_filename}">
		<div>첨부파일: ${play.play_original_filename}</div>
		<div><img src="<%=request.getContextPath() %>/${play.play_rename_filename}" width="500"></div>
	</c:if>
		<div>
			<button type="button" class="gotolist" onClick="history.back()">글목록</button>
		</div>
	</div>
</c:otherwise>
</c:choose>
</div>
<%@ include file="/WEB-INF/views/common/template_footer.jsp" %>
</div>
</body>
</html>