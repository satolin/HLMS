package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.service.user.UserBaseService;
import com.domain.House;
import com.domain.User;
@Controller
@RequestMapping("/user")
public class UserBaseController {
	@Autowired
	private UserBaseService userBaseService;
	public List<House> houseAll;
	public House house;
	@RequestMapping("/toHouseAll")
	public ModelAndView toHouseAll() {
		houseAll = userBaseService.houseinfo();
		ModelAndView mv =new ModelAndView();
		System.out.println(houseAll);
		System.out.println("--------------------------");
		mv.setViewName("/user/houseAll");
		mv.addObject("houseAll",houseAll);
		return mv;
	}
	
	@RequestMapping("/toUserDeleteHouse")
	public ModelAndView toUserDeleteHouse(HttpServletRequest request) {
		houseAll =userBaseService.selectHouseByUname(request.getParameter("user_uname"));
		System.out.println(request.getParameter("user_uname"));
		ModelAndView mv =new ModelAndView();
		mv.setViewName("/user/userDeleteHouse");
		mv.addObject("userSelectHouse",houseAll);
		return mv;
		
	}
	
	@RequestMapping("/toUserInsertHouse")
	public String toUserInsertHouse() {
		return "/user/userInsertHouse";
	}
	
	@RequestMapping("/toUserSelectHouse")
	public ModelAndView toUserSelectHouse(HttpServletRequest request) {
		houseAll =userBaseService.selectHouseByUname(request.getParameter("user_uname"));
		System.out.println(request.getParameter("user_uname"));
		ModelAndView mv =new ModelAndView();
		mv.setViewName("/user/userSelectHouse");
		mv.addObject("userSelectHouse",houseAll);
		return mv;
		
	}
	
	@RequestMapping("/toUserUpdateHouse")
	public ModelAndView toUserUpdateHouse(HttpServletRequest request) {
		houseAll =userBaseService.selectHouseByUname(request.getParameter("user_uname"));
		System.out.println(request.getParameter("user_uname"));
		ModelAndView mv =new ModelAndView();
		mv.setViewName("/user/userUpdateHouse");
		mv.addObject("userSelectHouse",houseAll);
		return mv;
	}
	
	@RequestMapping("/toUserUpdateInformation")
	public String toUserUpdateInformation() {
		return "/user/userUpdateInformation";
	}
	
	@RequestMapping("/toUserMain")
	public String toUserMain() {
		return "/user/userMain";
	}
	
	@RequestMapping("/InsertHouseInfo")
		public String InsertHouseInfo(HttpServletRequest request) {
		house=new House();
		house.setHouse_id((int)(1+Math.random()*(1000-1+1)));
		house.setAddr(request.getParameter("addr"));
		house.setUser_name(request.getParameter("user_name"));
		house.setArea(request.getParameter("area"));
		house.setDirec(request.getParameter("direc"));
		house.setPhone(request.getParameter("phone"));
		house.setCost(request.getParameter("cost"));
		house.setStatus(request.getParameter("status"));
		house.setTime(request.getParameter("time"));
		System.out.println(house.getAddr());
		System.out.println(house.getUser_name());
		System.out.println(house.getArea());
		System.out.println(house.getDirec());
		System.out.println(house.getPhone());
		System.out.println(house.getCost());
		System.out.println(house.getStatus());
		System.out.println(house.getTime());
		System.out.println("---------------------");
		userBaseService.addHouseInfo(house);
		System.out.println("return control");
		return "forward:toUserSelectHouse";
		}
	
	@RequestMapping("/deleteHouse")
	public String DeleteHouse(HttpServletRequest request) {
		String houseId = request.getParameter("id");
		userBaseService.deleteHouse(houseId);
		System.out.println("return control");
		return "forward:toUserSelectHouse";
	}
	
	@RequestMapping("/toUpdateAppointedHouse")
	public ModelAndView ToUpdateAppointedHouse(HttpServletRequest request) {
		System.out.println("in control");
		String houseId = request.getParameter("id");
		house=new House();
		house = userBaseService.selectHouseById(Integer.parseInt(houseId));
		System.out.println("return control");
		ModelAndView mv =new ModelAndView();
		mv.setViewName("/user/userUpdateAppointedHouse");
		mv.addObject("userAppointedHouse",house);
		return mv;
	}
	
	@RequestMapping("/toUpdateHouseInfo")
	public ModelAndView ToUpdateHouseInfo(HttpServletRequest request) {
		house=new House();
		house.setHouse_id(Integer.parseInt(request.getParameter("house_id")));
		house.setAddr(request.getParameter("addr"));
		house.setUser_name(request.getParameter("user_name"));
		house.setArea(request.getParameter("area"));
		house.setDirec(request.getParameter("direc"));
		house.setPhone(request.getParameter("phone"));
		house.setCost(request.getParameter("cost"));
		house.setStatus(request.getParameter("status"));
		house.setTime(request.getParameter("time"));
		
		userBaseService.modifyHouse(house);
		System.out.println("return control");
	
		houseAll =userBaseService.selectHouseByUname(house.getUser_name());
		System.out.println(request.getParameter("user_uname"));
		ModelAndView mv =new ModelAndView();
		mv.setViewName("/user/userUpdateHouse");
		mv.addObject("userSelectHouse",houseAll);
		return mv;
	}
	
	@RequestMapping("/toUpdateInformation")
	public ModelAndView ToUpdateInformation(HttpServletRequest request) {
		System.out.println("in control");
		String userId = request.getParameter("user_uname");
		System.out.println(userId);
		User user = new User();
		user = userBaseService.searchByUser_Id(userId);
		System.out.println("return control");
		ModelAndView mv =new ModelAndView();
		mv.setViewName("/user/userUpdateInformation");
		mv.addObject("userInformation",user);
		System.out.println(user.getPasswd());
		System.out.println(user.getAge());
		return mv;
	}
	
	@RequestMapping("/toUpdateUserInfo")
	public String ToUpdateUserInfo(HttpServletRequest request) {		
		User user = new User();
		user.setUser_id(Integer.parseInt(request.getParameter("user_id")));
		user.setUname(request.getParameter("uname"));
		user.setPassed(request.getParameter("passwd"));
		user.setAge(request.getParameter("age"));
		user.setPhone(request.getParameter("phone"));
		user.setPower("2");		
		userBaseService.updateUserInformation(user);
		return "forward:toUserSelectHouse";
	}
	
	@RequestMapping("/toTourist")
	public ModelAndView TOTourist() {
	houseAll = userBaseService.houseinfo();
	ModelAndView mv =new ModelAndView();
	System.out.println(houseAll);
	System.out.println("--------------------------");
	mv.setViewName("/user/Tourist");
	mv.addObject("houseAll",houseAll);
	return mv;
	}
}
