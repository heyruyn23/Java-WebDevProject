package org.bjd.ggs.service;

import java.util.List;

import org.bjd.ggs.vo.Member;

public interface MembersService {
	public Member login(Member member);
	public boolean join(Member member);
	public boolean checkEmail(String email);
	
	public List<Member> selectWinner(int no);
	public int selectWinTotal(int no);
}
