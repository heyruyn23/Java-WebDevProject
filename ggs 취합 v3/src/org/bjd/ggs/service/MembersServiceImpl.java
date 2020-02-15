package org.bjd.ggs.service;

import java.util.List;

import org.bjd.ggs.dao.MembersDAO;
import org.bjd.ggs.vo.Member;

public class MembersServiceImpl implements MembersService{
	
	private MembersDAO membersDAO;
	
	public void setMembersDAO(MembersDAO membersDAO) {
		this.membersDAO = membersDAO;
	}
	
	@Override
	public Member login(Member member) {
		return membersDAO.selectLogin(member);
	}

	@Override
	public boolean join(Member member) {
		return 1==membersDAO.insert(member);
	}
	
	@Override
	public boolean checkEmail(String email) {
		return 0==membersDAO.selectCheckEmail(email);
	}
	
	
	@Override
	public List<Member> selectWinner(int no) {
		// TODO Auto-generated method stub
		return membersDAO.selectWinner(no);
	}

	@Override
	public int selectWinTotal(int no) {
		// TODO Auto-generated method stub
		return membersDAO.selectWinTotal(no);
	}
	
}
