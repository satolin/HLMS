package com.service.user;

import org.springframework.ui.Model;

import com.domain.User;

public interface UserService {
	public String login(User user, Model model);
}
