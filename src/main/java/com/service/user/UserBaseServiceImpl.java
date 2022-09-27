package com.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.HouseDao;
import com.dao.UserDao;
import com.domain.House;
import com.domain.User;

@Service("userBaseService")
@Transactional
public class UserBaseServiceImpl implements UserBaseService {
	@Autowired
	private HouseDao houseDao;

	@Autowired
	private UserDao userDao;
	
	@Override
	public List<House> houseinfo() {
		return houseDao.houseinfo();
	}
	
	@Override
	public void addHouseInfo(House house){
		System.out.println(house.getAddr());
		System.out.println(house.getUser_name());
		System.out.println(house.getArea());
		System.out.println(house.getDirec());
		System.out.println(house.getPhone());
		System.out.println(house.getCost());
		System.out.println(house.getStatus());
		System.out.println(house.getTime());
		System.out.println("---------------------");
		userDao.addHouseInfo(house);
	}
	
	@Override
	public List<House> selectHouseByUname(String uname){
		return houseDao.selectHouseByUname(uname);
	}
	
	@Override
	public void deleteHouse(String house_id) {
		System.out.println("get deleteservice!!!!!!!");
		houseDao.deleteHouse(Integer.parseInt(house_id));
	}
	
	@Override
	public House selectHouseById(int id) {
		return houseDao.selectHouseById(id);
	}

	@Override
	public int addHouse(House house) {
		houseDao.addHouse(house);
		return 0;
	}
		
	@Override
	public User searchByUser_Id(String user_id) {
		return userDao.searchByUser_Id(user_id);
	}

	@Override
	public int modifyHouse(House house) {
		houseDao.modifyHouse(house);
		return 0;
	}

	@Override
	public void updateUserInformation(User user) {
		System.out.println("in service4");
		userDao.updateUserInformation(user);
		
	}
}

