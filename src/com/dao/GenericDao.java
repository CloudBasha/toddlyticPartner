package com.dao;

import java.io.Serializable;
import java.util.List;


public interface GenericDao<T, ID extends Serializable> {

    public static final long SLOW_QUERY_THRESHOLD = 1000;

    void persist(T transientInstance);

    void remove(T persistentInstance);

    T merge(T detachedInstance);

    void lock(T detachedInstance);

    T findById(ID id);

    List<T> findAll();

    List<T> search(String fieldName, Object value);

    void clear();

    void flush();
    
    public List<T> findAllBySort(String sort);

}
