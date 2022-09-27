package com.service.form;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.dao.FormDao;
import com.domain.Form;

@Service("adminFormService")
@Transactional
public class AdminFormServiceImpl implements AdminFormService{
	@Autowired
	private FormDao formDao;
	
	public String formInfo(Model model) {
		if(formDao.formInfo()!=null && formDao.formInfo().size()>0) {
			List<Form> temp = formDao.formInfo();
			model.addAttribute("forminfo",temp);
			return "showAllForm";
		}
		return "admin/adminMain";
	}
	
	@Override
	public String selectFormByDay(String date, Model model) {
		System.out.println("这是服务实现函数中");
		Form form = new Form();
		form.setDate(date);
		if(formDao.selectFormByDay(form)!=null && formDao.selectFormByDay(form).size()>0) {
			List<Form> temp = formDao.selectFormByDay(form);
			model.addAttribute("forminfo",temp);
			return "showAllForm";
		}
		return "adminMain";
	}

	@Override
	public String selectFormByMonth(String date, Model model) {
		System.out.println("这是服务实现函数中！！！！！！！！！！！！！！！");
		System.out.println(date);
		Form form = new Form();
		form.setDate(date);
		List<Form> temp = formDao.selectFormByMonth(form);
		if(formDao.selectFormByMonth(form)!=null && formDao.selectFormByMonth(form).size()>0) {
			model.addAttribute("forminfo",temp);
			return "showAllForm";
		}
		return "adminMain";
	}
}
