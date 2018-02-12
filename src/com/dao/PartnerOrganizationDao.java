package com.dao;

import java.util.List;


import com.model.PartnerAssesments;
import com.model.PartnerOrganization;

public interface PartnerOrganizationDao extends GenericDao<PartnerOrganization, Long>{

	List<PartnerOrganization> getPartnerOrganizationByPartnerId(Long partnerId);

	
}
