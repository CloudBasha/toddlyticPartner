package com.dto;

import java.util.List;
import java.util.Set;

import com.model.AssesmentCategory;
import com.model.AssesmentSections;
import com.model.Language;

public class AssesmentDetails {

	public Long getPrimaryId() {
		return primaryId;
	}
	public void setPrimaryId(Long primaryId) {
		this.primaryId = primaryId;
	}
	public Language getLanguage() {
		return language;
	}
	public void setLanguage(Language language) {
		this.language = language;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getAssesmentCategory() {
		return assesmentCategory;
	}
	public void setAssesmentCategory(String assesmentCategory) {
		this.assesmentCategory = assesmentCategory;
	}
	public Set<AssesmentSectionsDto> getAssesmentSections() {
		return assesmentSections;
	}
	public void setAssesmentSections(Set<AssesmentSectionsDto> assesmentSections) {
		this.assesmentSections = assesmentSections;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	private Long primaryId;
	private Language language;
	private String status;
	private String description;
	private String assesmentCategory;
	private Set<AssesmentSectionsDto> assesmentSections;
	private String name;
}
