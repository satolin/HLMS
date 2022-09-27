package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.domain.User;
import com.service.user.AdminUserService;

@Controller
public class AdminUserController {
	@Autowired
	private AdminUserService adminUserService;
	
	/**
	 * 鏌ヨ鎵�鏈夋埧灞嬩俊鎭�
	 */
	@RequestMapping("/UserInfos")
	public String selectAllUser(Model model){
		return adminUserService.userinfo(model);
	}
	
	/**
	 * 鏌ヨ鐢ㄦ埛
	 */
	@RequestMapping("/selectUsers")
	public String selectUsers(Model model,User user){
		return adminUserService.selectusers(model,user);
	}
	
	/**
	 * 澶у鎴�
	 */
	@RequestMapping("/VipInfos")
	public String selectVips(Model model,User user){
		return adminUserService.selectvips(model);
	}
}
