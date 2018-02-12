package com.controller;

import java.io.IOException;
import java.io.StringWriter;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
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
import com.dto.PartnerAssesmentDto;
import com.model.Assesment;
import com.model.AssesmentCategory;
import com.model.Language;
import com.model.Partner;
import com.services.AssesmentService;
import com.services.PartnerService;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;


@Controller
@RequestMapping("/cms")
public class PartnerLicenseController {

	@Autowired
	private AssesmentService assesmentService;
	
	@Autowired
	private PartnerService partnerService;
	
	@Autowired
	private ApplicationContext appContext;
	

	@RequestMapping(value = "getDataForPurchaseNewLicense", method = RequestMethod.POST)
	 public @ResponseBody void getDataForPurchaseNewLicense(@RequestBody Map<String, Object> requestParams,HttpServletRequest request,
				HttpServletResponse httpServletResponse) throws IllegalAccessException, InvocationTargetException, Exception{
		 String partnerId = (String) requestParams.get("partnerId");
		 String org_id = (String) requestParams.get("org_id");
		 RestTemplate restTemplate = new RestTemplate();
		 String url = com.util.Utils.MAIN_URL+"getDataForPurchaseNewLicense";
		 JSONObject requestToSend = new JSONObject();
		 requestToSend.put("org_id", org_id);
		 requestToSend.put("partnerId", partnerId);
		 HttpHeaders headers = new HttpHeaders();
		 headers.setContentType(MediaType.APPLICATION_JSON);
		 String plainCreds = "partner:12345";
		 byte[] plainCredsBytes = plainCreds.getBytes();
		 byte[] base64CredsBytes = Base64.encodeBase64(plainCredsBytes);
		 String base64Creds = new String(base64CredsBytes);
		 headers.add("Authorization", "Basic " + base64Creds);
		 HttpEntity<String> entity = new HttpEntity<String>(requestToSend.toString(), headers);
		 try{
		 ResponseEntity<String> response = restTemplate
				  .exchange(url, HttpMethod.POST, entity, String.class);
		 
		 if (response.getStatusCode() == HttpStatus.OK) {
			 JSONParser parser = new JSONParser(); 
			 JSONObject responseJson = (JSONObject) parser.parse(response.getBody());
			 httpServletResponse.getWriter().write(responseJson.toJSONString());
		}
		 else{
			 JSONObject responseError = new JSONObject();
			 responseError.put("status", "FAIL");
			 responseError.put("code", response.getStatusCode());
			 httpServletResponse.getWriter().write(responseError.toJSONString());
		 }
		 }
		 catch(Exception e){
			 e.printStackTrace();
			 JSONObject responseError = new JSONObject();
			 responseError.put("status", "FAIL");
			 httpServletResponse.getWriter().write(responseError.toJSONString());
		 }
	}
	
	 @RequestMapping(value = "savePurchaseNewLicense", method = RequestMethod.POST)
	 public @ResponseBody void savePurchaseNewLicense(@RequestBody Map<String, Object> requestParams,HttpServletRequest request,
				HttpServletResponse httpServletResponse) throws IllegalAccessException, InvocationTargetException, Exception{
		 StringWriter out = new StringWriter();
		 JSONValue.writeJSONString(requestParams,out);
		 String jsonText = out.toString();
		 JSONParser parser = new JSONParser();
		 JSONObject requestToSend =  (JSONObject) parser.parse(jsonText);
		 
		 RestTemplate restTemplate = new RestTemplate();
		 String url = com.util.Utils.MAIN_URL+"savePurchaseNewLicense";
		 
		 HttpHeaders headers = new HttpHeaders();
		 headers.setContentType(MediaType.APPLICATION_JSON);
		 String plainCreds = "partner:12345";
		 byte[] plainCredsBytes = plainCreds.getBytes();
		 byte[] base64CredsBytes = Base64.encodeBase64(plainCredsBytes);
		 String base64Creds = new String(base64CredsBytes);
		 headers.add("Authorization", "Basic " + base64Creds);
		 HttpEntity<String> entity = new HttpEntity<String>(requestToSend.toString(), headers);
		 try{
		 ResponseEntity<String> response = restTemplate
				  .exchange(url, HttpMethod.POST, entity, String.class);
		 
		 if (response.getStatusCode() == HttpStatus.OK) {
			 JSONObject responseJson = (JSONObject) parser.parse(response.getBody());
			 httpServletResponse.getWriter().write(responseJson.toJSONString());
		}
		 else{
			 JSONObject responseError = new JSONObject();
			 responseError.put("status", "FAIL");
			 responseError.put("code", response.getStatusCode());
			 httpServletResponse.getWriter().write(responseError.toJSONString());
		 }
		 }
		 catch(Exception e){
			 e.printStackTrace();
			 JSONObject responseError = new JSONObject();
			 responseError.put("status", "FAIL");
			 httpServletResponse.getWriter().write(responseError.toJSONString());
		 }
		 
	}
	 
	 
	 @RequestMapping(value = "getDataForPurchaseAddOnLicense", method = RequestMethod.POST)
	 public @ResponseBody void getDataForPurchaseAddOnLicense(@RequestBody Map<String, Object> requestParams,HttpServletRequest request,
				HttpServletResponse httpServletResponse) throws IllegalAccessException, InvocationTargetException, Exception{
		 String partnerId = (String) requestParams.get("partnerId");
		 String org_id = (String) requestParams.get("org_id");
		 RestTemplate restTemplate = new RestTemplate();
		 String url = com.util.Utils.MAIN_URL+"getDataForPurchaseAddOnLicense";
		 
		 JSONObject requestToSend = new JSONObject();
		 requestToSend.put("org_id", org_id);
		 requestToSend.put("partnerId", partnerId);
		 HttpHeaders headers = new HttpHeaders();
		 headers.setContentType(MediaType.APPLICATION_JSON);
		 String plainCreds = "partner:12345";
		 byte[] plainCredsBytes = plainCreds.getBytes();
		 byte[] base64CredsBytes = Base64.encodeBase64(plainCredsBytes);
		 String base64Creds = new String(base64CredsBytes);
		 headers.add("Authorization", "Basic " + base64Creds);
		 HttpEntity<String> entity = new HttpEntity<String>(requestToSend.toString(), headers);
		 try{
		 ResponseEntity<String> response = restTemplate
				  .exchange(url, HttpMethod.POST, entity, String.class);
		 
		 if (response.getStatusCode() == HttpStatus.OK) {
			 JSONParser parser = new JSONParser(); 
			 JSONObject responseJson = (JSONObject) parser.parse(response.getBody());
			 httpServletResponse.getWriter().write(responseJson.toJSONString());
		}
		 else{
			 JSONObject responseError = new JSONObject();
			 responseError.put("status", "FAIL");
			 responseError.put("code", response.getStatusCode());
			 httpServletResponse.getWriter().write(responseError.toJSONString());
		 }
		 }
		 catch(Exception e){
			 e.printStackTrace();
			 JSONObject responseError = new JSONObject();
			 responseError.put("status", "FAIL");
			 httpServletResponse.getWriter().write(responseError.toJSONString());
		 }
	} 
	 
	 
	 @RequestMapping(value = "savePurchaseAddOnLicense", method = RequestMethod.POST)
	 public @ResponseBody void savePurchaseAddOnLicense(@RequestBody Map<String, Object> requestParams,HttpServletRequest request,
				HttpServletResponse httpServletResponse) throws IllegalAccessException, InvocationTargetException, Exception{
		 StringWriter out = new StringWriter();
		 JSONValue.writeJSONString(requestParams,out);
		 String jsonText = out.toString();
		 JSONParser parser = new JSONParser();
		 JSONObject requestToSend =  (JSONObject) parser.parse(jsonText);
		 
		 RestTemplate restTemplate = new RestTemplate();
		 String url = com.util.Utils.MAIN_URL+"savePurchaseAddOnLicense";
		 
		 HttpHeaders headers = new HttpHeaders();
		 headers.setContentType(MediaType.APPLICATION_JSON);
		 String plainCreds = "partner:12345";
		 byte[] plainCredsBytes = plainCreds.getBytes();
		 byte[] base64CredsBytes = Base64.encodeBase64(plainCredsBytes);
		 String base64Creds = new String(base64CredsBytes);
		 headers.add("Authorization", "Basic " + base64Creds);
		 HttpEntity<String> entity = new HttpEntity<String>(requestToSend.toString(), headers);
		 try{
		 ResponseEntity<String> response = restTemplate
				  .exchange(url, HttpMethod.POST, entity, String.class);
		 
		 if (response.getStatusCode() == HttpStatus.OK) {
			 JSONObject responseJson = (JSONObject) parser.parse(response.getBody());
			 httpServletResponse.getWriter().write(responseJson.toJSONString());
		}
		 else{
			 JSONObject responseError = new JSONObject();
			 responseError.put("status", "FAIL");
			 responseError.put("code", response.getStatusCode());
			 httpServletResponse.getWriter().write(responseError.toJSONString());
		 }
		 }
		 catch(Exception e){
			 e.printStackTrace();
			 JSONObject responseError = new JSONObject();
			 responseError.put("status", "FAIL");
			 httpServletResponse.getWriter().write(responseError.toJSONString());
		 }
		 
	} 
	
	 
	 @RequestMapping(value = "getActiveLicensePackagesByOrgId", method = RequestMethod.POST)
	 public @ResponseBody void getActiveLicensePackagesByOrgId(@RequestBody Map<String, Object> requestParams,HttpServletRequest request,
				HttpServletResponse httpServletResponse) throws IllegalAccessException, InvocationTargetException, Exception{
		 String org_id = (String) requestParams.get("org_id");
		 String partnerId = (String) requestParams.get("partnerId");
		 RestTemplate restTemplate = new RestTemplate();
		 
		 String url = com.util.Utils.MAIN_URL+"getActiveLicensePackagesByOrgId";
		 JSONObject requestToSend = new JSONObject();
		 requestToSend.put("org_id", org_id);
		 requestToSend.put("partnerId", partnerId);
		 HttpHeaders headers = new HttpHeaders();
		 headers.setContentType(MediaType.APPLICATION_JSON);
		 String plainCreds = "partner:12345";
		 byte[] plainCredsBytes = plainCreds.getBytes();
		 byte[] base64CredsBytes = Base64.encodeBase64(plainCredsBytes);
		 String base64Creds = new String(base64CredsBytes);
		 headers.add("Authorization", "Basic " + base64Creds);
		 HttpEntity<String> entity = new HttpEntity<String>(requestToSend.toString(), headers);
		 try{
		 ResponseEntity<String> response = restTemplate
				  .exchange(url, HttpMethod.POST, entity, String.class);
		 
		 if (response.getStatusCode() == HttpStatus.OK) {
			 JSONParser parser = new JSONParser(); 
			 JSONObject responseJson = (JSONObject) parser.parse(response.getBody());
			 httpServletResponse.getWriter().write(responseJson.toJSONString());
		}
		 else{
			 JSONObject responseError = new JSONObject();
			 responseError.put("status", "FAIL");
			 responseError.put("code", response.getStatusCode());
			 httpServletResponse.getWriter().write(responseError.toJSONString());
		 }
		 }
		 catch(Exception e){
			 e.printStackTrace();
			 JSONObject responseError = new JSONObject();
			 responseError.put("status", "FAIL");
			 httpServletResponse.getWriter().write(responseError.toJSONString());
		 }
		 
	 }
	 
	 
	 
	
	 
	
	
}
