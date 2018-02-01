<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login 화면</title>

<script type="text/javascript">
	function chk() {
		var id = document.getElementById('id');
		var pwd = document.getElementById('password');
		var pwd2 = document.getElementById('password2');
		if (!id.value) {
			alert("ID를 입력하세요");
			id.focus();
			return false;
		}

		if (!pwd.value) {
			alert("패스워드를 입력하세요");
			pwd.focus();
			return false;
		}

		if (!pwd2.value) {
			alert("패스워드확인을 입력하세요");
			pwd2.focus();
			return false;
		}
		
		 if(pwd.value!=pwd2.value){
			 alert("입력하신 패스워드가 서로 다릅니다.");
			 pwd.value="";
			 pwd2.value="";
			 pwd.focus();
			 return false;
		 }
		 return true;

		return true
	}
</script>



</head>
<body>

	<form action="template.jsp" onsubmit="return chk()">
		<table border=1 bgcolor="yellow">
			<tr>
				<td>*ID:</td><td><input type="text" name="id" id="id"></td>
			</tr>
			<tr>
				<td>*PASSWORD</td><td><input type="password" name="password" id="password"></td>
			</tr>
			<tr>
				<td>PASSWORD확인</td><td><input type="password" name="password2" id="password2"></td>
			</tr>
			<tr>
				<td>*이름</td><td><input type="text" name="name" id="name" required></td>
			</tr>
			<tr>
				<td>나이</td><td><input type="text" name="age" id="age"></td>
			</tr>
			<tr>
				<td>*주소</td><td><input type="text" name="address" id="address" required></td>
			</tr>
			<tr>
				<td>tel</td><td><input type="text" name="tel" id="tel"></td>
			</tr>
			<tr>
				<td>*email</td><td><input type="email" name="email" id="email" required></td>
			</tr>
			<tr>
				<td colspan=2 align="center"><input type="submit" value="확인"><input type="reset" value="다시작성"></td>
			</tr>
		</table>


	</form>

</body>
</html>