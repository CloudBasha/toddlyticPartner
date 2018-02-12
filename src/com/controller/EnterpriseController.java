package com.controller;

import java.lang.reflect.InvocationTargetException;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.dto.PartnerAssesmentDto;
import com.model.CmsUser;
import com.model.Partner;
import com.services.AssesmentService;
import com.services.PartnerService;
import com.util.SendEmailThread;
import com.util.Utils;

@Controller
@RequestMapping({"/enterprise"})
public class EnterpriseController {

	@Autowired
	private AssesmentService assesmentService;
	@Autowired
	private PartnerService partnerService;

	@Autowired
	private ApplicationContext appContext;
	
	private Logger log = Logger.getLogger(this.getClass());
	
	
//	@Value("${toddlytic.api.url}")
//	private String MAIN_URL;

	

	@RequestMapping(value = "getAllParentPartners", method = RequestMethod.POST)
	public @ResponseBody void getAllParentPartners(HttpServletRequest request, HttpServletResponse httpServletResponse)
			throws IllegalAccessException, InvocationTargetException, Exception {
		JSONObject responseJSON = partnerService.getAllParentPartners();
		httpServletResponse.getWriter().write(responseJSON.toJSONString());
	}
	
	@RequestMapping(value = "getOrganizationLicenseUsageInfoByOrganizationId", method = RequestMethod.POST)
	public @ResponseBody void getOrganizationLicenseUsageInfoByOrganizationId(@RequestBody Map<String, Object> requestParams, HttpServletRequest request, HttpServletResponse httpServletResponse,HttpSession httpSession)
			throws IllegalAccessException, InvocationTargetException, Exception {
		String partnerId = (String) requestParams.get("partnerId");
		String organizationId = (String) requestParams.get("organizationId");
		RestTemplate restTemplate = new RestTemplate();
		String url = com.util.Utils.MAIN_URL+"getOrganizationLicenseUsageInfoByPartnerIdAndOrganizationId";
		JSONObject requestToSend = new JSONObject();
		requestToSend.put("partnerId", partnerId);
		requestToSend.put("organizationId", organizationId);
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		String plainCreds = "partner:12345";
		byte[] plainCredsBytes = plainCreds.getBytes();
		byte[] base64CredsBytes = Base64.encodeBase64(plainCredsBytes);
		String base64Creds = new String(base64CredsBytes);
		headers.add("Authorization", "Basic " + base64Creds);
		HttpEntity<String> entity = new HttpEntity<String>(requestToSend.toString(), headers);
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);
		Map<String, Object> responseObject = new HashMap<String, Object>();
		if (response.getStatusCode() == HttpStatus.OK) {

			JSONParser parser = new JSONParser();
			JSONObject responseJson = (JSONObject) parser.parse(response.getBody());
			httpServletResponse.getWriter().write(responseJson.toJSONString());

		}
		else{
			JSONObject responseJson = new JSONObject();
			responseJson.put("status", "FAIL");
			httpServletResponse.getWriter().write(responseJson.toJSONString());
		}

		
	}
	
	@RequestMapping(value = "getLoggedInPartnerAllChilds", method = {RequestMethod.POST,RequestMethod.GET})
	public @ResponseBody void getLoggedInPartnerAllChilds(@RequestBody Map<String, Object> requestParams,HttpServletResponse httpServletResponse,Principal principal,HttpSession httpSession,HttpServletRequest request) throws IllegalAccessException, InvocationTargetException, Exception {
		String partnerId = (String) requestParams.get("partnerId");
		
		JSONObject responseJSONObject = null;
		try{
		 responseJSONObject = partnerService.getLoggedInPartnerAllChilds(partnerId,null,null);
		 /*
		 responseJSONObject = new JSONObject();
		 JSONArray jsonArray = new JSONArray();
		 for(Partner partner:allPartners){
			 JSONObject jsonObject = new JSONObject();
			 jsonObject.put("name", partner.getName());
			 jsonObject.put("id", partner.getPrimaryId()+"");
			 jsonObject.put("parentId", partner.getParentPartnerId());
			 jsonArray.add(jsonObject);
		 }
		 responseJSONObject.put("partners", jsonArray);
		 */
		}
		catch(Exception e){
			responseJSONObject = new JSONObject();
			responseJSONObject.put("status", "FAIL");
			e.printStackTrace();
		}
		httpServletResponse.getWriter().write(responseJSONObject.toJSONString());
	}
	
	
	

	
}
