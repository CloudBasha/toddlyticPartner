package com.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;

import com.dao.CmsUserDao;
import com.model.CmsUser;





@Repository
public class CmsUserDaoImpl extends GenericDaoImpl<CmsUser, Long>
        implements CmsUserDao {

	@Override
	public CmsUser findByUserName(String userName) {
		// TODO Auto-generated method stub
		Query query = getEntityManager()
                .createQuery(
                        "from CmsUser cm " +
                                "where cm.userName=:userName");
        query.setParameter("userName", userName);
        try{
        	return (CmsUser) query.getSingleResult();
        }
        catch(Exception e){
        	return null;
        }
	}

	@Override
	public CmsUser findByEmail(String email) {
		// TODO Auto-generated method stub
		Query query = getEntityManager()
                .createQuery(
                        "from CmsUser cm " +
                                "where cm.emailAddress=:emailAddress");
        query.setParameter("emailAddress", email);
        try{
        	return (CmsUser) query.getSingleResult();
        }
        catch(Exception e){
        	return null;
        }
	}

	@Override
	public List<CmsUser> findByOrgId(long orgId) {
		// TODO Auto-generated method stub
		Query query = getEntityManager()
                .createQuery(
                        "from CmsUser cm " +
                                "where cm.organization.organizationId=:organizationId");
        query.setParameter("organizationId", orgId);
        try{
        	return query.getResultList();
        }
        catch(Exception e){
        	return null;
        }

	}

	@Override
	public List<CmsUser> getAllActiveCmsUsersByOrgId(long organizationId) {
		// TODO Auto-generated method stub
		Query query = getEntityManager()
                .createQuery(
                        "from CmsUser cm " +
                                "where cm.organization.organizationId=:organizationId and cm.deleted=:deleted and cm.activated=:activated");
        query.setParameter("organizationId", organizationId);
        query.setParameter("deleted", Boolean.FALSE);
        query.setParameter("activated", "true");
        try{
        	return query.getResultList();
        }
        catch(Exception e){
        	return null;
        }
	}

	@Override
	public List<CmsUser> findByPartnerId(long partnerId) {
		// TODO Auto-generated method stub
		Query query = getEntityManager()
                .createQuery(
                        "from CmsUser cm " +
                                "where cm.partner.primaryId=:primaryId");
        query.setParameter("primaryId", partnerId);
        try{
        	return query.getResultList();
        }
        catch(Exception e){
        	return null;
        }
	}

	

	

	
	
	

    
}
