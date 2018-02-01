<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>


<body>
    <h3>부서 정보</h3>
    
    
    <form action="oraDeptUpdateProc.jsp">
    	부서번호:<input type = "text" value = "${deptno}" name="deptno" readonly="readonly" size="2"><br>
                   부서명:<input type = "text" value = "${dname}" name="dname" size="15"><br>
                   위치:<input type="text" value="${loc}" name="loc" size="15"><br>
        <input type="submit" value="전송">
        <a href="oraDeptInsertProc.jsp"><b>부서정보 추가하기</b></a>
    </form>
    
 	
</body>




</html>