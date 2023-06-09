package kr.or.gift.controller;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Comparator;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import common.FileManager;
import kr.or.gift.model.service.GiftService;
import kr.or.gift.model.vo.ApproveResponse;
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
import kr.or.gift.model.vo.ReadyResponse;
import kr.or.gift.model.vo.Receive;
import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.ShippingAddress;

@Controller
@SessionAttributes({"tid","order"}) //하... 
public class GiftController {
	@Autowired
	private GiftService sv;
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value = "/allGiftList.do")
	public String allGiftLsit(Model model, HttpServletRequest request, @SessionAttribute(required = false) Member m) {
		//상품을 최신순으로 가져옴
		ArrayList<Product> pList = sv.getAllProduct();
		ArrayList<Product> fpList = new ArrayList<Product>();
		for(Product p : pList) {
			// status !=1 (상품 상태가 판매중이 아닌 -> status가 1이 아닌 p 객체를 rList에서 삭제함)
			if(p.getProductStatus() != 1) pList.remove(p);
			p.setMainImage(sv.getMainImage(p.getProductNo()));
			p.setProductLikeCount(sv.getProductLikeCount(p.getProductNo()));
			if(m != null && sv.getOneProductLike(p.getProductNo(), m.getMemberNo()) != null) p.setProductLikeStatus(true);
			else p.setProductLikeStatus(false);
			p.setTotalOrder(sv.getProductTotalOrder(p.getProductNo()));
		}
		//깊은복사
		fpList.addAll(pList);
		Comparator<Product> comparator = new Comparator<Product>() {
            @Override
            public int compare(Product o1, Product o2) {
                return o2.getTotalOrder() - o1.getTotalOrder();
            }
        };
        fpList.sort(comparator);
		model.addAttribute("pList", pList);
		model.addAttribute("fpList", fpList);
		
		return "gift/allGiftList";
	}
	
	@RequestMapping(value = "/giftInsertForm.do")
	public String giftInsertForm(Model model) {
		ArrayList<ProductCategory> categoryList = sv.getAllCategoryList();
		model.addAttribute("companyList", sv.getAllCompanyList());
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
	
	@RequestMapping(value = "/insertCompany.do")
	public String insertCompany(Model model) {
		model.addAttribute("list", sv.getAllCompanyList());
		return "admin/gift/insertCompany";
	}
	
	@ResponseBody
	@RequestMapping(value = "/insertCompanySql.do", produces = "application/json;charset=utf-8")
	public String insertCompanySql(ProductCompany company) {
		sv.insertCompanySql(company);
		Gson gson = new Gson();
		String result = gson.toJson(company);
		return result;		
	}
	@ResponseBody
	@RequestMapping(value = "/deleteCompany.do", produces = "application/json;charset=utf-8")
	public void deleteCompany(ProductCompany company) {
		sv.deleteCompany(company);
	}

	@ResponseBody
	@RequestMapping(value = "/updateCompany.do", produces = "application/json;charset=utf-8")
	public void updateCompany(ProductCompany company) {
		sv.updateCompany(company);
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
	public String giftDetail(Model model, int productNo, @SessionAttribute(required = false) Member m) {
		Product product = sv.getOneProduct(productNo);
		product.setImages(sv.getAllProductImage(productNo));
		product.setProductOptions(sv.getProductOptions(productNo));
		product.setTotalOrder(sv.getProductTotalOrder(productNo));
		if(m != null && sv.getOneProductLike(productNo, m.getMemberNo()) != null) product.setProductLikeStatus(true);
		else product.setProductLikeStatus(false);
		product.setProductLikeCount(sv.getProductLikeCount(productNo));
		model.addAttribute("p",product);
		
		return "gift/giftDetail";
	}
	
	@RequestMapping(value = "/adminGiftDetail.do")
	public String adminGiftDetail(Model model, int productNo) {
		Product p = sv.getOneProduct(productNo);
		p.setImages(sv.getAllProductImage(productNo));
		p.setProductOptions(sv.getProductOptions(productNo));
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
	
	@RequestMapping(value = "/insertOption.do")
	public String insertOption(String[] poName, String[] poPrice, int productNo) {
		ArrayList<ProductOption> options = new ArrayList<ProductOption>();
		for(int i=0; i<poName.length;i++) {
			ProductOption option = new ProductOption();
			option.setPoName(poName[i]);
			option.setPoPrice(Integer.parseInt(poPrice[i]));
			option.setProductNo(productNo);
			options.add(option);
		}
		int result = sv.insertOption(options);
		System.out.println("result : " + result);
		return "redirect:/adminGiftDetail.do?productNo="+productNo;
	}
	@ResponseBody
	@RequestMapping(value = "/deleteOption.do", produces = "application/json;charset=utf-8")
	public String deleteOption(int poNo) {
		int result = sv.deleteOption(poNo);
		return result + "";
	}
	@RequestMapping(value = "/takeOrderSheet.do")
	public String takeOrderSheet(Model model,String[] poNo, String[] orderCount, int productNo, int memberNo) {
		ArrayList<ProductOrderSheet> posList = new ArrayList<ProductOrderSheet>();
//		1. 기존 장바구니에 상품이 이미 존재하면
//		2. 상품 새로 작성하기 전 기존 해당 상품 장바구니 삭제 
		ArrayList<ProductOrderSheet> posOldList = sv.getPosList(memberNo);
		System.out.println("product number : " + productNo);
		for(ProductOrderSheet pos : posOldList) {
			System.out.println(pos);
			if(pos.getOrderNo() == 0 && pos.getProductNo() == productNo) {
				System.out.println("미 결제 상품 (장바구니 상품)");
				sv.deletePos(pos.getPosNo());
			} 
		}
		for(int i=0; i<poNo.length;i++) {
			ProductOrderSheet pos = new ProductOrderSheet();
			pos.setProductNo(productNo);
			pos.setPoNo(Integer.parseInt(poNo[i]));
			pos.setOrderCount(Integer.parseInt(orderCount[i]));
			pos.setMemberNo(memberNo);
			posList.add(pos);
		}
//		배송지 가져오기
		ArrayList<ShippingAddress> sas = sv.getShppingAddress(memberNo);
		for(ShippingAddress sa : sas) {
			String[] split = sa.getAddressPhone().split("-");
			sa.setSplit(split);
		}
//		상품 가져오기
		Product product = sv.getOneProduct(productNo);
		product.setMainImage(sv.getMainImage(productNo));
//		선택한 옵션 설정
		ArrayList<ProductOption> options = sv.getProductOptions(productNo);
//		sv.insertBuyOption(options);
		ArrayList<ProductOption> selectOptions = new ArrayList<ProductOption>();
		for(ProductOption option : options) {
			for(ProductOrderSheet pos : posList) if(option.getPoNo() == pos.getPoNo()) selectOptions.add(option);
		}
		product.setProductOptions(selectOptions);
//		product.setProductOptions();
		int result = sv.insertOrderSheet(posList);
		System.out.println("POSLIST  " + posList);
		System.out.println("result : " + result);
		model.addAttribute("posList", posList);
		model.addAttribute("product", product);
		model.addAttribute("sas", sas);
		return "gift/productOrderSheet";
	}
//	KAKAO PAY
//  RESTAPI
//	private HttpHeaders getHeaders() {
//		HttpHeaders headers = new HttpHeaders();
//		headers.set("Authorization", "KakaoAK 어드민키");
//		headers.set("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
//		
//		return headers;
//	}
//	@ResponseBody
//	@RequestMapping(value = "/giftKakaoPay.do", produces = "application/json;charset=utf-8")
//	public ReadyResponse giftKakaoPay(Order order) {
//		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
//		parameters.add("cid", "TC0ONETIME");
//		parameters.add("partner_order_id", "");
//		parameters.add("partner_user_id", "inflearn");
//		parameters.add("item_name", order.getItemName());
//		parameters.add("quantity", String.valueOf(order.getQuantity()));
//		parameters.add("total_amount", String.valueOf(order.getOrderPrice()));
//		parameters.add("tax_free_amount", "0");
//		parameters.add("approval_url", "http://localhost/successPay.do"); // 결제승인시 넘어갈 url
//		parameters.add("cancel_url", "http://localhost/cancelPay.do"); // 결제취소시 넘어갈 url
//		parameters.add("fail_url", "http://localhost/failPay.do"); // 결제 실패시 넘어갈 url
//		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());
//		// 외부url요청 통로 열기.
//		RestTemplate template = new RestTemplate();
//		String url = "https://kapi.kakao.com/v1/payment/ready";
//        // template으로 값을 보내고 받아온 ReadyResponse값 readyResponse에 저장.
//		ReadyResponse readyResponse = template.postForObject(url, requestEntity, ReadyResponse.class);
//        // 받아온 값 return
//		return readyResponse;
//	}
	@ResponseBody
	@RequestMapping(value = "/giftKakaoPay.do", produces = "application/json;charset=utf-8")
	public String giftKakaoPay(Model model, Order order) {
		try {
			// 1. 요청 URL 생성
			URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
			// 2. ULR connection 생성
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			// 3. KAKAO에서 권장하는 connection setting
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Authorization", "KakaoAK a9a0e196e56179a0efb5b33261aedcea");
			connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			// 4. connection을 통해 매개변 전달을 위해 output이 있음을 설정
			connection.setDoOutput(true);
			// 5. 해당 요청개체 생성 매개변수 생성
			String param = "cid=TC0ONETIME&partner_order_id="+order.getMemberId()+URLEncoder.encode(order.getItemName(),"utf-8")+"&partner_user_id=movieIslandGift&item_name="+URLEncoder.encode(order.getItemName(),"utf-8")+"&quantity="+order.getQuantity()+"&total_amount="+order.getOrderPrice()+"&tax_free_amount=0&approval_url=http://192.168.10.32/successPay.do&fail_url=http://192.168.10.32/failPay.do&cancel_url=http://192.168.10.32/cancelPay.do&item_code=";
			// 6. 작성한 매개변수 전송객체 생성
			OutputStream outputStream = connection.getOutputStream();
			BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(outputStream);
			DataOutputStream dataOutputStream = new DataOutputStream(bufferedOutputStream);
			// 7. 매개변수를 바이트배열로 변환 후 전송 후 전송객체 소멸
			dataOutputStream.writeBytes(param);
			dataOutputStream.flush();
			dataOutputStream.close();
			// 8. 실제 서버 통신 후 결과 입력받기
			int result = connection.getResponseCode();
			// 9. 결과 입력받은 내용 출력
			InputStream inputStream;
			// HTTP 통신결과가 200이면 뭐다?
			if (result == 200) {
				inputStream = connection.getInputStream();
			} else {
				inputStream = connection.getErrorStream();
			}
			// 받은 결과를 읽어오기
			InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");
			BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
			String data = bufferedReader.readLine();
			//JSON 형식 문자열을 객체에 담아줌
			ObjectMapper objectMapper = new ObjectMapper();
			ReadyResponse readyResponse = objectMapper.readValue(data, ReadyResponse.class);
			model.addAttribute("order", order);
			model.addAttribute("tid", readyResponse.getTid());
			return data;
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/failPay.do";
	}
	@RequestMapping(value = "/successPay.do")
	public String successPay(@RequestParam("pg_token") String pgToken, @ModelAttribute("tid") String tid, @ModelAttribute("order") Order order,  Model model) {
//		System.out.println("success pay gift");
//		System.out.println("pgToken : " + pgToken);
//		System.out.println("tid : " + tid);
		System.out.println("order : " + order);
		try {
			// 1. 요청 URL 생성
			URL url = new URL("https://kapi.kakao.com/v1/payment/approve");
			// 2. ULR connection 생성
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			// 3. KAKAO에서 권장하는 connection setting
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Authorization", "KakaoAK a9a0e196e56179a0efb5b33261aedcea");
			connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			// 4. connection을 통해 개체 전달을 위해 output이 있음을 설정
			connection.setDoOutput(true);
			// 5. 해당 요청개체 생성 매개변수 생성
			String param = "cid=TC0ONETIME&tid="+tid+"&partner_order_id="+order.getMemberId()+URLEncoder.encode(order.getItemName(),"utf-8")+"&partner_user_id=movieIslandGift&pg_token="+pgToken;
			OutputStream outputStream = connection.getOutputStream();
			BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(outputStream);
			DataOutputStream dataOutputStream = new DataOutputStream(bufferedOutputStream);
			// 7. 매개변수를 바이트배열로 변환 후 전송 후 전송객체 소멸
			dataOutputStream.writeBytes(param);
			dataOutputStream.flush();
			dataOutputStream.close();
			// 8. 실제 서버 통신 후 결과 입력받기
			int result = connection.getResponseCode();
			// 9. 결과 입력받은 내용 출력
			InputStream inputStream;
			if (result == 200) {
				inputStream = connection.getInputStream();
			} else {
				inputStream = connection.getErrorStream();
			}
			// 받은 결과를 읽어오기
			InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");
			BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
			String data = bufferedReader.readLine();
			ObjectMapper objectMapper = new ObjectMapper();
			ApproveResponse approveResponse = objectMapper.readValue(data, ApproveResponse.class);
			System.out.println(approveResponse);
			model.addAttribute("data", data);
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "gift/giftPaysuccess";
	}
	@RequestMapping(value = "/failPay.do")
	public String failPay() {
		System.out.println("failed pay gift");
		return "gift/giftPayFail";
	}
	@RequestMapping(value = "/cancelPay.do")
	public String cancelPay() {
		System.out.println("canceled pay gift");
		return "gift/giftPayCancel";
	}

	@ResponseBody
	@RequestMapping(value = "/addAddress.do")
	public String insertAddress(ShippingAddress sa) {
		int result = sv.insertAddress(sa);
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/getOneAddress.do", produces = "application/json;charset=utf-8")
	public String getOneAddress(int saNo) {
		ShippingAddress sa = sv.getOneAddress(saNo);
		if(sa != null) {
			Gson gson = new Gson();
			String result = gson.toJson(sa);
			return result;
		} else {
			return "fail";
		}
	}
	@RequestMapping(value = "/order.do")
	public String order(Model model, Order order, GiftPay giftPay, Receive receive, String payData, String[] posNo) {
		System.out.println("order : "+order);
		System.out.println("giftPay : " + giftPay);
		System.out.println("receive : " + receive);
		//data 문자열 깨지는거 수정해야함 강사님 도와주세요!
		System.out.println("payData : " + payData);
		int result = sv.insertOrder(order);
		//order insert하고나서 orderNo 삽입까지 마침
		if(result == 1) {
			giftPay.setOrderNo(order.getOrderNo());
			result = result + sv.insertGiftPay(giftPay);
			switch (giftPay.getPayMethod()) {
			case "kakaoPay":
				ObjectMapper objectMapper = new ObjectMapper();
				KakaoPay kakaoPay = null;
				try {
					kakaoPay = objectMapper.readValue(payData, KakaoPay.class);
					kakaoPay.setGpNo(giftPay.getGpNo());
				} catch (JsonMappingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (JsonProcessingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.println(kakaoPay);
				result = result + sv.insertKakaoPay(kakaoPay);
				
				break;
			default:
				break;
			}
		} else System.out.println("order insert fail");
		if(result == 3) {
			receive.setOrderNo(order.getOrderNo());
			receive.setReceiverPhone(receive.getPhone0() + "-" + receive.getPhone1() + "-" + receive.getPhone2());
			result = result + sv.insertReceive(receive);
		} else System.out.println("giftPay insert fail");
		if(result == 4) {
			ArrayList<ProductOrderSheet> poss = new ArrayList<ProductOrderSheet>();
			for(String pn : posNo) {
				ProductOrderSheet newPos = new ProductOrderSheet();
				newPos.setPosNo(Integer.parseInt(pn));
				newPos.setOrderNo(order.getOrderNo());
				poss.add(newPos);
			}
			System.out.println(poss);
			result = result + sv.setOrderNo(poss);
		}
		//배송
		return "gift/completePayment";
	}

	@ResponseBody
	@RequestMapping(value = "/selectOneProductLike.do")
	public String selectOneProductLike(ProductLike like) {
		ProductLike pl = sv.getOneProductLike(like);
		if(pl == null) return "false";
		else return "true";
	}
	@ResponseBody
	@RequestMapping(value = "/likeProduct.do")
	public String likeProduct(ProductLike like) {
		int result = sv.likeProduct(like);
		if(result > 0) return "success";
		else return "fail";
	}
	@ResponseBody
	@RequestMapping(value = "/disLikeProduct.do")
	public String disLikeProduct(ProductLike like) {
		int result = sv.disLikeProduct(like);
		if(result > 0) return "success";
		else return "fail";
	}

	@RequestMapping(value = "/cart.do")
	public String cart(Model model, @SessionAttribute(required = false) Member m) {
		//작업 후 맴버번호 수
		ArrayList<ProductOrderSheet> posList = sv.getPosList(m.getMemberNo());
		for(ProductOrderSheet pos : posList) {
			Product p = sv.getPosProduct(pos.getProductNo());
			p.setMainImage(sv.getMainImage(pos.getProductNo()));
			ProductOption po = sv.getPosOption(pos.getPoNo());
			System.out.println(p + " : product");
			pos.setProduct(p);
			pos.setProductOption(po);
		}
		model.addAttribute("posList", posList);
		return "gift/myCart";
	}
	

	@RequestMapping(value = "/allAboutGift.do")
	public String allAboutGift(Model model, @SessionAttribute(required = false) Member m) {
		//상품을 최신순으로 가져옴
		ArrayList<Product> pList = sv.getAllProduct();
		ArrayList<Product> fpList = new ArrayList<Product>();
		for(Product p : pList) {
			// status !=1 (상품 상태가 판매중이 아닌 -> status가 1이 아닌 p 객체를 rList에서 삭제함)
			if(p.getProductStatus() != 1) pList.remove(p);
			p.setMainImage(sv.getMainImage(p.getProductNo()));
			p.setProductLikeCount(sv.getProductLikeCount(p.getProductNo()));
			if(m != null && sv.getOneProductLike(p.getProductNo(), m.getMemberNo()) != null) p.setProductLikeStatus(true);
			else p.setProductLikeStatus(false);
			p.setTotalOrder(sv.getProductTotalOrder(p.getProductNo()));
		}
		//깊은복사
		fpList.addAll(pList);
		Comparator<Product> comparator = new Comparator<Product>() {
            @Override
            public int compare(Product o1, Product o2) {
                return o2.getTotalOrder() - o1.getTotalOrder();
            }
        };
        fpList.sort(comparator);
		model.addAttribute("pList", pList);
		model.addAttribute("fpList", fpList);
		
		return "gift/allAboutGift";
	}
	
	@ResponseBody
	@RequestMapping(value = "/deletePos.do")
	public String cart(int posNo) {
		int result = sv.deletePos(posNo);
		if(result > 0) return "success";
		else return "fail"; 
		
	}
} 






































