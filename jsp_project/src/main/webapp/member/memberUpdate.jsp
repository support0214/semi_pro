<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="member.MemberMgr" %>
<%@ page import="member.MemberBean" %>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("idKey"); // ID가지고옴 세션유지
	String name = (String)session.getAttribute("nameKey");
	String pwd = (String)session.getAttribute("pwdKey");
	
	
	%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>회원 정보 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" href="../resource/css/index.css">
<script src="../resource/js/javascript.js"></script>
<style>
a {text-decoration: none;
color: black;}
</style>
</head>
<body>
    <div class="container">
        <div><a href="../index.jsp">Team.Arete</a></div>
        <div><a href="#">팀소개</a></div>
        <div><a href="../sboard/list.jsp">공지사항</a></div>
        <div><a href="../board/list.jsp">자유게시판</a></div>
        
        <%if(id == null) { %>
        <div><a href="member/login.jsp">로그인</a></div>
        <% } else { %>
        <div><a href="mypage.jsp">마이페이지</a></div>
        <div><a href="logout.jsp">로그아웃</a></div>
        <% } %>
    </div>
    
    	<div id="login"> <%if(id != null) { %></div>
        <div style="text-align-last: right;">[<%=name %>님 로그인 완료]</div>
        <% } %>
        <hr>

    <h3>회원 정보 수정</h3>
	<style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        
        th {
            background-color: #f2f2f2;
        }
    </style>
            <hr>
    <table>
    <form action="MemberUpdateServlet" method="post">
    <tr>
        <th>이름</th>
        <td><input type="text" value="<%=name %>" readonly></td>
    </tr>
    <tr>
    	<th>아이디</th>
    	<td><input type="text" value="<%=id %>" readonly></td>
    </tr>
    <tr>
    	<th>비밀번호</th>
    	<td><input type="password" name="password" id="password" required></td>
    </tr>
    <tr>
    	<th>성별</th>
    	<td><input type="text" name="gender" id="gender"></td>
    </tr>
    <tr>
    	<th>생년월일</th>
    	<td><input type="text" name="birthday" id="birthday" required></td>
    </tr>
    <tr>
    	<th>이메일</th>
    	<td><input type="email" name="email" id="email" required></td>
    </tr>
    <tr>
    	<th>우편번호</th>
    	<td><input type="text" name="zipcode" id="zipcode" required></td>
    </tr>
    <tr>
    	<th>주소</th>
    	<td><input type="text" name="address" id="address" required></td>
    </tr>
    <tr>
    	<th>상세주소</th>
    	<td><input type="text" name="detailaddress" id="detailaddress" required></td>
    </tr>
    <tr>
    	<th>취미</th>
    	<td><input type="text" name="hobby" id="hobby" required></td>
    </tr>
    <tr>
    	<th>직업</th>
    	<td><input type="text" name="job" id="job" required></td>
    </tr>
	<tr>
		<td colspan="2"><input type="submit" value="수정"></td>
	</tr>
    </form>
           </table>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
