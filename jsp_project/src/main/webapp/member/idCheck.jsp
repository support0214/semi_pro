<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id = "mMgr" class="member.MemberMgr"/>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	boolean result = mMgr.checkId(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--
	 1. 라이브러리 ojdbc 오라클 연동 필수 
	 2. java.package.DBConnectionMGR.java 복사 붙여넣기 필수작업 
	 3. DBConnection 에서 user 이름 변경
-->
<%
	if(result){
		out.print(id + "는 이미 존재하는 ID입니다<p/>");
	} else {
		out.print(id + "는 사용가능 합니다<p/>");
	}
%>
<a href = "#" onclick="self.close();">닫기</a>
</body>
</html>