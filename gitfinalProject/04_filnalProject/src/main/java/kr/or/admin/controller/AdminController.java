package kr.or.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.admin.model.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	private AdminService service;
}
