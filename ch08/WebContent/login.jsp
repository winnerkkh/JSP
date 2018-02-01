<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login 화면</title>

<script type="text/javascript">
	function chk(){
		 var id = document.getElementById('id');
		 var pwd = document.getElementById('password');
		 
		 if(!id.value){
			 alert("ID를 입력하세요");
			 id.focus();
			 return false;
		 }
		 
		 if(!pwd.value){
			 alert("패스워드를 입력하세요");
			 pwd.focus();
			 return false;
		 }
		 
	   return true	
	}




</script>



</head>
<body>

<form action="template.jsp" onsubmit="return chk()">
	<table>
  <tr>
    <td>ID</td> <td><input type="text" name="id" id="id"></td>
  </tr>
  
  <tr>
    <td>PASSWORD</td> <td><input type="password" name="password" id="password"></td>
  </tr>

  <tr>
	<td colspan=2 align="center"><input type="submit" value="확인"> <input type="reset" value="다시작성"></td>
  </tr>
  
</table>



</form>

</body>
</html>