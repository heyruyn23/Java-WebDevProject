package org.bjd.ggs.dao;

import java.util.List;

import org.bjd.ggs.vo.Member;

public interface MembersDAO {
	
	public Member selectLogin(Member member);
	
	public int selectCheckEmail(String email);
	
	public int insert(Member member);
	
	public List<Member> selectWinner(int no);
	public int selectWinTotal(int no);
	
}
