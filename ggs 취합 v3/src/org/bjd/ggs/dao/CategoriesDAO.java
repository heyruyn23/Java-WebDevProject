package org.bjd.ggs.dao;

import java.util.List;

import org.bjd.ggs.vo.Category;

public interface CategoriesDAO {
	public List<Category> selectAll();
	public String selectImg(String name);
}
