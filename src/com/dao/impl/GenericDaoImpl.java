package com.dao.impl;

import com.dao.GenericDao;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.persistence.EntityManager;
import javax.persistence.LockModeType;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

public abstract class GenericDaoImpl<T, ID extends Serializable> {

	private Class<T> persistentClass;

	@PersistenceContext
	private EntityManager entityManager;

	protected EntityManager getEntityManager() {
		return this.entityManager;
	}

	public GenericDaoImpl() {
		this.persistentClass = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
	}

	public Class<T> getPersistentClass() {
		return persistentClass;
	}

	public void persist(T transientInstance) {

		try {
			entityManager.persist(transientInstance);

		} catch (RuntimeException re) {

			throw re;
		}
	}

	/*
	 * public void remove(T persistentInstance) {
	 * 
	 * try { entityManager.remove(persistentInstance);
	 * 
	 * } catch (RuntimeException re) {
	 * 
	 * throw re; } }
	 */

	public void remove(T persistentInstance) {

		try {
			Object managed = entityManager.merge(persistentInstance);
			entityManager.remove(managed);

		} catch (RuntimeException re) {

			throw re;
		}
	}

	public T merge(T detachedInstance) {

		try {
			T result = entityManager.merge(detachedInstance);

			return result;
		} catch (RuntimeException re) {

			throw re;
		}
	}

	public void lock(T detachedInstance) {

		try {
			entityManager.lock(detachedInstance, LockModeType.READ);

			return;
		} catch (RuntimeException re) {

			throw re;
		}
	}

	public T findById(ID id) {

		try {
			T instance = entityManager.find(getPersistentClass(), id);

			return instance;
		} catch (RuntimeException re) {

			throw re;
		}
	}

	public List<T> findAll() {

		try {
			Query query = entityManager.createQuery("FROM " + getPersistentClass().getName());
			return query.getResultList();
		} catch (RuntimeException re) {

			throw re;
		}
	}

	public List<T> findAllBySort(String sort) {

		try {
			Query query = entityManager.createQuery("FROM " + getPersistentClass().getName() + " " + sort);
			return query.getResultList();
		} catch (RuntimeException re) {

			throw re;
		}
	}

	public List<T> search(String fieldName, Object value) {

		try {
			String sql = "FROM " + getPersistentClass().getName() + " tbl WHERE tbl." + fieldName + " LIKE :value";
			Query query = entityManager.createQuery(sql);
			query.setParameter("value", value);

			return query.getResultList();
		} catch (RuntimeException re) {

			throw re;
		}
	}

	public void clear() {

		getEntityManager().clear();
	}

	public void flush() {

		getEntityManager().flush();
	}

}
