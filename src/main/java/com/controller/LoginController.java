package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.domain.User;
import com.service.user.LoginService;
import com.service.user.RegisterService;

import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
	@Autowired
	private LoginService loginService;

	@Autowired
	private RegisterService registerService;
	
	@RequestMapping("/toLogin")
	public String toLogin() {
		System.out.println("success in turning to loginPage");
		return "login";
	}
	@RequestMapping("/login")	
		public ModelAndView login(String uname, String passwd,HttpSession session) {
		String right;
		User user=new User();
		//user.setUname(uname);
		user.setUname(uname);
		user.setPassed(passwd);
		ModelAndView mv = new ModelAndView();
		User u = loginService.login(user);
		mv.addObject("userinfo",u);
		session.setAttribute("user", u);
		right=u.getPower();
		if(Integer.parseInt(right)==1) {
			mv.setViewName("admin/adminMain");
			
			return mv;
		}else {
			mv.setViewName("user/userMain");
			return mv;
		}
		
		

	}
	@RequestMapping("/exit")
	public String exit(@ModelAttribute User user,HttpSession session) {
		session.invalidate();
		return "admin/login";
	}
	@RequestMapping("/user/toLogin")
	public String toUserLogin() {
		System.out.println("success in turning to loginPage");
		return "/user/login";
	}
	@RequestMapping("/user/loginToUserMain")
	public ModelAndView loginToUserMain(HttpServletRequest request) {
		System.out.println("arrive at controller");
		User user=new User();
		user.setUname(request.getParameter("uname"));
		user.setPassed(request.getParameter("passwd"));
		ModelAndView mv = new ModelAndView();
		User user2 = new User();
		user2=null;
		System.out.println("*********************111**********************");
		user2=registerService.searchByRUname(user);
		System.out.println("*********************222**********************");
		String password2=user2.getPasswd();
		password2=password2.trim();
		String password3=request.getParameter("passwd");
		password3=password3.trim();
		System.out.println("getParamete"+request.getParameter("passwd"));
		System.out.println("password2"+password2);
		if(password2.equals(password3)) {
			User u = loginService.login(user);
			mv.setViewName("user/userMain");
			mv.addObject("yes","锟斤拷陆锟缴癸拷锟斤拷");
			mv.addObject("userInfo",u);
			return mv;
			
			
		}else {
			mv.setViewName("user/login");
			mv.addObject("hasbeen","锟斤拷锟斤拷锟斤拷锟�");
			return mv;
		}
	}
	@RequestMapping("/upload")
	public String upload() {
		return "register";
	}
	@RequestMapping("/user/loginToUserMain1")
	public ModelAndView loginToUserMain(/*String uname, String passwd*/) {
		/*String right;
		System.out.println("arrive at controller");
		User user=new User();
		//user.setUname(uname);
		user.setUname(uname);
		user.setPassed(passwd);
		ModelAndView mv = new ModelAndView();
//		mv.setViewName("toLogin");
//		mv.addObject("userInfo",user);
		System.out.println("Username:::"+uname);
		System.out.println("Password:::"+passwd);
		System.out.println("login service");
		User u = loginService.login(user);
		if(u!=null) {
			System.out.println("yes!!!!!!!!!!!!");
		}else {
			System.out.println("no!!!!!!!!!!!!");
		}
		System.out.println("return to controller");
//		System.out.println(u);
		right=u.getPower();
		System.out.println(right);
     	mv.addObject("userInfo",u);
     	*/
//		System.out.println(u);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/userMain");
		return mv;
		
		
	}
}
