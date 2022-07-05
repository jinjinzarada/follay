<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_footer.css">
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/member/login.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/template_header.jsp" %>
<div class="login_wrap">
  <div class="login_form-wrap">
	<form action="<%=request.getContextPath()%>/member/login" method="post" id="login_login" class="login_input-group">
		<div><input type="text" name="id" class="login_input-field" placeholder="아이디 입력하세요" required></div>
		<div><input type="password" name="pwd" class="login_input-field" name="passwd" placeholder="비밀번호 입력하세요" required></div>
		<button type="submit" class="login_submit">로그인</button> 
		<button type="button" class="login_find" onclick="idfind()">아이디 찾기</button>
        <button type="button" class="login_find" onclick="pwdfind()">비밀번호 찾기</button>
	</form>
<!-- 	<form id="login_idfind" class="login_input-group"> -->
<!--         <div>이메일:<input type="email" class="login_input-field" name="email_idfind" id="email_idfind" placeholder="이메일 주소 입력하세요" required> -->
<!--         <button class="login_submit" onclick="toidfind()">아이디 찾기</button> -->
<!--     </form> -->
<%--     <form id="login_passwordfind" action="<%=request.getContextPath()%>/pwdfind.lo" method="get" class="login_input-group"> --%>
<!--          <div>아이디:<input type="text" class="login_input-field" name="id_pwdfind" id="id_pwdfind" placeholder="아이디 입력하세요" required> -->
<!--          <div>이메일:<input type="email" class="login_input-field" name="email_pwdfind" id="email_pwdfind" placeholder="이메일 주소 입력하세요" required> -->
<!--          <button class="login_submit" onclick="topwdfind()">비밀번호 찾기</button> -->
<!--      </form> -->
     
  </div>
<%@ include file="/WEB-INF/views/common/template_footer.jsp" %>
</div>
<script>
    	function toregister(){
    		location.href="register"; 
    	}
    	
    	function toidfind(){
            var emailid = document.getElementById("email_idfind");
                var inputemailid = $('#email_idfind').val();
                console.log("ajax 전까지 들어왔어");
                console.log("이제 inputnameid를 찍어볼게");
                console.log(inputnameid);
                console.log("이제 inputemailid를 찍어볼게");
                console.log(inputemailid);
                
                $.ajax({
                    url:'idfind.lo',
                    async:false,
                    type:'post',
                    data:{'inputemailid' : inputemailid},
                    dataType:'json',
                    success:function(data){
                    	if (data != null) {
                    		
                    		alert("회원님의 ID는  "+data.idshow+"  입니다.");
                            console.log("ajax 진입-성공(data)까지 들어왔어");
                            
                            $('#id').val(data.idshow);
                            $("#id").prop('readonly', true);
                            $('#id_pwdfind').val(data.idshow);
                            $("#id_pwdfind").prop('readonly', true);
                            
                        } else {
                            alert("정보를 다시 한번 제대로 입력해주시기 바랍니다.");
                            console.log("ajax 진입-성공(else)까지 들어왔어");
                        }
                    },
                    error : function(error) {
                        alert("정보를 다시 한번 제대로 입력해주시기 바랍니다.");
                        console.log("ajax 진입(에러)까지 들어왔어");
                    }
                });
            console.log("ajax 진입 후의 영역까지 들어왔어");
            }  
    	
    	function topwdfind(){
    		
    	}
    </script>
</body>
</html>