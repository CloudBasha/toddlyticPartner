package com.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.aop.support.AopUtils;
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

import com.dto.AssesmentDetails;
import com.model.Assesment;
import com.model.AssesmentCategory;
import com.model.Language;
import com.services.AssesmentService;
import com.services.PartnerService;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

@Controller
@RequestMapping("/cms")
public class AssesmentController {

	@Autowired
	private AssesmentService assesmentService;

	@Autowired
	private ApplicationContext appContext;
	
	@Autowired
	private PartnerService partnerService;
	
	

	
	@RequestMapping(value = "getOrganizationLicenseUsageInfoByOrganizationId", method = RequestMethod.POST)
	public @ResponseBody void getOrganizationLicenseUsageInfoByOrganizationId(@RequestBody Map<String, Object> requestParams, HttpServletRequest request, HttpServletResponse httpServletResponse,HttpSession httpSession)
			throws IllegalAccessException, InvocationTargetException, Exception {
		String partnerId = (String) httpSession.getAttribute("partnerId");
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
	public @ResponseBody void getLoggedInPartnerAllChilds(HttpServletResponse httpServletResponse,Principal principal,HttpSession httpSession,HttpServletRequest request) throws IllegalAccessException, InvocationTargetException, Exception {
		String partnerId = (String) httpSession.getAttribute("partnerId");
		if(partnerId==null || partnerId.equals("")){
			partnerId = request.getParameter("partnerId");
		}
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
	

	@RequestMapping(value = "getAssesmentCategories", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> getAssesmentCategories(HttpServletRequest request, HttpServletResponse httpServletResponse)
			throws IllegalAccessException, InvocationTargetException, Exception {
		List<AssesmentCategory> assesmentCategories = assesmentService.getAssesmentCategories();
		Map<String, Object> responseObject = new HashMap<String, Object>();
		responseObject.put("assesmentCategories", assesmentCategories);
		return responseObject;

	}

	@RequestMapping(value = "getLanguage", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> getLanguage(HttpServletRequest request, HttpServletResponse httpServletResponse)
			throws IllegalAccessException, InvocationTargetException, Exception {
		List<Language> languagesList = assesmentService.getLanguages();
		Map<String, Object> responseObject = new HashMap<String, Object>();
		responseObject.put("languagesList", languagesList);
		return responseObject;

	}

	@RequestMapping(value = "getAssesments", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> getAssesments(HttpServletRequest request, HttpServletResponse httpServletResponse)
			throws IllegalAccessException, InvocationTargetException, Exception {
		List<Assesment> assesmentsList = assesmentService.getAssesments();
		Map<String, Object> responseObject = new HashMap<String, Object>();
		responseObject.put("assesmentsList", assesmentsList);
		return responseObject;
	}

	@RequestMapping(value = "getAssesmentById", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> getAssesmentById(@RequestBody Map<String, Object> requestParams, HttpServletRequest request,
			HttpServletResponse httpServletResponse) throws IllegalAccessException, InvocationTargetException, Exception {
		String assesmentId = (String) requestParams.get("assesmentId");
		AssesmentDetails assesment = assesmentService.getAssesmentById(Long.parseLong(assesmentId));
		Map<String, Object> responseObject = new HashMap<String, Object>();
		responseObject.put("assesment", assesment);
		return responseObject;
	}

	@RequestMapping(value = "createAssesment", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> createAssesment(@RequestBody Map<String, Object> requestParams, HttpServletRequest request,
			HttpServletResponse httpServletResponse) throws IllegalAccessException, InvocationTargetException, Exception {
		Map<String, Object> responseObject = new HashMap<String, Object>();
		try {
			assesmentService.saveNewAssesment(requestParams);
			responseObject.put("status", "SUCCESS");
		} catch (Exception e) {
			responseObject.put("status", "FAILED");
			e.printStackTrace();
		}
		return responseObject;
	}

	@RequestMapping(value = "addSectionsToAssesment", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> addSectionsToAssesment(@RequestBody Map<String, Object> requestParams, HttpServletRequest request,
			HttpServletResponse httpServletResponse) throws IllegalAccessException, InvocationTargetException, Exception {
		Map<String, Object> responseObject = new HashMap<String, Object>();
		try {
			assesmentService.addSectionsToAssesment(requestParams);
			responseObject.put("status", "SUCCESS");
		} catch (Exception e) {
			responseObject.put("status", "FAILED");
			e.printStackTrace();
		}
		return responseObject;
	}

	@RequestMapping(value = "addCriteriaToAssesmentSections", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> addCriteriaToAssesmentSections(@RequestBody Map<String, Object> requestParams,
			HttpServletRequest request, HttpServletResponse httpServletResponse) throws IllegalAccessException, InvocationTargetException, Exception {
		Map<String, Object> responseObject = new HashMap<String, Object>();
		try {
			assesmentService.addCriteriaToAssesmentSections(requestParams);
			responseObject.put("status", "SUCCESS");
		} catch (Exception e) {
			responseObject.put("status", "FAILED");
			e.printStackTrace();
		}
		return responseObject;
	}

	@RequestMapping(value = "updateAssesment", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> updateAssesment(@RequestBody Map<String, Object> requestParams, HttpServletRequest request,
			HttpServletResponse httpServletResponse) throws IllegalAccessException, InvocationTargetException, Exception {
		Map<String, Object> responseObject = new HashMap<String, Object>();
		try {
			assesmentService.updateAssesment(requestParams);
			responseObject.put("status", "SUCCESS");
		} catch (Exception e) {
			responseObject.put("status", "FAILED");
			e.printStackTrace();
		}
		return responseObject;
	}

	@RequestMapping(value = "updateAssesmentSections", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> updateSectionsAssesment(@RequestBody Map<String, Object> requestParams, HttpServletRequest request,
			HttpServletResponse httpServletResponse) throws IllegalAccessException, InvocationTargetException, Exception {
		Map<String, Object> responseObject = new HashMap<String, Object>();
		try {
			assesmentService.updateSectionsAssesment(requestParams);
			responseObject.put("status", "SUCCESS");
		} catch (Exception e) {
			responseObject.put("status", "FAILED");
			e.printStackTrace();
		}
		return responseObject;
	}

	@RequestMapping(value = "updateAssesmentSectionCriteria", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> updateCriteriaAssesmentSections(@RequestBody Map<String, Object> requestParams,
			HttpServletRequest request, HttpServletResponse httpServletResponse) throws IllegalAccessException, InvocationTargetException, Exception {
		Map<String, Object> responseObject = new HashMap<String, Object>();
		try {
			assesmentService.updateCriteriaAssesmentSections(requestParams);
			responseObject.put("status", "SUCCESS");
		} catch (Exception e) {
			responseObject.put("status", "FAILED");
			e.printStackTrace();
		}
		return responseObject;
	}

	@RequestMapping(value = "updateCriteriaAssesmentSectionAnswer", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> updateCriteriaAssesmentSectionAnswer(@RequestBody Map<String, Object> requestParams,
			HttpServletRequest request, HttpServletResponse httpServletResponse) throws IllegalAccessException, InvocationTargetException, Exception {
		Map<String, Object> responseObject = new HashMap<String, Object>();
		try {
			assesmentService.updateCriteriaAssesmentSectionAnswer(requestParams);
			responseObject.put("status", "SUCCESS");
		} catch (Exception e) {
			responseObject.put("status", "FAILED");
			e.printStackTrace();
		}
		return responseObject;
	}

	@RequestMapping(value = "deleteAssesment", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> deleteAssesment(@RequestBody Map<String, Object> requestParams, HttpServletRequest request,
			HttpServletResponse httpServletResponse) throws IllegalAccessException, InvocationTargetException, Exception {
		Map<String, Object> responseObject = new HashMap<String, Object>();
		try {
			assesmentService.deleteAssesment(requestParams);
			responseObject.put("status", "SUCCESS");
		} catch (Exception e) {
			responseObject.put("status", "FAILED");
			e.printStackTrace();
		}
		return responseObject;
	}

	@RequestMapping(value = "deleteAssesmentSections", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> deleteAssesmentSections(@RequestBody Map<String, Object> requestParams, HttpServletRequest request,
			HttpServletResponse httpServletResponse) throws IllegalAccessException, InvocationTargetException, Exception {
		Map<String, Object> responseObject = new HashMap<String, Object>();
		try {
			assesmentService.deleteAssesmentSections(requestParams);
			responseObject.put("status", "SUCCESS");
		} catch (Exception e) {
			responseObject.put("status", "FAILED");
			e.printStackTrace();
		}
		return responseObject;
	}

	@RequestMapping(value = "deleteAssesmentSectionsCriteria", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> deleteAssesmentSectionsCriteria(@RequestBody Map<String, Object> requestParams,
			HttpServletRequest request, HttpServletResponse httpServletResponse) throws IllegalAccessException, InvocationTargetException, Exception {
		Map<String, Object> responseObject = new HashMap<String, Object>();
		try {
			assesmentService.deleteAssesmentSectionsCriteria(requestParams);
			responseObject.put("status", "SUCCESS");
		} catch (Exception e) {
			responseObject.put("status", "FAILED");
			e.printStackTrace();
		}
		return responseObject;
	}

	@RequestMapping(value = "deleteAssesmentSectionsCriteriaAnswers", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> deleteAssesmentSectionsCriteriaAnswers(@RequestBody Map<String, Object> requestParams,
			HttpServletRequest request, HttpServletResponse httpServletResponse) throws IllegalAccessException, InvocationTargetException, Exception {
		Map<String, Object> responseObject = new HashMap<String, Object>();
		try {
			assesmentService.deleteAssesmentSectionsCriteriaAnswers(requestParams);
			responseObject.put("status", "SUCCESS");
		} catch (Exception e) {
			responseObject.put("status", "FAILED");
			e.printStackTrace();
		}
		return responseObject;
	}

}
