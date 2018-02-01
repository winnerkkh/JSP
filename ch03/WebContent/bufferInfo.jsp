<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page buffer="8kb" autoFlush="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>버퍼정보</title>
</head>
<body>
	<!-- 버퍼사이즈 및 사용 현황 출력 -->
	버퍼크기:<%=out.getBufferSize()%><br> <!-- 현재 페이지의 버퍼크기 정보 -->
	남은버퍼:<%=out.getRemaining()%><br> <!-- 현재 페이지의 남은 버퍼 크기 정보  -->
	사용한 버퍼:<%=out.getBufferSize() - out.getRemaining()%><br> <!-- 사용한 버퍼사이즈 -->
	auto Flush:<%=out.isAutoFlush()%><br> <!-- 자동 버퍼 비우기 설정여부  -->
</body>
</html>