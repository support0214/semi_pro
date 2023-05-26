<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("idKey"); // ID가지고옴 세션유지
	String pwd = (String)session.getAttribute("pwdKey");
	String name = (String)session.getAttribute("nameKey");
	
	int num = Integer.parseInt(request.getParameter("num"));
	
boolean isAdmin = false;
	
	if(id != null && id.equals("admin")) { // 아이디가 널아 아니고, 아이디가 admin이면서 
		isAdmin = true;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" href="../resource/css/index.css">
</head>
<body>
<style>
	a:link{text-decoration:none; color:black;}
	a:hover{text-decoration:yes; color:blue;}
	a:visited{text-decoration:none; color:black;}
		body{
	margin: 0 auto;
    width: 1000px;
    padding: 20px 0 20px 0;
    text-decoration: none;
    }
</style>

    <div class="container">
        <div>Team.Arete</div>
        <div><a href="#">팀소개</a></div>
        <div><a href="sboard/list.jsp">공지사항</a></div>
        <div><a href="board/list.jsp">자유게시판</div>
        
        <%if(id == null) { %>
        <div><a href="member/login.jsp">로그인</a></div>
        <% } else { %>
        <div><a href="member/mypage.jsp">마이페이지</div>
        <div><a href="member/logout.jsp">로그아웃</a></div>
        <% } %>
    </div>
        <div id="login"> <%if(id != null) { %></div>
        <div style="text-align-last: right;">[<%=name %>님 로그인 완료]</div>
        <% } %>
    <hr>
    
<h3>수정하기</h3>
<% if (isAdmin) {%>
<hr>
    <style>
	table {width: 1000px; border-collapse: collapse;}
	table input {size: 20px; width:100%;  border: 2px solid #DDE6ED; outline-color: #27374D; border-radius: 5px; padding: 10px;}
	textarea {rows: 15; width:100%; height: 300px; border: 2px solid #DDE6ED; resize: none; outline-color: #27374D; border-radius: 5px}
	td {font-weight: 500;}
	.btn {float: right; margin-top: 5px;}
	</style>
	<form method="post" name="supdateFrm" action="sboardUpdate.me">
<table align="center">
			<tr>
				<td align="left">이름</td>
			</tr>
			<tr>	
				<td><input name="name" size="5"></td>
			</tr>
			<tr>
				<td align="left">제목</td>
			</tr>
			<tr>
				<td><input name="subject" size="48"></td>
			</tr>
			<tr>
				<td align="left">내용</td>
			</tr>
			<tr>
				<td><textarea name="content" rows="10" cols="50"></textarea></td>
			</tr>
			<tr>
				<td align="left">비밀번호</td>
			</tr>
			<tr>
				<td><input type="password" name="pass" size="13" placeholder="수정시 비밀번호가 일치해야 변경가능합니다"></td>
				
			</tr>
		</table>
	<hr>
			<div class=btn>
				<button type="submit" class="btn btn-outline-secondary" >수정완료</button>
			</div>
			
			<div class=btn>
			<button type="reset" class="btn btn-outline-secondary" >다시수정</button>
			</div>
			
			<div class=btn>
			<button type="button" onclick="history.go(-1)" class="btn btn-outline-secondary" >뒤로</button>
			</div>
			
					<!-- <input type="submit" value="수정완료">
					<input type="reset" value="다시수정">
					<input type="button" value="뒤로" onclick="location.href='list.jsp'"> -->
	
		<input type="hidden" name="ip" value="<%=request.getRemoteAddr() %>">
		<input type="hidden" name="num" value="<%=num %>">
	</form>
	<%} else { %>
	<script>
    	alert("관리자 전용");
    	location.href="list.jsp";
    </script>
    <% } %>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>