<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="member.MemberMgr" %>
    <%@ page import="member.MemberBean" %>

<%
	request.setCharacterEncoding("UTF-8");
    String id = (String) session.getAttribute("idKey"); // 세션에서 회원 ID 가져오기
    MemberMgr memberMgr = new MemberMgr(); // MemberMgr 객체 생성

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div><%=id %></div>
<h1>회원 탈퇴</h1>
    <form action="MemberWithdrawServlet" method="POST">
        <label for="password">비밀번호:</label>
        <input type="password" id="password" name="password" required>
        <br>
        <input type="submit" value="탈퇴">
    </form>
</body>
</html>