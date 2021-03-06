INSERT INTO `prescholarpartner`.`partner`
(`PRIMARY_ID`,
`CREATED_BY`,
`CREATED_DATE`,
`UPDATED_BY`,
`MODIFIED_DATE`,
`BANK_ACCOUNT_NAME`,
`BANK_ACCOUNT_NO`,
`BANK_NAME`,
`IS_BILLING_ENABLED`,
`CITY`,
`COMPANY_NO`,
`CONTACT_NO`,
`COUNTRY`,
`CREATED_BY_ID`,
`CURRENCY`,
`DATE_FORMAT`,
`DEFAULT_BILLING_CYCLE`,
`DELETED_BY`,
`DELETED_BY_ID`,
`DELETED_DATE`,
`DESCRIPTION`,
`EMAIL`,
`FAX_NUMBER`,
`FOOTER_NOTE`,
`HEADER_NOTE`,
`INVOICE_PREFIX`,
`INVOICE_RUNNING_NO`,
`LANGUAGE`,
`LAST_BILLING_DATE`,
`LATITUDE`,
`LOGO_URL`,
`LONGITUDE`,
`MODIFIED_BY_ID`,
`MONTHLY_BILLING_DATE`,
`NAME`,
`NUMBER_OF_ORGANIZATIONS`,
`PAYMENT_TERM`,
`POST_CODE`,
`START_OF_WEEK`,
`STATE`,
`STATUS`,
`STREET_ADDR`,
`STREET_ADDR_ONE`,
`STREET_ADDR_TWO`,
`TAX_ACTIVE`,
`TAX_PERCENTAGE`,
`TIMEZONE`,
`WEBSITE`,
`PARAENT_PARTNER_ID`)
VALUES
(1,
'test',
'2017-06-14 00:00:00',
null,
null,
null,
null,
null,
0,
null,
null,
null,
null,
1,
null,
null,
null,
null,
0,
null,
null,
null,
null,
null,
null,
null,
null,
null,
null,
null,
null,
null,
1,
null,
'Test',
'10',
null,
null,
null,
null,
'true',
null,
null,
null,
0,
null,
null,
null,
null);



INSERT INTO `prescholarpartner`.`user`
(`CMS_USER_ID`,
`STATUS`,
`IS_ADMIN`,
`IS_APPROVED`,
`APPROVED_BY`,
`APPROVED_DATE`,
`CREATED_BY`,
`CREATED_DATE`,
`IS_DELETED`,
`DELETED_BY`,
`DELETED_DATE`,
`EMAIL_ADDRESS`,
`IS_EMAIL_VERIFIED`,
`IS_INVITED`,
`LOGIN_ATTEMPTS`,
`IS_MAIL_SEND`,
`MOBILE_NUMBER`,
`MODIFIED_BY`,
`UPDATED_DATE`,
`NAME`,
`PASSWORD`,
`IS_SHARED`,
`IS_USER_LOCKED`,
`USER_NAME`,
`PARTNER_ID`,
`REFERED_CMS_USER_ID`)
VALUES
(1,
'true',
0,
0,
null,
null,
'test',
'2017-06-14 00:00:00',
0,
null,
null,
'test@gmail.com',
1,
1,
0,
1,
null,
null,
null,
'test',
'test123',
1,
0,
'test',
1,
null);