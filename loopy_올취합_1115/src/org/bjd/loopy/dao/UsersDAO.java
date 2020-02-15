package org.bjd.loopy.dao;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.bjd.loopy.util.SqlSessionUtil;
import org.bjd.loopy.vo.User;

public class UsersDAO{
	public static int insert(User user) {
			int result =0;
			SqlSession session =null;
			try {
				session = SqlSessionUtil.getSession();
				result = session.insert("users.insert",user);
			}catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
			}finally {
				session.close();
			}
			return result;
	}//insert() end
	
	public static User selectLogin(User user) {
		User loginUser = null;
		SqlSession session = null;
		
			try {
				session = SqlSessionUtil.getSession();
				loginUser = session.selectOne("users.selectLogin", user);//members.xml
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			return loginUser;
		}// selectLogin() end
	
	public static int selectCheckEmail(String email) {
		int cnt = 0;
		SqlSession session =null;
		try {
			session = SqlSessionUtil.getSession();
			cnt = session.selectOne("members.selectCheckEmail", email);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}//try~ catch ~ finanlly end
		return cnt;
	}//selectCheckId end
	
	public static int selectCheckNicknameKo(String nickname) {
		int cnt = 0;
		
		SqlSession session =null;
		try {
			session = SqlSessionUtil.getSession();
			cnt = session.selectOne("users.selectCheckNicknameKo", nickname);
		}catch(Exception e) {
			
		}finally {
			session.close();
		}//try~ catch ~ finanlly end
		
		return cnt;
	}//selectCheckId end
	
	public static int selectCheckNicknameEn(String nickname) {
		int cnt = 0;
		
		SqlSession session =null;
		try {
			session = SqlSessionUtil.getSession();
			cnt = session.selectOne("users.selectCheckNicknameEn", nickname);
		}catch(Exception e) {
			
		}finally {
			session.close();
		}//try~ catch ~ finanlly end
		
		return cnt;
	}//selectCheckId end
	
	public static User selectOne(int no) {
		User user = null;
		SqlSession session = null;
		try {
			session=SqlSessionUtil.getSession();
			user= session.selectOne("users.selectOne",no);
			// 디버깅
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return user;
	} // selectOne() end
	
	
	public static List<User> selectListRP() {
		List<User> list = null;
		SqlSession session = null;
		try {
			session=SqlSessionUtil.getSession();
			list= session.selectList("users.selectListRP");
			// 디버깅
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	} // selectListRP() end
	
	public static List<User> selectListDBS() {
		List<User> list = null;
		SqlSession session = null;
		try {
			session=SqlSessionUtil.getSession();
			list= session.selectList("users.selectListDBS");
			// 디버깅
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	} // selectListDBS() end
	
	public static List<User> selectListLevel() {
		List<User> list = null;
		SqlSession session = null;
		try {
			session=SqlSessionUtil.getSession();
			list= session.selectList("users.selectListEXP");
			// 디버깅
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	} // selectListLevel() end
	
	public static int selectLevel(int no) {
		int result = 0;
		SqlSession session = null;
		try {
			session=SqlSessionUtil.getSession();
			result= session.selectOne("users.selectLevel",no);
			// 디버깅
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return result;
	} // selectLevel() end
	
	public static int updateInfo(User user) {
		int result = 0;
		SqlSession session = null;
		try {
			session=SqlSessionUtil.getSession();
			result= session.update("users.updateInfo",user);
			// 디버깅
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return result;
	} // updateInfo() end

	public static int selectPct() {
		int pct = 0;
		SqlSession session = null;
		try {
			session=SqlSessionUtil.getSession();
			pct= session.selectOne("users.selectPct");
			// 디버깅
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return pct;
	} // selectPct() end
	
	public static int selectExp(int no) {
		int exp = 0;
		SqlSession session = null;
		try {
			session=SqlSessionUtil.getSession();
			exp= session.selectOne("users.selectExp",no);
			// 디버깅
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return exp;
	} // selectExp() end
	
}//UsersDAO end



