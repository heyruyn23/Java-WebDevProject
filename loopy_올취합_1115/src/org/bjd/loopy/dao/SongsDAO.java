package org.bjd.loopy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.bjd.loopy.util.SqlSessionUtil;
import org.bjd.loopy.vo.PageVO;
import org.bjd.loopy.vo.Playlist;
import org.bjd.loopy.vo.Song;


public class SongsDAO {

	
	public static List<Song> selectList(int no) {
		List<Song> list = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("songs.selectSongList", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return list;
		
	}//selectList() end
	
	
	
	public static List<Song> selectArtList() {
		List<Song> list = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("songs.selectArtList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return list;
		
	}//selectArtList() end

	
	public static Song selectSong(int no) {
		Song song = null;
		SqlSession session = null;
		try {
			session=SqlSessionUtil.getSession();
			song= session.selectOne("songs.selectSong",no);
			// 디버깅
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return song;
	} // selectSong() end
	
	
	
	public static int selectSongCnt(int no) {
		int result = 0;
		SqlSession session = null;
		try {
			session=SqlSessionUtil.getSession();
			result= session.selectOne("songs.selectSongCnt",no);
			// 디버깅
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return result;
	} // selectSongCnt() end
	
	
	
	public static List<Song> selectListTest() {
		List<Song> list = null;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("songs.selectListTest");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return list;
	}//selectListTest() end
	
	
	
	public static List<Song> selectList(String nos) {
		List<Song> song = null;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			song = session.selectList("songs.selectList", nos);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return song;
	}//selectList() end
	
	
	
}//end



