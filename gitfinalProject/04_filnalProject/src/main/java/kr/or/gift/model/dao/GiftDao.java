package kr.or.gift.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GiftDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
}
