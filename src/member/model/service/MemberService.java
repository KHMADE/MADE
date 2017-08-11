package member.model.service;

import static common.JDBCTemplate.*;
import java.sql.*;
import java.util.ArrayList;

import member.model.dao.MemberDAO;
import member.model.vo.Member;

public class MemberService {
	public MemberService(){}
	
	public Member selectMember(String id, String pwd){
		Connection con = getConnection();
		Member loginMember = new MemberDAO().selectMember(con, id, pwd);
		close(con);
		return loginMember;
	}
	
	public Member selectMember(String id){
		Connection con = getConnection();
		Member loginMember = new MemberDAO().selectMember(con, id);
		close(con);
		return loginMember;
	}

	public int insertMember(Member m) {
		Connection con = getConnection();
		int result = new MemberDAO().insertMember(con, m);
		if(result > 0) commit(con);
		else rollback(con);
		close(con);
		
		return result;
	}

	public int updateMember(Member m) {
		Connection con = getConnection();
		int result = new MemberDAO().updateMember(con, m);
		if(result > 0) commit(con);
		else rollback(con);
		close(con);
		
		return result;
	}

	public int deleteMember(String userid) {
		Connection con = getConnection();
		int result = new MemberDAO().deleteMember(con, userid);
		if(result > 0) commit(con);
		else rollback(con);
		close(con);
		
		return result;
		}
		
  public ArrayList<String> selectMemberId() {
		Connection con = getConnection();
		ArrayList<String> checkId = new MemberDAO().selectMember(con);
		close(con);
		return checkId;
  }
	public ArrayList<String> selectAllDesigner() {
		Connection con = getConnection();
		ArrayList<String> DesignerList = new MemberDAO().selectAllDesigner(con);
		close(con);
		return DesignerList;
	}

	public String selectOrigenFileName(String userId) {
		Connection con = getConnection();
		String originFileName = null;
		
		originFileName = new MemberDAO().selectOrigenFileName(con,userId);
		
		
		close(con);
		return originFileName;
	}

	public int updateMember1(Member m) {
		Connection con = getConnection();
		int result = 0;
		result = new MemberDAO().updateMember1(con,m);
		System.out.println("Service updateMember1 result : " + result);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		
		close(con);
		return result;
	}

	public int updateMember2(Member m) {
		Connection con = getConnection();
		int result = 0;
		result = new MemberDAO().updateMember2(con,m);
		
		if(result > 0)
			commit(con);
		else
			rollback(con);
		
		
		
		close(con);
		return result;
	}
}
