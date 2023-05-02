package kr.or.gift.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.gift.model.dao.GiftDao;
import kr.or.gift.model.vo.GiftPay;
import kr.or.gift.model.vo.KakaoPay;
import kr.or.gift.model.vo.Order;
import kr.or.gift.model.vo.Product;
import kr.or.gift.model.vo.ProductCategory;
import kr.or.gift.model.vo.ProductCompany;
import kr.or.gift.model.vo.ProductLike;
import kr.or.gift.model.vo.ProductOption;
import kr.or.gift.model.vo.ProductOrderSheet;
import kr.or.gift.model.vo.ProductPhoto;
import kr.or.gift.model.vo.Receive;
import kr.or.member.model.vo.ShippingAddress;

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

	public int insertOption(ArrayList<ProductOption> options) {
		// TODO Auto-generated method stub
		int result = 0;
		for(ProductOption option : options) {
			result += dao.insertOption(option);
		}
		return result;
	}

	public ArrayList<ProductOption> getProductOptions(int productNo) {
		// TODO Auto-generated method stub
		return dao.getProductOptions(productNo);
	}

	public int deleteOption(int poNo) {
		// TODO Auto-generated method stub
		return dao.deleteOption(poNo);
	}

	public int insertOrderSheet(ArrayList<ProductOrderSheet> posList) {
		// TODO Auto-generated method stub
		int result = 0;
		for(ProductOrderSheet pos : posList) {
			result += dao.insertOrderSheet(pos);
		}
		return result;
	}

	public ArrayList<ProductOrderSheet> getPosList(int memberNo) {
		// TODO Auto-generated method stub
		return dao.getPosList(memberNo);
	}

	public int deletePos(int posNo) {
		// TODO Auto-generated method stub
		return dao.deletePos(posNo);
	}

	public ArrayList<ShippingAddress> getShppingAddress(int memberNo) {
		// TODO Auto-generated method stub
		return dao.getShppingAddress(memberNo);
	}

	public int insertAddress(ShippingAddress sa) {
		// TODO Auto-generated method stub
		return dao.insertAddress(sa);
	}

	public ShippingAddress getOneAddress(int saNo) {
		// TODO Auto-generated method stub
		return dao.getOneAddress(saNo);
	}

	public int insertOrder(Order order) {
		// TODO Auto-generated method stub
		return dao.insertOrder(order);
	}

	public int insertGiftPay(GiftPay giftPay) {
		// TODO Auto-generated method stub
		return dao.insertGiftPay(giftPay);
	}
	
	public int insertReceive(Receive receive) {
		// TODO Auto-generated method stub
		return dao.insertReceive(receive);
	}

	public int insertKakaoPay(KakaoPay kakaoPay) {
		// TODO Auto-generated method stub
		return dao.insertKakaoPay(kakaoPay);
	}

	public int setOrderNo(ArrayList<ProductOrderSheet> poss) {
		// TODO Auto-generated method stub
		int result = 0;
		for(ProductOrderSheet pos : poss) {
			result += dao.setOrderNo(pos);
		}
		return result;
	}

	public int getProductTotalOrder(int productNo) {
		// TODO Auto-generated method stub
		return dao.getProductTotalOrder(productNo);
	}

	public Object getAllCompanyList() {
		// TODO Auto-generated method stub
		return dao.getAllCompanyList();
	}

	public void insertCompanySql(ProductCompany company) {
		// TODO Auto-generated method stub
		dao.insertCompanySql(company);
	}

	public void deleteCompany(ProductCompany company) {
		// TODO Auto-generated method stub
		dao.deleteCompany(company);
	}

	public void updateCompany(ProductCompany company) {
		// TODO Auto-generated method stub
		dao.updateCompany(company);
	}

	public ProductLike getOneProductLike(ProductLike like) {
		// TODO Auto-generated method stub
		return dao.getOneProductLike(like);
	}
	public ProductLike getOneProductLike(int productNo, int memberNo) {
		// TODO Auto-generated method stub
		ProductLike like = new ProductLike(0, productNo, memberNo);
		return dao.getOneProductLike(like);
	}

	public int likeProduct(ProductLike like) {
		// TODO Auto-generated method stub
		return dao.likeProduct(like);
	}

	public int disLikeProduct(ProductLike like) {
		// TODO Auto-generated method stub
		return dao.disLikeProduct(like);
	}

	public int getProductLikeCount(int productNo) {
		// TODO Auto-generated method stub
		return dao.getProductLikeCount(productNo);
	}


}
