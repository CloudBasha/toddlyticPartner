package com.dao.impl;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;


import com.dao.AssesmentDao;
import com.model.Assesment;

@Repository
public class AssesmentDaoImpl extends GenericDaoImpl<Assesment, Long> implements AssesmentDao{

	@Override
	public Assesment findAllChildrenById(long assesmentId) {
		// TODO Auto-generated method stub
		Query query = getEntityManager()
                .createQuery(
                        "from Assesment cm " +
                                " join fetch cm.assesmentSections asec join fetch asec.assesmentSectionCriteriaList ascriteria join fetch ascriteria.assesmentSectionCriteriaAnswersList asca where cm.primaryId=:primaryId ");
        query.setParameter("primaryId", assesmentId);
        try{
        	return (Assesment) query.getSingleResult();
        }
        catch(Exception e){
        	return null;
        }
	}

	
}
