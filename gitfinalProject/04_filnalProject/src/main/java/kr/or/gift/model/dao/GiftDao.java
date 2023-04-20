package kr.or.gift.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.gift.model.vo.Product;
import kr.or.gift.model.vo.ProductCategory;
import kr.or.gift.model.vo.ProductPhoto;

@Repository
public class GiftDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertCategory(ProductCategory category) {
		// TODO Auto-generated method stub
		return sqlSession.insert("gift.insertCategory",category);
	}

	public ArrayList<ProductCategory> getAllCategoryList() {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("gift.selectAllCategory");
		return (ArrayList<ProductCategory>) list;
	}

	public ProductCategory getOneCategory(int pcNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("gift.selectOneCategory",pcNo);
	}

	public ArrayList<ProductCategory> getOrderlyCategory(int pcNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("gift.selectStepCategoryList",pcNo);
		return (ArrayList<ProductCategory>) list;
	}

	public int insertProduct(Product product) {
		// TODO Auto-generated method stub
		return sqlSession.insert("gift.insertProduct",product);
	}

	public int insertProductPhoto(ProductPhoto photo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("gift.insertProductPhoto", photo);
	}

	public ArrayList<Product> getAllProduct() {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("gift.selectAllProduct");
		return (ArrayList<Product>)list;
	}

	public ProductPhoto getMainImage(int productNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("gift.selectOneMainImage", productNo);
	}

	public void deleteCategory(ProductCategory category) {
		// TODO Auto-generated method stub
		sqlSession.delete("gift.deleteCategory",category);
	}

	public void updateCategory(ProductCategory category) {
		// TODO Auto-generated method stub
		sqlSession.update("gift.updateCategory",category);
	}

	public ArrayList<Product> getCategoryItems(int pcNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("gift.getCategoryItems",pcNo);
		return (ArrayList<Product>) list;
	}

	public Product getOneProduct(int productNo) {
		// TODO Auto-generated method stub
		return (Product)sqlSession.selectOne("gift.selectOneProduct",productNo);
	}

	public ArrayList<ProductPhoto> getAllProductImage(int productNo) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("gift.selectAllProductImage",productNo);
		return (ArrayList<ProductPhoto>) list;
	}

	public int deleteProduct(int productNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("gift.deleteProduct",productNo);
	}

}
