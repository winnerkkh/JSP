<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="managerSessionChk.jsp" %>
<%@ include file="../color.jsp"%>
<html><head><title>책관리</title>
<style type="text/css"> table { padding: 5 ; }</style>
</head><body>      
   <b>관리작업중.. </b><input type="button" value="로그아웃" 
  		  onclick="location.href='logon/managerLogout.jsp'"><br>  
   <table border="0" width="300">
     <tr><td align="center" bgcolor="<%=bar%>">상품관련 작업</td></tr>
     <tr><td><a href='productProcess/bookRegisterForm.jsp'>상품등록</a></td></tr>
     <tr><td><a href='productProcess/bookList.jsp?book_kind=all'>상품수정/삭제</a></td></tr>
   </table><br><br> 
   <table width="300">
     <tr><td align="center" bgcolor="<%=bar%>">구매된 상품관련 작업</td></tr>
     <tr><td><a href='orderedProduct/orderedList.jsp'>전체구매목록 확인</a></td></tr>
   </table>
   </body></html>