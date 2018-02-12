package com.dao;

import java.util.List;


import com.model.AssesmentCategory;
import com.model.AssesmentSections;

public interface AssesmentSectionsDao extends GenericDao<AssesmentSections, Long>{

	List<AssesmentSections> findByAssesmentId(Long assesmentId);

	
}
