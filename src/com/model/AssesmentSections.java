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
@Table (name = "assesment_sections")
public class AssesmentSections extends BaseEntity implements Serializable   {

	private String title;
	private Language language;
	private Assesment assesment;
	private String description;
	private Set<AssesmentSectionCriteria> assesmentSectionCriteriaList;
	
	
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
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ASSESMENT_ID",nullable=false)
	public Assesment getAssesment() {
		return assesment;
	}
	public void setAssesment(Assesment assesment) {
		this.assesment = assesment;
	}
	@Column(name = "DESCRIPTION", nullable = true)
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@OneToMany(fetch = FetchType.LAZY,cascade=CascadeType.REMOVE,mappedBy="assesmentSections")
	public Set<AssesmentSectionCriteria> getAssesmentSectionCriteriaList() {
		return assesmentSectionCriteriaList;
	}
	public void setAssesmentSectionCriteriaList(
			Set<AssesmentSectionCriteria> assesmentSectionCriteriaList) {
		this.assesmentSectionCriteriaList = assesmentSectionCriteriaList;
	}
		
	
}
