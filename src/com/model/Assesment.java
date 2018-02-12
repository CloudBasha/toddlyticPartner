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
@Table (name = "assesment")
public class Assesment extends BaseEntity implements Serializable   {

	private String name;
	private Language language;
	private String status;
	private String description;
	private AssesmentCategory assesmentCategory;
	private Set<AssesmentSections> assesmentSections;
	
	@Column(name = "NAME", nullable = false)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "LANGUAGE_ID",nullable=false)
	public Language getLanguage() {
		return language;
	}
	public void setLanguage(Language language) {
		this.language = language;
	}
	@Column(name = "STATUS", nullable = false)
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Column(name = "DESCRIPTION", nullable = true)
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ASSESMENT_CATEGORY_ID",nullable=false)
	public AssesmentCategory getAssesmentCategory() {
		return assesmentCategory;
	}
	public void setAssesmentCategory(AssesmentCategory assesmentCategory) {
		this.assesmentCategory = assesmentCategory;
	}
	@OneToMany(fetch = FetchType.LAZY,cascade=CascadeType.REMOVE,mappedBy="assesment")
	public Set<AssesmentSections> getAssesmentSections() {
		return assesmentSections;
	}
	public void setAssesmentSections(Set<AssesmentSections> assesmentSections) {
		this.assesmentSections = assesmentSections;
	}
		
	
}
