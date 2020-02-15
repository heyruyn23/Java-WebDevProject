package org.bjd.loopy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.bjd.loopy.util.SqlSessionUtil;
import org.bjd.loopy.vo.PageVO;
import org.bjd.loopy.vo.Text;

public class TextsDAO {

	public static int insert(Text text) {
		int result = 0;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			result = session.insert("texts.insert", text);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return result;
	}//insert() end
	
	public static List<Text> selectList(PageVO pageVO) {
		List<Text> list =null;
		SqlSession session =null;
			
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("texts.selectList",pageVO);
			
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			session.close();
		}
		return list;
	}//selectList() end
	
	public static List<Text> selectFList(PageVO pageVO) {
		List<Text> list =null;
		SqlSession session =null;
			
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("texts.selectFList",pageVO);
			
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			session.close();
		}
		return list;
	}//selectList() end
	
	public static List<Text> selectLList(PageVO pageVO) {
		List<Text> list =null;
		SqlSession session =null;
			
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("texts.selectLList",pageVO);
			
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			session.close();
		}
		return list;
	}//selectList() end
	
	public static List<Text> selectIList(PageVO pageVO) {
		List<Text> list =null;
		SqlSession session =null;
			
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("texts.selectIList",pageVO);
			
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			session.close();
		}
		return list;
	}//selectList() end
	
	public static List<Text> selectPList(PageVO pageVO) {
		List<Text> list =null;
		SqlSession session =null;
			
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("texts.selectPList",pageVO);
			
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			session.close();
		}
		return list;
	}//selectList() end
	
	public static List<Text> selectQList(PageVO pageVO) {
		List<Text> list =null;
		SqlSession session =null;
			
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("texts.selectQList",pageVO);
			
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			session.close();
		}
		return list;
	}//selectList() end
	
	public static List<Text> selectRList(PageVO pageVO) {
		List<Text> list =null;
		SqlSession session =null;
			
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("texts.selectRList",pageVO);
			
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			session.close();
		}
		return list;
	}//selectList() end
	
	public static int selectTotal() {
		int count = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			count = session.selectOne("texts.selectTotal");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return count;
	}//selectList() end
	
	public static int selectFTotal() {
		int count = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			count = session.selectOne("texts.selectFTotal");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return count;
	}//selectList() end
	
	public static int selectLTotal() {
		int count = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			count = session.selectOne("texts.selectLTotal");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return count;
	}//selectList() end
	
	public static int selectPTotal() {
		int count = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			count = session.selectOne("texts.selectPTotal");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return count;
	}//selectList() end
	
	public static int selectITotal() {
		int count = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			count = session.selectOne("texts.selectITotal");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return count;
	}//selectList() end	
	
	public static int selectQTotal() {
		int count = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			count = session.selectOne("texts.selectQTotal");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return count;
	}//selectList() end
	
	public static int selectRTotal() {
		int count = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			count = session.selectOne("texts.selectRTotal");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return count;
	}//selectList() end
	
	public static List<Text> selectListBV() {
		List<Text> list =null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("texts.selectListBV");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return list;
	}//selectList() end
	
	public static List<Text> selectListBL() {
			List<Text> list =null;
			SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("texts.selectListBL");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return list;
	}//selectList() end
	
	public static Text selectOne(int no) {
		Text text = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			text = session.selectOne("texts.selectOne", no); 
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}//try~catch~finally end
		return text;
	}// selectOne() end
	
	
	public static int updateHit(int no) {
		int result = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			result = session.update("texts.updateHit",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return result;
	}//updateHit() end
	
}//TextsDAO end
