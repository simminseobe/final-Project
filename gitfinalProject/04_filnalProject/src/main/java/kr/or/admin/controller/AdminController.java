package kr.or.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.admin.model.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	private AdminService service;

	@RequestMapping("/admin.do")
	public String admin() {
		return "admin/admin";
	}
}
