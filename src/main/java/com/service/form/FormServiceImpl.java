package com.service.form;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.FormDao;
import com.domain.Form;

@Service("formService")
@Transactional
public class FormServiceImpl implements FormService{
	@Autowired
	private FormDao formDao;

	@Override
	public void addForm(Form form) {
		System.out.println("get FormService!!!!!!!");
		formDao.addForm(form);
	}

	@Override
	public List<Form> selectForm(int user_id) {
		System.out.println("get FormService!!!!!!!");
		return formDao.selectForm(user_id);
	}

	@Override
	public Form selectFormById(int form_id) {
		return formDao.selectFormById(form_id);
	}

	@Override
	public void updateForm(Form form) {
		formDao.updateForm(form);
	}

	@Override
	public void deleteForm(int form_id) {
		formDao.deleteForm(form_id);
	}
	
}
