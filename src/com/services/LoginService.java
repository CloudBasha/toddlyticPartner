package com.services;

import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestBody;


import com.model.CmsUser;


public interface LoginService {

	Map<String, Object> doLogin(Map<String, Object> requestParams);
	
	
	
}

