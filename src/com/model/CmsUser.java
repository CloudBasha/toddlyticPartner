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

import com.fasterxml.jackson.annotation.JsonFormat;

@SuppressWarnings("serial")
@Entity
@Table(name = "user")
public class CmsUser implements Serializable {
	private Long cmsUserId;
	private String userName;
	private String password;
	private String name;
	private boolean invited = false;
	private CmsUser referedUser;
	private boolean admin = false;
	private boolean mailSend = false;
	private boolean emailVerified = false;
	private Partner partner;
	private boolean shared = false;
	private boolean deleted = false;
	private String deletedBy;
	private Date deletedDate;
	private boolean approved = false;
	private String approvedBy;
	private Date approvedDate;
	private String createdBy;
	private String modifiedBy;
	private String activated = "false";
	private String emailAddress;
	private String mobileNumber;
	private Date createdDate;
	private Date modifiedDate;
	private int loginAttempts;
	private boolean userLocked = false;

	@Column(name = "NAME", nullable = false)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "IS_INVITED", nullable = false)
	public boolean isInvited() {
		return invited;
	}

	public void setInvited(boolean invited) {
		this.invited = invited;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "REFERED_CMS_USER_ID", nullable = true)
	public CmsUser getReferedUser() {
		return referedUser;
	}

	public void setReferedUser(CmsUser referedUser) {
		this.referedUser = referedUser;
	}

	@Column(name = "IS_ADMIN", nullable = false)
	public boolean isAdmin() {
		return admin;
	}

	public void setAdmin(boolean admin) {
		this.admin = admin;
	}

	@Column(name = "IS_EMAIL_VERIFIED", nullable = false)
	public boolean isEmailVerified() {
		return emailVerified;
	}

	public void setEmailVerified(boolean emailVerified) {
		this.emailVerified = emailVerified;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "PARTNER_ID", nullable = false)
	public Partner getPartner() {
		return partner;
	}

	public void setPartner(Partner partner) {
		this.partner = partner;
	}

	@Column(name = "IS_SHARED", nullable = false)
	public boolean isShared() {
		return shared;
	}

	public void setShared(boolean shared) {
		this.shared = shared;
	}

	@Column(name = "IS_DELETED", nullable = false)
	public boolean isDeleted() {
		return deleted;
	}

	public void setDeleted(boolean deleted) {
		this.deleted = deleted;
	}

	@Column(name = "DELETED_BY", nullable = true)
	public String getDeletedBy() {
		return deletedBy;
	}

	public void setDeletedBy(String deletedBy) {
		this.deletedBy = deletedBy;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "DELETED_DATE", nullable = true)
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Kuala_Lumpur")
	public Date getDeletedDate() {
		return deletedDate;
	}

	public void setDeletedDate(Date deletedDate) {
		this.deletedDate = deletedDate;
	}

	@Column(name = "IS_APPROVED", nullable = false)
	public boolean isApproved() {
		return approved;
	}

	public void setApproved(boolean approved) {
		this.approved = approved;
	}

	@Column(name = "APPROVED_BY", nullable = true)
	public String getApprovedBy() {
		return approvedBy;
	}

	public void setApprovedBy(String approvedBy) {
		this.approvedBy = approvedBy;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "APPROVED_DATE", nullable = true)
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Kuala_Lumpur")
	public Date getApprovedDate() {
		return approvedDate;
	}

	public void setApprovedDate(Date approvedDate) {
		this.approvedDate = approvedDate;
	}

	@Column(name = "CREATED_BY", nullable = false)
	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	@Column(name = "MODIFIED_BY", nullable = true)
	public String getModifiedBy() {
		return modifiedBy;
	}

	public void setModifiedBy(String modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CREATED_DATE", nullable = false)
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Kuala_Lumpur")
	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "UPDATED_DATE", nullable = true)
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Kuala_Lumpur")
	public Date getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	@Column(name = "USER_NAME", nullable = false, unique = true)
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Column(name = "PASSWORD", nullable = true)
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "STATUS", nullable = false)
	public String getActivated() {
		return activated;
	}

	public void setActivated(String activated) {
		this.activated = activated;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CMS_USER_ID", unique = true, nullable = false, precision = 15, scale = 0)
	public Long getCmsUserId() {
		return cmsUserId;
	}

	public void setCmsUserId(Long cmsUserId) {
		this.cmsUserId = cmsUserId;
	}

	@Column(name = "EMAIL_ADDRESS", nullable = false,unique = true)
	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	@Column(name = "MOBILE_NUMBER", nullable = true)
	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	@Column(name = "IS_MAIL_SEND", nullable = false)
	public boolean isMailSend() {
		return mailSend;
	}

	public void setMailSend(boolean mailSend) {
		this.mailSend = mailSend;
	}

	@Column(name = "LOGIN_ATTEMPTS", nullable = false)
	public int getLoginAttempts() {
		return loginAttempts;
	}

	public void setLoginAttempts(int loginAttempts) {
		this.loginAttempts = loginAttempts;
	}

	@Column(name = "IS_USER_LOCKED", nullable = false)
	public boolean isUserLocked() {
		return userLocked;
	}

	public void setUserLocked(boolean userLocked) {
		this.userLocked = userLocked;
	}

}
