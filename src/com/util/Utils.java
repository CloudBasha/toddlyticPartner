package com.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import com.dao.CmsUserDao;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson.JacksonFactory;
import com.google.gson.JsonObject;
import com.model.CmsUser;

public class Utils {

	

	@Autowired
	private static CmsUserDao cmsUserDao;

	private static final JacksonFactory jacksonFactory = new JacksonFactory();
	private static final NetHttpTransport transport = new NetHttpTransport();
	public static String EMAIL_URL = "https://sit.toddlytic.com/ToddlyticsPartner/#/registrationActivation.html";
	public static String MAIN_URL = "http://localhost:8080/partner/";
	



	public static String parentRegisterEmailContent(String name, String email) {
		String content = "<html style=\"font-family: sans-serif;-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;-webkit-text-size-adjust: 100%;-ms-text-size-adjust: 100%;font-size: 10px;-webkit-tap-highlight-color: rgba(0,0,0,0);\">";
		content += "<head style=\"-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;\"><link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\" integrity=\"sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u\" crossorigin=\"anonymous\" style=\"-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;\"></head>";
		content += "<body style=\"width: 100%;height: 100%;background-color: #CCE1F1;-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;margin: 0;font-family: &quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;font-size: 14px;line-height: 1.42857143;color: #333;\">";
		content += "<div style=\"padding: 10px;margin-top: 15px;text-align: center;-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;\">"
				+ "<img src=\"https://dev.toddlytic.com/images/toddlyticWhiteLogo.png\" width=\"150px\" style=\"margin: 0 auto;margin-top:15px;-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;border: 0;vertical-align: middle;page-break-inside: avoid;max-width: 100%!important;\"></div>";
		content += "<div style=\"padding: 10px;text-align: center;width: 350px;margin: 0 auto;-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;\">";
		content += "<div class=\"panel panel-default\" style=\"-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;margin-bottom: 20px;background-color: #fff;border: 1px solid transparent;border-radius: 4px;-webkit-box-shadow: 0 1px 1px rgba(0,0,0,.05);box-shadow: 0 1px 1px rgba(0,0,0,.05);border-color: #ddd;\"><div class=\"panel-body\" style=\"-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;padding: 15px;\"><div style=\"text-align: left;-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;\">";
		content += "<p style=\"-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;orphans: 3;widows: 3;margin: 0 0 10px;\">Hi "
				+ name + ",</p></div>";
		content += "<p style=\"-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;orphans: 3;widows: 3;margin: 0 0 10px;\">You have joined a great team. Welcome to Toddlytic!</p>";
		content += "<p style=\"-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;orphans: 3;widows: 3;margin: 0 0 10px;\">We love your kids as much as you do. </p>";
		content += "<p style=\"-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;orphans: 3;widows: 3;margin: 0 0 10px;\"></p>";
		content += "<p style=\"-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;orphans: 3;widows: 3;margin: 0 0 10px;\">Let's get started &nbsp;&nbsp;&nbsp;<a class=\"btn btn-danger\" style=\"background-color: #2E5B68;border: none;-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;color: #fff;text-decoration: none;display: inline-block;padding: 6px 12px;margin-bottom: 0;font-size: 14px;font-weight: 400;line-height: 1.42857143;text-align: center;white-space: nowrap;vertical-align: middle;-ms-touch-action: manipulation;touch-action: manipulation;cursor: pointer;-webkit-user-select: none;-moz-user-select: none;-ms-user-select: none;user-select: none;background-image: none;border-radius: 4px;border-color: #d43f3a;\" href=\""
				+ EMAIL_URL + "?email=" + email + "\">Get Started!</a></p></div>";
		content += "</div></div></body></html>";

		return content;
	}

	
}
