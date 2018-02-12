package com.services;

import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestBody;

import com.dto.AssesmentDetails;
import com.dto.PartnerAssesmentDto;
import com.model.Assesment;
import com.model.AssesmentCategory;
import com.model.CmsUser;
import com.model.Language;
import com.model.Partner;


public interface PartnerService {

	
	
	public List<Partner> getAllPartners();
	
	
	public List<PartnerAssesmentDto> getPartnerAssesmentByPartnerId(Long partnerId);
	
	public CmsUser getCmsUserByEmail(String email);
	
	public void createPartnerOrganization(String partnerId,String organizationId,String createdBy);
	
	public Map<String,Object> changePassword(String userName,String currentPassword,String newPassword);


	public Map<String, Object> getUserContactInfoById(String userName);


	public JSONObject getLoggedInPartnerChilds(String partnerId);


	public JSONObject getPartnerDetailsById(long partnerId) throws org.json.simple.parser.ParseException;


	public JSONObject viewPartnerInformationByPartnerId(long partnerId) throws org.json.simple.parser.ParseException;


	public JSONObject getLoggedInPartnerAllChilds(String partnerId,JSONObject mainJSONObject,JSONArray mainJsonArray);


	public void changeParentPartner(String parentId, String childId);


	public String changeOrganizationPartner(String organizationId,
			String partnerId,String currentParentPartnerId);


	public JSONObject createUserForPartner(Map<String, Object> requestParams);


	public JSONObject activateAccount(CmsUser cmsUser, String password);


	public JSONObject listUserForPartner(String partnerId);


	public JSONObject getAllParentPartners();


	public JSONObject createPartner(Map<String, Object> requestParams) throws Exception;


	public void updatePartnerPhoto(String partnerId, String photoUrl);


	public JSONObject updatePartnerInformation(Map<String, Object> requestParams);
	
	
}

