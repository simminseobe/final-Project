package kr.or.gift.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import common.FileManager;
import kr.or.gift.model.service.GiftService;
import kr.or.gift.model.vo.Product;
import kr.or.gift.model.vo.ProductCategory;
import kr.or.gift.model.vo.ProductPhoto;

@Controller
public class GiftController {
	@Autowired
	private GiftService sv;
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value = "/allGiftList.do")
	public String allGiftLsit(Model model, HttpServletRequest request) {
		ArrayList<Product> pList = sv.getAllProduct();
		for(Product p : pList) {
			// status !=1 (상품 상태가 판매중이 아닌 -> status가 1이 아닌 p 객체를 rList에서 삭제함)
			if(p.getProductStatus() != 1) pList.remove(p);
			p.setMainImage(sv.getMainImage(p.getProductNo()));
		}
		model.addAttribute("pList", pList);
		return "gift/allGiftList";
	}
	
	@RequestMapping(value = "/giftInsertForm.do")
	public String giftInsertForm(Model model) {
		ArrayList<ProductCategory> categoryList = sv.getAllCategoryList();
		model.addAttribute("categoryList", categoryList);
		return "admin/gift/giftInsertForm";
	}
	@ResponseBody
	@RequestMapping(value = "/getOrderlyCategory.do", produces = "application/json;charset=utf-8")
	public String getOrderlyCategory(int pcNo) {
		ArrayList<ProductCategory> list = sv.getOrderlyCategory(pcNo);
		Gson gson = new Gson();
		String result = gson.toJson(list);
		return result;
	}
	@RequestMapping(value = "/insertGift.do")
	public String insertGift(Product product, MultipartFile[] productPhoto, HttpServletRequest request) {
		//1. 사진파일 local save
		//2. 사진파일경로 DB insert
		//3. 상품글 DB insert
		System.out.println(product);
		int fileIndex = 0;
		ArrayList<ProductPhoto> fileList = new ArrayList<ProductPhoto>();
		if(!productPhoto[0].isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/gift/");
			for(MultipartFile file : productPhoto) {
				System.out.print("File index : " + ++fileIndex + " file is : ");
				System.out.println(file.getOriginalFilename());
				
				
				String filepath = fileManager.upload(savePath, file);
				ProductPhoto pP = new ProductPhoto();
				pP.setPpPath(filepath);
				pP.setPpOrder(fileIndex);
				fileList.add(pP);
			}
		}
		int result = sv.insertProduct(product, fileList);
		if(result == fileList.size()+1) {
			System.out.println("insert success");
		} else {
			System.out.println("insert faild");
		}
		return "redirect:/adminGiftList.do";
	}
	//adminPage
	@RequestMapping(value = "/adminGiftList.do")
	public String adminGiftLsit(Model model) {
		ArrayList<Product> pList = sv.getAllProduct();
		for(Product p : pList ) {
			p.setMainImage(sv.getMainImage(p.getProductNo()));
		}
		model.addAttribute("pList", pList);
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
		model.addAttribute("list", sv.getAllCategoryList());
		return "admin/gift/categoryInsertForm";
	}
	@ResponseBody
	@RequestMapping(value = "/insertCategory.do", produces = "application/json;charset=utf-8")
	public String insertCategory(ProductCategory category) {
		sv.insertCategory(category);
		Gson gson = new Gson();
		String result = gson.toJson(category);
		return result;		
	}
	@ResponseBody
	@RequestMapping(value = "/deleteCategory.do", produces = "application/json;charset=utf-8")
	public void deleteCategory(ProductCategory category) {
		sv.deleteCategory(category);
	}

	@ResponseBody
	@RequestMapping(value = "/updateCategory.do", produces = "application/json;charset=utf-8")
	public void updateCategory(ProductCategory category) {
		sv.updateCategory(category);
	}

	@ResponseBody
	@RequestMapping(value = "/getCategoryItems.do", produces = "application/json;charset=utf-8")
	public String getCategoryItems(int pcNo) {
		ArrayList<Product> cpList = sv.getCategoryItems(pcNo);
		Gson gson = new Gson();
		String result = gson.toJson(cpList);
		return result;
	}

	@RequestMapping(value = "/giftDetail.do")
	public String giftDetail(Model model, int productNo) {
		Product product = sv.getOneProduct(productNo);
		product.setImages(sv.getAllProductImage(productNo));
		model.addAttribute("p",product);
		
		return "gift/giftDetail";
	}
	
	@RequestMapping(value = "/adminGiftDetail.do")
	public String adminGiftDetail(Model model, int productNo) {
		Product p = sv.getOneProduct(productNo);
		p.setImages(sv.getAllProductImage(productNo));
		model.addAttribute("p",p);
		return "admin/gift/adminGiftDetail";
	}
	
	@RequestMapping(value = "/deleteProduct.do")
	public String deleteProduct(HttpServletRequest request, int productNo) {
		ArrayList<ProductPhoto> images = sv.deleteProduct(productNo);
		if(images == null) return "redirect:/adminGiftDetail.do";
		else {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/gift/");
			for(ProductPhoto pp : images) {
				boolean removeResult = fileManager.deleteFile(savePath, pp.getPpPath());
				if(removeResult) System.out.println(pp.getPpPath() + " : image remove success");
				else System.out.println(pp.getPpPath() + " : image remove fail");
			}
			return "redirect:/adminGiftList.do";
		}
	}
	
} 
