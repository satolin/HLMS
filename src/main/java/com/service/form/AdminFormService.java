package com.service.form;

import org.springframework.ui.Model;

public interface AdminFormService {
	public String formInfo(Model model);
	public String selectFormByDay(String date,Model model);
	public String selectFormByMonth(String date,Model model);
}
