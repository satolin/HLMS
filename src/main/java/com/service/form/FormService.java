package com.service.form;

import java.util.List;

import com.domain.Form;

public interface FormService {
	//用户只能增和查询自己的合同
	public void addForm(Form form);
	public void updateForm(Form form);
	public void deleteForm(int form_id);
	public List<Form> selectForm(int user_id);
	public Form selectFormById(int form_id);
}