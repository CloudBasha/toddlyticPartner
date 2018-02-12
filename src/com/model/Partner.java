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
import javax.persistence.Transient;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.util.CustomLocalDateTimeSerializer;

@SuppressWarnings("serial")
@Entity
@Table(name = "partner")
public class Partner extends BaseEntity implements Serializable {

	
	private String name;
	private String streetAddress;
	private String streetAddressOne;
	private String streetAddressTwo;
	private String email;
	private String postCode;
	private String city;
	private String state;
	private String country;
	private String latitude;
	private String longitude;
	private String faxNumber;
	private String photoUrl;
	private String contactNumber;
	private String website;
	private String logoUrl;
	private String language;
	private String timezone;
	private String currency;
	private String dateFormat;
	private String startOfWeek;
	private String companyNo;
	private String invoicePrefix;
	private String invoiceRunningNo;
	private Double taxPercentage=0d;
	private String bankName;
	private String bankAccountNo;
	private String bankAccountName;
	private String headerNote;
	private String footerNote;
	private String monthlyBillingDate;
	private String defaultBillingCycle;
	private String paymentTerm;
	private boolean isBillingEnabled = false;
	private boolean taxActive = false;
	private String lastBillingDate;
	private String status;
	private String description;
	private Long createdById;
	private Long modifiedById;
	private Long deletedById;
	private String deletedBy;
	private LocalDateTime deletedDate;
	private Partner paraentPartner;
	private Integer numberOfOrganizations=0;
	private Integer parentPartnerId=0;

	@Column(name = "NAME", nullable = false)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	

	@Column(name = "TAX_ACTIVE", nullable = false)
	public boolean isTaxActive() {
		return taxActive;
	}

	public void setTaxActive(boolean taxActive) {
		this.taxActive = taxActive;
	}

	@Column(name = "LAST_BILLING_DATE", nullable = true)
	public String getLastBillingDate() {
		return lastBillingDate;
	}

	public void setLastBillingDate(String lastBillingDate) {
		this.lastBillingDate = lastBillingDate;
	}

	@Column(name = "IS_BILLING_ENABLED", nullable = false)
	public boolean isBillingEnabled() {
		return isBillingEnabled;
	}

	public void setBillingEnabled(boolean isBillingEnabled) {
		this.isBillingEnabled = isBillingEnabled;
	}

	@Column(name = "INVOICE_PREFIX", nullable = true)
	public String getInvoicePrefix() {
		return invoicePrefix;
	}

	public void setInvoicePrefix(String invoicePrefix) {
		this.invoicePrefix = invoicePrefix;
	}

	@Column(name = "LANGUAGE", nullable = true)
	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	@Column(name = "TIMEZONE", nullable = true)
	public String getTimezone() {
		return timezone;
	}

	public void setTimezone(String timezone) {
		this.timezone = timezone;
	}

	@Column(name = "CURRENCY", nullable = true)
	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	@Column(name = "DATE_FORMAT", nullable = true)
	public String getDateFormat() {
		return dateFormat;
	}

	public void setDateFormat(String dateFormat) {
		this.dateFormat = dateFormat;
	}

	@Column(name = "START_OF_WEEK", nullable = true)
	public String getStartOfWeek() {
		return startOfWeek;
	}

	public void setStartOfWeek(String startOfWeek) {
		this.startOfWeek = startOfWeek;
	}

	@Column(name = "STREET_ADDR", nullable = true)
	public String getStreetAddress() {
		return streetAddress;
	}

	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}

	@Column(name = "STREET_ADDR_ONE", nullable = true)
	public String getStreetAddressOne() {
		return streetAddressOne;
	}

	public void setStreetAddressOne(String streetAddressOne) {
		this.streetAddressOne = streetAddressOne;
	}

	@Column(name = "STREET_ADDR_TWO", nullable = true)
	public String getStreetAddressTwo() {
		return streetAddressTwo;
	}

	public void setStreetAddressTwo(String streetAddressTwo) {
		this.streetAddressTwo = streetAddressTwo;
	}

	@Column(name = "EMAIL", nullable = true)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "POST_CODE", nullable = true)
	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	@Column(name = "CITY", nullable = true)
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Column(name = "STATE", nullable = true)
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Column(name = "COUNTRY", nullable = true)
	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	@Column(name = "LATITUDE", nullable = true)
	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	@Column(name = "LONGITUDE", nullable = true)
	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	@Column(name = "FAX_NUMBER", nullable = true)
	public String getFaxNumber() {
		return faxNumber;
	}

	public void setFaxNumber(String faxNumber) {
		this.faxNumber = faxNumber;
	}

	@Column(name = "CONTACT_NO", nullable = true)
	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	@Column(name = "WEBSITE", nullable = true)
	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	@Column(name = "LOGO_URL", nullable = true)
	public String getLogoUrl() {
		return logoUrl;
	}

	public void setLogoUrl(String logoUrl) {
		this.logoUrl = logoUrl;
	}

	@Column(name = "COMPANY_NO", nullable = true)
	public String getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(String companyNo) {
		this.companyNo = companyNo;
	}

	@Column(name = "INVOICE_RUNNING_NO", nullable = true)
	public String getInvoiceRunningNo() {
		return invoiceRunningNo;
	}

	public void setInvoiceRunningNo(String invoiceRunningNo) {
		this.invoiceRunningNo = invoiceRunningNo;
	}

	@Column(name = "TAX_PERCENTAGE", nullable = true)
	public Double getTaxPercentage() {
		return taxPercentage;
	}

	public void setTaxPercentage(Double taxPercentage) {
		this.taxPercentage = taxPercentage;
	}

	@Column(name = "BANK_NAME", nullable = true)
	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	@Column(name = "BANK_ACCOUNT_NO", nullable = true)
	public String getBankAccountNo() {
		return bankAccountNo;
	}

	public void setBankAccountNo(String bankAccountNo) {
		this.bankAccountNo = bankAccountNo;
	}

	@Column(name = "BANK_ACCOUNT_NAME", nullable = true)
	public String getBankAccountName() {
		return bankAccountName;
	}

	public void setBankAccountName(String bankAccountName) {
		this.bankAccountName = bankAccountName;
	}

	@Column(name = "HEADER_NOTE", nullable = true)
	public String getHeaderNote() {
		return headerNote;
	}

	public void setHeaderNote(String headerNote) {
		this.headerNote = headerNote;
	}

	@Column(name = "FOOTER_NOTE", nullable = true)
	public String getFooterNote() {
		return footerNote;
	}

	public void setFooterNote(String footerNote) {
		this.footerNote = footerNote;
	}

	@Column(name = "MONTHLY_BILLING_DATE", nullable = true)
	public String getMonthlyBillingDate() {
		return monthlyBillingDate;
	}

	public void setMonthlyBillingDate(String monthlyBillingDate) {
		this.monthlyBillingDate = monthlyBillingDate;
	}

	@Column(name = "DEFAULT_BILLING_CYCLE", nullable = true)
	public String getDefaultBillingCycle() {
		return defaultBillingCycle;
	}

	public void setDefaultBillingCycle(String defaultBillingCycle) {
		this.defaultBillingCycle = defaultBillingCycle;
	}

	@Column(name = "PAYMENT_TERM", nullable = true)
	public String getPaymentTerm() {
		return paymentTerm;
	}

	public void setPaymentTerm(String paymentTerm) {
		this.paymentTerm = paymentTerm;
	}

	@Column(name = "CREATED_BY_ID", nullable = false)
	public Long getCreatedById() {
		return createdById;
	}

	public void setCreatedById(Long createdById) {
		this.createdById = createdById;
	}

	

	@Column(name = "MODIFIED_BY_ID", nullable = true)
	public Long getModifiedById() {
		return modifiedById;
	}

	public void setModifiedById(Long modifiedById) {
		this.modifiedById = modifiedById;
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
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "PARAENT_PARTNER_ID",nullable=true)
	public Partner getParaentPartner() {
		return paraentPartner;
	}

	public void setParaentPartner(Partner paraentPartner) {
		this.paraentPartner = paraentPartner;
	}
	@Column(name = "NUMBER_OF_ORGANIZATIONS", nullable = false)
	public Integer getNumberOfOrganizations() {
		return numberOfOrganizations;
	}

	public void setNumberOfOrganizations(Integer numberOfOrganizations) {
		this.numberOfOrganizations = numberOfOrganizations;
	}
	
	@Transient
	public Integer getParentPartnerId() {
		return parentPartnerId;
	}

	public void setParentPartnerId(Integer parentPartnerId) {
		this.parentPartnerId = parentPartnerId;
	}
	@Column(name = "PHOTO_URL", nullable = true)
	public String getPhotoUrl() {
		return photoUrl;
	}

	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}
	
	
	
	

}
