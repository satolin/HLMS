package com.service.house;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.dao.AdminHouseDao;
import com.dao.HouseDao;
import com.domain.House;

@Service("adminHouseService")
@Transactional
public class AdminHouseServiceImpl implements AdminHouseService{
	@Autowired
	private HouseDao houseDao;
	@Autowired
	private AdminHouseDao adminHouseDao;

	@Override
	public String toAddHouse(Model model) {
		model.addAttribute("houseinfo", houseDao.houseinfo());
		return "admin/addHouse";
	}
	
	@Override
	public String addHouse(House house, Model model, HttpSession session) {
		if(houseDao.addHouse(house)>0)
			model.addAttribute("msg", "锟斤拷映晒锟斤拷锟�");
		//锟斤拷臃锟皆�
		session.setAttribute("houseinfo", houseDao.houseinfo());
		return "forward:/admin/toAddHouse";
	}

	@Override
	public String updateHouse(House house, Model model, HttpSession session) {
		if(houseDao.modifyHouse(house)>0) {
			List<House> temp = houseDao.houseinfo();
			model.addAttribute("houseinfo",temp);
			String msg = "鎴愬姛";
			model.addAttribute("msg", msg);
			return "showAll";
		}
		session.setAttribute("allHouses", houseDao.houseinfo());
		return "adminMain";
	}

	/**
	 * 锟斤拷询一锟斤拷锟斤拷锟斤拷
	 */
	@Override
	public String selectAHouse(Model model, @ModelAttribute House house, HttpSession session) {
		int id = house.getHouse_id();
		if(houseDao.selectHouseById(id)!=null) {
			House house1 = houseDao.selectHouseById(id);
			List<House> temp = new ArrayList<House>();
			temp.add(house1);
			model.addAttribute("houseinfo", temp);
			return "selectahouse";
		}
		else {
			model.addAttribute("houseinfo",houseDao.houseinfo());
			return "showAll";
		}
	}
	/**
	 * 锟斤拷询锟斤拷锟斤拷
	 */
	@Override
	public String selectHouses(Model model, @ModelAttribute House house, HttpSession session) {
		String uname = house.getUser_name();
		String cost = house.getCost();
		if(uname!=null && adminHouseDao.selectHouseByUname(uname).size()>0) {
			List<House> temp = adminHouseDao.selectHouseByUname(uname);
			model.addAttribute("houseinfo", temp);
			return "selecthouses";
		}else if(cost!=null && adminHouseDao.selectHouseByCost(cost).size()>0) {
			List<House> temp = adminHouseDao.selectHouseByCost(cost);
			model.addAttribute("houseinfo", temp);
			return "selecthouses";
		}
		model.addAttribute("houseinfo",adminHouseDao.houseinfo());
		return "showAll";
	}
	/**
	 * 删锟斤拷一锟斤拷锟斤拷品
	 */
	@Override
	public String deleteAHouse(House house, Model model) {
		System.out.println("This is AdminHouseServicesImpl");
		if(houseDao.selectHouseById(house.getHouse_id())==null) {
			model.addAttribute("msg", "璇ュ簭鍙蜂笉瀛樺湪锛�");
			return "forward:/adminHouse/selectHouse?act=deleteSelect";
		}
		System.out.println("閫氳繃if锛侊紒锛侊紒锛�");
		int t = adminHouseDao.deleteAHouse(house.getHouse_id());
		System.out.println("************"+t+"*************");
		System.out.println("閫氳繃delete鍑芥暟锛侊紒锛侊紒锛�");
		model.addAttribute("houseinfo",houseDao.houseinfo());
		model.addAttribute("msg", "鍒犻櫎鎴愬姛锛�");
		return "showAll";
	}
	
	@Override
	public String houseInfo(Model model) {
		if(houseDao.houseinfo()!=null && houseDao.houseinfo().size()>0) {
			List<House> temp = houseDao.houseinfo();
			model.addAttribute("houseinfo",temp);
			return "showAll";
		}
		
		return "adminMain";
	}
}

