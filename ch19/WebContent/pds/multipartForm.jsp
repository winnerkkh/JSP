<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<title>multipart 폼</title>
</head>
<body>
<form action="multipartUpload" method="post" enctype="multipart/form-data">
text1:<input type="text" name="text1">
file1:<input type="text" name="file1"><br>
file2:<input type="text" name="file2"><br>
<input type="submit" name="전송"><br>
</form>
</body>
</html>