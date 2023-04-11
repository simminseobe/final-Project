package kr.or.gift.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.gift.model.vo.ProductCategory;

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
	
}
