<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html><html><head>
<title>회원정보</title></head><body>
	<jsp:useBean id="pinfo" class="model.Customer" scope="request"/>
	<jsp:setProperty property="*" name="pinfo"/>
	    <!-- property로 와일드카드 문자(*) 사용시 
	         html에서 넘어온 파라미터들이 각 속성에 맞게 세팅됨. -->
	<jsp:forward page="NewCustomerInfoView.jsp"/>
</body>
</html>