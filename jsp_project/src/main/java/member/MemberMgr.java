package member;

import java.lang.reflect.Member;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import db.DBConnectionMgr;

public class MemberMgr {
	private DBConnectionMgr pool;

	public MemberMgr() {
		pool = DBConnectionMgr.getInstance();
	}

	public boolean checkId(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean flag = false;

		try {
			con = pool.getConnection();
			String sql = "SELECT ID FROM MEMBER WHERE ID=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}

	public boolean insertMember(MemberBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean flag = false;

		try {
			con = pool.getConnection();
			String sql = "INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId()); // Id 값을 가져옴 대신 순서를 맞춰준다
			pstmt.setString(2, bean.getPwd());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getGender());
			pstmt.setString(5, bean.getBirthday());
			pstmt.setString(6, bean.getEmail());
			pstmt.setString(7, bean.getZipcode());
			pstmt.setString(8, bean.getAddress());
			pstmt.setString(9, bean.getDetailaddress());
			pstmt.setString(10, bean.getHobby());
			pstmt.setString(11, bean.getJob());

			if (pstmt.executeUpdate() == 1) // 데이터가 바뀜
				flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}

	 public String loginMember(String id, String pwd) {
		 Connection con = null;
		 PreparedStatement pstmt = null;
		 ResultSet rs = null;

		 String name = "";

		 try { con = pool.getConnection(); 
		 String sql = "SELECT NAME FROM MEMBER WHERE ID=? and pwd=?";
		 pstmt = con.prepareStatement(sql);
		 pstmt.setString(1, id);
		 pstmt.setString(2, pwd);
		 rs = pstmt.executeQuery(); 
		 if(rs.next()) {
			 name = rs.getString(1); 
			 }
 } catch (Exception e) {
	 e.printStackTrace(); 
	 } finally {
		 pool.freeConnection(con, pstmt, rs); 
		 }
		 return name; 
		 }

//	public List<MemberBean> getAllMembers(String id, String pwd) {
//	    Connection con = null;
//	    PreparedStatement pstmt = null;
//	    ResultSet rs = null;
//
//	    List<MemberBean> memberList = new ArrayList<>();
//
//	    try {
//	        con = pool.getConnection();
//	        String sql = "SELECT * FROM MEMBER WHERE ID=? AND PWD=?";
//	        pstmt = con.prepareStatement(sql);
//	        rs = pstmt.executeQuery();
//
//	        while (rs.next()) {
//	            MemberBean member = new MemberBean();
//	            member.setId(rs.getString(1));
//	            member.setPwd(rs.getString(2));
//	            member.setName(rs.getString(3));
//	            member.setGender(rs.getString(4));
//	            member.setBirthday(rs.getString(5));
//	            member.setEmail(rs.getString(6));
//	            member.setZipcode(rs.getString(7));
//	            member.setAddress(rs.getString(8));
//	            member.setDetailaddress(rs.getString(9));
//	            String[] hobbyArray = rs.getString(10).split(",");
//	            member.setHobby(hobbyArray);
//	            member.setJob(rs.getString(11));
//	            
//	            memberList.add(member);
//	        }
//	    } catch (Exception e) {
//	        e.printStackTrace();
//	    } finally {
//	        pool.freeConnection(con, pstmt, rs);
//	    }
//
//	    return memberList;
//	}

	public MemberBean getMember(String id, String pwd) {
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    MemberBean member = null;

	    try {
	        con = pool.getConnection();
	        String sql = "SELECT * FROM MEMBER WHERE ID=? AND PWD=?";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, id);
	        pstmt.setString(2, pwd);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            member = new MemberBean();
	            member.setId(rs.getString("ID"));
	            member.setPwd(rs.getString("PWD"));
	            member.setName(rs.getString("NAME"));
	            member.setGender(rs.getString("GENDER"));
	            member.setBirthday(rs.getString("BIRTHDAY"));
	            member.setEmail(rs.getString("EMAIL"));
	            member.setZipcode(rs.getString("ZIPCODE"));
	            member.setAddress(rs.getString("ADDRESS"));
	            member.setDetailaddress(rs.getString("DETAILADDRESS"));
	            member.setHobby(rs.getString("Hobby"));
	            member.setJob(rs.getString("JOB"));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        pool.freeConnection(con, pstmt, rs);
	    }

	    return member;
	}
	
	/*
	 * public MemberBean deleteMember(String id, String pwd) { Connection con =
	 * null; PreparedStatement pstmt = null; ResultSet rs = null;
	 * 
	 * MemberBean memberDelete = null; }
	 */

	
	
	
	
	
	public boolean updateMember(String id, String pwd, MemberBean updatedMember) {
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    
	    try {
	        con = pool.getConnection();
	        String sql = "UPDATE MEMBER SET PWD=?, BIRTHDAY=?, EMAIL=?, ZIPCODE=?, ADDRESS=?, DETAILADDRESS=?, HOBBY=?, JOB=? WHERE ID=? AND PWD=?";
	        pstmt = con.prepareStatement(sql);
	        
	        pstmt.setString(1, updatedMember.getPwd());
	        pstmt.setString(2, updatedMember.getBirthday());
	        pstmt.setString(3, updatedMember.getEmail());
	        pstmt.setString(4, updatedMember.getZipcode());
	        pstmt.setString(5, updatedMember.getAddress());
	        pstmt.setString(6, updatedMember.getDetailaddress());
	        pstmt.setString(7, String.join(",", updatedMember.getHobby()));
	        pstmt.setString(8, updatedMember.getJob());
	        pstmt.setString(9, id);
	        pstmt.setString(10, pwd);
	        
	        int rowsAffected = pstmt.executeUpdate();
	        
	        return rowsAffected > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        pool.freeConnection(con, pstmt);
	    }
	    
	    return false;
	}
	
	    
	public boolean deleteMember(String pwd) {
		  Connection con = null;
		  PreparedStatement pstmt = null;
		  
		  try {
		    con = pool.getConnection();
		    String sql = "DELETE FROM Member WHERE pwd=?";
		    pstmt = con.prepareStatement(sql);
		    pstmt.setString(1, pwd);
		    
		    int rowsAffected = pstmt.executeUpdate();
		    
		    return rowsAffected > 0;
		  } catch (Exception e) {
		    e.printStackTrace();
		  } finally {
		    pool.freeConnection(con, pstmt);
		  }
		  
		  return false;
		}
}


	
	

