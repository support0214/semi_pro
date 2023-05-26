package sboard;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class sBoardUpdateServlet
 */
@WebServlet("/sboard/sboardUpdate.me")
public class sBoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String nowPage = request.getParameter("nowPage");
		
		sBoardBean upBean = new sBoardBean();
		upBean.setNum(Integer.parseInt(request.getParameter("num")));
		upBean.setName(request.getParameter("name"));
		upBean.setSubject(request.getParameter("subject"));
		upBean.setContent(request.getParameter("content"));
		upBean.setPass(request.getParameter("pass"));
		
		HttpSession session = request.getSession();
		sBoardBean inBean = (sBoardBean)session.getAttribute("bean");
		
		sBoardMgr bMgr = new sBoardMgr();
		if(inBean.getPass().equals(upBean.getPass())) {
			bMgr.updateBoard(upBean);
			String url = "read.jsp?nowPage=" + nowPage + "&num=" + upBean.getNum();
			response.sendRedirect(url);
		} else {
			out.print("<script>");
			out.print("alert('비밀번호가 맞지않습니다');");
			out.print("history.back();");
			out.print("</script>");
		}	
	}
}


