package kr.or.gift.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.gift.model.dao.GiftDao;
import kr.or.gift.model.vo.ProductCategory;

@Service
public class GiftService {
	@Autowired
	private GiftDao dao;

	public int insertCategory(ProductCategory category) {
		// TODO Auto-generated method stub
		return dao.insertCategory(category);
	}

	public ArrayList<ProductCategory> getAllCategoryList() {
		// TODO Auto-generated method stub
		return dao.getAllCategoryList();
	}
	public ProductCategory getOneCategory(int pcNo) {
		return dao.getOneCategory(pcNo);
	}

	public ArrayList<ProductCategory> getOrderlyCategory(int pcNo) {
		// TODO Auto-generated method stub
		return dao.getOrderlyCategory(pcNo);
	}
}
