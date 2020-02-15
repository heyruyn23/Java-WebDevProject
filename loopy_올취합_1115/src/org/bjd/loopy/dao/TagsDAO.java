package org.bjd.loopy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.bjd.loopy.util.SqlSessionUtil;
import org.bjd.loopy.vo.Playlist;
import org.bjd.loopy.vo.Tag;


public class TagsDAO {
//	
//	
//	public static 리턴자료형 selectLogin(변수타입 변수) {
//			Member loginMember =null;
//			SqlSession session =null;
//			
//			try {
//				
//				session = SqlSessionUtill.getSession();
//				loginMember = session.selectOne("members.selectLogin",변수);
//				
//			}catch (Exception e) {
//				e.printStackTrace();
//				// TODO: handle exception
//			}finally {
//				
//				session.close();
//			}
//			
//			return loginMember;
//						
//	}//slectLogin() end
//
	
	public static int insert(Tag tag) {
		int result = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			result = session.insert("tags.insert",tag);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return result;
	}//selectList() end

	
	public static Tag selectOne(String tag) {
		Tag result = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			result = session.selectOne("tags.selectOne",tag);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return result;
		
	}// end
}



