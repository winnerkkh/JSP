<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>회원가입폼</title>
<script>
function chk(){
	var pass1 = document.forms[0].password;
	var pass2 = document.forms[0].password2;
	if(pass1.value!=pass2.value){
		alert('서로 다릅니다.');
		pass1.value="";
		pass2.value="";
		pass1.focus();
		return false;
	}
	return true;
}
</script>
<script type="text/javascript">
function open_chk(){
	var id = document.getElementById('id').value;
	if(id.length==0){
		alert("id를 입력하세요");
		document.getElementById('id').focus();
		return ;
	}
	//팝업윈도우 호출(BOM)
	//window.open(파일명,"title",속성);
	//여기(subscribe.jsp)가 부모(opener)가 됨.
	window.open("member/idCheck.jsp?id="+id,"idchk","height=100,width=450,resize=yes");
} //idCheck.jsp?id=dd
</script>
</head>
<body>
<h2>로그인 화면</h2>
<form action="joinPro.do" onsubmit="return chk()" name="frm">
<table border=1 bgcolor="yellow">
<caption><b>회원가입폼</b></caption>
 <tr>
 <th><b>아이디: </b></th>
 <td><input type="text" name="id" id="id" required>
        <input type="button" name="isId" id="isId" value="IDcheck" 
				                    onclick="open_chk()"></td>
 </tr>
 <tr>
 <th><b> 암호: </b> </th>
 <td>
 <input type="password" name="password" required></td>
 </tr>
 <tr><th><b> 암호확인: </b></th>
 <td><input type="password" name="password2" required></td>
 </tr>
 <tr><th><b> 이름:</b> </th>
 <td><input type="text" name="name" required></td>
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