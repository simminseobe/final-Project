package kr.or.gift.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.gift.model.service.GiftService;
import kr.or.gift.model.vo.ProductCategory;

@Controller
public class GiftController {
	@Autowired
	private GiftService sv;
	
	@RequestMapping(value = "/allGiftList.do")
	public String allGiftLsit() {
		return "gift/allGiftList";
	}
	
	@RequestMapping(value = "/giftInsertForm.do")
	public String giftInsertForm(Model model) {
		ArrayList<ProductCategory> categoryList = sv.getAllCategoryList();
		model.addAttribute("categoryList", categoryList);
		return "admin/gift/giftInsertForm";
	}
	@RequestMapping(value = "/insertGift.do")
	public String insertGift() {
		
		return "admin/gift/allGiftLsit";
	}
	@RequestMapping(value = "/adminGiftList.do")
	public String adminGiftLsit() {
		
		return "admin/gift/allGiftList";
	}
	@RequestMapping(value = "/allCategoryList.do")
	public String allCategoryList(Model model) {
		ArrayList<ProductCategory> categoryList = sv.getAllCategoryList();
		model.addAttribute("list", categoryList);
		return "admin/gift/allCategoryList";
	}
	@RequestMapping(value = "/categoryInsertForm.do")
	public String categoryInsertForm(Model model) {
		ArrayList<ProductCategory> categoryList = sv.getAllCategoryList();
		model.addAttribute("list", categoryList);
		return "admin/gift/categoryInsertForm";
	}
	@RequestMapping(value = "/insertCategory.do")
	public String insertCategory(ProductCategory category) {
		if(category.getPcNo() != 0) {
			ProductCategory pc = sv.getOneCategory(category.getPcNo());
			category.setPcDepth(pc.getPcDepth()+1);
			category.setPcStep(pc.getPcNo());
		}
		else {
			category.setPcDepth(1);
		}
		sv.insertCategory(category);
		return "admin/gift/allCategoryList";
	}
	@ResponseBody
	@RequestMapping(value = "/getOrderlyCategory.do", produces = "application/json;charset=utf-8")
	public String getOrderlyCategory(int pcNo) {
		ArrayList<ProductCategory> list = sv.getOrderlyCategory(pcNo);
		Gson gson = new Gson();
		String result = gson.toJson(list);
		return result;
	}
} 
