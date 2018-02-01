<%@page contentType="text/html; charset=UTF-8"%>
<html>
<script>
	function chk() {
		var frm = document.forms[0];
		if (!frm.deptno.value) {
			alert("값을 입력하세요");
			frm.deptno.focus();
			return false;
		}
		if (isNaN(frm.deptno.value)) {
			alert("숫자를 입력하세요");
			frm.deptno.value = "";
			frm.deptno.focus();
			return false;
		}
		if (!frm.dname.value) {
			alert("값을 입력하세요");
			frm.dname.focus();
			return false;
		}
		if (!frm.loc.value) {
			alert("값을 입력하세요");
			frm.loc.focus();
			return false;
		}
		return true;
	}
</script>
<body>
	<h3>부서 추가하기</h3>
	<form action="oraDeptInsertProc.jsp" method="post" onsubmit="return chk()">
		부서번호:<input type="text" value="${deptno}" name="deptno" size="2"><br>
		부서명:<input type="text" value="${dname}" name="dname" size="15"><br>
		위치:<input type="text" value="${loc}" name="loc" size="15"><br>
		<input type="submit" value="추가하기"><br>
	</form>
</body>
</html>