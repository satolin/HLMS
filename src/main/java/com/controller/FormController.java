package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.service.form.FormService;
import com.domain.Form;
import com.domain.User;

@Controller
@RequestMapping("/user")
public class FormController {
	@Autowired
	private FormService formService;
	public List<Form> formAll;
	public Form form;
	public User user;
	
	@RequestMapping("/toAddUserForm")
	public String toAddUserForm() {
		return "/user/userAddForm";
	}
	
	/**
	 * 添加一个合同
	 */
	@RequestMapping("/addForm")
	public String addForm(HttpServletRequest request){
		form=new Form();
		form.setId((int)(1+Math.random()*(1000-1+1)));
		form.setHouse_id(Integer.parseInt(request.getParameter("house_id")));
		form.setUser_id(Integer.parseInt(request.getParameter("user_id")));
		form.setUser_phone(request.getParameter("user_phone"));
		form.setPrice(request.getParameter("price"));
		form.setDate(request.getParameter("date"));
		System.out.println(form.getHouse_id());
		System.out.println(form.getUser_id());
		System.out.println(form.getUser_phone());
		System.out.println(form.getPrice());
		System.out.println(form.getDate());
		formService.addForm(form);
		ModelAndView mv = new ModelAndView();
		mv.addObject("addFormSuccess","addFormSuccess");
		formAll=formService.selectForm(Integer.parseInt(request.getParameter("user_id")));
		mv.addObject("formAll",formAll);
		return "forward:toFormAll";
	}
	
	/**
	 * 显示自己的合同
	 */
	@RequestMapping("/toFormAll")
	public ModelAndView toFormAll(HttpServletRequest request){
		formAll=formService.selectForm(Integer.parseInt(request.getParameter("user_id")));
		System.out.println("return controller!!!!");
		ModelAndView mv =new ModelAndView();
		System.out.println("userFormAll");
		System.out.println("--------------------------");
		mv.setViewName("user/formAll");
		mv.addObject("formAll",formAll);
		return mv;
	}
	
	/**
	 * 修改合同
	 */
	@RequestMapping("/toUpdateAppointedForm")
	public ModelAndView ToUpdateAppointedForm(HttpServletRequest request) {
		System.out.println("in control");
		String formId = request.getParameter("id");
		form=new Form();
		form = formService.selectFormById(Integer.parseInt(formId));
		System.out.println("return control");
		ModelAndView mv =new ModelAndView();
		mv.setViewName("/user/userUpdateAppointedForm");
		mv.addObject("userAppointedForm",form);
		return mv;
	}
	
	@RequestMapping("/updateFormInfo")
	public String ToUpdateFormInfo(HttpServletRequest request) {
		form=new Form();
		form.setId(Integer.parseInt(request.getParameter("id")));
		form.setHouse_id(Integer.parseInt(request.getParameter("house_id")));
		form.setUser_id(Integer.parseInt(request.getParameter("user_id")));
		form.setUser_phone(request.getParameter("user_phone"));
		form.setPrice(request.getParameter("price"));
		form.setDate(request.getParameter("date"));
		formService.updateForm(form);
		ModelAndView mv =new ModelAndView();
		mv.addObject("updateFormSuccess","updateFormSuccess");
		formAll=formService.selectForm(Integer.parseInt(request.getParameter("user_id")));
		mv.addObject("formAll",formAll);
		return "forward:toFormAll";
	}
	
	/**
	 * 删除合同
	 */
	@RequestMapping("/deleteForm")
	public String DeleteHouse(HttpServletRequest request) {
		System.out.println("get deleteForm!!!!!");
		System.out.println(request.getParameter("id"));
		String formId = request.getParameter("id");
		formService.deleteForm(Integer.parseInt(formId));
		System.out.println("return control");
		ModelAndView mv =new ModelAndView();
		mv.addObject("deleteFormSuccess","deleteFormSuccess");
		formAll=formService.selectForm(Integer.parseInt(request.getParameter("user_id")));
		mv.addObject("formAll",formAll);
		return "forward:toFormAll";
	}
}
