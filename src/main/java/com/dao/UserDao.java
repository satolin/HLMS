package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.domain.House;
import com.domain.User;

@Repository("userDao")
@Mapper
public interface UserDao {
	public User login(User user);
	public List<User> userinfo();
	public int registe(User user);
	public User searchByUser_Id(String user_id);
	public List<User> searchByUname(String uname);
	public User searchByRUname(User user);
	public void updateUserInformation(User user);
	public void addHouseInfo(House house);
}
