package org.bjd.loopy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.bjd.loopy.util.SqlSessionUtil;
import org.bjd.loopy.vo.PageVO;
import org.bjd.loopy.vo.Playlist;

public class PlaylistsDAO {

	public static List<Playlist> selectAlbums(int no) {
		List<Playlist> list = null;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("playlists.selectAlbums", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return list;
	}//selectListTest() end
	
	public static Playlist selectPlaylist(int no) {
		Playlist list = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectOne("playlists.selectPlaylist",no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return list;
	}//selectList() end
	
	
	
	public static int selectName(String name) {
		int cnt = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			cnt = session.selectOne("playlists.selectName",name);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return cnt;
	}// end
	
	
	
	public static List<Playlist> selectArtList(PageVO pagevo) {
		List<Playlist> list = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("playlists.selectArtList",pagevo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return list;
		
	}//selectList() end
	
	
	public static List<Playlist> selectMyList(Playlist playlist) {
		List<Playlist> list = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("playlists.selectMyList",playlist);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return list;
		
	}//selectList() end
	
	
	
	
	
	public static int insert(Playlist playlist) {
		int cnt = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			cnt = session.insert("playlists.insert",playlist);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return cnt;
	}// end
	
	
	
	public static int selectTotal(String type) {
		int cnt = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			cnt = session.selectOne("playlists.selectTotal",type);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return cnt;

	}
	
}//PlaylistDAO end
