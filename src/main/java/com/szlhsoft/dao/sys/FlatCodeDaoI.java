package com.szlhsoft.dao.sys;

import com.szlhsoft.core.dao.base.BaseDaoI;
import com.szlhsoft.model.sys.FlatCode;


public interface FlatCodeDaoI extends BaseDaoI<FlatCode> {
    int deleteByPrimaryKey(Integer id);

    int insert(FlatCode record);

    int insertSelective(FlatCode record);

    FlatCode selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(FlatCode record);

    int updateByPrimaryKey(FlatCode record);

}
