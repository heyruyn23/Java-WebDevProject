package org.bjd.ggs.service;

import java.util.List;

import org.bjd.ggs.dao.CategoriesDAO;
import org.bjd.ggs.vo.Category;

public class CategoriesServiceImpl implements CategoriesService{
	private CategoriesDAO categoriesDAO;
	public void setCategoriesDAO(CategoriesDAO categoriesDAO) {
		this.categoriesDAO = categoriesDAO;
	}
	@Override
	public List<Category> selectAll() {
		// TODO Auto-generated method stub
		return categoriesDAO.selectAll();
	}
	@Override
	public String selectImg(String name) {
		// TODO Auto-generated method stub
		return categoriesDAO.selectImg(name);
	}
}
