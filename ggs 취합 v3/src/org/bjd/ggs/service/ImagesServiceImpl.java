package org.bjd.ggs.service;

import org.bjd.ggs.dao.ImagesDAO;

public class ImagesServiceImpl implements ImagesService{
	private ImagesDAO imagesDAO;
	public void setImagesDAO(ImagesDAO imagesDAO) {
		this.imagesDAO = imagesDAO;
	}
}
