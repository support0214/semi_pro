<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bean" class="board.BoardBean" scope="session" />
<%
	String nowPage = request.getParameter("nowPage");
	String id = (String)session.getAttribute("idKey"); // ID가지고옴 세션유지
	String pwd = (String)session.getAttribute("pwdKey");
	String name = (String)session.getAttribute("nameKey");
	
	 int num = 0;
	String numParam = request.getParameter("num");
	
	if (numParam != null && !numParam.isEmpty()) {
        num = Integer.parseInt(numParam);
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
        <div><a href="index.jsp">Team.Arete</a></div>
        <div><a href="#">팀소개</a></div>
        <div><a href="../sboard/list.jsp">공지사항</a></div>
        <div><a href="list.jsp">자유게시판</a></div>
        
        <%if(id == null) { %>
        <div><a href="member/login.jsp">로그인</a></div>
        <% } else { %>
        <div><a href="../member/mypage.jsp">마이페이지</a></div>
        <div><a href="../member/logout.jsp">로그아웃</a></div>
        <% } %>
    </div>
        <div id="login"> <%if(id != null) { %></div>
        <div style="text-align-last: right;">[<%=name %>님 로그인 완료]</div>
        <% } %>
    <hr>
<h3>답변작성</h3>

<style>
	table {width: 1000px; border-collapse: collapse;}
	table input {size: 20px; width:100%;  border: 2px solid #DDE6ED; outline-color: #27374D; border-radius: 5px; padding: 10px;}
	textarea {rows: 15; width:100%; height: 300px; border: 2px solid #DDE6ED; resize: none; outline-color: #27374D; border-radius: 5px}
	td {font-weight: 500;}
	.btn {float: right; margin-top: 5px;}
	</style>
	<hr>
	<% if (id != null) { %>
	<form method="post" name="boardReply" action="boardReply">
		<table align="center">
			<tr>
				<td align="left">이름</td>
			</tr>
			<tr>
				<td><input name="name" size="5" readonly value="<%=name %>"></td>
			</tr>
			<tr>
				<td align="left">제목</td>
			</tr>
			<tr>
				<td><input name="subject" size="48" placeholder="'<%=bean.getSubject()%>'의 댓글작성"></td>
			</tr>
			<tr>
				<td align="left">내용</td>
			<tr>
				<td><textarea name="content" rows="10" cols="50" placeholder="댓글작성"></textarea></td>
			</tr>
			<tr>
				<td align="left">비밀번호</td>
			</tr>
			<tr>
				<td><input type="password" name="pass" size="13" required placeholder="해당 ID의 비밀번호 입력"></td>
			</tr>
	</table>
		<hr>
				<div class=btn>	
					<button type="submit" class="btn btn-outline-secondary">답변등록</button>
				</div>
				<div class=btn>
					<button type="reset" class="btn btn-outline-secondary">다시작성</button>
				</div>
				<div class=btn>
					<button type="button" onclick="history.back()" class="btn btn-outline-secondary">뒤로</button>
				</div>

		<!-- 나의 정보 -->
		<input type="hidden" name="ip" value="<%=request.getRemoteAddr() %>">
		<!-- 앞에서 넘어온 값 -->
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
		
		<!-- 부모글의 정보 -->
		<input type="hidden" name="ref" value="<%=bean.getRef() %>">
		<input type="hidden" name="pos" value="<%=bean.getPos() %>">
		<input type="hidden" name="depth" value="<%=bean.getDepth() %>">
	</form>
	<% } else { %>
    <script>
    	alert("로그인 후 댓글사용가능");
    	location.href="list.jsp";
    </script>
<% } %>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>