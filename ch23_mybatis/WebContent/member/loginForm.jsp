<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>로그인폼</title>
</script>
</head>
<body>
<form action="loginPro.do"  name="frm">
<table border=1 bgcolor="yellow">
<caption><b>로그인 폼</b></caption>
 <tr>
 <th><b>아이디: </b></th>
 <td><input type="text" name="id" id="id" required></td>
 </tr>
 <tr>
 <th><b> 암호: </b> </th>
 <td>
 <input type="password" name="password" required></td>
 </tr>
 <tr>
 <td colspan=2 align="center"><b>
 <input type="submit" value="확인">
 <input type="reset" value="취소"></b></td>
 </tr>
 </table>
</form>
</body>
</html>