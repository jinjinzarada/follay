<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_footer.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/main.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ page session="false" %>
<html>
<head>
	<title>Follay!</title>
</head>
<body>

<%@ include file="/WEB-INF/views/common/template_header.jsp" %>
<div class="wrap section">
<section>
<div class="section_container">
	<div class="slideshow-container">
		<div class="mySlides fade">
		  <div class="numbertext">1 / 3</div>
		  <img src="<%=request.getContextPath()%>/resources/image/main/follay_work_slide2.png"
			onclick="location.href='<%=request.getContextPath()%>/'" width="100%;">
		  <div class="text"></div>
		</div>
		<div class="mySlides fade">
		  <div class="numbertext">2 / 3</div>
		  <img src="<%=request.getContextPath()%>/resources/image/main/follay_show_slide2.png"
			onclick="location.href='<%=request.getContextPath()%>/'" width="100%;">
		  <div class="text"></div>
		</div>
		<div class="mySlides fade">
		  <div class="numbertext">3 / 3</div>
		  <img src="<%=request.getContextPath()%>/resources/image/main/follay_play_slide2.png"
			onclick="location.href='<%=request.getContextPath()%>/play/list'" width="100%;">
		  <div class="text"></div>
		</div>
		<!-- 뒤로 앞으로 버튼 -->
		<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
		<a class="next" onclick="plusSlides(1)">&#10095;</a>
		</div>
		<br>
		<!-- 슬라이드 점 -->
		<div style="text-align:center">
			<span class="dot" onclick="currentSlide(1)"></span>
			<span class="dot" onclick="currentSlide(2)"></span>
			<span class="dot" onclick="currentSlide(3)"></span>
		</div>
	</div>
</section>
</div>
<!-- <div> -->
<%-- <button type="button" onclick="location.href='<%=request.getContextPath()%>/member/list'">회원목록</button> --%>
<!-- </div> -->
<!-- <div> -->
<%-- <button type="button" onclick="location.href='<%=request.getContextPath()%>/play/list'">글목록</button> --%>
<!-- </div> -->

<%@ include file="/WEB-INF/views/common/template_footer.jsp" %>
</body>
</html>
