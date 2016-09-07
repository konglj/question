package com.bolion.question.mapper;

import java.util.List;
import java.util.Map;

import com.bolion.question.bean.Setting;

public interface SettingMapper {
	
	public Setting getSettingByKey(String key);
	
	public List<Map> getSettings();

}
