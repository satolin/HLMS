package com.service.house;

import javax.servlet.http.HttpSession;
import org.springframework.ui.Model;
import com.domain.House;

public interface AdminHouseService {
	public String addHouse(House house,Model model,HttpSession session);
	public String toAddHouse(Model model);
	public String updateHouse(House house,Model model,HttpSession session);
	public String selectAHouse(Model model, House house, HttpSession session);
	public String selectHouses(Model model,  House house, HttpSession session);
	public String deleteAHouse(House house, Model model);
	public String houseInfo(Model model);
}