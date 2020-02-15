package org.bjd.loopy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.bjd.loopy.util.SqlSessionUtil;
import org.bjd.loopy.vo.PageVO;
import org.bjd.loopy.vo.Source;

public class SourcesDAO {

	public static List<Source> selectList(PageVO pagevo) {
		List<Source> list = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("sources.selectList",pagevo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return list;
	}//selectList() end




	public static int selectTotal() {
		int cnt = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			cnt = session.selectOne("sources.selectTotal");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return cnt;
		
	}//selectTotal() end
	
	
	public static List<Source> selectSources(int no) {
		List list = null;
		SqlSession session = null;
		try {
			session=SqlSessionUtil.getSession();
			list= session.selectList("sources.selectSource",no);
			// 디버깅
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	} // selectSources() end
	
	
	
}
