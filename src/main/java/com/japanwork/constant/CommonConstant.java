package com.japanwork.constant;

public class CommonConstant {
	public interface StatusTranslate {
        String UNTRANSLATED = "UNTRANSLATED";
        String TRANSLATING = "TRANSLATING";
        String TRANSLATION_COMPLETED = "TRANSLATION_COMPLETED";
        String TRANSLATION_NOT_COMPLETED = "TRANSLATION_NOT_COMPLETED";
    }
	
	public interface StatusApplyJob {
		String WAITING_FOR_COMPANY_APPROVE = "WAITING_FOR_COMPANY_APPROVE";
		String WAITING_FOR_TRANSLATOR_JOIN = "WAITING_FOR_TRANSLATOR_JOIN";
		String ON_GOING = "ON_GOING";
		String APPLICATION_SUCCEED = "APPLICATION_SUCCEED";
		String APPLICATION_CANCELED = "APPLICATION_CANCELED";
    }
	
	public interface Role {
		String COMPANY = "ROLE_COMPANY";
		String CANDIDATE = "ROLE_CANDIDATE";
		String ADMIN = "ROLE_ADMIN";
		String TRANSLATOR = "ROLE_TRANSLATOR";
    }
}
