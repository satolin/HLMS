package com.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.dao.UserDao;
import com.domain.User;

@Service("loginService")
@Transactional
public class LoginServiceImpl implements LoginService {
	@Autowired
	private UserDao userDao;
	@Override
	public User login(User user) {
		System.out.println("arrive at service");
		System.out.println("service user" + user.getUname());
		System.out.println("return to service");
		return userDao.login(user);
		//return user;
	}
}
