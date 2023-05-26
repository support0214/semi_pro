package member;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MemberDeleteServlet
 */
@WebServlet("/member/MemberWithdrawServlet")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		 PrintWriter out = response.getWriter();
		
	    // 세션에서 유지된 비밀번호를 가져옵니다.
	    String password = (String) session.getAttribute("pwdKey");
	 
	    // 비밀번호 확인
	    if (password != null && password.equals(request.getParameter("password"))) {

	      MemberMgr memberMgr = new MemberMgr();
	      memberMgr.deleteMember(password);
	      
	
	      session.invalidate();
	      
	      out.println("<script>");
	      out.println("alert('회원탈퇴가 완료되었습니다');");
	      out.println("location.href='../index.jsp'");
	      out.println("</script>");
	      
	    } else {
	    	out.println("<script>");
		      out.println("alert('비밀번호가 올바르지 않습니다');");
		      out.println("location.href='mypage.jsp'");
		      out.println("</script>");
	    }
	  }
	  
	}