package org.bjd.ggs.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.bjd.ggs.vo.Member;


public class MembersDAOImpl implements MembersDAO{
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	public Member selectLogin(Member member) {
		return session.selectOne("members.selectLogin", member);
	}// selectLogin() end
	
	public int insert(Member member) {
		return session.insert("members.insert", member);
	}
	
	public int selectCheckEmail(String email) {
		return session.selectOne("members.selectCheckEmail", email);
	}// selectCheckId() end

	@Override
	public List<Member> selectWinner(int no) {
		// TODO Auto-generated method stub
		return session.selectList("members.selectWinner", no);
	}

	@Override
	public int selectWinTotal(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("members.selectWinTotal", no);
	}
	
}
