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
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

import static javax.persistence.GenerationType.SEQUENCE;

@Entity
@Table(name = "login_request")
public class LoginRequest implements Serializable {

	private Long loginRequestId;
	private CmsUser cmsUser;
	private String device;
	private boolean loginComplete;
	private String httpReferer;
	private String browser;
	private Date loginDateTime;
	private String userName;
	
	
	@Column(name = "DEVICE", nullable = true)
	public String getDevice() {
		return device;
	}
	public void setDevice(String device) {
		this.device = device;
	}
	@Column(name = "HTTP_REFERER", nullable = true)
	public String getHttpReferer() {
		return httpReferer;
	}
	public void setHttpReferer(String httpReferer) {
		this.httpReferer = httpReferer;
	}
	@Column(name = "BROWSER", nullable = true)
	public String getBrowser() {
		return browser;
	}
	public void setBrowser(String browser) {
		this.browser = browser;
	}
	@Id
	@GeneratedValue( strategy = GenerationType.IDENTITY )
	@Column(name = "LOGIN_REQUEST_ID", unique = true, nullable = false, precision = 15, scale = 0)
	public Long getLoginRequestId() {
		return loginRequestId;
	}
	public void setLoginRequestId(Long loginRequestId) {
		this.loginRequestId = loginRequestId;
	}
	
	
	@Column(name = "LOGIN_COMPLETE", nullable = false)
	public boolean isLoginComplete() {
		return loginComplete;
	}
	public void setLoginComplete(boolean loginComplete) {
		this.loginComplete = loginComplete;
	}
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "CMS_USER_ID",nullable=true)
	public CmsUser getCmsUser() {
		return cmsUser;
	}
	public void setCmsUser(CmsUser cmsUser) {
		this.cmsUser = cmsUser;
	}
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "LOGIN_DATE", nullable = false)
	public Date getLoginDateTime() {
		return loginDateTime;
	}
	public void setLoginDateTime(Date loginDateTime) {
		this.loginDateTime = loginDateTime;
	}
	@Column(name = "USER_NAME", nullable = true)
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
}
