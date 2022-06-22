<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <div class="collapse navbar-collapse" id="navbarColor02">
      <ul class="navbar-nav me-auto">
    <li class="nav-item dropdown">
		<img src="<%=request.getContextPath()%>/resources/image/main/jong2.png" class="nav-link dropdown-toggle" 
		data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
			<div class="dropdown-menu">
	            <a class="dropdown-item" href="#">동물</a>
	            <a class="dropdown-item" href="#">식물</a>
	            <a class="dropdown-item" href="#">곤충</a>
	            <a class="dropdown-item" href="#">도형</a>
	            <a class="dropdown-item" href="#">가구</a>
	            <a class="dropdown-item" href="#">이동수단</a>
	            <a class="dropdown-item" href="#">기타</a>
	        </div>
	</li>
	<li class="nav-item">
		<img src="<%=request.getContextPath()%>/resources/image/main/ppom.png" class="nav-item-image">
	</li>
	<li class="nav-item">
		<img src="<%=request.getContextPath()%>/resources/image/main/noliteo.png" class="nav-item-image"
	onclick="location.href='<%=request.getContextPath()%>/play/list'">
	</li>
	<li class="nav-item">
		<img src="<%=request.getContextPath()%>/resources/image/main/follay!.gif" class="nav-item-image-logo">
	</li>
	<li class="nav-item">
		<img src="<%=request.getContextPath()%>/resources/image/main/login.png" class="nav-item-image"
	onclick="location.href='<%=request.getContextPath()%>/member/login'">
	</li>
	<li class="nav-item">
		<img src="<%=request.getContextPath()%>/resources/image/main/hoewongaib.png" class="nav-item-image"
	onclick="location.href='<%=request.getContextPath()%>/member/insert'">
	</li>
	<li class="nav-item">
		<img src="<%=request.getContextPath()%>/resources/image/main/mypage.png" class="nav-item-image">
	</li>
      </ul>
    </div>
  </div>
</nav>
</header>