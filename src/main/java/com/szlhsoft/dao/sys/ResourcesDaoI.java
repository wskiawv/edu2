package com.szlhsoft.dao.sys;

import com.szlhsoft.core.dao.base.BaseDaoI;
import com.szlhsoft.model.sys.Resources;

import java.util.List;

public interface ResourcesDaoI extends BaseDaoI<Resources> {
    int insert(Resources record);
    int insertSelective(Resources record);
    void delete(Long id);
    void deleteAll();
    List<Resources> select(String name);
}
