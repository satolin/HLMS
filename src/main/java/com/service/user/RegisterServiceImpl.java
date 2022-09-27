package com.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.UserDao;
import com.domain.User;

@Service("registeService")
@Transactional
public class RegisterServiceImpl implements RegisterService{

	@Autowired
	private UserDao userDao;
	
	@Override
	public User searchByRUname(User user) {
		System.out.println("in service1");
		System.out.println(user.getUname());
		System.out.println(user.getPasswd());
		return userDao.searchByRUname(user);
	}

	@Override
	public void registe(User user) {
		System.out.println("in service2");
		 userDao.registe(user);
	}

}
