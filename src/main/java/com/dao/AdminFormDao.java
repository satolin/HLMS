package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.domain.Form;

@Repository("adminFormDao")
@Mapper
public interface AdminFormDao {
//admin特有的操作
	public int updateForm(Form formInfo);
	public int deleteAForm(int id);
	public int deleteForms(List<Integer> ids);
	public List<Form> selectAllForms();
	public List<Form> selectFormByDay(Form form);
	public List<Form> selectFormByMonth(Form form);
}
