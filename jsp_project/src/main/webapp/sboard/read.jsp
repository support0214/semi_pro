<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sboard.sBoardBean" %>
<jsp:useBean id="bMgr" class="sboard.sBoardMgr" />
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("idKey");
	String name = (String)session.getAttribute("nameKey");
	int num = Integer.parseInt(request.getParameter("num"));

	String nowPage = request.getParameter("nowPage");
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	
	bMgr.upCount(num);

	sBoardBean  bean = bMgr.getBoard(num);
	session.setAttribute("bean", bean);
	
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
<link rel="stylesheet" href="../resource/css/index.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<script>
	function download(filename) {
		downFrm.filename.value = filename;
		downFrm.submit();
	}
	function list() {
		listFrm.submit();
	}
</script>
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
	<table align="center" width=1000px>
	<tr>
        <td colspan=2>
            <table width=100%>
                <tr>    
                    <td align=center>이름</td>
                    <td><%=bean.getName() %></td>
                    <td align=center>등록 날짜</td>
                    <td><%=bean.getRegdate() %></td>
                </tr>
                <tr>
                    <td align=center>제 목</td>
                    <td colspan=3><%=bean.getSubject() %></td>
                </tr>
                <tr>
                    <td align=center>첨부 파일</td>
                    <td colspan=3>
                    <% 
                        if(bean.getFilename()!=null && !bean.getFilename().equals("파일없음"))
                        {
                    %>
                        <a href="javascript:download('<%=bean.getFilename() %>')"><%=bean.getFilename() %></a>&nbsp;&nbsp;
                        <font color=blue>(<%=bean.getFilesize() %> KBytes)</font>
                    <% } else { %>
                            등록된 파일이 없습니다.
                            <% } %>        
                    </td>
                </tr>
                <tr>
                    <td align="center" height="250px">
                    내용
                    </td>
                    <td colspan=4>
                    <%=bean.getContent() %>
                    </td>
                </tr>
                <tr>
                    <td colspan=4 align=right>
                        <%=bean.getIp() %> 로부터 글을 남기셨습니다 / 조회수 : <%=bean.getCount() %>
                    </td>
                </tr>
            </table>    
        </td>
    </tr>
    
    <tr>
        <td align="center" colspan="2">
        <hr>
        [ 
        <a href="javascript:list()">리스트</a> | 
        <a href="update.jsp?nowPage=<%=nowPage%>&num=<%=num%>">수정</a> | 
        <a href="reply.jsp?nowPage=<%=nowPage%>">답변</a> | 
        <a href="delete.jsp?nowPage=<%=nowPage%>&num=<%=num%>">삭제</a> 
        ]
        </td>
    </tr>
</table>
	<form name="downFrm" method="post" action="download.jsp">
		<input type="hidden" name="filename">
	</form>

	<form name="listFrm" method="post" action="list.jsp">
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
		
		<% if(!(keyWord == null || keyWord.equals(""))) { %>
			<input type="hidden" name="keyField" value="<%=keyField %>">
			<input type="hidden" name="keyWord" value="<%=keyWord %>">
		<% } %>
		
	</form>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>






