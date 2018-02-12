package com.dao.impl;

import java.util.List;

import javax.persistence.Query;

import org.springframework.stereotype.Repository;


import com.dao.AssesmentCategoryDao;
import com.dao.AssesmentSectionsDao;

import com.model.AssesmentCategory;
import com.model.AssesmentSections;

@Repository
public class AssesmentSectionsDaoImpl extends GenericDaoImpl<AssesmentSections, Long> implements AssesmentSectionsDao{

	@Override
	public List<AssesmentSections> findByAssesmentId(Long assesmentId) {
		// TODO Auto-generated method stub
		Query query = getEntityManager()
                .createQuery(
                        "from AssesmentSections cm " +
                                "where cm.assesment.primaryId=:primaryId");
        query.setParameter("primaryId", assesmentId);
        try{
        	return query.getResultList();
        }
        catch(Exception e){
        	return null;
        }
	}

	
}
