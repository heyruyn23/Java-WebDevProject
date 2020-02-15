package org.bjd.loopy.dao;

import org.apache.ibatis.session.SqlSession;
import org.bjd.loopy.util.SqlSessionUtil;

public class BLKSourcesDAO {

	public static int selectSourceCnt(int no) {
		int result = 0;
		SqlSession session = null;
		try {
			session=SqlSessionUtil.getSession();
			result= session.selectOne("blkSources.selectSourceCnt",no);
			// 디버깅
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return result;
	} // selectSourceCnt() end
	
	
}
