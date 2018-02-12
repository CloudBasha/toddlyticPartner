package com.dao;


import com.model.Assesment;

public interface AssesmentDao extends GenericDao<Assesment, Long>{

	Assesment findAllChildrenById(long assesmentId);

	
}
