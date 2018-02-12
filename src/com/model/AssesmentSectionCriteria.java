package com.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table (name = "assesment_section_criteria")
public class AssesmentSectionCriteria extends BaseEntity implements Serializable   {

	private String title;
	private Language language;
	private AssesmentSections assesmentSections;
	private Set<AssesmentSectionCriteriaAnswers> assesmentSectionCriteriaAnswersList;
	private String description;
	
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "LANGUAGE_ID",nullable=false)
	public Language getLanguage() {
		return language;
	}
	public void setLanguage(Language language) {
		this.language = language;
	}
	@Column(name = "TITLE", nullable = false)
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	@Column(name = "DESCRIPTION", nullable = true)
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ASSESMENT_SECTIONS_ID",nullable=false)
	public AssesmentSections getAssesmentSections() {
		return assesmentSections;
	}
	public void setAssesmentSections(AssesmentSections assesmentSections) {
		this.assesmentSections = assesmentSections;
	}
	@OneToMany(fetch = FetchType.LAZY,cascade=CascadeType.REMOVE,mappedBy="assesmentSectionCriteria")
	public Set<AssesmentSectionCriteriaAnswers> getAssesmentSectionCriteriaAnswersList() {
		return assesmentSectionCriteriaAnswersList;
	}
	public void setAssesmentSectionCriteriaAnswersList(
			Set<AssesmentSectionCriteriaAnswers> assesmentSectionCriteriaAnswersList) {
		this.assesmentSectionCriteriaAnswersList = assesmentSectionCriteriaAnswersList;
	}
		
	
}
