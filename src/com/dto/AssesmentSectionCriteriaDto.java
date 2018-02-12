package com.dto;

import java.util.List;
import java.util.Set;

import com.model.AssesmentSectionCriteriaAnswers;
import com.model.AssesmentSections;
import com.model.Language;

public class AssesmentSectionCriteriaDto {
	private String title;
	private Language language;
	private Set<AssesmentSectionCriteriaAnswersDto> assesmentSectionCriteriaAnswersList;
	private String description;
	private Long primaryId;
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
	public Set<AssesmentSectionCriteriaAnswersDto> getAssesmentSectionCriteriaAnswersList() {
		return assesmentSectionCriteriaAnswersList;
	}
	public void setAssesmentSectionCriteriaAnswersList(
			Set<AssesmentSectionCriteriaAnswersDto> assesmentSectionCriteriaAnswersList) {
		this.assesmentSectionCriteriaAnswersList = assesmentSectionCriteriaAnswersList;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Long getPrimaryId() {
		return primaryId;
	}
	public void setPrimaryId(Long primaryId) {
		this.primaryId = primaryId;
	}
}
