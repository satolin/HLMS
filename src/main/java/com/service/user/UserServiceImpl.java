package com.service.user;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.dao.UserDao;
import com.domain.User;
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDao userDao;
	@Override
	public String login(User user, Model model) {
		if(userDao.login(user)!=null) {
			if(user.getPower()=="0"||user.getPower()=="1")
				return "admin/main";
			else if(user.getPower()=="2")
				return "user/main";
			else if(user.getPower()=="3")
				return "visitor/main";
		}
		else {
			model.addAttribute("msg", "用户名或密码错误！");
			return "admin/login";
		}
		return null;
	}
}
