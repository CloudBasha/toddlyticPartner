package com.model;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.util.CustomLocalDateTimeSerializer;

@MappedSuperclass
public class BaseEntity {
	private Long primaryId;
	private LocalDateTime createdDate;
	private String createdBy;
	private LocalDateTime updatedDate;
	private String updatedBy;
	@Id
	@GeneratedValue( strategy = GenerationType.IDENTITY )
	@Column(name = "PRIMARY_ID", unique = true, nullable = false, precision = 15, scale = 0)
	public Long getPrimaryId() {
		return primaryId;
	}
	public void setPrimaryId(Long primaryId) {
		this.primaryId = primaryId;
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
	@Column(name = "CREATED_BY", nullable = false)
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	@Column(name = "MODIFIED_DATE", nullable = true)
	@Convert(converter = LocalDateTimeAttributeConverter.class)
	@JsonSerialize(using = CustomLocalDateTimeSerializer.class)
	public LocalDateTime getUpdatedDate() {
		return updatedDate;
	}
	public void setUpdatedDate(LocalDateTime updatedDate) {
		this.updatedDate = updatedDate;
	}
	@Column(name = "UPDATED_BY", nullable = true)
	public String getUpdatedBy() {
		return updatedBy;
	}
	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}
	
	
}
