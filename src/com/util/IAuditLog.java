package com.util;

public interface IAuditLog {
	public Long getAuditLogId();	
	public String getLogDeatil();
	public void setLogDetail(String logDetail);
	public String getClassName();
}
