package com.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

public class NoRedirectLogoutSuccessHandler implements LogoutSuccessHandler
{
    @Override
    public void onLogoutSuccess(HttpServletRequest request,
            HttpServletResponse response, Authentication authentication)
            throws IOException, ServletException
    {
    		response.setContentType("application/json");
		  JSONObject jsonObject = new JSONObject();
		  jsonObject.put("status", "success");
		  jsonObject.put("remark", "You need to authenticate");
		  response.getWriter().write(jsonObject.toJSONString());
    }
}
