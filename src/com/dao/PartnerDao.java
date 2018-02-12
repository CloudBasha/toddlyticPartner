package com.dao;


import java.util.List;

import com.model.Partner;

public interface PartnerDao extends GenericDao<Partner, Long>{

	List<Partner> getPartnersByParentId(long parentPartnerId);

	Long getNumberOfPartnersByParentId(Long parentPartnerId);

	List<Partner> getAllParentPartners();

	
}
