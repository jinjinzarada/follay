<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Follay!</title>
</head>
<body>

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
        <li class="nav-item">
          <a class="nav-link active" href="#">Follay!
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Features</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Pricing</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">About</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">종이접기</a>
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
      </ul>
<!--       <form class="d-flex"> -->
<!--         <input class="form-control me-sm-2" type="text" placeholder="Search"> -->
<!--         <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button> -->
<!--       </form> -->
    </div>
  </div>
</nav>

<div>
<button type="button" onclick="location.href='<%=request.getContextPath()%>/member/insert'">회원가입</button>
</div>
<div>
<button type="button" onclick="location.href='<%=request.getContextPath()%>/member/list'">회원목록</button>
</div>
<div>
<button type="button" onclick="location.href='<%=request.getContextPath()%>/member/login'">로그인</button>
</div>
<div>
<button type="button" onclick="location.href='<%=request.getContextPath()%>/play/write'">글쓰기</button>
</div>
<div>
<button type="button" onclick="location.href='<%=request.getContextPath()%>/play/list'">글목록</button>
</div>
</body>
</html>
