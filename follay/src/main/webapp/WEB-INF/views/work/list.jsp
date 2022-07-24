<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_footer.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/work/list.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="kh.spring.follay.work.domain.Work"%>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>종이접기</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/template_header.jsp" %>
<div class="work_cover">
<div class="title">종이접기</div>
<div class="work_frmcover">
<form action="<%=request.getContextPath()%>/work/list" method="post" id="work_work" class="work_input-group"></form>
<section>
	<article id="article1">
		<!-- 컨셉버튼 -->
		<div class="category_btn_wrap">
			<button type="button" class="category_btn" id="total" 
				<c:if test="${work_category eq '8'}"></c:if>>전체</button>
			<button type="button" class="category_btn" id="animal"
				<c:if test="${work_category eq '1'}"></c:if>>동물</button>
			<button type="button" class="category_btn" id="plant"
				<c:if test="${work_category eq '2'}"></c:if>>식물</button>
			<button type="button" class="category_btn" id="bug"
				<c:if test="${work_category eq '3'}"></c:if>>곤충</button>
			<button type="button" class="category_btn" id="transportation"
				<c:if test="${work_category eq '4'}"></c:if>>이동수단</button>
			<button type="button" class="category_btn" id="figure"
				<c:if test="${work_category eq '5'}"></c:if>>도형</button>
			<button type="button" class="category_btn" id="furniture"
				<c:if test="${work_category eq '6'}"></c:if>>가구</button>
			<button type="button" class="category_btn" id="etc"
				<c:if test="${work_category eq '7'}"></c:if>>기타</button>
		</div>
	</article>
	<article id="article2">
			<button type="button" id="write_btn"
				onclick="location.href='<%=request.getContextPath()%>/work/write'">글쓰기</button>
	</article>
	<article id="article3">
			<!--db받아온 ntpcVolist를 vo에 담아서 반복문 돌리기  -->
<%-- 				<% --%>
<!-- // 					for (NtPlatingListVo vo : ntpcVolist) { -->
<%-- 				%> --%>
<!-- 			<div id="contentItem"> -->
<%-- 				<div class="article3_img_id"><%=vo.getMemberId()%></div> --%>
<!-- 					<div class="article3_img"> -->
<%-- 						<img src=<%=vo.getPiFile()%> --%>
<%-- 							onclick="location.href='ntpcdetail?work_no=<%=vo.getWork_no()%>';" --%>
<!-- 							id="img_item"> -->
<!-- 					</div> -->
<%-- 				<div class="article3_text"><%=vo.getWork_name()%></div> --%>
<!-- 			</div> -->
<%-- 				<% --%>
<!-- // 					} -->
<%-- 				%> --%>
	</article>
	<!-- 페이징처리 -->
	<article id="article4">
		<div class="paging_div">
			<c:if test="${startPage > 1 }">
				<a href="list?page=${startPage-1}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>&nbsp;&nbsp;&nbsp;
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
				<a href="list?page=${endPage+1}" aria-label="Next"><span aria-hidden="true">&raquo;</span></a>&nbsp;&nbsp;&nbsp;
			</c:if>
		</div>
	</article>
</section>
</div>
<%@ include file="/WEB-INF/views/common/template_footer.jsp" %>
</div>
<script>
		//컨셉별 화면 조회
		$("#total").on("click", function() {
			location.href = "/follay/work/list?work_category=8";
		});
		
		$("#animal").on("click", function() {
			location.href = "/follay/work/list?work_category=1";
		});

		$("#plant").on("click", function() {
			location.href = "/follay/work/list?work_category=2";
		});

		$("#bug").on("click", function() {
			location.href = "/follay/work/list?work_category=3";
		});

		$("#transportation").on("click", function() {
			location.href = "/follay/work/list?work_category=4";
		});
		
		$("#figure").on("click", function() {
			location.href = "/follay/work/list?work_category=5";
		});
		
		$("#furniture").on("click", function() {
			location.href = "/follay/work/list?work_category=6";
		});
		
		$("#etc").on("click", function() {
			location.href = "/follay/work/list?work_category=7";
		});
</script>
</body>
</html>