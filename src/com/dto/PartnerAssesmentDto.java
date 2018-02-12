package com.dto;

import java.util.List;
import java.util.Set;

import com.model.AssesmentCategory;
import com.model.AssesmentSections;
import com.model.Language;

public class PartnerAssesmentDto {

	private Long partnerId;
	private Long assesmentId;
	private String assesmentName;
	private String partnerName;
	private String assesmentStatus;
	private String assesmentCategory;
	public String getPartnerStatus() {
		return partnerStatus;
	}
	public void setPartnerStatus(String partnerStatus) {
		this.partnerStatus = partnerStatus;
	}
	private String partnerStatus;
	public Long getPartnerId() {
		return partnerId;
	}
	public void setPartnerId(Long partnerId) {
		this.partnerId = partnerId;
	}
	public Long getAssesmentId() {
		return assesmentId;
	}
	public void setAssesmentId(Long assesmentId) {
		this.assesmentId = assesmentId;
	}
	public String getAssesmentName() {
		return assesmentName;
	}
	public void setAssesmentName(String assesmentName) {
		this.assesmentName = assesmentName;
	}
	public String getPartnerName() {
		return partnerName;
	}
	public void setPartnerName(String partnerName) {
		this.partnerName = partnerName;
	}
	public String getAssesmentStatus() {
		return assesmentStatus;
	}
	public void setAssesmentStatus(String assesmentStatus) {
		this.assesmentStatus = assesmentStatus;
	}
	public String getAssesmentCategory() {
		return assesmentCategory;
	}
	public void setAssesmentCategory(String assesmentCategory) {
		this.assesmentCategory = assesmentCategory;
	}
	
	
}
