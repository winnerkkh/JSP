<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주석 예제</title>
<!-- 이것은 jsp에 의해서 생성된 html 문서 입니다. -->


</head>
<body>
	<%-- JSP주석: 다음은 데이터를 처리하는 스크립틀릿 입니다. --%>
	<%
		int result =1; /* 자바주석: 스크립틀릿에서 선언된 변수는 로컬변수로 초기화를 해주어야함 */
		//자바주석: 1부터 10까지 곱하는 반복문
		for(int cnt=1; cnt<=10; cnt++){
			result*=cnt;
		}
	%>
	
	1부터 10까지 곱한 값은? <%=result %>

</body>
</html>

