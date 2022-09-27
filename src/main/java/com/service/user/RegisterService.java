package com.service.user;

import com.domain.User;

public interface RegisterService {
	public User searchByRUname(User user);
	public void registe(User user);
}
