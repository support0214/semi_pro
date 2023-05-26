<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate(); // 세션종료
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	alert("로그아웃이 되었습니다");
	location.href = "../index.jsp";
</script>
</head>
<body>

</body>
</html>