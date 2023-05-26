<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id = "mMgr" class="member.MemberMgr"/>
<jsp:useBean id="bean" class="board.BoardBean" scope="session" />
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("idKey"); // ID가지고옴 세션유지
	String pwd = (String)session.getAttribute("pwdKey");
	String name = (String)session.getAttribute("nameKey");
	String address = (String)session.getAttribute("addressKey");
	
	MemberMgr memberMgr = new MemberMgr();
	
	MemberBean member = memberMgr.getMember(id, pwd);
	
	String gen = "";
	if(member.getGender().equals("1")) {
		gen = "남자";
	} else {
		gen = "여자";
	}

	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
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
        <div><a href="../board/list.jsp">자유게시판</div>
        <div><a href="#">마이페이지</div>
        
        <%if(id == null) { %>
        <div><a href="member/login.jsp">로그인</a></div>
        <% } else { %>
        <div><a href="../member/logout.jsp">로그아웃</a></div>
        <% } %>
    </div>
    
    	<div id="login"> <%if(id != null) { %></div>
        <div style="text-align-last: right;">[<%=name %>님 로그인 완료]</div>
        <% } %>
        <hr>
       
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
    <h3>나의 정보</h3>
    <hr>
        <table>
        <tr>
            <th>이름</th>
            <td><%= member.getName() %></td>
        </tr>
        <tr>
        	<th>아이디</th>
        	<td><%= member.getId() %></td>
        </tr>
        <tr>
        	<th>비밀번호</th>
        	<td><%= member.getPwd() %></td>
        </tr>
        <tr>
        	<th>성별</th>
        	<td><%= gen %></td>
        </tr>
        <tr>
        	<th>생년월일</th>
        	<td><%= member.getBirthday() %></td>
        </tr>
        <tr>
        	<th>이메일</th>
        	<td><%= member.getEmail() %></td>
        </tr>
        <tr>
        	<th>우편번호</th>
        	<td><%= member.getZipcode() %></td>
        </tr>
        <tr>
	        <th>주소</th>
	        <td><%= member.getAddress() %></td>
        </tr>
        <tr>
        	<th>상세주소</th>
        	<td><%= member.getDetailaddress() %></td>
        </tr>
        <tr>
        	<th>취미</th>
        	<td><%= member.getHobby() %></td>
        </tr>
        <tr>
        	<th>직업</th>
        	<td><%= member.getJob() %></td>
        </tr>
    </table>
    <a href="memberUpdate.jsp">정보수정</a>
    <a href="memberDelete.jsp">탈퇴</a>
    
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
          </body>
</html>