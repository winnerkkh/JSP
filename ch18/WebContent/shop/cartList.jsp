<%@page import="dao.CartDao"%><%@page import="model.Cart"%><%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="loginCheck.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
     String path = getServletContext().getContextPath();
	 String book_kind = request.getParameter("book_kind");
	 String buyer = (String)session.getAttribute("id");

	 ArrayList<Cart> list = null;
	 Cart cart = null;
	 int count = 0; int number = 0; int total = 0;
	 CartDao dao = CartDao.getInstance();
	 count = dao.getListCount(buyer);
	 list = dao.getCartList(buyer);
	 
	 for(int i=0;i<list.size();i++){
		 total += list.get(i).getBuy_count()*list.get(i).getBuy_price();
		 System.out.println("total="+total);
	 }
	 	
	 
	 request.setAttribute("count", count);
	 request.setAttribute("number", number);
	 request.setAttribute("total", total);
	 request.setAttribute("list", list);
	 request.setAttribute("path",path);
	 request.setAttribute("book_kind",book_kind);
%>
<html><head>
<title>상품구매 리스트</title>
<link href="style.css" rel="stylesheet" type="text/css"></head>
<body>
<h3><b>장바구니</b></h3>
<c:if test="${empty list}">
<table border="1" width="650" cellpadding="3" cellspacing="3" align="center">
  <tr><td align="center"><b>장바구니에 담긴 상품이 없습니다.</b></td></tr> 
</table>
<input type="button" value="쇼핑계속" onclick="location.href='list.jsp?book_kind=${book_kind}'">
</c:if>

<c:if test="${!empty list}">
 <table border="1" width="650" cellpadding="3" cellspacing="3" align="center">
  <tr>
    <th><b>번호</b></th><th><b>도서명</b></th>
    <th><b>판매가격</b></th><th><b>수량</b></th><th><b>금액</b></th>
  </tr>
  <c:forEach var="cart" items="${list}" varStatus="n">
<tr>
	<td align="center" width="50"><b>${n.count}</b></td>
	<td width="300">
	<img src="${path}/imageFile/${cart.book_image}" border="0" 
	                                                     width="30" height="50" align="middle">
     ${cart.book_title}	                                                     
    </td>
	<td align="center" width="100">
	      <fmt:formatNumber value="${cart.buy_price}" type="currency" currencySymbol="￦"/>
	</td>
	<td width="150" align="center">
	<form action="updateCart.jsp" name="inform" method="post">
		<input type="text" name="buy_count" size="5" value="${cart.buy_count}">
		<input type="hidden" name="cart_id" value="${cart.cart_id}">
		<input type="hidden" name="book_kind" value="${book_kind}">
		<input type="submit" value="수정">
		<input type="button" value="비우기" 
		  onclick="location.href='cartDel.jsp?list=${cart.cart_id}&book_kind=${book_kind}'">
	</form>
	</td>
	<td align="center" width="150">
	  <fmt:formatNumber value="${cart.buy_count *cart.buy_price}" pattern="###,##0"/>
	     / <fmt:formatNumber value="${total}" pattern="###,##0"/>
	</td>
</tr>
</c:forEach>
 <tr>
 <td colspan="5" align="right">
  <b>총 금액:<fmt:formatNumber value="${total}" type="currency" currencySymbol="￦"/></b>
</td>
</tr>
<tr>
	<td colspan="5" align="center" valign="middle">
	<form>
		<input type="button" value="구매하기" onclick="location.href='buyForm.jsp'">
		<input type="button" value="쇼핑계속" 
		                           onclick="location.href='list.jsp?book_kind=${book_kind}'">
		<input type="button" value="장바구니비우기"
		          onclick="location.href='cartDel.jsp?list=all&book_kind=${book_kind}'">
	</form>
   </td>
  </tr>
</table>
</c:if>
</body>
</html>