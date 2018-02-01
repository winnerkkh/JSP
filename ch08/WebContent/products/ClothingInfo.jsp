<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 넘어온 request객체의 문자셋을 현재 페이지의 문자셋으로 설정 -->  
<%request.setCharacterEncoding("utf-8"); %>
<!-- Bean객체 선언: ClothingInfo pinfo = new Clothing   <--이 선언과 같은 내용임  --> 
<jsp:useBean id="pinfo" class="model.ClothInfo" scope="request"/>

<jsp:setProperty property="code" name="pinfo" param="code"/>
<jsp:setProperty property="name" name="pinfo" param="name"/>
<jsp:setProperty property="price" name="pinfo" param="price"/>
<jsp:setProperty property="size" name="pinfo" param="size"/>
<jsp:setProperty property="color" name="pinfo" param="color"/>

<html>
<head>
<title></title></head>
<body>
	의류정보가 저장되었습니다.<br>
	<hr><br>
	<h3>제품 개략 정보</h3>
	<jsp:include page="ProductInfo.jsp"/><br>
	
	<!-- 밑에부분은 ProductInfol.jsp에 없는 파라미터들이기에 밑에부분에 상속클래스에 나오는 필드는 아래와 같이 명시함 -->
	사이즈:<jsp:getProperty property="size" name="pinfo"/><br>
	색상:<jsp:getProperty property="color" name="pinfo"/><br>
	
</body>
</html>

