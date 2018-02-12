package com.security;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;



public class CustomAuthenticationEntryPoint implements AuthenticationEntryPoint {

	
	
	  public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException authException)
	      throws IOException, ServletException {
		  response.setContentType("application/json");
		  JSONObject jsonObject = new JSONObject();
		  jsonObject.put("status", "FAILED");
		  jsonObject.put("remark", "You need to authenticate");
		  response.getWriter().write(jsonObject.toJSONString());
	  }
	}


