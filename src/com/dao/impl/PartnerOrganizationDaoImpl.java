package com.dao.impl;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;


import com.dao.PartnerAssesmentsDao;
import com.dao.PartnerOrganizationDao;
import com.model.PartnerAssesments;
import com.model.PartnerOrganization;

@Repository
public class PartnerOrganizationDaoImpl extends GenericDaoImpl<PartnerOrganization, Long> implements PartnerOrganizationDao{

	

	@Override
	public List<PartnerOrganization> getPartnerOrganizationByPartnerId(
			Long partnerId) {
		// TODO Auto-generated method stub
		try {
			Query query = getEntityManager().createQuery(
					"from PartnerOrganization cm " + "where cm.partners.primaryId=:primaryId");
			query.setParameter("primaryId", partnerId);
			return query.getResultList();
		} catch (Exception e) {
			return null;
		}
	}

	
}
