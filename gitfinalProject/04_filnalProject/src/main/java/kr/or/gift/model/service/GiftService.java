package kr.or.gift.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.gift.model.dao.GiftDao;

@Service
public class GiftService {
	@Autowired
	private GiftDao dao;
}
