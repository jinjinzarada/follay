<%@ page import="kh.spring.follay.member.domain.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <div class="collapse navbar-collapse" id="navbarColor02">
      <ul class="navbar-nav me-auto">
    <li class="nav-item">
		<img src="<%=request.getContextPath()%>/resources/image/main/jong2.png" class="nav-item-image" 
		onclick="location.href='<%=request.getContextPath()%>/work/list'">
	</li>
	<li class="nav-item">
		<img src="<%=request.getContextPath()%>/resources/image/main/ppom.png" class="nav-item-image"
		onclick="location.href='<%=request.getContextPath()%>/show/list'">
	</li>
	<li class="nav-item">
		<img src="<%=request.getContextPath()%>/resources/image/main/noliteo.png" class="nav-item-image"
		onclick="location.href='<%=request.getContextPath()%>/play/list'">
	</li>
	<li class="nav-item">
		<img src="<%=request.getContextPath()%>/resources/image/main/follay!_logo.gif" class="nav-item-image-logo"
		onclick="location.href='<%=request.getContextPath()%>/'">
	</li>
<c:if test="${empty loginSsInfo}">
	<li class="nav-item">
		<img src="<%=request.getContextPath()%>/resources/image/main/login.png" class="nav-item-image"
		onclick="location.href='<%=request.getContextPath()%>/member/login'">
	</li>
</c:if>
<c:if test="${not empty loginSsInfo}">
	<li class="nav-item">
		<img src="<%=request.getContextPath()%>/resources/image/main/logout.png" class="nav-item-image"
		onclick="location.href='<%=request.getContextPath()%>/member/logout'">
	</li>
</c:if>
	<li class="nav-item">
		<img src="<%=request.getContextPath()%>/resources/image/main/hoewongaib.png" class="nav-item-image"
		onclick="location.href='<%=request.getContextPath()%>/member/insert'">
	</li>
	<li class="nav-item">
		<img src="<%=request.getContextPath()%>/resources/image/main/mypage.png" class="nav-item-image"
		onclick="location.href='<%=request.getContextPath()%>/member/mypage'">
	</li>
      </ul>
    </div>
  </div>
</nav>
<script> 
		var msg = '${msg}';
		if(msg !='' || msg != false) {
			alert('${msg}');		
			location.href= "<%=request.getContextPath()%>/";
		}
	</script>
</header>
