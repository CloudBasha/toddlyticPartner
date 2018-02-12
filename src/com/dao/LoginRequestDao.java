package com.dao;




import java.util.Collection;
import java.util.Date;
import java.util.List;

import com.model.CmsUser;
import com.model.LoginRequest;


public interface LoginRequestDao extends GenericDao<LoginRequest, Long> {

	public LoginRequest getLatestLoginCounterByUserAuthentication(CmsUser cmsUser);
	
	public List<LoginRequest> getLoginRequestByUserAuthentication(CmsUser cmsUser);

	public List<LoginRequest> getAllLoginRequestByOrgIdAndDateRange(long org_id,Date startDate,Date endDate);

}
