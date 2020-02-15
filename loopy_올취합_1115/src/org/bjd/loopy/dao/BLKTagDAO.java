package org.bjd.loopy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.bjd.loopy.util.SqlSessionUtil;
import org.bjd.loopy.vo.BLKTag;
import org.bjd.loopy.vo.PageVO;
import org.bjd.loopy.vo.Playlist;


public class BLKTagDAO {
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
	public static List<String> selectList(BLKTag blkTag) {
		List<String> list = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("BLKTag.selectList",blkTag);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return list;
		
	}//selectList() end
	
	
	public static int insert(BLKTag blkTag) {
		int result = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			result = session.insert("BLKTag.insert",blkTag);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return result;
		
	}// end

}// end



