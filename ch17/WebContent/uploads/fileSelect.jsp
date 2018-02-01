<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>파일 업로드 예제</title>
</head>
<body>
	<!-- 파일은 사이즈 가 크므로 전송방식이 body에 데이타를 묶어서 보내는 post방식으로 지정해야함. -->
	<form action="fileUploadPro.jsp" method="post" enctype="multipart/form-data" name="fileForm">
		  작성자:<input type="text" name="user"><br>
		     제목:<input type="text" name="title"><br>
 		 파일명:<input type="file" name="uploadFileName"><br><!--file타입은 파일선택창이 나타남.  -->
       		  <input type="submit" value="파일 올리기">
	</form>
</body>
</html>