package com.services.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.CmsUserDao;
import com.dao.LoginRequestDao;
import com.dao.PartnerDao;
import com.model.CmsUser;
import com.model.LoginRequest;
import com.model.Partner;
import com.services.LoginService;

@Service
public class LoginServiceImpl implements LoginService {

	private Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private CmsUserDao cmsUserDao;

	@Autowired
	private LoginRequestDao loginRequestDao;

	@Autowired
	private PartnerDao partnerDao;

	@Override
	@Transactional
	public Map<String, Object> doLogin(Map<String, Object> requestParams) {
		// TODO Auto-generated method stub
		String userEmail = (String) requestParams.get("userEmail");
		String userPassword = (String) requestParams.get("userPassword");
		String httpreferer = (String) requestParams.get("httpreferer");
		String browsertype = (String) requestParams.get("browsertype");
		String devicetype = (String) requestParams.get("devicetype");

		Map<String, Object> responseMessage = new HashMap<String, Object>();
		LoginRequest loginRequest = new LoginRequest();
		int lockTime = 3;
		CmsUser cmsUser = cmsUserDao.findByEmail(userEmail);
		loginRequest.setLoginDateTime(new Date());
		loginRequest.setBrowser(browsertype);
		loginRequest.setDevice(devicetype);
		loginRequest.setHttpReferer(httpreferer);
		loginRequest.setUserName(userEmail);

		int loginAttempts = 0;
		String dbPassword = null;
		boolean isVerified = false;
		boolean isUserLocked = false;
		String activated = "false";

		if (cmsUser != null) {
			loginAttempts = cmsUser.getLoginAttempts();
			dbPassword = cmsUser.getPassword();
			isVerified = cmsUser.isEmailVerified();
			isUserLocked = cmsUser.isUserLocked();
			activated = cmsUser.getActivated();
			responseMessage.put("userId", cmsUser.getCmsUserId());
			LoginRequest loginRequestLatest = loginRequestDao.getLatestLoginCounterByUserAuthentication(cmsUser);
			if (loginRequestLatest == null) {
				responseMessage.put("isFirstLogin", "true");
			} else {
				responseMessage.put("isFirstLogin", "false");
			}
		}
		int numberOfRetryAllowed = 3;
		if (cmsUser != null) {
			responseMessage.put("isInvited", String.valueOf(cmsUser.isInvited()));
			loginRequest.setCmsUser(cmsUser);
			if (!isVerified) {
				loginRequest.setLoginComplete(false);
				responseMessage.put("loginStatus", "FAIL");
				responseMessage.put("remark", "Email not verified yet");
			}

			else if (activated != null && activated.equals("false")) {
				loginRequest.setLoginComplete(false);
				responseMessage.put("loginStatus", "FAIL");
				responseMessage.put("remark", "User access is disabled");
			}

			else {
				if (dbPassword != null && dbPassword.equals(userPassword)) {
					if (isUserLocked) {
						LoginRequest loginRequestLatest = loginRequestDao.getLatestLoginCounterByUserAuthentication(cmsUser);
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						if (loginRequestLatest != null) {
							Date modifiedDate = loginRequestLatest.getLoginDateTime();
							Date currentDate = new Date();
							long diff = currentDate.getTime() - modifiedDate.getTime();
							long diffMinutes = diff / (60 * 1000) % 60;
							if (diffMinutes >= lockTime) {
								cmsUser.setUserLocked(false);
								responseMessage.put("isUserLocked", "false");
								cmsUser.setLoginAttempts(0);
								responseMessage.put("lastLogin", sdf.format(modifiedDate));
								loginRequest.setLoginComplete(true);
								responseMessage.put("loginStatus", "SUCCESS");
							} else {
								responseMessage.put("isUserLocked", "true");
								loginRequest.setLoginComplete(false);
								responseMessage.put("loginStatus", "FAIL");
								responseMessage.put("msg", "Login after 3 minutes");

							}
						} else {
							responseMessage.put("loginStatus", "FAIL");
							responseMessage.put("isUserLocked", "true");
						}
						responseMessage.put("isPasswordMatched", "true");
					}

					else {
						 	LoginRequest loginRequestLatest = loginRequestDao.getLatestLoginCounterByUserAuthentication(cmsUser);
							SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
							responseMessage.put("isPasswordMatched", "true");
							responseMessage.put("isUserLocked", "false");
							responseMessage.put("loginStatus", "SUCCESS");
							if (loginRequestLatest != null)
								responseMessage.put("lastLogin", sdf.format(loginRequestLatest.getLoginDateTime()));
							else
								responseMessage.put("lastLogin", "");
							responseMessage.put("isForgotPassword", "false");
							loginRequest.setLoginComplete(true);

						cmsUser.setLoginAttempts(0);
					}

				}

				else {
					responseMessage.put("isPasswordMatched", "false");
					loginRequest.setLoginComplete(false);
					responseMessage.put("loginStatus", "FAIL");
					if (loginAttempts >= numberOfRetryAllowed) {
						cmsUser.setUserLocked(true);
						responseMessage.put("isUserLocked", "true");
					} else {
						responseMessage.put("isUserLocked", "false");
					}
					cmsUser.setLoginAttempts(++loginAttempts);

				}

			}
		} else {
			responseMessage.put("loginStatus", "FAIL");
			responseMessage.put("remark", "User not found");
			loginRequest.setLoginComplete(false);
		}
		Partner partner = partnerDao.findById(cmsUser.getPartner().getPrimaryId());
		responseMessage.put("partnerId", partner.getPrimaryId()+"");
		if (cmsUser != null){
			cmsUserDao.merge(cmsUser);
			responseMessage.put("name", cmsUser.getName());
		}
		loginRequestDao.persist(loginRequest);
		return responseMessage;

	}


}
