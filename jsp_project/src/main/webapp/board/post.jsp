<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- <%@ page import="board.BoardBean" %>
<jsp:useBean id="bMgr" class="board.BoardMgr" /> --%>
    
<% 
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("idKey");
	
	String name = (String)session.getAttribute("nameKey");
	
	boolean user = false;
	
	if(id != null) { // 아이디 값 널이 아니면
		user = true;
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="../resource/css/index.css">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
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
</head>
 
<body>

    <div class="container">
        <div><a href="../index.jsp">Team.Arete</a></div>
        <div><a href="../index.jsp">팀소개</a></div>
        <div><a href="../sboard/list.jsp">공지사항</a></div>
        
        <div><a href="list.jsp">자유게시판</a></div>
		<hr>
        
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
        
    <style>
	table {width: 1000px; border-collapse: collapse;}
	table input {size: 20px; width:100%;  border: 2px solid #DDE6ED; outline-color: #27374D; border-radius: 5px; padding: 10px;}
	textarea {rows: 15; width:100%; height: 300px; border: 2px solid #DDE6ED; resize: none; outline-color: #27374D; border-radius: 5px}
	td {font-weight: 500;}
	.btn {float: right; margin-top: 5px;}
	</style>
        
        <h3>자유게시판</h3>
        <hr>
        <% if (user) { %>
	<form method="post" name="postFrm" action="boardPost" enctype="multipart/form-data">
		<table>
			<tr>
				<td>제목</td>
			</tr>
			<tr>
				<td><input name="subject"></td>
			</tr>
			<tr>
				<td>작성자</td>
			</tr>
			<tr>
				<td><input name="name" value="<%=name %>" readonly></td>
			</tr>
			<tr>
				<td>내용</td>
			</tr>
			<tr>
				<td><textarea name="content" rows="10" cols="30"></textarea></td>
			</tr>
			<tr>
				<td>비밀번호</td>
			</tr>
			<tr>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td>파일찾기<input type="file" name="filename"></td>
			</tr>
			</table>
			<hr>
			
			<div class=btn>
				<button type="submit" class="btn btn-outline-secondary">작성하기</button>
				<!-- 	<input type="submit" value="등록"> -->
			</div>
			
			<div class=btn>
			<button type="reset" class="btn btn-outline-secondary">다시작성</button>
			<!-- 		<input type="reset" value="다시쓰기"> -->
			</div>
			
			<div class=btn>
			<button onclick="location.href='list.jsp'" class="btn btn-outline-secondary">게시글</button>
			<!-- 		<input type="button" value="리스트" onclick="location.href='list.jsp'"> -->
			</div>	
		
		<input type="hidden" name="ip" value="<%=request.getRemoteAddr() %>">
	</form>
	<% } else { %>
	<script>
    	alert("로그인 후 사용가능");
    	location.href="list.jsp";
    </script>
	<% } %>
<%-- 	<style>
    table {
      width: 100%;
      border-top: 1px solid #444444;
      border-collapse: collapse;
    }
    th, td {
      border-bottom: 1px solid #444444;
      border-left: 1px solid #444444;
      padding: 10px;
    }
    th:first-child, td:first-child {
      border-left: none;
    }
  </style>
    <h2>작성하기</h2>

    <form method="post" name="postFrm" action="boardPost" enctype="multipart/form-data">
    <table>
        <tr>
            <td>성명</td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td>제목</td>
            <td><input type="text" name="subject"></td>
        </tr>
        <tr>
            <td>내용</td>
            <td><textarea name="content" cols="30" rows="10"></textarea></td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type="password" name="pass"></td>
        </tr>
        <tr>
            <td>파일찾기</td>
            <td>
                <input type="file" name="filename">
            </td>
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
    </form>
<%--            <form method="post" name="postFrm" action="boardPost" enctype="multipart/form-data">
            <article>
                <div class="container" role="main">
                    <h2>공지사항</h2>
                    <div class="mb-3">
                        <label for="title">제목</label>
                        <input type="text" class="form-control"  placeholder="제목을 입력해 주세요"
                            name="subject">
                    </div>
                    <div class="mb-3">
                        <label for="reg_id">작성자</label>
                        <input type="text" class="form-control" name="name" id="reg_id" placeholder="이름을 입력해 주세요">
                    </div>
                    <div class="mb-3">
                        <label for="content">내용</label>
                        <textarea class="form-control" rows="5" name="content"
                            placeholder="내용을 입력해 주세요"></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="tag">비밀번호</label>
                        <input type="password" class="form-control" name="pass" placeholder="비밀번호를 입력해주세요">
                    </div>
                    <div class="mb-3">
                        <label for="tag">파일찾기</label> &emsp;
                        <input type="file" name="filename">
                    </div>
                    <div>
                        <input type="submit" class="btn btn-sm btn-primary" value="등록"></input>
                        <input type="reset" class="btn btn-sm btn-primary" value="다시작성"></input>
                        <input type="button" class="btn btn-sm btn-primary" value="리스트" onclick="location.href='list.jsp'"></input>
                        <input type="hidden" name="ip" value="<%=request.getRemoteAddr() %>">
                    </div>
                </div>
            </article>
        </form> --%>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>