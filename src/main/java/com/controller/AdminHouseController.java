package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.domain.House;
import com.service.house.AdminHouseService;

@Controller
public class AdminHouseController{
	@Autowired
	private AdminHouseService adminHouseService;
	
	@RequestMapping("/selectHouses")
	public String selectGoods(Model model, House house, HttpSession session) {
		return adminHouseService.selectHouses(model, house, session);
	}
	
	/**
	 * 
	 */
	@RequestMapping("/toAddHouse")
	public String toAddHouse(Model model){
		model.addAttribute("house", new House());
		return "admin/addHouse";
	}
	
	/**
	 * 
	 */
	@RequestMapping("/addHouse")
	public String addHouse(House house, Model model, HttpSession session){
		return adminHouseService.addHouse(house, model, session);
	}
	
	/**
	 * 
	 */
	@RequestMapping(value = "/updateHouse",method = RequestMethod.POST)
	public String updateHouse(@ModelAttribute House house, Model model, HttpSession session){
		System.out.println("updateHouse  Controller");
		return adminHouseService.updateHouse(house, model, session);
	}
	
	/**
	 * 
	 */
	@RequestMapping("/selectahouse")
	public String selectAHouse(){
		return "selectahouse";
	}
	
	/**
	 * 
	 */
	@RequestMapping(value = "/selectAHouse", method = RequestMethod.POST)
	public String selectAHouse(Model model, @ModelAttribute House house, HttpSession session){
		System.out.println("This is in selectAHouse");
		System.out.println(house.getHouse_id());
		return adminHouseService.selectAHouse(model, house, session);
	}
	
	/**
	 * 
	 */
	@RequestMapping("/HouseInfos")
	public String selectAllHouse(Model model){
		return adminHouseService.houseInfo(model);
	}
	

	/**
	 * 
	 */
	@RequestMapping("/deleteAHouse")
	public String deleteAHouse(House house, Model model) {
		System.out.println("Delete a House !!!!!!");
		System.out.println(house.getHouse_id());
		return adminHouseService.deleteAHouse(house, model);
	}
	
	@RequestMapping("/process")
	public String toProcessPage() {
		
		return "admin/process";
	}
}
