package com.szlhsoft.dao.base;

import java.util.List;
import java.util.Map;

public interface BaseDaoI<T> {
    public Long count(Map params);
    public List<T> find(Map params);
    int insert(T obj);
    int delete(T obj);
    Long remove(Long id);
    int update(T obj);
}
