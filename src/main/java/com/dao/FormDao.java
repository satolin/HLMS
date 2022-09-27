package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import com.domain.Form;

@Repository("formDao")
@Mapper
public interface FormDao {
	public List<Form> formInfo();
	public int addForm(Form form);
	public int updateForm(Form form);
	public int deleteForm(int form_id);
	public List<Form> selectForm(int user_id);
	public Form selectFormById(int form_id);
	public List<Form> selectFormByDay(Form form);
	public List<Form> selectFormByMonth(Form form);
}
