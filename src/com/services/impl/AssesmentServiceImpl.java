package com.services.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.TimeUnit;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.AssesmentCategoryDao;
import com.dao.AssesmentDao;
import com.dao.AssesmentSectionCriteriaAnswersDao;
import com.dao.AssesmentSectionCriteriaDao;
import com.dao.AssesmentSectionsDao;
import com.dao.LanguageDao;
import com.dao.PartnerAssesmentsDao;
import com.dao.PartnerDao;
import com.dto.AssesmentDetails;
import com.dto.AssesmentSectionCriteriaAnswersDto;
import com.dto.AssesmentSectionCriteriaDto;
import com.dto.AssesmentSectionsDto;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.model.Assesment;
import com.model.AssesmentCategory;
import com.model.AssesmentSectionCriteria;
import com.model.AssesmentSectionCriteriaAnswers;
import com.model.AssesmentSections;
import com.model.Language;
import com.model.Partner;
import com.model.PartnerAssesments;
import com.services.AssesmentService;

@Service
public class AssesmentServiceImpl implements AssesmentService {

	private Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private AssesmentDao assesmentDao;
	
	@Autowired
	private LanguageDao languageDao; 
	
	@Autowired
	private PartnerAssesmentsDao partnerAssesmentsDao;
	
	@Autowired
	private PartnerDao partnerDao;

	@Autowired
	private AssesmentCategoryDao assesmentCategoryDao;

	@Autowired
	private AssesmentSectionsDao assesmentSectionsDao;

	@Autowired
	private AssesmentSectionCriteriaDao assesmentSectionCriteriaDao;

	@Autowired
	private AssesmentSectionCriteriaAnswersDao assesmentSectionCriteriaAnswersDao;

	

	@Override
	@Transactional
	public List<AssesmentCategory> getAssesmentCategories() {
		// TODO Auto-generated method stub
		return assesmentCategoryDao.findAll();
	}

	@Override
	@Transactional
	public void saveNewAssesment(Map<String, Object> requestParams) {
		// TODO Auto-generated method stub
		String name = (String) requestParams.get("name");
		String description = (String) requestParams.get("description");
		String status = (String) requestParams.get("status");
		String createdBy = (String) requestParams.get("createdBy");
		String assesmentCategoryId = (String) requestParams
				.get("assesmentCategoryId");
		String languageId = (String) requestParams.get("languageId");
		
		Language language = languageDao.findById(Long.parseLong(languageId));
		AssesmentCategory assesmentCategory = assesmentCategoryDao
				.findById(Long.parseLong(assesmentCategoryId));
		Assesment assesment = new Assesment();
		assesment.setAssesmentCategory(assesmentCategory);
		assesment.setCreatedBy(createdBy);
		assesment.setCreatedDate(LocalDateTime.now());
		assesment.setDescription(description);
		assesment.setLanguage(language);
		assesment.setName(name);
		assesment.setStatus(status);
		Set<Assesment> assesmentsSet = new HashSet<>();
		assesmentsSet.add(assesment);
		assesmentDao.persist(assesment);
		
		assesment = assesmentsSet.iterator().next();
		List<String> partnerIdList = (List<String>) requestParams.get("partnerId");
		if(partnerIdList!=null && partnerIdList.size()>0){
			for(String partnerId:partnerIdList){
				PartnerAssesments partnerAssesments = new PartnerAssesments();
				partnerAssesments.setAssesments(assesment);
				partnerAssesments.setCreatedBy(createdBy);
				partnerAssesments.setCreatedDate(LocalDateTime.now());
				Partner partners = partnerDao.findById(Long.parseLong(partnerId));
				partnerAssesments.setPartners(partners);
				partnerAssesmentsDao.persist(partnerAssesments);
			}
		}
	}

	@Override
	@Transactional
	public void addSectionsToAssesment(Map<String, Object> requestParams) {
		// TODO Auto-generated method stub
		String title = (String) requestParams.get("title");
		String description = (String) requestParams.get("description");
		String assesmentId = (String) requestParams.get("assesmentId");
		String languageId = (String) requestParams.get("languageId");
		String createdBy = (String) requestParams.get("createdBy");
		Assesment assesment = assesmentDao
				.findById(Long.parseLong(assesmentId));
		Language language = languageDao.findById(Long.parseLong(languageId));
		AssesmentSections assesmentSections = new AssesmentSections();
		assesmentSections.setAssesment(assesment);
		assesmentSections.setCreatedBy(createdBy);
		assesmentSections.setCreatedDate(LocalDateTime.now());
		assesmentSections.setDescription(description);
		assesmentSections.setLanguage(language);
		assesmentSections.setTitle(title);
		assesmentSectionsDao.persist(assesmentSections);
	}

	@Override
	@Transactional
	public void addCriteriaToAssesmentSections(Map<String, Object> requestParams)
			throws org.json.simple.parser.ParseException {
		// TODO Auto-generated method stub
		String title = (String) requestParams.get("title");
		String description = (String) requestParams.get("description");
		String languageId = (String) requestParams.get("languageId");
		String assesmentSectionsId = (String) requestParams
				.get("assesmentSectionsId");
		String createdBy = (String) requestParams.get("createdBy");
		AssesmentSectionCriteria assesmentSectionCriteria = new AssesmentSectionCriteria();
		AssesmentSections assesmentSections = assesmentSectionsDao
				.findById(Long.parseLong(assesmentSectionsId));
		Language language = languageDao.findById(Long.parseLong(languageId));
		assesmentSectionCriteria.setAssesmentSections(assesmentSections);
		assesmentSectionCriteria.setCreatedBy(createdBy);
		assesmentSectionCriteria.setCreatedDate(LocalDateTime.now());
		assesmentSectionCriteria.setDescription(description);
		assesmentSectionCriteria.setLanguage(language);
		assesmentSectionCriteria.setTitle(title);
		Set<AssesmentSectionCriteria> assesmentSectionCriteriaSet = new HashSet<>();
		assesmentSectionCriteriaSet.add(assesmentSectionCriteria);
		assesmentSectionCriteriaDao.persist(assesmentSectionCriteria);
		assesmentSectionCriteria = assesmentSectionCriteriaSet.iterator()
				.next();

		List<java.util.LinkedHashMap> json = (List<java.util.LinkedHashMap>) requestParams
				.get("answers");
		Iterator<java.util.LinkedHashMap> jsonIterator = json.iterator();
		while (jsonIterator.hasNext()) {
			java.util.LinkedHashMap answersJson = jsonIterator.next();
			String answersTitle = (String) answersJson.get("title");
			String answersValue = (String) answersJson.get("value");
			if (answersValue == null || answersValue.equals("")) {
				answersValue = answersTitle;
			}
			String answersLanguageId = (String) answersJson.get("languageId");
			AssesmentSectionCriteriaAnswers assesmentSectionCriteriaAnswers = new AssesmentSectionCriteriaAnswers();
			assesmentSectionCriteriaAnswers
					.setAssesmentSectionCriteria(assesmentSectionCriteria);
			assesmentSectionCriteriaAnswers.setCreatedBy(createdBy);
			assesmentSectionCriteriaAnswers.setCreatedDate(LocalDateTime.now());
			assesmentSectionCriteriaAnswers.setLanguage(language);
			assesmentSectionCriteriaAnswers.setTitle(answersTitle);
			assesmentSectionCriteriaAnswers.setValue(answersValue);
			assesmentSectionCriteriaAnswersDao
					.persist(assesmentSectionCriteriaAnswers);
		}
		
	}

	@Override
	@Transactional
	public List<Language> getLanguages() {
		// TODO Auto-generated method stub
		return languageDao.findAll();
	}

	@Override
	@Transactional
	public void updateAssesment(Map<String, Object> requestParams) {
		// TODO Auto-generated method stub
		String name = (String) requestParams.get("name");
		String assesmentId = (String) requestParams.get("assesmentId");
		String description = (String) requestParams.get("description");
		String status = (String) requestParams.get("status");
		String updatedBy = (String) requestParams.get("updatedBy");
		String assesmentCategoryId = (String) requestParams
				.get("assesmentCategoryId");
		String languageId = (String) requestParams.get("languageId");
		Language language = languageDao.findById(Long.parseLong(languageId));
		AssesmentCategory assesmentCategory = assesmentCategoryDao
				.findById(Long.parseLong(assesmentCategoryId));
		Assesment assesment = assesmentDao
				.findById(Long.parseLong(assesmentId));
		assesment.setAssesmentCategory(assesmentCategory);
		// assesment.setCreatedBy(createdBy);
		// assesment.setCreatedDate(LocalDateTime.now());
		assesment.setUpdatedBy(updatedBy);
		assesment.setUpdatedDate(LocalDateTime.now());
		assesment.setName(name);
		assesment.setDescription(description);
		assesment.setLanguage(language);
		assesment.setStatus(status);

	}

	@Override
	@Transactional
	public void updateSectionsAssesment(Map<String, Object> requestParams) {
		// TODO Auto-generated method stub
		String title = (String) requestParams.get("title");
		String description = (String) requestParams.get("description");
		String assesmentId = (String) requestParams.get("assesmentId");
		String languageId = (String) requestParams.get("languageId");
		String updatedBy = (String) requestParams.get("updatedBy");
		String assesmentSectionsId = (String) requestParams
				.get("assesmentSectionsId");
		Assesment assesment = assesmentDao
				.findById(Long.parseLong(assesmentId));
		Language language = languageDao.findById(Long.parseLong(languageId));
		AssesmentSections assesmentSections = assesmentSectionsDao
				.findById(Long.parseLong(assesmentSectionsId));
		assesmentSections.setAssesment(assesment);
		assesmentSections.setUpdatedBy(updatedBy);
		assesmentSections.setUpdatedDate(LocalDateTime.now());
		assesmentSections.setDescription(description);
		assesmentSections.setLanguage(language);
		assesmentSections.setTitle(title);
		assesmentSectionsDao.merge(assesmentSections);
	}

	@Override
	@Transactional
	public void updateCriteriaAssesmentSections(
			Map<String, Object> requestParams)
			throws org.json.simple.parser.ParseException {
		// TODO Auto-generated method stub
		String title = (String) requestParams.get("title");
		String description = (String) requestParams.get("description");
		String languageId = (String) requestParams.get("languageId");
		String assesmentSectionsId = (String) requestParams
				.get("assesmentSectionsId");
		String assesmentSectionCriteriaId = (String) requestParams
				.get("assesmentSectionCriteriaId");
		String updatedBy = (String) requestParams.get("updatedBy");
		AssesmentSectionCriteria assesmentSectionCriteria = assesmentSectionCriteriaDao
				.findById(Long.parseLong(assesmentSectionCriteriaId));
		AssesmentSections assesmentSections = assesmentSectionsDao
				.findById(Long.parseLong(assesmentSectionsId));
		Language language = languageDao.findById(Long.parseLong(languageId));
		assesmentSectionCriteria.setAssesmentSections(assesmentSections);
		assesmentSectionCriteria.setUpdatedBy(updatedBy);
		assesmentSectionCriteria.setUpdatedDate(LocalDateTime.now());
		assesmentSectionCriteria.setDescription(description);
		assesmentSectionCriteria.setLanguage(language);
		assesmentSectionCriteria.setTitle(title);
		assesmentSectionCriteriaDao.merge(assesmentSectionCriteria);

	}

	@Override
	@Transactional
	public void deleteAssesment(Map<String, Object> requestParams) {
		// TODO Auto-generated method stub
		String assesmentId = (String) requestParams.get("assesmentId");
		Assesment assesment = assesmentDao
				.findById(Long.parseLong(assesmentId));
		assesmentDao.remove(assesment);
	}

	@Override
	@Transactional
	public void deleteAssesmentSections(Map<String, Object> requestParams) {
		// TODO Auto-generated method stub
		String assesmentSectionsId = (String) requestParams
				.get("assesmentSectionsId");
		AssesmentSections assesmentSections = assesmentSectionsDao
				.findById(Long.parseLong(assesmentSectionsId));
		assesmentSectionsDao.remove(assesmentSections);
	}

	@Override
	@Transactional
	public void deleteAssesmentSectionsCriteria(
			Map<String, Object> requestParams) {
		// TODO Auto-generated method stub
		String assesmentSectionsCriteriaId = (String) requestParams
				.get("assesmentSectionsCriteriaId");
		AssesmentSectionCriteria assesmentSectionCriteria = assesmentSectionCriteriaDao
				.findById(Long.parseLong(assesmentSectionsCriteriaId));
		assesmentSectionCriteriaDao.remove(assesmentSectionCriteria);
	}

	@Override
	@Transactional
	public void updateCriteriaAssesmentSectionAnswer(
			Map<String, Object> requestParams)
			throws org.json.simple.parser.ParseException {
		// TODO Auto-generated method stub
		String answersTitle = (String) requestParams.get("title");
		String answersValue = (String) requestParams.get("value");
		String languageId = (String) requestParams.get("languageId");
		String updatedBy = (String) requestParams.get("updatedBy");
		Language language = languageDao.findById(Long.parseLong(languageId));
		String assesmentSectionCriteriaId = (String) requestParams
				.get("assesmentSectionCriteriaId");
		AssesmentSectionCriteria assesmentSectionCriteria = assesmentSectionCriteriaDao
				.findById(Long.parseLong(assesmentSectionCriteriaId));
		String assesmentSectionCriteriaAnswerId = (String) requestParams
				.get("assesmentSectionCriteriaAnswerId");
		AssesmentSectionCriteriaAnswers assesmentSectionCriteriaAnswers = assesmentSectionCriteriaAnswersDao
				.findById(Long.parseLong(assesmentSectionCriteriaAnswerId));
		assesmentSectionCriteriaAnswers.setTitle(answersTitle);
		assesmentSectionCriteriaAnswers
				.setAssesmentSectionCriteria(assesmentSectionCriteria);
		assesmentSectionCriteriaAnswers.setLanguage(language);
		assesmentSectionCriteriaAnswers.setTitle(answersTitle);
		assesmentSectionCriteriaAnswers.setUpdatedBy(updatedBy);
		assesmentSectionCriteriaAnswers.setUpdatedDate(LocalDateTime.now());
		assesmentSectionCriteriaAnswers.setValue(answersValue);
		assesmentSectionCriteriaAnswersDao
				.merge(assesmentSectionCriteriaAnswers);
	}

	@Override
	@Transactional
	public void deleteAssesmentSectionsCriteriaAnswers(
			Map<String, Object> requestParams) {
		// TODO Auto-generated method stub
		String assesmentSectionsCriteriaAnswersId = (String) requestParams
				.get("assesmentSectionsCriteriaAnswersId");
		AssesmentSectionCriteriaAnswers assesmentSectionCriteriaAnswers = assesmentSectionCriteriaAnswersDao
				.findById(Long.parseLong(assesmentSectionsCriteriaAnswersId));
		assesmentSectionCriteriaAnswersDao
				.remove(assesmentSectionCriteriaAnswers);

	}

	@Override
	@Transactional
	public List<Assesment> getAssesments() {
		// TODO Auto-generated method stub
		return assesmentDao.findAllBySort(" order by createdDate desc");
	}

	@Override
	@Transactional
	public AssesmentDetails getAssesmentById(long assesmentId) {
		// TODO Auto-generated method stub
		Assesment assesment = assesmentDao.findAllChildrenById(assesmentId);
		AssesmentDetails assesmentDetails = new AssesmentDetails();
		Set<AssesmentSections> assesmentSectionsSet = assesment
				.getAssesmentSections();
		Set<AssesmentSectionsDto> assesmentSectionsDtoSet = new HashSet<>();
		for (AssesmentSections assesmentSections : assesmentSectionsSet) {
			Set<AssesmentSectionCriteria> assesmentSectionCriteriaSet = assesmentSections
					.getAssesmentSectionCriteriaList();
			Set<AssesmentSectionCriteriaDto> assesmentSectionCriteriaDtos = new HashSet<>();
			for (AssesmentSectionCriteria assesmentSectionCriteria : assesmentSectionCriteriaSet) {
				Set<AssesmentSectionCriteriaAnswers> assesmentSectionCriteriaAnswersSet = assesmentSectionCriteria
						.getAssesmentSectionCriteriaAnswersList();
				Set<AssesmentSectionCriteriaAnswersDto> assesmentSectionCriteriaAnswersDtos = new HashSet<>();
				for (AssesmentSectionCriteriaAnswers assesmentSectionCriteriaAnswers : assesmentSectionCriteriaAnswersSet) {
					AssesmentSectionCriteriaAnswersDto assesmentSectionCriteriaAnswersDto = new AssesmentSectionCriteriaAnswersDto();
					assesmentSectionCriteriaAnswersDto
							.setLanguage(assesmentSectionCriteriaAnswers
									.getLanguage());
					assesmentSectionCriteriaAnswersDto
							.setPrimaryId(assesmentSectionCriteriaAnswers
									.getPrimaryId());
					assesmentSectionCriteriaAnswersDto
							.setTitle(assesmentSectionCriteriaAnswers
									.getTitle());
					assesmentSectionCriteriaAnswersDto
							.setValue(assesmentSectionCriteriaAnswers
									.getValue());
					assesmentSectionCriteriaAnswersDtos
							.add(assesmentSectionCriteriaAnswersDto);
				}
				AssesmentSectionCriteriaDto assesmentSectionCriteriaDto = new AssesmentSectionCriteriaDto();
				assesmentSectionCriteriaDto
						.setAssesmentSectionCriteriaAnswersList(assesmentSectionCriteriaAnswersDtos);
				assesmentSectionCriteriaDto
						.setDescription(assesmentSectionCriteria
								.getDescription());
				assesmentSectionCriteriaDto
						.setLanguage(assesmentSectionCriteria.getLanguage());
				assesmentSectionCriteriaDto
						.setPrimaryId(assesmentSectionCriteria.getPrimaryId());
				assesmentSectionCriteriaDto.setTitle(assesmentSectionCriteria
						.getTitle());
				assesmentSectionCriteriaDtos.add(assesmentSectionCriteriaDto);
			}
			AssesmentSectionsDto assesmentSectionsDto = new AssesmentSectionsDto();
			assesmentSectionsDto.setDescription(assesmentSections
					.getDescription());
			assesmentSectionsDto.setLanguage(assesmentSections.getLanguage());
			assesmentSectionsDto.setPrimaryId(assesmentSections.getPrimaryId());
			assesmentSectionsDto.setTitle(assesmentSections.getTitle());
			assesmentSectionsDto.setAssesmentSectionCriteriaList(assesmentSectionCriteriaDtos);
			assesmentSectionsDtoSet.add(assesmentSectionsDto);
		}
		// BeanUtils.copyProperties(assesment, assesmentDetails);
		assesmentDetails.setAssesmentCategory(assesment.getAssesmentCategory().getName());
		assesmentDetails.setDescription(assesment.getDescription());
		assesmentDetails.setName(assesment.getName());
		assesmentDetails.setLanguage(assesment.getLanguage());
		assesmentDetails.setPrimaryId(assesment.getPrimaryId());
		assesmentDetails.setStatus(assesment.getStatus());
		assesmentDetails.setAssesmentSections(assesmentSectionsDtoSet);
		return assesmentDetails;
	}

}
