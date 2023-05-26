<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("idKey");
	String name = (String)session.getAttribute("nameKey");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% if(id != null) { %>

	<h4><%=name %>님 환영합니다</h4>
	<p>즐거운 하루 되세요</p>
	<a href="../index.jsp">홈으로</a>&emsp;
	<a href="logout.jsp">로그아웃</a>
	
<% } else { %>




<section class="login">
<form method="post" name="loginFrm" action="loginProc.jsp">
	<h2>로그인</h2>
	
	<ul>
		<li><input type="text" placeholder="아이디" name="id" required></li>
		<li><input type="password" placeholder="비밀번호" name="pwd" required></li>
		<li>
			<input type="submit" value="로그인" class="btnlog"></input>
			
		</li>
	</ul>
	<div>
	<table>
		<tr>
			<td>
			<input type="button" value="회원가입" onclick="location.href='member.jsp'" class="etc">
		</td>
		<td>
			<input type="submit" value="홈으로" onclick="location.href='../index.jsp'" class="etc">
		</td>
		</tr>
	</table>
</div>
</form>
</section>
<% } %>
<style>
	.login{width: 410px; position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%);}
	ul{list-style: none; padding-left: 0px;}
	.login h2{font-size: 32px; color: #111; border-bottom: 2px solid #111; text-align: center; line-height: 1; padding: 0 0 20px;}
	.login li {padding: 0 0 12px;}
	.login li input{width: 100%; height: 46px; box-sizing: border-box; text-indent: 16px;}
	.login li input::-webkit-input-placeholder{font-size: 16px; color: #9fa19f; text-indent: 16px;} 
	.btnlog {width: 100%; height: 56px; background-color: black; font-size: 18px; color: white; border: none;}
	.login div ul{display: flex; justify-content: center;}
	div {text-align: center; display: flex; justify-content: space-around; flex-direction: row;
	box-sizing: border-box; background-color: #9fa19f;}
	.etc {border: 0 solid black; background: none; color: white;}
	</style>

</body>
</html>