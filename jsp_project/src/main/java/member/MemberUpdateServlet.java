package member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member/MemberUpdateServlet")
public class MemberUpdateServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
	    PrintWriter out = response.getWriter();
	    
	    String nowPage = request.getParameter("nowPage");
	    
	    MemberBean updatedMember = new MemberBean();
	    updatedMember.setName(request.getParameter("name"));
	    updatedMember.setPwd(request.getParameter("password"));
	    updatedMember.setBirthday(request.getParameter("birthday"));
	    updatedMember.setEmail(request.getParameter("email"));
	    updatedMember.setZipcode(request.getParameter("zipcode"));
	    updatedMember.setAddress(request.getParameter("address"));
	    updatedMember.setDetailaddress(request.getParameter("detailaddress"));
	    updatedMember.setHobby(request.getParameter("hobby"));
	    updatedMember.setJob(request.getParameter("job"));

	    HttpSession session = request.getSession();
	    String id = (String) session.getAttribute("idKey");
	    String pwd = (String) session.getAttribute("pwdKey");

	    MemberMgr memberDAO = new MemberMgr();
	    boolean isUpdated = memberDAO.updateMember(id, pwd, updatedMember);

	    if (isUpdated) {
	        out.println("<script>");
	        out.println("alert('회원정보수정이 완료되었습니다');");
	        out.println("location.href='logout.jsp'");
	        out.println("</script>");
	    } else {
	        out.println("회원 정보 업데이트에 실패했습니다.");
	    }
	}
}
