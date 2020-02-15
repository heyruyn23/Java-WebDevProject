package org.bjd.loopy.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.bjd.loopy.util.SqlSessionUtil;
import org.bjd.loopy.vo.PageVO;
import org.bjd.loopy.vo.ReplyText;


public class RepliesTextsDAO{
	
	
	public static List<ReplyText> selectList(PageVO pageVO){
		List<ReplyText> list = null;
		SqlSession session = null;
		try {
			session= SqlSessionUtil.getSession();
			list  = session.selectList("repliesTexts.selectList", pageVO);
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}//try~catch~finally end
		return list;
	}// selectList end
	
	
	public static int selectTotal(int no) {
		int count = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			count = session.selectOne("repliesTexts.selectTotal",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return count;
	}//selectTotal() end
	
	
	
}// RepliesTextsDAO end


