package com.dao.impl;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;


import com.dao.PartnerAssesmentsDao;
import com.model.PartnerAssesments;

@Repository
public class PartnerAssesmentsDaoImpl extends GenericDaoImpl<PartnerAssesments, Long> implements PartnerAssesmentsDao{

	@Override
	public List<PartnerAssesments> getPartnerAssesmentByPartnerId(Long partnerId) {
		// TODO Auto-generated method stub
		try {
			Query query = getEntityManager().createQuery(
					"from PartnerAssesments cm " + "where cm.partners.primaryId=:primaryId");
			query.setParameter("primaryId", partnerId);
			return query.getResultList();
		} catch (Exception e) {
			return null;
		}
	}

	
}
