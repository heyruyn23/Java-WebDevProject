package org.bjd.loopy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.bjd.loopy.util.SqlSessionUtil;
import org.bjd.loopy.vo.User;

public class UserMGMTDAO {
	
	public static List<User> selectFollower(int no) {
		List<User> list = null;
		SqlSession session = null;
		try {
			session=SqlSessionUtil.getSession();
			list= session.selectList("userMGMT.selectFollower",no);
			// 디버깅
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	} // selectFollower() end
	

	public static List<User> selectFollowing(int no) {
		List<User> list = null;
		SqlSession session = null;
		try {
			session=SqlSessionUtil.getSession();
			list= session.selectList("userMGMT.selectFollowing",no);
			// 디버깅
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	} // selectFollowing() end
	
	
	public static List<User> selectBlock(int no) {
		List<User> list = null;
		SqlSession session = null;
		try {
			session=SqlSessionUtil.getSession();
			list= session.selectList("userMGMT.selectBlock",no);
			// 디버깅
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	} // selectBlock() end
	
	public static int selectFollowerCnt(int no) {
		int result = 0;
		SqlSession session = null;
		try {
			session=SqlSessionUtil.getSession();
			result= session.selectOne("userMGMT.selectFollowerCnt",no);
			// 디버깅
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return result;
	} // selectBlock() end
	
}
