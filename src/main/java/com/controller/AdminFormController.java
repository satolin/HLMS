package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.domain.Form;
import com.domain.User;
import com.service.form.AdminFormService;

@Controller
public class AdminFormController {
	@Autowired
	private AdminFormService adminFormService;
	public List<Form> formAll;
	public Form form;
	public User user;
	
	@RequestMapping("/toAdminFormAll")
	public String toFormAll(Model model){
		System.out.println("get service!!!!!!");
		return adminFormService.formInfo(model);
	}
	
	@RequestMapping("/selectByDay")
	public String selectFormByDay(@RequestParam(value="month")String month,@RequestParam(value="day")String day,Model model){
		System.out.println(month);
		System.out.println(day);
		if(day.compareTo("0")==0) {
			String date = month;
			return adminFormService.selectFormByMonth(date,model);
		}
		String date = "2021-"+month+"-"+day;
		System.out.println(date);
		return adminFormService.selectFormByDay(date,model);
	}
}