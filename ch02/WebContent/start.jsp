<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%> <!-- directive -->


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>1���� 100������ ��</title>
</head>
<body>
	<% /* �ڹ��ڵ� �κ� ���� */
		int i=1;
		int total=0;
		for(; i<=100; i++){
			total +=i;
		}
	%>
	<!-- �ڹ��ڵ�κ� ��  -->
	1���� 100������ ����?<%=total%> <!-- ǥ����(expression):���� ���, ���� �� -->


</body>
</html>