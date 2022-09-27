package com.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.dao.AdminUserDao;
import com.dao.UserDao;
import com.domain.User;

@Service("adminUserService")
@Transactional
public class AdminUserServiceImpl implements AdminUserService {
	@Autowired
	private UserDao userDao;
	@Autowired
	private AdminUserDao adminUserDao;

	@Override
	public String userinfo(Model model) {
		if(userDao.userinfo()!=null && userDao.userinfo().size()>0) {
				List<User> temp = userDao.userinfo();
				model.addAttribute("userinfo",temp);
				return "admin/showAllUsers";
			}
			return "userMain";
		}

	@Override
	public String selectusers(Model model, User user) {
		String uname = user.getUname();
		if(uname!=null && userDao.searchByUname(uname).size()>0) {
			List<User> temp = userDao.searchByUname(uname);
			model.addAttribute("userinfo", temp);
			return "admin/showAllUsers";
		}
		model.addAttribute("userinfo",userDao.userinfo());
		return "userMain";
	}

	@Override
	public String selectvips(Model model) {
			List<User> temp = adminUserDao.searchVips();
			model.addAttribute("userinfo", temp);
			return "admin/showAllUsers";
	}
}
