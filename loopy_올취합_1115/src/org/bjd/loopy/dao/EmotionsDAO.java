package org.bjd.loopy.dao;

import org.apache.ibatis.session.SqlSession;
import org.bjd.loopy.util.SqlSessionUtil;
import org.bjd.loopy.vo.Emotion;


public class EmotionsDAO {
	
	public static Emotion selectTodayEmotion(int no) {
		Emotion emotion = null;
		SqlSession session = null;
		try {
			session=SqlSessionUtil.getSession();
			emotion= session.selectOne("emotions.selectTodayEmotion",no);
			// 디버깅
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return emotion;
	} // selectTodayEmotion() end
	
	
	public static int insertEmotion(int no) {
		int result = 0;
		SqlSession session = null;
		try {
			session=SqlSessionUtil.getSession();
			result= session.insert("emotions.insertEmotion",no);
			// 디버깅
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}// try~catch~finally end
		return result;
	} // insertEmotion() end
	
}
