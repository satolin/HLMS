package com.service.user;

import java.util.List;

import com.domain.House;
import com.domain.User;

public interface UserBaseService {
	public List<House> houseinfo();
	public int addHouse(House house);
	public List<House> selectHouseByUname(String uname);
	public void deleteHouse(String house_id);
	public House selectHouseById(int id);
	public void addHouseInfo(House house);
	public User searchByUser_Id(String user_id);
	public int modifyHouse(House house);
	public void updateUserInformation(User user);
	
}
