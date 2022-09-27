package com.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.exception.AdminLoginNoException;
@Controller
public class BaseController {
	/**
	 * ��¼Ȩ�޿��ƣ�������ִ��ǰִ�и÷���
	 * @throws AdminLoginNoException 
	 */
	@ModelAttribute  
    public void isLogin(HttpSession session, HttpServletRequest request) throws AdminLoginNoException {      
       if(session.getAttribute("auser") == null||session.getAttribute("admin") == null){  
            throw new AdminLoginNoException("û�е�¼");
       }  
    } 
}
