package org.bjd.loopy.dao;

import org.apache.ibatis.session.SqlSession;
import org.bjd.loopy.util.SqlSessionUtil;

public class RPSDAO {

	public static int selectCnt() {
		int cnt = 0;
		SqlSession session = null;
		try {
			session=SqlSessionUtil.getSession();
			cnt= session.selectOne("rps.selectCnt");
			// 디버깅
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return cnt;
	} // selectCnt() end
	
	public static int selectSum() {
		int total = 0;
		SqlSession session = null;
		try {
			session=SqlSessionUtil.getSession();
			total= session.selectOne("rps.selectSum");
			// 디버깅
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return total;
	} // selectSum() end
	
	public static int selectSTDDEV() {
		int std = 0;
		SqlSession session = null;
		try {
			session=SqlSessionUtil.getSession();
			std= session.selectOne("rps.selectSTDDEV");
			// 디버깅
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return std;
	} // selectSTDDEV() end
	
	public static int selectVAR() {
		int var = 0;
		SqlSession session = null;
		try {
			session=SqlSessionUtil.getSession();
			var= session.selectOne("rps.selectVAR");
			// 디버깅
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return var;
	} // selectVAR() end
	
}
