<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_footer.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>종이접기</title>
</head>
<body>
<%@ include file="/WEB-INF/views/common/template_header.jsp" %>
<div class="work_cover">
<div class="title">놀이터</div>
<div class="work_frmcover">
<form action="<%=request.getContextPath()%>/work/list" method="post" id="play_play" class="work_input-group"></form>
<section>
	<article id="article1">
		<!-- 컨셉버튼 -->
		<div class="concept_btn_wrap">
			<button type="button" class="concept_btn" id="animal"
				<c:if test="${work_category eq '1'}">style="background-color : #F54748; color : white;"</c:if>>동물</button>
			<button type="button" class="concept_btn" id="plant"
				<c:if test="${work_category eq '2'}">style="background-color : #F54748; color : white;"</c:if>>식물</button>
			<button type="button" class="concept_btn" id="bug"
				<c:if test="${work_category eq '3'}">style="background-color : #F54748; color : white;"</c:if>>곤충</button>
			<button type="button" class="concept_btn" id="figure"
				<c:if test="${work_category eq '4'}">style="background-color : #F54748; color : white;"</c:if>>도형</button>
			<button type="button" class="concept_btn" id="furniture"
				<c:if test="${work_category eq '5'}">style="background-color : #F54748; color : white;"</c:if>>가구</button>
			<button type="button" class="concept_btn" id="transportation"
				<c:if test="${work_category eq '6'}">style="background-color : #F54748; color : white;"</c:if>>이동수단</button>
			<button type="button" class="concept_btn" id="etc"
				<c:if test="${work_category eq '7'}">style="background-color : #F54748; color : white;"</c:if>>기타</button>
		</div>
	</article>
	<!-- 페이징처리 -->
	<article id="article4">
		<div class="paging_div">
			<c:if test="${startPage > 1 }">
				<a href="list?page=${startPage-1}"><span>&laquo;</span></a>&nbsp;&nbsp;&nbsp;
			</c:if>
			
			<c:forEach begin="${startPage}" end="${endPage}" step="1" var="i"> 
				<c:if test="${currentPage eq i}">
					<a href="list?page=${i}"><span id="paging_no">${i}</span></a>&nbsp;&nbsp;&nbsp;
				</c:if>
				
				<c:if test="${currentPage ne i}">
					<a href="list?page=${i}">${i}</a>&nbsp;&nbsp;&nbsp;
				</c:if>
			</c:forEach>
			
			<c:if test="${endPage < pageCnt}">
				<a href="list?page=${endPage+1}"><span>&raquo;</span></a>&nbsp;&nbsp;&nbsp;
			</c:if>
		</div>
	</article>
</section>
</div>
<%@ include file="/WEB-INF/views/common/template_footer.jsp" %>
</div>
<script>
		//컨셉별 화면 조회
		$("#animal").on("click", function() {
			location.href = "/work/list?work_category=1";
		});

		$("#plant").on("click", function() {
			location.href = "/bobn/ntpclist?work_category=2";
		});

		$("#bug").on("click", function() {
			location.href = "/bobn/ntpclist?work_category=3";
		});

		$("#figure").on("click", function() {
			location.href = "/bobn/ntpclist?work_category=4";
		});
		
		$("#furniture").on("click", function() {
			location.href = "/bobn/ntpclist?work_category=5";
		});
		
		$("#transportation").on("click", function() {
			location.href = "/bobn/ntpclist?work_category=6";
		});
		
		$("#etc").on("click", function() {
			location.href = "/bobn/ntpclist?work_category=7";
		});
</script>
</body>
</html>