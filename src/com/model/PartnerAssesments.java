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
@Table (name = "partner_assesments")
public class PartnerAssesments extends BaseEntity implements Serializable   {

	private Partner partners;
	private Assesment assesments;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "PARTNER_ID",nullable=false)
	public Partner getPartners() {
		return partners;
	}
	public void setPartners(Partner partners) {
		this.partners = partners;
	}
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ASSESMENT_ID",nullable=false)
	public Assesment getAssesments() {
		return assesments;
	}
	public void setAssesments(Assesment assesments) {
		this.assesments = assesments;
	}
	
	
	
	
	
	
}
