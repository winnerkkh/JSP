<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script language="JavaScript">
<!--
	// 쿠키 생성
	function setCookie(cName, cValue, cDay){
		var expire = new Date();
		expire.setDate(expire.getDate() + cDay);
		cookies = cName + '=' + escape(cValue) + '; path=/ '; // 한글 깨짐을 막기위해 escape(cValue)를 합니다.
		if(typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
		document.cookie = cookies;
	}

	// 쿠키 가져오기
	function chk(cookieName) {
		var oldValue = document.getElementById('oldValue').value;
		alert('쿠키네임은'+cookieName);
		cookieName = cookieName + '=';
		var cookieData = document.cookie;
		alert('쿠키값은'+cookieData);
		var start = cookieData.indexOf(cookieName);
		var cookieValue = '';
		if(start != -1){
			start += cookieName.length;
			var end = cookieData.indexOf(';', start);
			alert(end);
			if(end == -1)end = cookieData.length;
			cookieValue = cookieData.substring(start, end);
		}
		if(unescape(cookieValue)!=oldValue){
			alert(cookieValue+'와'+oldValue+'는 서로 다릅니다.');
			return false;
		}
		return true;
	}
//-->
</script>

쿠키 생성 버튼을 누른 후 쿠키 보기를 눌러 보세요.<br>
쿠키 삭제 버튼을 누른 후 쿠키 보기도 눌러 보세요.<br>
<br>
쿠키 생성 버튼을 누른 후 이 페이지를 닫고 다시 들어와서 쿠키 보기를 눌러보세요.<br>
<br>
old Value:<input type="text" name="oldValue"  id="oldValue"><p>
new Value:<input type="text" name="newValue"  id="newValue" ><p>

<input type="button" value="쿠키 생성" onclick="setCookie('password', 'test', 1)">
<input type="button" value="쿠키 보기" onclick="return chk('password')">
</head>
<body>

</body>
</html>