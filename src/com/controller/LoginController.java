package com.controller;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;




import com.model.CmsUser;
import com.services.LoginService;
import com.services.PartnerService;


@RestController
public class LoginController {

	@Autowired
	private LoginService loginService;
	
	@Autowired
	private PartnerService partnerService;

	
	@RequestMapping(value = "activation", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> activation(@RequestBody Map<String, Object> requestParams, HttpServletRequest request,
			HttpServletResponse httpServletResponse) throws IllegalAccessException, InvocationTargetException, Exception {
		String email = (String) requestParams.get("email");
		String password = (String) requestParams.get("password");
		CmsUser cmsUser = partnerService.getCmsUserByEmail(email);

		JSONObject responseObject = null;
		if (cmsUser == null) {
			responseObject.put("status", "FAILED");
			responseObject.put("remark", "Email address not found");
		} else {
			if (cmsUser.isEmailVerified()) {
				responseObject.put("status", "FAILED");
				responseObject.put("remark", "Account already activated");
			} else {
				try {
					responseObject = partnerService.activateAccount(cmsUser, password);
					
				} catch (Exception e) {
					responseObject.put("status", "FAILED");
					e.printStackTrace();
				}
			}
		}
		return responseObject;
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public Map<String, Object> login(@RequestBody Map<String, Object> requestParams, HttpServletRequest request,
			HttpServletResponse httpServletResponse) throws IllegalAccessException, InvocationTargetException, Exception {
		Map<String, Object> responseObject = new HashMap<String, Object>();
		try {
			/*httpServletResponse.setHeader("Access-Control-Allow-Origin", "*");
			httpServletResponse.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
			httpServletResponse.setHeader("Access-Control-Max-Age", "3600");
			httpServletResponse.setHeader("Access-Control-Allow-Headers", "x-requested-with");*/
			responseObject = loginService.doLogin(requestParams);
			String loginStatus = (String) responseObject.get("loginStatus");
			if (loginStatus != null && loginStatus.equals("SUCCESS")) {
				String userEmail = (String) requestParams.get("userEmail");
				String partnerId = (String) responseObject.get("partnerId");
				String userPassword = (String) requestParams.get("userPassword");
				List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
				authorities.add(new SimpleGrantedAuthority("ROLE_CMS"));
				UserDetails userDetails = new User(userEmail, userPassword, authorities);
				Authentication authentication = new UsernamePasswordAuthenticationToken(userDetails, userDetails.getPassword(),
						userDetails.getAuthorities());
				SecurityContext securityContext = SecurityContextHolder.getContext();
				securityContext.setAuthentication(authentication);
				HttpSession session = request.getSession(true);
				session.setAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY, securityContext);
				session.setAttribute("partnerId", partnerId);
				responseObject.put("sessionid", session.getId());
				
			}
			return responseObject;

		} catch (Exception e) {
			responseObject.put("status", "Error");
			responseObject.put("remark", "Exception");
			e.printStackTrace();
			return responseObject;
		}

	}
	
	
}
