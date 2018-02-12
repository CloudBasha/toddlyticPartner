package com.controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
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
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.dto.PartnerAssesmentDto;
import com.model.CmsUser;

import com.model.Partner;
import com.obj.ConstantVar;
import com.s3.S3Func;
import com.services.AssesmentService;
import com.services.PartnerService;
import com.util.SendEmailThread;
import com.util.Utils;

@Controller
@RequestMapping({"/cms","/enterprise"})
public class PartnerController {

	@Autowired
	private AssesmentService assesmentService;
	@Autowired
	private PartnerService partnerService;

	@Autowired
	private ApplicationContext appContext;
	
	private Logger log = Logger.getLogger(this.getClass());
	
	
//	@Value("${toddlytic.api.url}")
//	private String MAIN_URL;

	@RequestMapping(value = "getPartnerAssesmentByPartnerId", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> getAssesmentCategories(@RequestBody Map<String, Object> requestParams, HttpServletRequest request,
			HttpServletResponse httpServletResponse) throws IllegalAccessException, InvocationTargetException, Exception {
		String partnerId = (String) requestParams.get("partnerId");
		List<PartnerAssesmentDto> partnerAssesmentDtos = partnerService.getPartnerAssesmentByPartnerId(Long.parseLong(partnerId));
		Map<String, Object> responseObject = new HashMap<String, Object>();
		responseObject.put("partnerAssesments", partnerAssesmentDtos);
		return responseObject;

	}

	@RequestMapping(value = "getAllPartners", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> getAllPartners(HttpServletRequest request, HttpServletResponse httpServletResponse)
			throws IllegalAccessException, InvocationTargetException, Exception {
		List<Partner> partnersList = partnerService.getAllPartners();
		Map<String, Object> responseObject = new HashMap<String, Object>();
		responseObject.put("partners", partnersList);
		return responseObject;
	}
	
	@RequestMapping(value = "createPartner", method = RequestMethod.POST)
	public @ResponseBody void createPartner(@RequestBody Map<String, Object> requestParams,HttpServletRequest request, HttpServletResponse httpServletResponse)
			throws IllegalAccessException, InvocationTargetException, Exception {
		String email = (String)requestParams.get("email");
		String name = (String)requestParams.get("name");
		JSONObject responseJSON = partnerService.createPartner(requestParams);
		SendEmailThread emailThread = (SendEmailThread) appContext.getBean("sendEmailThread");
		String subject = "Welcome to Toddlytic";
		emailThread.setSubject(subject);
		emailThread.setContent(Utils.parentRegisterEmailContent(name, email));
		emailThread.setToAddress(email);
		emailThread.start();
		httpServletResponse.getWriter().write(responseJSON.toJSONString());
	}
	
	@RequestMapping(value = "uploadProfilePhoto", headers = "Content-Type= multipart/form-data", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> uploadContactLogo(@RequestParam("uploadProfilePhoto") MultipartFile file,HttpSession httpSession) throws IOException {

		Map<String, Object> responseObject = new HashMap<String, Object>();
		String partnerId = (String) httpSession.getAttribute("partnerId");
		
		try {
			
			byte[] bytes;

			if (!file.isEmpty()) {
				bytes = file.getBytes();
				File convFile = new File(file.getOriginalFilename());
				file.transferTo(convFile);
				// store file in storage

				long size = file.getSize();
				

				//store file in storage

					String folderUrl = partnerId + "/profile/";
					Map<String, Object> statusObj = S3Func.uploadFileToBucket(ConstantVar.CURRENT_BUCKET, folderUrl, convFile,
							file.getOriginalFilename());

					if (statusObj.get("status").equals("Fail")) {
						System.out.println("Photo upload to S3 failed");
						throw new Exception();
					} else {
						System.out.println("Photo upload to S3 success");
						String photoUrl = (String) statusObj.get("url");
						partnerService.updatePartnerPhoto(partnerId,photoUrl);
					}
					
				
			}

			responseObject.put("status", ConstantVar.SUCCESS_MSG);
			responseObject.put("remark", "");

		} catch (Exception e) {
			e.printStackTrace();
			responseObject.put("status", ConstantVar.FAIL_MSG);
			responseObject.put("remark", ConstantVar.EXCEPTION_MSG);
		}
		return responseObject;
	}

	@RequestMapping(value = "createOrganization", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> createOrganization(@RequestBody Map<String, Object> requestParams, HttpServletRequest request,
			HttpServletResponse httpServletResponse,Principal principal,HttpSession httpSession) throws IllegalAccessException, InvocationTargetException, Exception {
		String name = (String) requestParams.get("name");
		
		String partnerId = (String) httpSession.getAttribute("partnerId");
		String createdBy = (String) requestParams.get("createdBy");
		String email = (String) requestParams.get("email");
		String mobileNumber = (String) requestParams.get("mobileNumber");
		String organizationName = (String) requestParams.get("organizationName");
		String timezone = (String) requestParams.get("timezone");
		RestTemplate restTemplate = new RestTemplate();
		String url = com.util.Utils.MAIN_URL+"createOrganization";
		JSONObject requestToSend = new JSONObject();
		requestToSend.put("name", name);
		requestToSend.put("partnerId", partnerId);
		requestToSend.put("createdBy", createdBy);
		requestToSend.put("organizationName", organizationName);
		requestToSend.put("email", email);
		requestToSend.put("mobileNumber", mobileNumber);
		requestToSend.put("timezone", timezone);
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
			String organizationId = (String) responseJson.get("organizationId");
			if (organizationId != null && !organizationId.equals("")) {
				partnerService.createPartnerOrganization(partnerId, organizationId, createdBy);
			}
			responseObject.put("status", (String) responseJson.get("status"));
			responseObject.put("remark", (String) responseJson.get("remark"));
		} else {
			responseObject.put("status", "FAIL");
		}

		return responseObject;
	}
	
	@RequestMapping(value = "createUserForPartner", method = RequestMethod.POST)
	public @ResponseBody void createUserForPartner(@RequestBody Map<String, Object> requestParams, HttpServletRequest request, HttpServletResponse httpServletResponse,HttpSession httpSession)
			throws IllegalAccessException, InvocationTargetException, Exception {
		String partnerId = (String) httpSession.getAttribute("partnerId");
		String email = (String)requestParams.get("email");
		String name = (String)requestParams.get("name");
		log.debug("Partner ID from Session:" + partnerId);
		 requestParams.put("partnerId", partnerId);
		 JSONObject jsonObject = partnerService.createUserForPartner(requestParams);
		 String status = (String) jsonObject.get("status");
		 if(status.equals("SUCCESS")){
			 	SendEmailThread emailThread = (SendEmailThread) appContext.getBean("sendEmailThread");
				String subject = "Welcome to Toddlytic";
				emailThread.setSubject(subject);
				emailThread.setContent(Utils.parentRegisterEmailContent(name, email));
				emailThread.setToAddress(email);
				emailThread.start();
		 }
		 httpServletResponse.getWriter().write(jsonObject.toJSONString());
	}
	
	@RequestMapping(value = "listUserForPartner", method = RequestMethod.POST)
	public @ResponseBody void listUserForPartner(@RequestBody Map<String, Object> requestParams, HttpServletRequest request, HttpServletResponse httpServletResponse,HttpSession httpSession)
			throws IllegalAccessException, InvocationTargetException, Exception {
		String partnerId = (String) httpSession.getAttribute("partnerId");
		JSONObject jsonObject = partnerService.listUserForPartner(partnerId);
		httpServletResponse.getWriter().write(jsonObject.toJSONString());
	}
	
	
	
	@RequestMapping(value = "getOrganizationInfoByOrganizationId", method = RequestMethod.POST)
	public @ResponseBody void getOrganizationInfoByOrganizationId(@RequestBody Map<String, Object> requestParams, HttpServletRequest request, HttpServletResponse httpServletResponse,HttpSession httpSession)
			throws IllegalAccessException, InvocationTargetException, Exception {
		String partnerId = (String) httpSession.getAttribute("partnerId");
		log.debug("Partner ID from Session:" + partnerId);
		String organizationId = (String) requestParams.get("organizationId");
		RestTemplate restTemplate = new RestTemplate();
		String url = com.util.Utils.MAIN_URL+"getOrganizationInfoByPartnerIdAndOrganizationId";
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
	
	@RequestMapping(value = "updatePartnerInformation", method = RequestMethod.POST)
	public @ResponseBody void updatePartnerInformation(@RequestBody Map<String, Object> requestParams, HttpServletRequest request, HttpServletResponse httpServletResponse,HttpSession httpSession,Principal principal)
			throws IllegalAccessException, InvocationTargetException, Exception {
		String partnerId = (String) httpSession.getAttribute("partnerId");
		String userName = principal.getName();
		requestParams.put("partnerId", partnerId);
		requestParams.put("userName", userName);
		JSONObject response = partnerService.updatePartnerInformation(requestParams);
		httpServletResponse.getWriter().write(response.toJSONString());
	}
	
	
	
	
	
	@RequestMapping(value = "getLicensePricingInfoByEditionId", method = RequestMethod.POST)
	public @ResponseBody void getLicensePricingInfoByEditionId(@RequestBody Map<String, Object> requestParams, HttpServletRequest request, HttpServletResponse httpServletResponse,HttpSession httpSession)
			throws IllegalAccessException, InvocationTargetException, Exception {
		String editionId = (String) requestParams.get("editionId");
		
		RestTemplate restTemplate = new RestTemplate();
		String url = com.util.Utils.MAIN_URL+"getLicensePricingInfoByEditionId";
		JSONObject requestToSend = new JSONObject();
		requestToSend.put("editionId", editionId);
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
	
	@RequestMapping(value = "getOrgBillingInfo", method = RequestMethod.POST)
	public @ResponseBody void getOrgBillingInfo(@RequestBody Map<String, Object> requestParams,HttpServletRequest request,
			HttpServletResponse httpServletResponse,HttpSession httpSession) throws IllegalAccessException, InvocationTargetException, Exception {
		String orgId = (String) requestParams.get("orgId");
		String date = (String) requestParams.get("date");
		RestTemplate restTemplate = new RestTemplate();
		String url = com.util.Utils.MAIN_URL+"getOrgBillingInfo";
		JSONObject requestToSend = new JSONObject();
		requestToSend.put("orgId", orgId);
		requestToSend.put("date", date);
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
	
	
	@RequestMapping(value = "getSchoolBillingInfo", method = RequestMethod.POST)
	public @ResponseBody void getSchoolBillingInfo(@RequestBody Map<String, Object> requestParams,HttpServletRequest request,
			HttpServletResponse httpServletResponse,HttpSession httpSession) throws IllegalAccessException, InvocationTargetException, Exception {
		String schoolId = (String) requestParams.get("schoolId");
		String date = (String) requestParams.get("date");
		RestTemplate restTemplate = new RestTemplate();
		String url = com.util.Utils.MAIN_URL+"getSchoolBillingInfo";
		JSONObject requestToSend = new JSONObject();
		requestToSend.put("schoolId", schoolId);
		requestToSend.put("date", date);
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
	
	
	@RequestMapping(value = "getStudentBillingInfo", method = RequestMethod.POST)
	public @ResponseBody void getStudentBillingInfo(@RequestBody Map<String, Object> requestParams,HttpServletRequest request,
			HttpServletResponse httpServletResponse,HttpSession httpSession) throws IllegalAccessException, InvocationTargetException, Exception {
		String programSchoolId = (String) requestParams.get("programSchoolId");
		String date = (String) requestParams.get("date");
		RestTemplate restTemplate = new RestTemplate();
		String url = com.util.Utils.MAIN_URL+"getStudentBillingInfo";
		JSONObject requestToSend = new JSONObject();
		requestToSend.put("programSchoolId", programSchoolId);
		requestToSend.put("date", date);
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
	
	@RequestMapping(value = "getInvoiceInfo", method = RequestMethod.POST)
	public @ResponseBody void getInvoiceInfo(@RequestBody Map<String, Object> requestParams,HttpServletRequest request,
			HttpServletResponse httpServletResponse,HttpSession httpSession) throws IllegalAccessException, InvocationTargetException, Exception {
		String invoiceId = (String) requestParams.get("invoiceId");
		String orgId = (String) requestParams.get("orgId");
		RestTemplate restTemplate = new RestTemplate();
		String url = com.util.Utils.MAIN_URL+"getInvoiceInfo";
		JSONObject requestToSend = new JSONObject();
		requestToSend.put("orgId", orgId);
		requestToSend.put("invoiceId", invoiceId);
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
	
	
	@RequestMapping(value = "getPurchaseOrdersByOrganizationId", method = RequestMethod.POST)
	public @ResponseBody void getPurchaseOrdersByOrganizationId(@RequestBody Map<String, Object> requestParams,HttpServletRequest request,
			HttpServletResponse httpServletResponse,HttpSession httpSession) throws IllegalAccessException, InvocationTargetException, Exception {
		String org_id = (String) requestParams.get("org_id");
		RestTemplate restTemplate = new RestTemplate();
		String url = com.util.Utils.MAIN_URL+"getPurchaseOrdersByOrganizationId";
		JSONObject requestToSend = new JSONObject();
		requestToSend.put("org_id", org_id);
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
	
	
	@RequestMapping(value = "getPurchaseOrderDetailsByTransactionId", method = RequestMethod.POST)
	public @ResponseBody void getPurchaseOrderDetailsByTransactionId(@RequestBody Map<String, Object> requestParams,HttpServletRequest request,
			HttpServletResponse httpServletResponse,HttpSession httpSession) throws IllegalAccessException, InvocationTargetException, Exception {
		String transactionId = (String) requestParams.get("transactionId");
		RestTemplate restTemplate = new RestTemplate();
		String url = com.util.Utils.MAIN_URL+"getPurchaseOrderDetailsByTransactionId";
		JSONObject requestToSend = new JSONObject();
		requestToSend.put("transactionId", transactionId);
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
	
	@RequestMapping(value = "getOrganizationById", method = RequestMethod.POST)
	public @ResponseBody void getOrganizationById(@RequestBody Map<String, Object> requestParams,HttpServletRequest request,
			HttpServletResponse httpServletResponse,HttpSession httpSession) throws IllegalAccessException, InvocationTargetException, Exception {
		String orgId = (String) requestParams.get("orgId");
		RestTemplate restTemplate = new RestTemplate();
		String url = com.util.Utils.MAIN_URL+"getOrganizationById";
		JSONObject requestToSend = new JSONObject();
		requestToSend.put("orgId", orgId);
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
	
	@RequestMapping(value = "changePassword", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> changePassword(@RequestBody Map<String, Object> requestParams,
			HttpServletResponse httpServletResponse,Principal principal) throws IllegalAccessException, InvocationTargetException, Exception {
		String name = principal.getName();
		String currentPassword = (String) requestParams.get("currentPassword");
		String newPassword = (String) requestParams.get("newPassword");
		Map<String,Object> responseParams = partnerService.changePassword(name, currentPassword, newPassword);
		return responseParams;
	}
	
	@RequestMapping(value = "getLoggedInUserContactInfo", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> getLoggedInUserContactInfo(@RequestBody Map<String, Object> requestParams,
			HttpServletResponse httpServletResponse,Principal principal) throws IllegalAccessException, InvocationTargetException, Exception {
		String name = principal.getName();
		Map<String,Object> responseParams = partnerService.getUserContactInfoById(name);
		return responseParams;
	}
	
	@RequestMapping(value = "getLoggedInPartnerChilds", method = RequestMethod.POST)
	public @ResponseBody void getLoggedInPartnerChilds(@RequestBody Map<String, Object> requestParams,
			HttpServletResponse httpServletResponse,Principal principal,HttpSession httpSession) throws IllegalAccessException, InvocationTargetException, Exception {
		String partnerId = (String) httpSession.getAttribute("partnerId");
		JSONObject responseJSONObject = null;
		try{
		 responseJSONObject = partnerService.getLoggedInPartnerChilds(partnerId);
		}
		catch(Exception e){
			responseJSONObject = new JSONObject();
			responseJSONObject.put("status", "FAIL");
			e.printStackTrace();
		}
		httpServletResponse.getWriter().write(responseJSONObject.toJSONString());
	}
	
	@RequestMapping(value = "changeParentPartner", method = RequestMethod.POST)
	public @ResponseBody void changeParentPartner(@RequestBody Map<String, Object> requestParams,
			HttpServletResponse httpServletResponse,Principal principal,HttpSession httpSession) throws IllegalAccessException, InvocationTargetException, Exception {
		String parentId = (String) requestParams.get("parentId");
		String childId = (String) requestParams.get("childId");
		JSONObject responseJSONObject = null;
		try{
		 partnerService.changeParentPartner(parentId,childId);
		 responseJSONObject = new JSONObject();
		 responseJSONObject.put("status", "SUCCESS");
		}
		catch(Exception e){
			responseJSONObject = new JSONObject();
			responseJSONObject.put("status", "FAIL");
			e.printStackTrace();
		}
		httpServletResponse.getWriter().write(responseJSONObject.toJSONString());
	}
	
	@RequestMapping(value = "changeOrganizationPartner", method = RequestMethod.POST)
	public @ResponseBody void changeOrganizationPartner(@RequestBody Map<String, Object> requestParams,
			HttpServletResponse httpServletResponse,Principal principal,HttpSession httpSession) throws IllegalAccessException, InvocationTargetException, Exception {
		String organizationId = (String) requestParams.get("organizationId");
		String newPartnerId = (String) requestParams.get("newPartnerId");
		String currentPartnerId = (String) requestParams.get("currentPartnerId");
		JSONObject responseJSONObject = null;
		try{
		 String status = partnerService.changeOrganizationPartner(organizationId,newPartnerId,currentPartnerId);
		 responseJSONObject = new JSONObject();
		 
		 responseJSONObject.put("status", status);
		}
		catch(Exception e){
			responseJSONObject = new JSONObject();
			responseJSONObject.put("status", "FAIL");
			e.printStackTrace();
		}
		httpServletResponse.getWriter().write(responseJSONObject.toJSONString());
	}
	
	
	@RequestMapping(value = "getPartnerDetailsById", method = RequestMethod.POST)
	public @ResponseBody void getPartnerDetailsById(@RequestBody Map<String, Object> requestParams,
			HttpServletResponse httpServletResponse,Principal principal,HttpSession httpSession) throws IllegalAccessException, InvocationTargetException, Exception {
		String partnerId = (String) requestParams.get("partnerId");
		JSONObject jsonObject = partnerService.getPartnerDetailsById(Long.parseLong(partnerId));
		httpServletResponse.getWriter().write(jsonObject.toJSONString());
	}
	
	
	
	@RequestMapping(value = "viewPartnerInformationByPartnerId", method = RequestMethod.POST)
	public @ResponseBody void viewPartnerInformationByPartnerId(@RequestBody Map<String, Object> requestParams,
			HttpServletResponse httpServletResponse,Principal principal,HttpSession httpSession) throws IllegalAccessException, InvocationTargetException, Exception {
		String partnerId = (String) requestParams.get("partnerId");
		JSONObject jsonObject = partnerService.viewPartnerInformationByPartnerId(Long.parseLong(partnerId));
		httpServletResponse.getWriter().write(jsonObject.toJSONString());
	}
	

	@RequestMapping(value = "getOrganizationsByPartnerId", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> getOrganizationsByPartnerId(HttpServletRequest request,
			HttpServletResponse httpServletResponse,HttpSession httpSession) throws IllegalAccessException, InvocationTargetException, Exception {

		String partnerId = (String) httpSession.getAttribute("partnerId");

		RestTemplate restTemplate = new RestTemplate();
		String url = com.util.Utils.MAIN_URL+"getOrganizationByPartnerId";
		JSONObject requestToSend = new JSONObject();
		requestToSend.put("partnerId", partnerId);
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
			String status = (String) responseJson.get("status");
			if (status != null && status.equals("SUCCESS")) {
				responseObject.put("partnersOrganization", responseJson.get("organizations"));
				responseObject.put("status", (String) responseJson.get("status"));
			}

			else {
				responseObject.put("status", "FAIL");
			}

		}

		return responseObject;
	}
}
