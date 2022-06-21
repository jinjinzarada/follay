<!-- <link rel="shortcut icon" type="image/x-icon" href="http://http://localhost:8090/follay/favicon.ico" /> -->
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
	<img src="<%=request.getContextPath()%>/resources/image/main/jong2.png">
	<img src="<%=request.getContextPath()%>/resources/image/main/ppom.png">
	<img src="<%=request.getContextPath()%>/resources/image/main/noliteo.png">
	<img src="<%=request.getContextPath()%>/resources/image/main/follay!.gif" style="width:-100%">
	<img src="<%=request.getContextPath()%>/resources/image/main/login.png">
	<img src="<%=request.getContextPath()%>/resources/image/main/hoewongaib.png">
	<img src="<%=request.getContextPath()%>/resources/image/main/mypage.png">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarColor02">
      <ul class="navbar-nav me-auto">
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
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Separated link</a>
          </div>
        </li>
      </ul>
      <form class="d-flex">
        <input class="form-control me-sm-2" type="text" placeholder="Search">
        <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
      </form>
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
