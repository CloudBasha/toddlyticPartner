package com.dao;

import java.util.List;


import com.model.PartnerAssesments;

public interface PartnerAssesmentsDao extends GenericDao<PartnerAssesments, Long>{

	List<PartnerAssesments> getPartnerAssesmentByPartnerId(Long partnerId);

	
}
