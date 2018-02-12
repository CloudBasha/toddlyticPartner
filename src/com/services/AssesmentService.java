package com.services;

import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestBody;

import com.dto.AssesmentDetails;

import com.model.Assesment;
import com.model.AssesmentCategory;
import com.model.Language;


public interface AssesmentService {

	
	
	public List<AssesmentCategory> getAssesmentCategories();
	
	public void saveNewAssesment(Map<String, Object> requestParams);
	
	public void updateAssesment(Map<String, Object> requestParams);
	
	public void addSectionsToAssesment(Map<String, Object> requestParams);
	
	public void updateSectionsAssesment(Map<String, Object> requestParams);
	
	public void updateCriteriaAssesmentSections(Map<String, Object> requestParams) throws org.json.simple.parser.ParseException;
	
	public void updateCriteriaAssesmentSectionAnswer(Map<String, Object> requestParams) throws org.json.simple.parser.ParseException;
	
	public void deleteAssesment(Map<String, Object> requestParams);
	
	public void deleteAssesmentSections(Map<String, Object> requestParams);
	
	public void deleteAssesmentSectionsCriteria(Map<String, Object> requestParams);
	
	public void deleteAssesmentSectionsCriteriaAnswers(Map<String, Object> requestParams);
	
	public void addCriteriaToAssesmentSections(Map<String, Object> requestParams) throws org.json.simple.parser.ParseException;
	
	public List<Language> getLanguages();
	
	public List<Assesment> getAssesments();

	public AssesmentDetails getAssesmentById(long assesmentId);
	
	
	
	
}

