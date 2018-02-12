package com.dto;

import java.util.List;
import java.util.Set;

import com.model.Assesment;
import com.model.AssesmentSectionCriteria;
import com.model.Language;

public class AssesmentSectionsDto {

	private String title;
	private Language language;
	private String description;
	private Long primaryId;
	public Long getPrimaryId() {
		return primaryId;
	}
	public void setPrimaryId(Long primaryId) {
		this.primaryId = primaryId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Language getLanguage() {
		return language;
	}
	public void setLanguage(Language language) {
		this.language = language;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Set<AssesmentSectionCriteriaDto> getAssesmentSectionCriteriaList() {
		return assesmentSectionCriteriaList;
	}
	public void setAssesmentSectionCriteriaList(
			Set<AssesmentSectionCriteriaDto> assesmentSectionCriteriaList) {
		this.assesmentSectionCriteriaList = assesmentSectionCriteriaList;
	}
	private Set<AssesmentSectionCriteriaDto> assesmentSectionCriteriaList;
	
}
