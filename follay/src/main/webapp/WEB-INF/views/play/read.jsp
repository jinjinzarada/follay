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
<section>
	<div class="read_table">
		<table>
			<tr>
				<th>${play.play_title}</th>
			</tr>
<!-- 		</table> -->
<!-- 		<table> -->
			<tr>
				<td id="read_memberid">${play.member_id}</td>
				<td id="read_playreadcount">조회 ${play.play_readcount}</td>
				<td id="read_playdate">${fn:substring(play.play_date,0,16)}</td>
			</tr>
		</table>
		<div class="read_content">${play.play_content}</div>
	<c:if test="${not empty play.play_original_filename}">
		<div>첨부파일: ${play.play_original_filename}</div>
		<div><img src="<%=request.getContextPath() %>/${play.play_rename_filename}" width="500"></div>
	</c:if>
	</div>
	<form id="frmComment">
		<input type="hidden" name="play_no" value="${play.play_no}">
		<input type="text" name="play_content" placeholder= "예쁜말 고운말로 댓글 적어주세요." class="comment_content">
		<button type="button" class="comment_submit">댓글등록</button>
	</form>
	<script>
	$(".comment_submit").click(function(){
		console.log($("#frmComment").serialize());
		$.ajax({
			url:"<%=request.getContextPath()%>/play/writecomment,
			type:"post",
			data:$("#frmComment").serialize(),
			dataType:"json",
			success:function(result){
				console.log(result);
				if(result){
					alert(result);
				}
				var html = "";
			},
			error:function(errcode){
				console.log(errcode);
			}			
		});
		
	});
	
	
	</script>
<hr>
	<c:forEach items="${play.play_commentlist}" var="playcomment">
			<p>작성자: ${playcomment.member_id}</p>
			<p>작성일:${playcomment.pc_date}</p>
			<p>글내용:${playcomment.pc_content}</p>
			<hr>
	</c:forEach>
	<div>
		<button type="button" class="gotolist" onClick="history.back()">글목록</button>
	</div>
</section>
</c:otherwise>
</c:choose>
</div>
<%@ include file="/WEB-INF/views/common/template_footer.jsp" %>
</div>
</body>
</html>