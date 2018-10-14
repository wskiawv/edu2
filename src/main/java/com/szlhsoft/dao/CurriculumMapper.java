package com.szlhsoft.dao;

import com.szlhsoft.model.Curriculum;

public interface CurriculumMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Curriculum record);

    int insertSelective(Curriculum record);

    Curriculum selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Curriculum record);

    int updateByPrimaryKey(Curriculum record);
}