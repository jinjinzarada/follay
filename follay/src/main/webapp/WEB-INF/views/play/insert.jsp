<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/common/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main/template_footer.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/play/insert.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kh.spring.follay.play.domain.Play"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>
<%@ include file="/WEB-INF/views/common/template_header.jsp" %>
<div class="play_cover">
<div class="title">놀이터</div>
<div class="play_form-cover">
<section>
	<form action="<%=request.getContextPath()%>/play/write" method="post" id="play_write" 
		enctype="multipart/form-data">
		<input type="hidden" name="refnum" value="${refnum}">
		<div>
			<input type="text" name="play_title" class="play_title" placeholder="제목를 적어주세요." required>
		</div>
		<div>
			<textarea type="text" name="play_content" class="play_content" placeholder="내용을 적어주세요."required></textarea>
		</div>
		<div class="filebox bs3-primary preview-image">
              <label for="input_file">사진 업로드</label> 
              <input class="upload-name" value="파일선택" disabled="disabled">
              <input type="file" id="input_file" class="upload-hidden"> 
		</div>
		<button type="submit" class="play_insert">글등록</button>
	</form>
</section>	
</div>
<%@ include file="/WEB-INF/views/common/template_footer.jsp" %>
</div>

<script>
$(document).ready(function(){
	   var fileTarget = $('.filebox .upload-hidden');

	    fileTarget.on('change', function(){
	        if(window.FileReader){
	            // 파일명 추출
	            var filename = $(this)[0].files[0].name;
	        } 

	        else {
	            // Old IE 파일명 추출
	            var filename = $(this).val().split('/').pop().split('\\').pop();
	        };

	        $(this).siblings('.upload-name').val(filename);
	    });

	    //preview image 
	    var imgTarget = $('.preview-image .upload-hidden');

	    imgTarget.on('change', function(){
	        var parent = $(this).parent();
	        parent.children('.upload-display').remove();

	        if(window.FileReader){
	            //image 파일만
	            if (!$(this)[0].files[0].type.match(/image\//)) return;
	            
	            var reader = new FileReader();
	            reader.onload = function(e){
	                var src = e.target.result;
	                parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
	            }
	            reader.readAsDataURL($(this)[0].files[0]);
	        }

	        else {
	            $(this)[0].select();
	            $(this)[0].blur();
	            var imgSrc = document.selection.createRange().text;
	            parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

	            var img = $(this).siblings('.upload-display').find('img');
	            img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
	        }
	    });
	});
</script>
</body>
</html>