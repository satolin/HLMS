package com.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.domain.User;
import com.service.user.RegisterService;

@Controller
public class RegisterController {
	@Autowired
	private RegisterService registerService;
	
	@RequestMapping("toRegister")
	public String toRegister() {
		System.out.println("success in turning to loginPage");
		return "user/register";
	}
	
	@RequestMapping("/user/register")
	public ModelAndView Register(HttpServletRequest request) {
		System.out.println("in Control");
		User user = new User();
		user.setUname(request.getParameter("uname"));
		user.setPassed(request.getParameter("password"));
		user.setAge(request.getParameter("age"));
		user.setPhone(request.getParameter("phone"));
		ModelAndView mv = new ModelAndView();
		User user2 = new User();
		user2=null;
		user2=registerService.searchByRUname(user);
		if(user2!=null) {
			mv.setViewName("user/register");
			mv.addObject("fail","���û����Ѵ��ڣ�");
			return mv;
		}
		else {
			registerService.registe(user);
			mv.setViewName("user/login");
			mv.addObject("successful","ע��ɹ���");
			return mv;
		}
		
		//uname2=	registerService.searchByUname(user).getUname();
		//System.out.println("return Control");
		//if(uname2!=null) {
		//	registerService.registe(user);
		//	return "toLogin";
		//}else {
		//	return "register" ;
		//}
	}
}
