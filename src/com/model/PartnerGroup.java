package com.model;

import java.io.Serializable;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.util.CustomLocalDateTimeSerializer;

@SuppressWarnings("serial")
@Entity
@Table(name="partner_group")
public class PartnerGroup implements Serializable {

	private Long partnerGroupId;
	private Partner parentPartner;
	private Partner childPartner;
	private Long createdById;
	private String createdBy;
	private LocalDateTime createdDate;
	private Long modifiedById;
	private String modifiedBy;
	private LocalDateTime modifiedDate;
	private Long deletedById;
	private String deletedBy;
	private LocalDateTime deletedDate;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PARTNER_GROUP_ID", nullable = false, unique = true, scale = 0, precision = 15)
	public Long getPartnerGroupId() {
		return partnerGroupId;
	}

	public void setPartnerGroupId(Long partnerGroupId) {
		this.partnerGroupId = partnerGroupId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "PARENT_PARTNER_ID",nullable=false)
	public Partner getParentPartner() {
		return parentPartner;
	}

	public void setParentPartner(Partner parentPartner) {
		this.parentPartner = parentPartner;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "CHILD_PARTNER_ID",nullable=false)
	public Partner getChildPartner() {
		return childPartner;
	}

	public void setChildPartner(Partner childPartner) {
		this.childPartner = childPartner;
	}

	@Column(name = "CREATED_BY_ID", nullable = false)
	public Long getCreatedById() {
		return createdById;
	}

	public void setCreatedById(Long createdById) {
		this.createdById = createdById;
	}

	@Column(name = "CREATED_BY", nullable = false)
	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	@Column(name = "CREATED_DATE", nullable = false)
	@Convert(converter = LocalDateTimeAttributeConverter.class)
	@JsonSerialize(using = CustomLocalDateTimeSerializer.class)
	public LocalDateTime getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(LocalDateTime createdDate) {
		this.createdDate = createdDate;
	}

	@Column(name = "MODIFIED_BY_ID", nullable = true)
	public Long getModifiedById() {
		return modifiedById;
	}

	public void setModifiedById(Long modifiedById) {
		this.modifiedById = modifiedById;
	}

	@Column(name = "MODIFIED_BY", nullable = true)
	public String getModifiedBy() {
		return modifiedBy;
	}

	public void setModifiedBy(String modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

	@Column(name = "MODIFIED_DATE", nullable = true)
	@Convert(converter = LocalDateTimeAttributeConverter.class)
	@JsonSerialize(using = CustomLocalDateTimeSerializer.class)
	public LocalDateTime getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(LocalDateTime modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	@Column(name = "DELETED_BY_ID", nullable = true)
	public Long getDeletedById() {
		return deletedById;
	}

	public void setDeletedById(Long deletedById) {
		this.deletedById = deletedById;
	}

	@Column(name = "DELETED_BY", nullable = true)
	public String getDeletedBy() {
		return deletedBy;
	}

	public void setDeletedBy(String deletedBy) {
		this.deletedBy = deletedBy;
	}

	@Column(name = "DELETED_DATE", nullable = true)
	@Convert(converter = LocalDateTimeAttributeConverter.class)
	@JsonSerialize(using = CustomLocalDateTimeSerializer.class)
	public LocalDateTime getDeletedDate() {
		return deletedDate;
	}

	public void setDeletedDate(LocalDateTime deletedDate) {
		this.deletedDate = deletedDate;
	}

}
