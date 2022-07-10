<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_footer.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/play/read.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글읽기</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
<script>
	var msg="${msg}";
	if(msg){
		alert(msg);
	}
</script>
<div><button type="button" onclick="location.href='<%=request.getContextPath() %>/'">홈</button></div>
<c:choose>
<c:when test="${empty board }">
	<script>
		alert("해당글이 없습니다. 글목록으로 이동합니다. ");
		location.href="<%=request.getContextPath()%>/play/list";
	</script>
</c:when>
<c:otherwise>

<c:if test="${play.play_writer eq loginSsInfo.id}">
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
			<tr>
				<td>${play.play_level }</td>	
				<td>${play.play_ref }</td>	
				<td>${play.play_reply_ref }</td>	
				<td>${play.play_reply_seq }</td>			
				<td>${play.play_no }</td>
				<td>${play.play_title }</td>
				<td>${play.play_date }</td>
				<td>${play.play_writer }</td>
				<td>${play.play_readcount }</td>
			</tr>
		</table>
		<div>내용: ${play.play_content }</div>
	<c:if test="${not empty play.play_original_filename }">
		<div>첨부파일: ${play.play_original_filename }</div>
		<div><img src="<%=request.getContextPath() %>/${play.play_rename_filename }" width="500"></div>
	</c:if>
		<div>
			<button type="button" class="btn-reply" onclick="location.href='<%=request.getContextPath()%>/play/write?refnum=${play.play_no}'">답글쓰기</button>
		</div>
		<div>
			<input class="btn btn-gotolist" type="button" value="글목록" onClick="history.back()">
		</div>
	</div>
</c:otherwise>
</c:choose>
</body>
</html>