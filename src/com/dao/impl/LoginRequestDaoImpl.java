package com.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;



import com.dao.LoginRequestDao;
import com.model.CmsUser;
import com.model.LoginRequest;



@Repository
public class LoginRequestDaoImpl extends GenericDaoImpl<LoginRequest, Long>
        implements LoginRequestDao {

	@Override
	public LoginRequest getLatestLoginCounterByUserAuthentication(
			CmsUser cmsUser) {
		// TODO Auto-generated method stub
		 Query query = getEntityManager()
	                .createQuery(
	                        "from LoginRequest lr " +
	                                "where lr.loginRequestId=(select max(lr1.loginRequestId) from LoginRequest lr1 where lr1.cmsUser=:cmsUser) ");
	        query.setParameter("cmsUser", cmsUser);
	        try {
	            return (LoginRequest) query.getSingleResult();
	        } catch (NoResultException e) {
	            return null;
	        }
	}

	@Override
	public List<LoginRequest> getLoginRequestByUserAuthentication(
			CmsUser cmsUser) {
		// TODO Auto-generated method stub
		 Query query = getEntityManager()
	                .createQuery(
	                        "from LoginRequest lr where lr.cmsUser=:cmsUser) ");
	        query.setParameter("cmsUser", cmsUser);
	        try {
	            return query.getResultList();
	        } catch (NoResultException e) {
	            return null;
	        }
	}

	@Override
	public List<LoginRequest> getAllLoginRequestByOrgIdAndDateRange(long org_id,Date startDate,Date endDate) {
		// TODO Auto-generated method stub
		String dateQuery="";
		if(startDate!=null){
			dateQuery+=" and lr.loginDateTime BETWEEN :startDate AND :endDate";
		}
		Query query = getEntityManager()
                .createQuery(
                        "from LoginRequest lr where lr.cmsUser.organization.organizationId=:organizationId "+dateQuery+" order by lr.loginDateTime desc");
        query.setParameter("organizationId", org_id);
        if(startDate!=null){
        	query.setParameter("startDate", startDate);
        	query.setParameter("endDate", endDate);
        }
        try {
            return query.getResultList();
        } catch (NoResultException e) {
            return null;
        }
	}

	
	
	

    
}
