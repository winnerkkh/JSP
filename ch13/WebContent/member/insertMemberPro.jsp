<%@page import="java.util.Date"%>
<%@page import="dao.MemberDao"%>
<%@page import="java.sql.Timestamp"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="model.Member1"/>
<jsp:setProperty property="*" name="member"/>
<%
	MemberDao dao = new MemberDao();
	int result = dao.insertMember(member);
	if(result>0){
		%>
<jsp:getProperty property="id" name="member"/>님 회원가입을 축하드립니다.		
		<%
	}
%>

