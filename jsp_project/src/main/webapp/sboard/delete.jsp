<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sboard.sBoardBean" %>
<jsp:useBean id="bMgr" class="sboard.sBoardMgr" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("nowPage");
	
	if(request.getParameter("pass") != null) {
		String inPass = request.getParameter("pass");
		sBoardBean bean = (sBoardBean)session.getAttribute("bean");
		String dbPass = bean.getPass();
		
		if(dbPass.equals(inPass)) {
			boolean result = bMgr.deleteBoard(num);
			if(result) {
				String url = "list.jsp?nowPage="+nowPage;
				response.sendRedirect(url);
			} else {
				out.print("<script>");
				out.print("alert('댓글이 있으므로 삭제할 수 없습니다');");
				out.print("history.go(-2);");
				out.print("</script>");	
			}       
		} else {
			out.print("<script>");
			out.print("alert('비밀번호가 맞지않습니다');");
			out.print("history.back();");
			out.print("</script>");
		}

	} else {
%>


<style>
.position{width: 410px; position: absolute; left: 50%; top: 40%; transform: translate(-50%, -50%);}
ul{list-style: none; padding-left: 0px;}
.position h2{font-size: 26px; color: #111; border-bottom: 2px solid #111; text-align: center; line-height: 1; padding: 0 0 20px;}
.position li input{width: 100%; height: 30px; box-sizing: border-box; text-indent: 10px;}
.etc{text-align: center; display: flex; justify-content: space-around; flex-direction: row;
	box-sizing: border-box; background-color: #9fa19f; margin-top: 20px;}
.etc1>button {border: none; background-color: #9fa19f; color: white;}
</style>

	<form method="post" name="delFrm" action="delete.jsp">
		<div class="position">
			<h2>게시글 삭제</h2>
				<ul>
					<li><input type="password" name="pass" required placeholder="관리자의 비밀번호 입력"></li>
				<ul>
				<div class="etc">
					<div class="etc1"><button type="submit">삭제완료</button></div>	
					
					<div class="etc1"><button type="reset">재입력</button></div>
					
					<div class="etc1"><button onclick="history.go(-1)">뒤로가기</button></div>
					
				</div>	
		</div>
						<!-- <input type="submit" value="삭제완료">
						<input type="reset" value="다시쓰기">
						<input type="button" value="뒤로" onclick="history.go(-1)"> -->
		
		<input type="hidden" name="num" value="<%=num %>">
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
	</form>
	<%		
	}
%>
</body>
</html>