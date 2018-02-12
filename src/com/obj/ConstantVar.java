package com.obj;

import java.util.HashMap;
import java.util.Map;

public class ConstantVar {

	/* PAYPAL Live boolean */
	public static boolean IS_PAYPAL_LIVE = true;

	/* Bucket name for different instances */
	public static String DEV_BUCKET = "todddev";
	public static String DEV2_BUCKET = "todddev2";
	public static String SIT_BUCKET = "toddsit";
	public static String UAT_BUCKET = "todduat";
	public static String PROD_BUCKET = "toddprod";
	public static String CURRENT_BUCKET = DEV_BUCKET; // IMPORTANT! Change
														// Bucket when deploying
														// to specific instance.

	/* BILLING URL */
	public static String BILLPLZ_UAT_URL = "https://uat.toddlytic.com";
	public static String BILLPLZ_SIT_URL = "https://sit.toddlytic.com";
	public static String BILLPLZ_PROD_URL = "https://system.toddlytic.com";
	public static String BILLPLZ_DEV_URL = "https://dev.toddlytic.com";
	public static String BILLPLZ_DEV2_URL = "https://dev2.toddlytic.com";
	public static String CURRENT_BILL_URL = BILLPLZ_SIT_URL;

	/* Email */
	public static String sf_lead_email = "sales@toddlytic.com";

	/* One SMS Credential */
	public static String ONE_SMS_USERNAME = "API2XIUVU4KYP"; // API0N8WMSG2OC
	public static String ONE_SMS_PASSWORD = "API2XIUVU4KYP2XIUV"; // API0N8WMSG2OC3KK0M

	/*
	 * Firebase Cloud Message Setting
	 */
	public static String FCM_URL = "https://fcm.googleapis.com/fcm/send";
	// public static String FCM_SERVER_KEY =
	// "AAAAtC-RdK0:APA91bHlHmMqdvhH_fGNQ2FirGjaAbUBHWVUSDCNC5jLiTvOO_JFZRRBIEck1SCIHKUBaiNonEG2nXQY3r-gsEy_EvWHCZPXNE187A9HgqOSUJ6rMSLu9UjljQll0z_9EHuHvQvhBnpq";
	// //DEMO
	public static String FCM_SERVER_KEY = "AAAAtC-RdK0:APA91bHlHmMqdvhH_fGNQ2FirGjaAbUBHWVUSDCNC5jLiTvOO_JFZRRBIEck1SCIHKUBaiNonEG2nXQY3r-gsEy_EvWHCZPXNE187A9HgqOSUJ6rMSLu9UjljQll0z_9EHuHvQvhBnpq";

	/* General Message */
	public static String SYSTEM = "SYSTEM";
	public static String FAIL_MSG = "Fail";
	public static String SUCCESS_MSG = "Success";
	public static String ERROR_MSG = "Error";
	public static String EXCEPTION_MSG = "Exception";

	/* Object exist category */
	public static String MANAGER_EXIST = "Manager already assigned to this user";
	public static String MENU_EXIST = "Menu already exist";
	public static String SCHOOL_EXIST = "School already exist";
	public static String MEAL_EXIST = "Meal already exist";
	public static String USER_EXIST = "User already exist";
	public static String PACKAGE_EXIST = "Package already exist";
	public static String ROOM_EXIST = "Room already exist";
	public static String ACTION_EXIST = "Action already exist";
	public static String EMAIL_EXIST = "Email already exist";
	public static String EMAIL_NOT_EXIST = "Email not exists";
	public static String ALBUM_EXIST = "Album already exist";
	public static String PLACE_ID_EXIST = "This Place ID is already registered to another school";
	public static String FCM_ERROR = "FCM error";

	// public static String EMAIL_URL =
	// "https://uat.toddlytic.com/#/registrationActivation.html";
	// public static String FORGOT_PASSWORD_URL =
	// "https://uat.toddlytic.com/#/forgotPassword.html";
	// public static String EMAIL_URL =
	// "http://system.toddlytic.com/#/registrationActivation.html";
	// public static String FORGOT_PASSWORD_URL =
	// "http://system.toddlytic.com/#/forgotPassword.html";
	public static String EMAIL_URL = "https://sit.toddlytic.com/#/registrationActivation.html";
	public static String FORGOT_PASSWORD_URL = "https://sit.toddlytic.com/#/forgotPassword.html";
	// public static String EMAIL_URL =
	// "https://uat.toddlytic.com/#/registrationActivation.html";
	// public static String FORGOT_PASSWORD_URL =
	// "https://uat.toddlytic.com/#/forgotPassword.html";
	// public static String EMAIL_URL =
	// "http://system.toddlytic.com/#/registrationActivation.html";
	// public static String FORGOT_PASSWORD_URL =
	// "http://system.toddlytic.com/#/forgotPassword.html";
	// public static String EMAIL_URL =
	// "https://sit.toddlytic.com/#/registrationActivation.html";
	// public static String FORGOT_PASSWORD_URL =
	// "https://sit.toddlytic.com/#/forgotPassword.html";
	// public static String EMAIL_URL =
	// "https://dev.toddlytic.com/#/registrationActivation.html";
	// public static String FORGOT_PASSWORD_URL =
	// "https://dev.toddlytic.com/#/forgotPassword.html";
	// public static String EMAIL_URL =
	// "https://dev2.toddlytic.com/#/registrationActivation.html";
	// public static String FORGOT_PASSWORD_URL =
	// "https://dev2.toddlytic.com/#/forgotPassword.html";
	// public static String EMAIL_URL =
	// "http://localhost:8080/Toddlytics/#/registrationActivation.html";
	// public static String FORGOT_PASSWORD_URL =
	// "http://localhost:8080/Toddlytics/#/forgotPassword.html";

	/* Success Response Remark */
	public static String PASSWORD_RESET = "Please check your inbox.";
	public static String PASSWORD_CHANGED = "Please use your new password upon your next login.";

	/* Fail Response Remark */
	public static String LOGIN_ERROR = "Username or password is incorrect";
	public static String USER_NOT_FOUND = "Your account does not exist. Please register.";
	public static String LOGIN_ATTEMPTS = "Your login attempt was unsucessful because you have requested to change your password. Please check your inbox.";
	public static String STUDENT_ENROLLED = "Unable to delete. There are students enrolled in this school.";
	public static String LICENSE_LIMIT = "There is no available license for this new user";
	public static String EMAIL_NOT_FOUND = "Email not found";
	public static String EMAIL_VERIFIED = "Email already verified. Proceed to login.";
	public static String INVALID_TYPE = "Invalid type";
	public static String TOKEN_NOT_FOUND = "Token not found";
	public static String TOKEN_INVALID = "Invalid token";
	public static String FORGOT_PASSWORD = "You have requested to reset password";
	public static String OLD_PASSWORD_NOT_FOUND = "Old password incorrect";
	public static String SMS_LIMIT = "Insufficient SMS credits to send";
	public static String NEW_EMAIL_EXIST = "New email is already been used";
	public static String STUDENT_LIMIT = "Reached student maximum capacity";
	public static String EMAIL_NOT_VERIFIED = "Email is not verified";
	public static String CAPACITY_EXCEED = "You cannot enroll a student to a program that has reached it's maximum capacity";
	public static String INSUFFICIENT_STORAGE = "Insufficient storage";
	public static String CONTACT_ACTIVATION_EXCEED = "Please contact your administrator";
	public static String INVALID_TAC = "Invalid tac";
	public static String INCOMPLETE_SCHOOL_INFO = "Incomplete school information";
	public static String STUDENT_EXIST_IN_PROGRAM = "You cannot remove a Program which has students enrolled to it. Please Withdraw or Complete the students in the Program, then try removing the Program again.";

	/* Approval Actions Description */
	public static String APP_CREATE = "Request to create a new ";
	public static String APP_UPDATE = "Request to update ";
	public static String APP_DELETE = "Request to delete ";
	public static String APP_UPLOAD = "Request to upload ";
	public static String APP_SEND = "Request to send ";
	public static String APP_ADD_PACKAGE = "Request to add ";

	/* Approval Actions Type */
	public static String APP_CREATE_TYPE = "CREATE";
	public static String APP_UPDATE_TYPE = "UPDATE";
	public static String APP_DELETE_TYPE = "DELETE";

	/* Audit Log Constant Variables */
	public static String ACTION_INSERT = "insert";
	public static String ACTION_UPDATE = "update";
	public static String ACTION_DELETE = "delete";
	public static String ACTION_SEND_EMAIL = "send_email";

	public static final String TABLE_ACTIVITY = "ACTIVITY";
	public static final String TABLE_ACTIVITY_ITEM = "ACTIVITY_ITEM";
	public static final String TABLE_ACTIVITY_TRACKING = "ACTIVITY_TRACKING";
	public static final String TABLE_ALBUM = "ALBUM";
	public static final String TABLE_ASSESSMENT = "ASSESSMENT";
	public static final String TABLE_ASSESSMENT_CRITERIA = "ASSESSMENT_CRITERIA";
	public static final String TABLE_ASSESSMENT_CRITERIA_HISTORY = "ASSESSMENT_CRITERIA_HISTORY";
	public static final String TABLE_ASSESSMENT_PROGRAM = "ASSESSMENT_PROGRAM";
	public static final String TABLE_ASSESSMENT_STUDENT = "ASSESSMENT_STUDENT";
	public static final String TABLE_AUDIT_LOG = "AUDIT_LOG";
	public static final String TABLE_CALENDAR = "CALENDAR";
	public static final String TABLE_CALENDAR_EVENT = "CALENDAR_EVENT";
	public static final String TABLE_CMSUSER = "USER";
	public static final String TABLE_CONTACT = "CONTACT";
	public static final String TABLE_D_S_PROGRAM = "DAILY_SCHOOL_PROGRAM";
	public static final String TABLE_DELEGATION = "DELEGATION";
	public static final String TABLE_DELEGATION_USER = "DELEGATION_USER";
	public static final String TABLE_EDITIONS = "EDITIONS";
	public static final String TABLE_ENROLLMENT = "ENROLLMENT";
	public static final String TABLE_ENROLLMENT_STUDENT = "ENROLLMENT_STUDENT";
	public static final String TABLE_EVENT = "EVENT";
	public static final String TABLE_HOLIDAY = "HOLIDAY";
	public static final String TABLE_LEADS = "LEADS";
	public static final String TABLE_LEAVE_APPLICATION = "LEAVE_APPLICATION";
	public static final String TABLE_LEAVE_DETAIL = "LEAVE_DETAIL";
	public static final String TABLE_LICENSE = "LICENSE";
	public static final String TABLE_L_B_ITEMS = "LICENSE_BILLING_ITEMS";
	public static final String TABLE_LICENSE_PURCHASED = "LICENSE_PURCHASED";
	public static final String TABLE_L_P_HISTORY = "LICENSE_PURCHASE_HISTORY";
	public static final String TABLE_L_S_USER = "LICENSE_SCHOOL_USER";
	public static final String TABLE_LICENSE_TYPE = "LICENSE_TYPE";
	public static final String TABLE_LICENSE_USER = "LICENSE_USER";
	public static final String TABLE_LOGIN_REQUEST = "LOGIN_REQUEST";
	public static final String TABLE_MANAGER = "MANAGER";
	public static final String TABLE_MEAL = "MEAL";
	public static final String TABLE_MEAL_RECIPE = "MEAL_RECIPE";
	public static final String TABLE_MEDICAL_HISTORY = "MEDICAL_HISTORY";
	public static final String TABLE_MENU = "MENU";
	public static final String TABLE_MENU_SCHOOL = "MENU_SCHOOL";
	public static final String TABLE_MESSAGE = "MESSAGE";
	public static final String TABLE_MESSAGE_CONTACT = "MESSAGE_CONTACT";
	public static final String TABLE_NEWSLETTER = "NEWSLETTER";
	public static final String TABLE_NEWSLETTER_PROGRAM = "NEWSLETTER_PROGRAM";
	public static final String TABLE_NOTES = "NOTES";
	public static final String TABLE_OPTION = "OPTION";
	public static final String TABLE_ORGANIZATION = "ORGANIZATION";
	public static final String TABLE_ORGANIZATION_CONTACT = "ORGANIZATION_CONTACT";
	public static final String TABLE_ORGANIZATION_USER = "ORGANIZATION_USER";
	public static final String TABLE_PACKAGE = "PACKAGE";
	public static final String TABLE_PACKAGE_OPTION = "PACKAGE_OPTION";
	public static final String TABLE_PACKAGE_SCHOOL = "PACKAGE_SCHOOL";
	public static final String TABLE_PHOTO = "PHOTO";
	public static final String TABLE_PHOTO_TAGGING = "PHOTO_TAGGING";
	public static final String TABLE_PROFILE = "PROFILE";
	public static final String TABLE_PROFILE_USER = "PROFILE_USER";
	public static final String TABLE_PROGRAM = "PROGRAM";
	public static final String TABLE_PROGRAM_ITEM = "PROGRAM_ITEM";
	public static final String TABLE_PROGRAM_SCHOOL = "PROGRAM_SCHOOL";
	public static final String TABLE_PROGRAM_SCHOOL_STUDENT = "PROGRAM_SCHOOL_STUDENT";
	public static final String TABLE_PROGRAM_ACTIVITY = "PROGRAM_ACTIVITY";
	public static final String TABLE_RECIPE = "RECIPE";
	public static final String TABLE_REMARK = "REMARK";
	public static final String TABLE_REQUEST = "REQUEST";
	public static final String TABLE_ROOM = "ROOM";
	public static final String TABLE_ROOM_EVENT = "ROOM_EVENT";
	public static final String TABLE_SCHOOL = "SCHOOL";
	public static final String TABLE_SCHOOL_CONTACT = "SCHOOL_CONTACT";
	public static final String TABLE_SERVICE = "SERVICE";
	public static final String TABLE_SERVICE_OPTION = "SERVICE_OPTION";
	public static final String TABLE_SMS_BUNDLE = "SMS_BUNDLE";
	public static final String TABLE_SMS_PURCHASED = "SMS_PURCHASED";
	public static final String TABLE_SMS_PURHCASED_HISTORY = "SMS_PURCHASED_HISTORY";
	public static final String TABLE_STUDENT = "STUDENT";
	public static final String TABLE_STUDENT_BILLING_ITEM = "STUDENT_BILLING_ITEM";
	public static final String TABLE_STUDENT_CONTACT = "STUDENT_CONTACT";
	public static final String TABLE_STUDENT_INVOICE = "STUDENT_INVOICE";
	public static final String TABLE_STUDENT_INVOICE_ITEM = "STUDENT_INVOICE_ITEM";
	public static final String TABLE_STUDENT_INVOICE_NUMBER = "STUDENT_INVOICE_NUMBER";
	public static final String TABLE_STUDENT_ITEM = "STUDENT_ITEM";
	public static final String TABLE_STUDENT_LINK_PACKAGE = "STUDENT_LINK_PACKAGE";
	public static final String TABLE_S_S_PROGRAM = "SCHOOL_PROGRAM";
	public static final String TABLE_TEACHER_EVENT = "TEACHER_EVENT";
	public static final String TABLE_TIMETABLE = "TIMETABLE";
	public static final String TABLE_TRACKING = "TRACKING";
	public static final String TABLE_TRANSACTION_BUNDLE = "TRANSACTION_BUNDLE";
	public static final String TABLE_TRANSACTION_PURCHASED = "TRANSACTION_PURCHASED";
	public static final String TABLE_T_P_HISTORY = "TRANSACTION_PURCHASE_HISTORY";
	public static final String TABLE_W_G_HISTORY = "WIZARD_GENERATION_HISTORY";

	/* Profile Constant Module Variables */
	public static String P_ORG = "ORGANIZATION";
	public static String P_STUDENT = "STUDENT";
	public static String P_PARENT = "PARENT";
	public static String P_STAFF = "STAFF";
	public static String P_OTHER = "OTHER";
	public static String P_SCHEDULING = "SCHEDULING";
	public static String P_CALENDAR = "CALENDAR";
	public static String P_ROOM = "ROOM";
	public static String P_FOOD = "FOOD";
	public static String P_REQUEST = "REQUEST";
	public static String P_ANNOUNCEMENT = "ANNOUNCEMENT";
	public static String P_NEWSLETTER = "NEWSLETTER";
	public static String P_PUSHMESSAGE = "PUSHMESSAGE";
	public static String P_PHOTO = "PHOTO";
	public static String P_MOBILE = "MOBILE";
	public static String P_PROGRAM = "PROGRAM";
	public static String P_ACTIVITY = "ACTIVITY";
	public static String P_WORKFLOW = "WORKFLOW";
	public static String P_ADHOCPACKAGE = "ADHOCPACKAGE";
	public static String P_MEAL = "MEAL";
	public static String P_RECIPE = "RECIPE";
	public static String P_PRIVILEGE = "PRIVILEGE";

	/* Profile Constant Variables (C,R,U,D) */
	/* Admin */
	public static String P_A_ORG = "1111";
	public static String P_A_STUDENT = "1111";
	public static String P_A_PARENT = "1111";
	public static String P_A_STAFF = "1111";
	public static String P_A_OTHER = "1111";
	public static String P_A_SCHEDULING = "1111";
	public static String P_A_CALENDAR = "1111";
	public static String P_A_ROOMS = "1111";
	public static String P_A_FOOD = "1111";
	public static String P_A_REQUEST = "1111";
	public static String P_A_ANNOUNCEMENT = "1111";
	public static String P_A_NEWSLETTER = "1111";
	public static String P_A_PUSHMESSAGE = "1111";
	public static String P_A_PHOTO = "1111";
	public static String P_A_MOBILE = "1111";
	public static String P_A_PROGRAM = "1111";
	public static String P_A_ACTIVITY = "1111";
	public static String P_A_WORKFLOW = "1111";
	public static String P_A_ADHOCPACKAGE = "1111";
	public static String P_A_MEALS = "1111";
	public static String P_A_RECIPE = "1111";
	public static String P_A_PRIVILEGE = "1111";

	public static Map<String, String> getAdminPermission() {

		Map<String, String> p1 = new HashMap<>();
		p1.put(ConstantVar.P_ORG, P_A_ORG);
		p1.put(ConstantVar.P_STUDENT, P_A_STUDENT);
		p1.put(ConstantVar.P_PARENT, P_A_PARENT);
		p1.put(ConstantVar.P_STAFF, P_A_STAFF);
		p1.put(ConstantVar.P_OTHER, P_A_OTHER);
		p1.put(ConstantVar.P_SCHEDULING, P_A_SCHEDULING);
		p1.put(ConstantVar.P_CALENDAR, P_A_CALENDAR);
		p1.put(ConstantVar.P_ROOM, P_A_ROOMS);
		p1.put(ConstantVar.P_FOOD, P_A_FOOD);
		p1.put(ConstantVar.P_REQUEST, P_A_REQUEST);
		p1.put(ConstantVar.P_ANNOUNCEMENT, P_A_ANNOUNCEMENT);
		p1.put(ConstantVar.P_NEWSLETTER, P_A_NEWSLETTER);
		p1.put(ConstantVar.P_PUSHMESSAGE, P_A_PUSHMESSAGE);
		p1.put(ConstantVar.P_PHOTO, P_A_PHOTO);
		p1.put(ConstantVar.P_MOBILE, P_A_MOBILE);
		p1.put(ConstantVar.P_PROGRAM, P_A_PROGRAM);
		p1.put(ConstantVar.P_ACTIVITY, P_A_ACTIVITY);
		p1.put(ConstantVar.P_WORKFLOW, P_A_WORKFLOW);
		p1.put(ConstantVar.P_ADHOCPACKAGE, P_A_ADHOCPACKAGE);
		p1.put(ConstantVar.P_MEAL, P_A_MEALS);
		p1.put(ConstantVar.P_RECIPE, P_A_RECIPE);
		p1.put(ConstantVar.P_PRIVILEGE, P_A_PRIVILEGE);

		return p1;
	}

	/* Teacher */
	public static String P_T_ORG = "0000";
	public static String P_T_STUDENT = "0000";
	public static String P_T_PARENT = "0111";
	public static String P_T_STAFF = "0111";
	public static String P_T_OTHER = "0111";
	public static String P_T_SCHEDULING = "0000";
	public static String P_T_CALENDAR = "0100";
	public static String P_T_ROOMS = "0000";
	public static String P_T_FOOD = "0000";
	public static String P_T_REQUEST = "1100";
	public static String P_T_ANNOUNCEMENT = "0100";
	public static String P_T_NEWSLETTER = "0100";
	public static String P_T_PUSHMESSAGE = "1100";
	public static String P_T_PHOTO = "1100";
	public static String P_T_MOBILE = "0000";
	public static String P_T_PROGRAM = "0000";
	public static String P_T_ACTIVITY = "0000";
	public static String P_T_WORKFLOW = "0000";
	public static String P_T_ADHOCPACKAGE = "0000";
	public static String P_T_MEALS = "0000";
	public static String P_T_RECIPE = "0000";
	public static String P_T_PRIVILEGE = "0000";

	public static Map<String, String> getTeacherPermission() {

		Map<String, String> p1 = new HashMap<>();
		p1.put(ConstantVar.P_ORG, P_T_ORG);
		p1.put(ConstantVar.P_STUDENT, P_T_STUDENT);
		p1.put(ConstantVar.P_PARENT, P_T_PARENT);
		p1.put(ConstantVar.P_STAFF, P_T_STAFF);
		p1.put(ConstantVar.P_OTHER, P_T_OTHER);
		p1.put(ConstantVar.P_SCHEDULING, P_T_SCHEDULING);
		p1.put(ConstantVar.P_CALENDAR, P_T_CALENDAR);
		p1.put(ConstantVar.P_ROOM, P_T_ROOMS);
		p1.put(ConstantVar.P_FOOD, P_T_FOOD);
		p1.put(ConstantVar.P_REQUEST, P_T_REQUEST);
		p1.put(ConstantVar.P_ANNOUNCEMENT, P_T_ANNOUNCEMENT);
		p1.put(ConstantVar.P_NEWSLETTER, P_T_NEWSLETTER);
		p1.put(ConstantVar.P_PUSHMESSAGE, P_T_PUSHMESSAGE);
		p1.put(ConstantVar.P_PHOTO, P_T_PHOTO);
		p1.put(ConstantVar.P_MOBILE, P_T_MOBILE);
		p1.put(ConstantVar.P_PROGRAM, P_T_PROGRAM);
		p1.put(ConstantVar.P_ACTIVITY, P_T_ACTIVITY);
		p1.put(ConstantVar.P_WORKFLOW, P_T_WORKFLOW);
		p1.put(ConstantVar.P_ADHOCPACKAGE, P_T_ADHOCPACKAGE);
		p1.put(ConstantVar.P_MEAL, P_T_MEALS);
		p1.put(ConstantVar.P_RECIPE, P_T_RECIPE);
		p1.put(ConstantVar.P_PRIVILEGE, P_T_PRIVILEGE);

		return p1;
	}

	/* Staff */
	public static String P_S_ORG = "0000";
	public static String P_S_STUDENT = "1111";
	public static String P_S_PARENT = "0000";
	public static String P_S_STAFF = "0000";
	public static String P_S_OTHER = "0000";
	public static String P_S_SCHEDULING = "0000";
	public static String P_S_CALENDAR = "0100";
	public static String P_S_ROOMS = "0000";
	public static String P_S_FOOD = "0000";
	public static String P_S_REQUEST = "1111";
	public static String P_S_ANNOUNCEMENT = "0100";
	public static String P_S_NEWSLETTER = "0100";
	public static String P_S_PUSHMESSAGE = "1100";
	public static String P_S_PHOTO = "0000";
	public static String P_S_MOBILE = "0000";
	public static String P_S_PROGRAM = "0000";
	public static String P_S_ACTIVITY = "0000";
	public static String P_S_WORKFLOW = "0000";
	public static String P_S_ADHOCPACKAGE = "0000";
	public static String P_S_MEALS = "0000";
	public static String P_S_RECIPE = "0000";
	public static String P_S_PRIVILEGE = "0000";

	public static Map<String, String> getStaffPermission() {

		Map<String, String> p1 = new HashMap<>();
		p1.put(ConstantVar.P_ORG, P_S_ORG);
		p1.put(ConstantVar.P_STUDENT, P_S_STUDENT);
		p1.put(ConstantVar.P_PARENT, P_S_PARENT);
		p1.put(ConstantVar.P_STAFF, P_S_STAFF);
		p1.put(ConstantVar.P_OTHER, P_S_OTHER);
		p1.put(ConstantVar.P_SCHEDULING, P_S_SCHEDULING);
		p1.put(ConstantVar.P_CALENDAR, P_S_CALENDAR);
		p1.put(ConstantVar.P_ROOM, P_S_ROOMS);
		p1.put(ConstantVar.P_FOOD, P_S_FOOD);
		p1.put(ConstantVar.P_REQUEST, P_S_REQUEST);
		p1.put(ConstantVar.P_ANNOUNCEMENT, P_S_ANNOUNCEMENT);
		p1.put(ConstantVar.P_NEWSLETTER, P_S_NEWSLETTER);
		p1.put(ConstantVar.P_PUSHMESSAGE, P_S_PUSHMESSAGE);
		p1.put(ConstantVar.P_PHOTO, P_S_PHOTO);
		p1.put(ConstantVar.P_MOBILE, P_S_MOBILE);
		p1.put(ConstantVar.P_PROGRAM, P_S_PROGRAM);
		p1.put(ConstantVar.P_ACTIVITY, P_S_ACTIVITY);
		p1.put(ConstantVar.P_WORKFLOW, P_S_WORKFLOW);
		p1.put(ConstantVar.P_ADHOCPACKAGE, P_S_ADHOCPACKAGE);
		p1.put(ConstantVar.P_MEAL, P_S_MEALS);
		p1.put(ConstantVar.P_RECIPE, P_S_RECIPE);
		p1.put(ConstantVar.P_PRIVILEGE, P_S_PRIVILEGE);

		return p1;
	}

}
