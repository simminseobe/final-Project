package kr.or.gift.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.gift.model.dao.GiftDao;
import kr.or.gift.model.vo.Product;
import kr.or.gift.model.vo.ProductCategory;
import kr.or.gift.model.vo.ProductPhoto;

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

	public int insertProduct(Product product, ArrayList<ProductPhoto> fileList) {
		// TODO Auto-generated method stub
		int result = dao.insertProduct(product);
		if(result > 0) {
			for(ProductPhoto photo : fileList) {
				photo.setProductNo(product.getProductNo());
				result += dao.insertProductPhoto(photo);
			}
		}
		return result;
	}

	public ArrayList<Product> getAllProduct() {
		// TODO Auto-generated method stub
		return dao.getAllProduct();
	}

	public ProductPhoto getMainImage(int productNo) {
		// TODO Auto-generated method stub
		return dao.getMainImage(productNo);
	}

	public void deleteCategory(ProductCategory category) {
		// TODO Auto-generated method stub
		dao.deleteCategory(category);
	}

	public void updateCategory(ProductCategory category) {
		// TODO Auto-generated method stub
		dao.updateCategory(category);
	}

	public ArrayList<Product> getCategoryItems(int pcNo) {
		// TODO Auto-generated method stub
		return dao.getCategoryItems(pcNo);
	}

	public Product getOneProduct(int productNo) {
		// TODO Auto-generated method stub
		return dao.getOneProduct(productNo);
	}

	public ArrayList<ProductPhoto> getAllProductImage(int productNo) {
		// TODO Auto-generated method stub
		return dao.getAllProductImage(productNo);
	}

	public ArrayList<ProductPhoto> deleteProduct(int productNo) {
		// TODO Auto-generated method stub
		ArrayList<ProductPhoto> images = dao.getAllProductImage(productNo);
		int result = dao.deleteProduct(productNo);
		if(result > 0) return images;
		else return null;
	}

}
