package com.bolion.question.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bolion.question.bean.Setting;
import com.bolion.question.mapper.SettingMapper;
import com.bolion.question.service.SettingService;

@Service
public class SettingServiceImpl implements SettingService {

	@Autowired
	private SettingMapper settingMapper;
	
	@Override
	public Setting getSettingByKey(String key) {
		return settingMapper.getSettingByKey(key);
	}

}
