package com.dao.impl;

import com.dao.LanguageDao;
import com.model.Language;
import org.springframework.stereotype.Repository;

@Repository
public class LanguageDaoImpl extends GenericDaoImpl<Language, Long> implements
		LanguageDao {
}
