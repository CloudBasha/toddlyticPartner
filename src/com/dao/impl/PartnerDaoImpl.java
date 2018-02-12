package com.dao.impl;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;





import com.dao.PartnerDao;
import com.model.Partner;

@Repository
public class PartnerDaoImpl extends GenericDaoImpl<Partner, Long> implements PartnerDao{

	@Override
	public List<Partner> getPartnersByParentId(long parentPartnerId) {
		// TODO Auto-generated method stub
		try {
			Query query = getEntityManager().createQuery(
					"from Partner cm " + "where cm.paraentPartner.primaryId=:primaryId");
			query.setParameter("primaryId", parentPartnerId);
			return query.getResultList();
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public Long getNumberOfPartnersByParentId(Long parentPartnerId) {
		// TODO Auto-generated method stub
		try {
			Query query = getEntityManager().createQuery(
					"select COUNT(cm) from Partner cm " + "where cm.paraentPartner.primaryId=:primaryId");
			query.setParameter("primaryId", parentPartnerId);
			long count = (long)query.getSingleResult();
			return count;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<Partner> getAllParentPartners() {
		// TODO Auto-generated method stub
		try {
			Query query = getEntityManager().createQuery(
					"from Partner cm " + "where cm.paraentPartner is null");
			
			return query.getResultList();
		} catch (Exception e) {
			return null;
		}
	}

	

}
