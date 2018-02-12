package com.dao;




import java.util.Collection;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.model.CmsUser;


public interface CmsUserDao extends GenericDao<CmsUser, Long> {

	CmsUser findByUserName(String userName);

	CmsUser findByEmail(String email);
	
	List<CmsUser> findByOrgId(long orgId);

	List<CmsUser> getAllActiveCmsUsersByOrgId(long organizationId);

	List<CmsUser> findByPartnerId(long partnerId);
    

}
