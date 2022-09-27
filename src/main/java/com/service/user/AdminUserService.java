package com.service.user;

import org.springframework.ui.Model;

import com.domain.User;

public interface AdminUserService {
	public String userinfo(Model model);
	public String selectusers(Model model,User user);
	public String selectvips(Model model);
}
