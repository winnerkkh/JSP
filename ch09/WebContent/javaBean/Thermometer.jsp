<%@page import="util.Thermometer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%	
	/* bean객체 생성 */
	Thermometer thermo = new Thermometer();

	/* request객체에 저장 */
	request.setAttribute("t", thermo);
%>

<html>
<head>

<title>온도 변환</title>
</head>
<body>

 ${t.setCelsius('서울',27.3)}
 ${t.setCelsius('일본',25.3)}
 ${t.setCelsius('북경',30.3)}
 ${t.setCelsius('대만',26.3)}

서울 온도: 섭시${t.getCelsius("서울")}도 / 화씨 ${t.getFahrenheit("서울")} <br>
서울 온도: 섭시${t.getCelsius("북경")}도 / 화씨 ${t.getFahrenheit("북경")} <br>

정보:${t.info} <!-- bean에서 get+필드명 으로 메소드를 생성 -->

</body> 
</html>