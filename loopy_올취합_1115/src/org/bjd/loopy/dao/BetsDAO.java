package org.bjd.loopy.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.bjd.loopy.util.SqlSessionUtil;
import org.bjd.loopy.vo.Bet;


public class BetsDAO {
	public static List<Bet> selectList(){
		List<Bet> list = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("bets.selectList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return list;
	}	
	
	public static int seqCount(int no) {
		int result = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			result = session.selectOne("bets.seqCount", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return result;
	}
	
}//BetsDAO end



