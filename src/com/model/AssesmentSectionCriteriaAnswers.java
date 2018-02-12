package com.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.codehaus.jackson.map.annotate.JsonSerialize;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table (name = "assesment_section_criteria_ans")
public class AssesmentSectionCriteriaAnswers extends BaseEntity implements Serializable   {

	private String title;
	private Language language;
	private AssesmentSectionCriteria assesmentSectionCriteria;
	private String value;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ASSESMENT_SECTIONS_CRITERIA_ID",nullable=false)
	public AssesmentSectionCriteria getAssesmentSectionCriteria() {
		return assesmentSectionCriteria;
	}
	public void setAssesmentSectionCriteria(
			AssesmentSectionCriteria assesmentSectionCriteria) {
		this.assesmentSectionCriteria = assesmentSectionCriteria;
	}
	@Column(name = "VALUE", nullable = false)
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
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
	
	
		
	
}
