package com.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.domain.House;

@Repository("adminHouseDao")
@Mapper
public interface AdminHouseDao {
	public List<House> houseinfo();
	public House selectHouseById(int id);
	public List<House> selectHouseByUname(String uname);
	public List<House> selectHouseByAddr(String addr);
	public List<House> selectHouseByArea(String area);
	public List<House> selectHouseByDirect(String direct);
	public List<House> selectHouseByCost(String cost);
	public List<House> selectHouseByTime(String time);
	public List<House> selectHouseByStatus(String status);
	public List<House> selectAllHousesByPage(Map<String, Object> map);
	public int addHouse(House house);
	public int modifyHouse(House house);
	public int deleteHouses(List<Integer> ids);
	public int deleteAHouse(int id);
}
