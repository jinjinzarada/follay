<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_footer.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/main.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
	<title>Follay!</title>
</head>
<body>
<%@ include file="/WEB-INF/views/common/template_header.jsp" %>
<section>
	<div class="slideshow-container">
		<div class="mySlides fade">
		  <img src="<%=request.getContextPath()%>/resources/image/main/follay_work_slide.png"
			onclick="location.href='<%=request.getContextPath()%>/work/list'" width="100%;">
		</div>
		<div class="mySlides fade">
		  <img src="<%=request.getContextPath()%>/resources/image/main/follay_show_slide.png"
			onclick="location.href='<%=request.getContextPath()%>/show/list'" width="100%;">
		</div>
		<div class="mySlides fade">
		  <img src="<%=request.getContextPath()%>/resources/image/main/follay_play_slide.png"
			onclick="location.href='<%=request.getContextPath()%>/play/list'" width="100%;">
		</div>
		<!-- 뒤로 앞으로 버튼 -->
		<div>
		<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
		<a class="next" onclick="plusSlides(1)">&#10095;</a>
		</div>
		<br>
		<!-- 슬라이드 점 -->
		<div style="text-align:center" class="dots">
			<span class="dot" onclick="currentSlide(1)"></span>
			<span class="dot" onclick="currentSlide(2)"></span>
			<span class="dot" onclick="currentSlide(3)"></span>
		</div>
	</div>
</section>
<%@ include file="/WEB-INF/views/common/template_footer.jsp" %>
<script>
// 	let slideIndex = 1;
// 	showSlides(slideIndex);
	let slideIndex = 0;
	showSlides();
	
	function plusSlides(n) {
	  showSlides(slideIndex += n);
	}
	
	function currentSlide(n) {
	  showSlides(slideIndex = n);
	}
	
	function showSlides(n) {
	  let i;
	  let slides = document.getElementsByClassName("mySlides");
	  let dots = document.getElementsByClassName("dot");
	  if (n > slides.length) {slideIndex = 1}    
	  if (n < 1) {slideIndex = slides.length}
	  for (i = 0; i < slides.length; i++) {
	    slides[i].style.display = "none";  
	  }
	  slideIndex++;
	  if (slideIndex > slides.length) {slideIndex = 1}    
	  for (i = 0; i < dots.length; i++) {
	    dots[i].className = dots[i].className.replace(" active", "");
	  }
	  slides[slideIndex-1].style.display = "block";  
	  dots[slideIndex-1].className += " active";
	  setTimeout(showSlides, 3000); // 2초마다 silde show 변경
	}

</script>
</body>
</html>
