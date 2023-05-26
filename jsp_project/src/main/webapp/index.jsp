<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("idKey"); // ID가지고옴 세션유지
	String name = (String)session.getAttribute("nameKey");
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" href="resource/css/index.css">
<script src="resource/js/javascript.js"></script>
<style>
a {text-decoration: none;
color: black;}
</style>
</head>
<body>
    <div class="container">
        <div>Team.Arete</div>
        <div><a href="intro/intro.jsp">팀소개</a></div>
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
    <div class="slide">
        <div>
            <img src="resource/image/img1.jpg" alt="">
            <img src="resource/image/img2.jpg" alt="">
            <img src="resource/image/img3.png" alt="">
            <img src="resource/image/img1.jpg" alt="">
        </div>
    </div>
    
    
<div class="content" style="padding: 20px 0 20px 0;">
<div class="container text-center">
  <div class="row">
    <div class="col">
    <div class="card" style="width: 18rem;">
  <img src="resource/image/3.jpg" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
    </div>
    <div class="col">
    <div class="card" style="width: 18rem;">
  <img src="resource/image/1.jpg" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
    </div>
    <div class="col">
    <div class="card" style="width: 18rem;">
  <img src="resource/image/2.jpg" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
    </div>
  </div>
</div>
</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>