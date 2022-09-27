package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.domain.User;

@Repository("adminUserDao")
@Mapper
public interface AdminUserDao {
//admin���еķ���
//	public int addManager(User user);		power==1ΪManager��0λ��ͨuser
	public int addUser(User user);
	public int modifyUser(User user);
	public int deleteUser(User user);
	public List<User> searchVips();
}
