<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("idKey");
	String name = (String)session.getAttribute("nameKey"); 
	boolean isAdmin = false;
	
	if(id != null && id.equals("admin")) { // 아이디가 널아 아니고, 아이디가 admin이면서 
		isAdmin = true;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  </head>
<link rel="stylesheet" href="../resource/css/index.css">
<style>
	a:link{text-decoration:none; color:black;}
	a:hover{text-decoration:yes; color:blue;}
	a:visited{text-decoration:none; color:black;}
</style>
</head>
<body>

    <div class="container">
        <div><a href="../index.jsp">Team.Arete</div>
        <div><a href="../index.jsp">팀소개</a></div>
        <div><a href="#">공지사항</a></div>
        
        <div><a href="../board/list.jsp">자유게시판</div>

        
        <%if(id == null) { %>
        <div><a href="../member/login.jsp">로그인</a></div>
        <% } else { %>
        <div><a href="../member/logout.jsp">로그아웃</a></div>
        <% } %>
    </div>
    
    	<div id="login"> <%if(id != null) { %></div>
        <div style="text-align-last: right;">[<%=name %>님 로그인 완료]</div>
        <% } %>
        <hr>
<%-- 	<table align="center" width="500px"  style="background-color: burlywood; height: 30px">
		<tr>
			<td align="center">글 쓰 기</td>
		</tr>
	</table>
	<form method="post" name="postFrm" action="boardPost" enctype="multipart/form-data">
		<table align="center">
			<tr>
				<td align="center">성 명</td>
				<td><input name="name" size="5"></td>
			</tr>
			<tr>
				<td align="center">제 목</td>
				<td><input name="subject" size="48"></td>
			</tr>
			<tr>
				<td align="center">내 용</td>
				<td><textarea name="content" rows="10" cols="50"></textarea></td>
			</tr>
			<tr>
				<td align="center">비밀번호</td>
				<td><input type="password" name="pass" size="13"></td>
			</tr>
			<tr>
				<td align="center">파일찾기</td>
				<td><input type="file" name="filename"></td>
			</tr>
			<tr>
				<td colspan="2"><hr></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="등록">
					<input type="reset" value="다시쓰기">
					<input type="button" value="리스트" onclick="location.href='list.jsp'">
				</td>
			</tr>
		</table>
		<input type="hidden" name="ip" value="<%=request.getRemoteAddr() %>">
	</form> --%>
<style>
	table {width: 1000px; border-collapse: collapse;}
	table input {size: 20px; width:100%;  border: 2px solid #DDE6ED; outline-color: #27374D; border-radius: 5px; padding: 10px;}
	textarea {rows: 15; width:100%; height: 300px; border: 2px solid #DDE6ED; resize: none; outline-color: #27374D; border-radius: 5px}
	td {font-weight: 500;}
	.btn {float: right; margin-top: 5px;}
</style>

    <h2>공지사항</h2>
    <hr>
    <% if (isAdmin) { %>
    <form method="post" name="postFrm" action="boardPost" enctype="multipart/form-data">
    <table>
        <tr>
            <td>제목</td>
        </tr>
        <tr>
        	<td><input type="text" name="subject"></td>
        </tr>
        <tr>
            <td>작성자</td>
        </tr>
        <tr>
            <td><input type="text" name="name" value="<%=name %>" readonly></td>
        </tr>
        <tr>
            <td>내용</td>
        </tr>
        <tr>
            <td><textarea name="content" cols="30" rows="10"></textarea></td>
        </tr>
        <tr>
            <td>비밀번호</td>
        </tr>
        <tr>
            <td><input type="password" name="pass"></td>
        <tr>
        <tr>
            <td>파일찾기<input type="file" name="filename"></td>
        </tr>
    </table>
    <hr>
    <div class=btn>
		<button type="submit" class="btn btn-outline-secondary">작성하기</button>
		<!-- <input type="submit" value="등록"> -->
	</div>
	<div class=btn>
		<button type="reset" class="btn btn-outline-secondary">다시작성</button>
<!-- 		<input type="reset" value="다시쓰기"> -->
	</div>
	<div class=btn>
		<button onclick="location.href='list.jsp'" class="btn btn-outline-secondary">게시글</button>
		<!-- <input type="button" value="리스트" onclick="location.href='list.jsp'"> -->
	</div>
    <input type="hidden" name="ip" value="<%=request.getRemoteAddr() %>">
    </form>
    <% } else { %>
    <script>
    	alert("관리자 전용");
    	location.href="list.jsp";
    </script>
    <% } %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  </body>
</body>
</html>