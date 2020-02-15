package org.bjd.ggs.service;

import java.util.List;

import org.bjd.ggs.vo.Category;

public interface CategoriesService {
	public List<Category> selectAll();
	public String selectImg(String name);
}
