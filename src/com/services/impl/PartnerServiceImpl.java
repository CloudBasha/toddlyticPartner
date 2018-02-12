package com.services.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.TimeUnit;

import org.apache.commons.codec.binary.Base64;
import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import com.dao.AssesmentCategoryDao;
import com.dao.AssesmentDao;
import com.dao.AssesmentSectionCriteriaAnswersDao;
import com.dao.AssesmentSectionCriteriaDao;
import com.dao.AssesmentSectionsDao;
import com.dao.CmsUserDao;
import com.dao.LanguageDao;
import com.dao.PartnerAssesmentsDao;
import com.dao.PartnerDao;
import com.dao.PartnerOrganizationDao;
import com.dto.AssesmentDetails;
import com.dto.AssesmentSectionCriteriaAnswersDto;
import com.dto.AssesmentSectionCriteriaDto;
import com.dto.AssesmentSectionsDto;
import com.dto.PartnerAssesmentDto;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.model.Assesment;
import com.model.AssesmentCategory;
import com.model.AssesmentSectionCriteria;
import com.model.AssesmentSectionCriteriaAnswers;
import com.model.AssesmentSections;
import com.model.CmsUser;
import com.model.Language;
import com.model.Partner;
import com.model.PartnerAssesments;
import com.model.PartnerOrganization;
import com.obj.ConstantVar;
import com.s3.S3Exception;
import com.s3.S3Func;
import com.services.AssesmentService;
import com.services.PartnerService;

@Service
public class PartnerServiceImpl implements PartnerService {

	private Logger log = Logger.getLogger(this.getClass());
	
	
	

	@Autowired
	private AssesmentDao assesmentDao;
	
	@Autowired
	private PartnerAssesmentsDao partnerAssesmentsDao;
	
	@Autowired
	private PartnerDao partnerDao;

	@Autowired
	private AssesmentCategoryDao assesmentCategoryDao;

	@Autowired
	private AssesmentSectionsDao assesmentSectionsDao;

	@Autowired
	private AssesmentSectionCriteriaDao assesmentSectionCriteriaDao;

	@Autowired
	private AssesmentSectionCriteriaAnswersDao assesmentSectionCriteriaAnswersDao;

	@Autowired
	private LanguageDao languageDao;
	
	@Autowired
	private PartnerOrganizationDao partnerOrganizationDao;

	@Autowired
	private CmsUserDao cmsUserDao;
	
	@Override
	@Transactional
	public List<Partner> getAllPartners() {
		// TODO Auto-generated method stub
		return partnerDao.findAll();
	}

	@Override
	@Transactional
	public List<PartnerAssesmentDto> getPartnerAssesmentByPartnerId(
			Long partnerId) {
		// TODO Auto-generated method stub
		List<PartnerAssesments> partnerAssesmentsList = partnerAssesmentsDao.getPartnerAssesmentByPartnerId(partnerId);
		List<PartnerAssesmentDto> partnerAssesmentDtoList = new ArrayList<>();
		for(PartnerAssesments partnerAssesments:partnerAssesmentsList){
			Partner partner = partnerAssesments.getPartners();
			Assesment assesment = partnerAssesments.getAssesments();
			PartnerAssesmentDto partnerAssesmentDto = new PartnerAssesmentDto();
			partnerAssesmentDto.setAssesmentCategory(assesment.getAssesmentCategory().getName());
			partnerAssesmentDto.setAssesmentId(assesment.getPrimaryId());
			partnerAssesmentDto.setAssesmentName(assesment.getName());
			partnerAssesmentDto.setAssesmentStatus(assesment.getStatus());
			partnerAssesmentDto.setPartnerId(partner.getPrimaryId());
			partnerAssesmentDto.setPartnerName(partner.getName());
			partnerAssesmentDto.setPartnerStatus(partner.getStatus());
			partnerAssesmentDtoList.add(partnerAssesmentDto);
		}
		return partnerAssesmentDtoList;
	}

	@Override
	@Transactional
	public void createPartnerOrganization(String partnerId,String organizationId,String createdBy) {
		// TODO Auto-generated method stub
		Partner partner = partnerDao.findById(Long.parseLong(partnerId));
		partner.setNumberOfOrganizations(partner.getNumberOfOrganizations()+1);
		partnerDao.merge(partner);
		PartnerOrganization partnerOrganization = new PartnerOrganization();
		partnerOrganization.setPartners(partner);
		partnerOrganization.setCreatedBy(createdBy);
		partnerOrganization.setCreatedDate(LocalDateTime.now());
		partnerOrganization.setOrganizationId(organizationId);
		partnerOrganizationDao.persist(partnerOrganization);
	}

	@Override
	@Transactional
	public Map<String, Object> changePassword(String userName,
			String currentPassword, String newPassword) {
		// TODO Auto-generated method stub
		CmsUser cmsUser = cmsUserDao.findByUserName(userName);
		Map<String,Object> responseParam = new HashMap<>();
		if(cmsUser.getPassword().equals(currentPassword)){
			cmsUser.setPassword(newPassword);
			cmsUser.setModifiedDate(new Date());
			cmsUserDao.merge(cmsUser);
			responseParam.put("status", "SUCCESS");
		}
		else{
			responseParam.put("status", "FAIL");
			responseParam.put("reason", "Current password is not correct");
		}
		return responseParam;
	}

	@Override
	@Transactional
	public Map<String, Object> getUserContactInfoById(String userName) {
		// TODO Auto-generated method stub
		CmsUser cmsUser = cmsUserDao.findByUserName(userName);
		Partner partner = cmsUser.getPartner();
		Map<String,Object> responseParam = new HashMap<>();
		responseParam.put("name", cmsUser.getName());
		responseParam.put("email", cmsUser.getEmailAddress());
		responseParam.put("mobileNumber", partner.getContactNumber());
		responseParam.put("companyName", partner.getName());
		
		return responseParam;
	}

	@Override
	@Transactional
	public JSONObject getLoggedInPartnerChilds(String partnerId) {
		// TODO Auto-generated method stub
		List<Partner> childPartners = partnerDao.getPartnersByParentId(Long.parseLong(partnerId));
		JSONObject responseJSON = new JSONObject();
		JSONArray array = new JSONArray();
		for(Partner childPartner:childPartners){
			JSONObject partnerJSON = new JSONObject();
			partnerJSON.put("partnerId", childPartner.getPrimaryId()+"");
			partnerJSON.put("name", childPartner.getName());
			partnerJSON.put("noOfOrgs", childPartner.getNumberOfOrganizations()+"");
			if(childPartner.getStatus().equals("true")){
			partnerJSON.put("status", "Active");
			}
			else{
				partnerJSON.put("noOfOrgs", "Not Active");
			}
			Long numberOfChildPartner = partnerDao.getNumberOfPartnersByParentId(childPartner.getPrimaryId());
			partnerJSON.put("noOfChildPartners", numberOfChildPartner+"");
			array.add(partnerJSON);
		}
		responseJSON.put("childPartners", array);
		responseJSON.put("status", "SUCCESS");
		return responseJSON;
	}

	@Override
	@Transactional(readOnly=true)
	public JSONObject getPartnerDetailsById(long partnerId) throws org.json.simple.parser.ParseException {
		// TODO Auto-generated method stub
		List<Partner> childPartners = partnerDao.getPartnersByParentId(partnerId);
		JSONObject responseJSON = new JSONObject();
		JSONArray array = new JSONArray();
		try{
		for(Partner childPartner:childPartners){
			JSONObject partnerJSON = new JSONObject();
			partnerJSON.put("partnerId", childPartner.getPrimaryId()+"");
			partnerJSON.put("name", childPartner.getName());
			partnerJSON.put("noOfOrgs", childPartner.getNumberOfOrganizations()+"");
			if(childPartner.getStatus().equals("true")){
			partnerJSON.put("status", "Active");
			}
			else{
				partnerJSON.put("status", "Not Active");
			}
			Long numberOfChildPartner = partnerDao.getNumberOfPartnersByParentId(childPartner.getPrimaryId());
			partnerJSON.put("noOfChildPartners", numberOfChildPartner+"");
			array.add(partnerJSON);
		}
		responseJSON.put("childPartners", array);
		
		RestTemplate restTemplate = new RestTemplate();
		String url = com.util.Utils.MAIN_URL+"getOrganizationByPartnerId";
		JSONObject requestToSend = new JSONObject();
		requestToSend.put("partnerId", partnerId+"");
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		String plainCreds = "partner:12345";
		byte[] plainCredsBytes = plainCreds.getBytes();
		byte[] base64CredsBytes = Base64.encodeBase64(plainCredsBytes);
		String base64Creds = new String(base64CredsBytes);
		headers.add("Authorization", "Basic " + base64Creds);
		HttpEntity<String> entity = new HttpEntity<String>(requestToSend.toString(), headers);
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);
		
		if (response.getStatusCode() == HttpStatus.OK) {
			JSONParser parser = new JSONParser();
			JSONObject organizationResponseJson = (JSONObject) parser.parse(response.getBody());
			String status = (String) organizationResponseJson.get("status");
			if (status != null && status.equals("SUCCESS")) {
				responseJSON.put("partnersOrganization", organizationResponseJson.get("organizations"));
			}
			else {
				responseJSON.put("status", "FAIL");
			}

		}
		
	}
		catch(Exception e){
			responseJSON.put("status", "FAIL");
			e.printStackTrace();
		}
		
	return responseJSON;	
	}

	@Override
	@Transactional
	public JSONObject viewPartnerInformationByPartnerId(long partnerId) throws org.json.simple.parser.ParseException {
		// TODO Auto-generated method stub
		JSONObject responseJSON = new JSONObject();
		try{
		RestTemplate restTemplate = new RestTemplate();
		String url = com.util.Utils.MAIN_URL+"viewPartnerInformationByPartnerId";
		JSONObject requestToSend = new JSONObject();
		requestToSend.put("partnerId", partnerId+"");
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		String plainCreds = "partner:12345";
		byte[] plainCredsBytes = plainCreds.getBytes();
		byte[] base64CredsBytes = Base64.encodeBase64(plainCredsBytes);
		String base64Creds = new String(base64CredsBytes);
		headers.add("Authorization", "Basic " + base64Creds);
		HttpEntity<String> entity = new HttpEntity<String>(requestToSend.toString(), headers);
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);
		
		JSONArray array = new JSONArray();
		if (response.getStatusCode() == HttpStatus.OK) {
			JSONParser parser = new JSONParser();
			 responseJSON = (JSONObject) parser.parse(response.getBody());
			
			
		}
		
		else{
			responseJSON.put("status", "FAIL");
		}
		}
		catch(Exception e){
			responseJSON.put("status", "FAIL");
			e.printStackTrace();
		}
		return responseJSON;
	}
	
	/*
	@Override
	@Transactional
	public List<Partner> getLoggedInPartnerAllChilds(String partnerId,List<Partner> resultPartnersParam,JSONArray parentJSONArray) {
		// TODO Auto-generated method stub
		if(resultPartnersParam==null){
			resultPartnersParam = new ArrayList<>();
			Partner parentPartner = partnerDao.findById(Long.parseLong(partnerId));
			if(parentPartner.getParaentPartner()!=null){
				parentPartner.setParentPartnerId(Integer.parseInt(parentPartner.getParaentPartner().getPrimaryId()+""));	
			}
			resultPartnersParam.add(parentPartner);
			parentJSONArray = new JSONArray();
		}
		List<Partner> childPartners = partnerDao.getPartnersByParentId(Long.parseLong(partnerId));
		//resultPartnersParam.addAll(childPartners);
		for(Partner childPartner:childPartners){
			childPartner.setParentPartnerId(Integer.parseInt(partnerId));
			resultPartnersParam.add(childPartner);
			getLoggedInPartnerAllChilds(childPartner.getPrimaryId()+"",resultPartnersParam,parentJSONArray);
		}
		return resultPartnersParam;
	}
	*/
	
	@Override
	@Transactional
	public JSONObject getLoggedInPartnerAllChilds(String partnerId,JSONObject mainJSONObject,JSONArray mainJsonArray) {
		// TODO Auto-generated method stub
		List<Partner> childPartners = null;
		if(mainJSONObject==null){
			Partner child = partnerDao.findById(Long.parseLong(partnerId));
			mainJSONObject = new JSONObject();
			mainJSONObject.put("name", child.getName());
			mainJSONObject.put("partnerId", child.getPrimaryId()+"");
			mainJsonArray = new JSONArray();
			childPartners = partnerDao.getPartnersByParentId(Long.parseLong(partnerId));
			for(Partner childPartner:childPartners){
				JSONObject childJSONObject = new JSONObject(); 
				childJSONObject.put("name", childPartner.getName());
				childJSONObject.put("partnerId", childPartner.getPrimaryId()+"");
				mainJsonArray.add(childJSONObject);
				//getLoggedInPartnerAllChilds(childPartner.getPrimaryId()+"",mainJSONObject,mainJsonArray);
			}
		}
		else{
		childPartners = partnerDao.getPartnersByParentId(Long.parseLong(partnerId));
		if(childPartners==null || childPartners.size()==0){
			mainJSONObject.put("childPartners", mainJsonArray);
		}
		JSONArray childJSONArray = new JSONArray();
		Partner child = partnerDao.findById(Long.parseLong(partnerId));
		if(childPartners!=null && childPartners.size()>0){
		JSONObject childJSON = new JSONObject(); 
		childJSON.put("name", child.getName());
		childJSON.put("partnerId", child.getPrimaryId()+"");
		
		for(Partner childPartner:childPartners){
			JSONObject childJSONObject = new JSONObject(); 
			childJSONObject.put("name", childPartner.getName());
			childJSONObject.put("partnerId", childPartner.getPrimaryId()+"");
			childJSONArray.add(childJSONObject);
			//getLoggedInPartnerAllChilds(childPartner.getPrimaryId()+"",mainJSONObject,mainJsonArray);
		}
		childJSON.put("childPartners", childJSONArray);
		mainJsonArray.add(childJSON);
		}
		}
		for(Partner childPartner:childPartners){
			getLoggedInPartnerAllChilds(childPartner.getPrimaryId()+"",mainJSONObject,mainJsonArray);
		}
		return mainJSONObject;
	}

	@Override
	@Transactional
	public void changeParentPartner(String parentId, String childId) {
		// TODO Auto-generated method stub
		Partner parentPartner = partnerDao.findById(Long.parseLong(parentId));
		Partner childPartner = partnerDao.findById(Long.parseLong(childId));
		childPartner.setParaentPartner(parentPartner);
		partnerDao.merge(childPartner);
		
	}

	@Override
	@Transactional
	public String changeOrganizationPartner(String organizationId,
			String newPartnerId,String currentPartnerId) {
		// TODO Auto-generated method stub
		RestTemplate restTemplate = new RestTemplate();
		String url = com.util.Utils.MAIN_URL+"changeOrganizationPartner";
		JSONObject requestToSend = new JSONObject();
		requestToSend.put("partnerId", newPartnerId+"");
		requestToSend.put("organizationId", organizationId+"");
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		String plainCreds = "partner:12345";
		byte[] plainCredsBytes = plainCreds.getBytes();
		byte[] base64CredsBytes = Base64.encodeBase64(plainCredsBytes);
		String base64Creds = new String(base64CredsBytes);
		headers.add("Authorization", "Basic " + base64Creds);
		HttpEntity<String> entity = new HttpEntity<String>(requestToSend.toString(), headers);
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);
		
		if (response.getStatusCode() == HttpStatus.OK) {
			JSONParser parser = new JSONParser();
			JSONObject organizationResponseJson;
			try {
				organizationResponseJson = (JSONObject) parser.parse(response.getBody());
				String status = (String) organizationResponseJson.get("status");
				Partner currentParentPartner = partnerDao.findById(Long.parseLong(currentPartnerId));
				currentParentPartner.setNumberOfOrganizations(currentParentPartner.getNumberOfOrganizations()-1);
				partnerDao.merge(currentParentPartner);
				Partner newPartner = partnerDao.findById(Long.parseLong(newPartnerId));
				newPartner.setNumberOfOrganizations(newPartner.getNumberOfOrganizations()+1);
				partnerDao.merge(newPartner);
				return status;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "FAIL";
			}
			
		}
		
		return null;
		
	}

	@Override
	@Transactional
	public JSONObject createUserForPartner(Map<String, Object> requestParams) {
		// TODO Auto-generated method stub
		JSONObject responseJSON = new JSONObject();
		String email = (String)requestParams.get("email");
		String partnerId = (String)requestParams.get("partnerId");
		Partner partner = partnerDao.findById(Long.parseLong(partnerId));
		//CmsUser cmsUserDbReferred = cmsUserDao.findByPartnerId(Long.parseLong(partnerId));		
		String name = (String)requestParams.get("name");
		String mobileNumber = (String)requestParams.get("mobileNumber");
		CmsUser cmsUserDb = cmsUserDao.findByEmail(email);
		if(cmsUserDb!=null){
			responseJSON.put("status","FAIL");
			responseJSON.put("remark","Email address already exists. Please register another email address");
			return responseJSON;
		}
		else{
			CmsUser cmsUser = new CmsUser();
			cmsUser.setActivated("false");
			cmsUser.setAdmin(false);
			cmsUser.setCreatedBy(partnerId);
			cmsUser.setCreatedDate(new Date());
			cmsUser.setDeleted(false);
			cmsUser.setEmailAddress(email);
			cmsUser.setEmailVerified(false);
			cmsUser.setInvited(false);
			cmsUser.setLoginAttempts(0);
			cmsUser.setMailSend(false);
			cmsUser.setMobileNumber(mobileNumber);
			cmsUser.setName(name);
			cmsUser.setPartner(partner);
			//cmsUser.setReferedUser(cmsUserDbReferred);
			cmsUser.setUserLocked(false);
			cmsUser.setUserName(email);
			cmsUserDao.persist(cmsUser);
			responseJSON.put("status","SUCCESS");
			return responseJSON;
		}
		
	}

	@Override
	@Transactional
	public CmsUser getCmsUserByEmail(String email) {
		// TODO Auto-generated method stub
		return cmsUserDao.findByEmail(email);
	}

	@Override
	@Transactional
	public JSONObject activateAccount(CmsUser cmsUser, String password) {
		// TODO Auto-generated method stub
		JSONObject responseJSON = new JSONObject();
		cmsUser.setActivated("true");
		cmsUser.setEmailVerified(true);
		cmsUser.setPassword(password);
		cmsUser.setLoginAttempts(0);
		cmsUserDao.merge(cmsUser);
		responseJSON.put("status","SUCCESS");
		return responseJSON;
	}

	@Override
	@Transactional
	public JSONObject listUserForPartner(String partnerId) {
		// TODO Auto-generated method stub
		List<CmsUser> cmsUsers = cmsUserDao.findByPartnerId(Long.parseLong(partnerId));
		JSONObject jsonObject = new JSONObject();
		JSONArray array = new JSONArray();
		for(CmsUser cmsUser:cmsUsers){
			JSONObject cmsUserJSON = new JSONObject();
			cmsUserJSON.put("id", cmsUser.getCmsUserId()+"");
			cmsUserJSON.put("userName", cmsUser.getUserName());
			cmsUserJSON.put("email", cmsUser.getEmailAddress());
			cmsUserJSON.put("name", cmsUser.getName());
			if (cmsUser.getActivated()!=null && cmsUser.getActivated().equals("true")){
			cmsUserJSON.put("status", "Activated");
			}
			else{
				cmsUserJSON.put("status", "Invited");	
			}
			cmsUserJSON.put("mobileNumber", cmsUser.getMobileNumber());
			array.add(cmsUserJSON);
		}
		jsonObject.put("users", array);
		jsonObject.put("status", "SUCCESS");
		return jsonObject;
	}

	@Override
	@Transactional
	public JSONObject getAllParentPartners() {
		// TODO Auto-generated method stub
		List<Partner> childPartners =  partnerDao.getAllParentPartners();
		JSONObject responseJSON = new JSONObject();
		JSONArray array = new JSONArray();
		for(Partner childPartner:childPartners){
			JSONObject partnerJSON = new JSONObject();
			partnerJSON.put("partnerId", childPartner.getPrimaryId()+"");
			partnerJSON.put("name", childPartner.getName());
			partnerJSON.put("noOfOrgs", childPartner.getNumberOfOrganizations()+"");
			if(childPartner.getStatus().equals("true")){
			partnerJSON.put("status", "Active");
			}
			else{
				partnerJSON.put("noOfOrgs", "Not Active");
			}
			Long numberOfChildPartner = partnerDao.getNumberOfPartnersByParentId(childPartner.getPrimaryId());
			partnerJSON.put("noOfChildPartners", numberOfChildPartner+"");
			array.add(partnerJSON);
		}
		responseJSON.put("childPartners", array);
		responseJSON.put("status", "SUCCESS");
		return responseJSON;
		
	}

	@Override
	@Transactional
	public JSONObject createPartner(Map<String, Object> requestParams)throws Exception {
		// TODO Auto-generated method stub
		JSONObject responseJSON = new JSONObject();
		String email = (String)requestParams.get("email");
		String partnerId = (String)requestParams.get("partnerId");
		Partner partner = partnerDao.findById(Long.parseLong(partnerId));
		String name = (String)requestParams.get("name");
		String companyName = (String)requestParams.get("companyName");
		String mobileNumber = (String)requestParams.get("mobileNumber");
		CmsUser cmsUserDb = cmsUserDao.findByEmail(email);
		Partner newPartner = null;
		if(cmsUserDb!=null){
			responseJSON.put("status","FAIL");
			responseJSON.put("remark","Email address already exists. Please register another email address");
			return responseJSON;
		}
		else{
			newPartner = new Partner();
			newPartner.setBillingEnabled(false);
			newPartner.setContactNumber(mobileNumber);
			newPartner.setCountry("Malaysia");
			newPartner.setStatus("true");
			newPartner.setCreatedBy(partnerId);
			newPartner.setCreatedById(1l);
			newPartner.setCreatedDate(LocalDateTime.now());
			newPartner.setEmail(email);
			newPartner.setName(companyName);
			newPartner.setNumberOfOrganizations(0);
			newPartner.setParaentPartner(partner);
			Set<Partner> partnerSet = new HashSet<>();
			partnerSet.add(newPartner);
			partnerDao.persist(newPartner);
			newPartner = partnerSet.iterator().next();
			
			CmsUser cmsUser = new CmsUser();
			cmsUser.setActivated("false");
			cmsUser.setAdmin(false);
			cmsUser.setCreatedBy(partnerId);
			cmsUser.setCreatedDate(new Date());
			cmsUser.setDeleted(false);
			cmsUser.setEmailAddress(email);
			cmsUser.setEmailVerified(false);
			cmsUser.setInvited(false);
			cmsUser.setLoginAttempts(0);
			cmsUser.setMailSend(false);
			cmsUser.setMobileNumber(mobileNumber);
			cmsUser.setName(name);
			cmsUser.setPartner(newPartner);
			//cmsUser.setReferedUser(cmsUserDbReferred);
			cmsUser.setUserLocked(false);
			cmsUser.setUserName(email);
			cmsUserDao.persist(cmsUser);
			
		}
		responseJSON.put("status","SUCCESS");
		
		/*Map<String, Object> statusObj = S3Func.createFolderForOrg(ConstantVar.CURRENT_BUCKET, newPartner.getPrimaryId()+"");
		if (statusObj.get("status").equals("Fail"))
			throw new S3Exception("S3 creation failed. Reason: " + statusObj.get("remark"));*/

		
		return responseJSON;
		
	}

	@Override
	@Transactional
	public void updatePartnerPhoto(String partnerId, String photoUrl) {
		// TODO Auto-generated method stub
		Partner partner = partnerDao.findById(Long.parseLong(partnerId));
		partner.setPhotoUrl(photoUrl);
		partnerDao.merge(partner);
	}

	@Override
	@Transactional
	public JSONObject updatePartnerInformation(Map<String, Object> requestParams) {
		// TODO Auto-generated method stub
		String partnerId = (String)requestParams.get("partnerId");
		String userName = (String)requestParams.get("userName");
		String name = (String)requestParams.get("name");
		String email = (String)requestParams.get("email");
		String mobileNumber = (String)requestParams.get("mobileNumber");
		String companyName = (String)requestParams.get("companyName");
		Partner partner = partnerDao.findById(Long.parseLong(partnerId));
		partner.setName(companyName);
		partner.setContactNumber(mobileNumber);
		partnerDao.merge(partner);
		CmsUser cmsUser = cmsUserDao.findByUserName(userName);
		cmsUser.setName(name);
		cmsUserDao.merge(cmsUser);
		JSONObject responseJSON = new JSONObject();
		responseJSON.put("status", "SUCCESS");
		return responseJSON;
	}
	
}

