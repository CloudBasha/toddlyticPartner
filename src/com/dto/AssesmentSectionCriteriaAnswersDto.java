package com.dto;

import com.model.Language;

public class AssesmentSectionCriteriaAnswersDto {
	private String title;
	private Language language;
	private String value;
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
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public Long getPrimaryId() {
		return primaryId;
	}
	public void setPrimaryId(Long primaryId) {
		this.primaryId = primaryId;
	}
	
}
