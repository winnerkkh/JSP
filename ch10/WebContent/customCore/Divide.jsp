<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String str1 = request.getParameter("num1");
    String str2 = request.getParameter("num2");
   
    int num1 = Integer.parseInt(str1);
    int num2 = Integer.parseInt(str2);
%>
<html>
	<body>
		<c:catch var = "e">
			<% int result = num1 /num2; %>
			  나눗셈의 결과는 ? <%=result %>
		</c:catch>
		<!-- c:catch 내에서 발생한 오류 객체 e의 처리 -->
		
		<c:if test="${!empty e}">
			에러메세지:${e.message}
		</c:if>
		
	
	</body>

</html>

