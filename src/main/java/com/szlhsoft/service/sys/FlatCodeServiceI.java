package com.szlhsoft.service.sys;

import com.szlhsoft.core.service.BaseServiceI;
import com.szlhsoft.model.sys.FlatCode;

import java.util.List;

public interface FlatCodeServiceI extends BaseServiceI<FlatCode> {
    public void initFlatCode();
    public List<FlatCode> getFlatCode();
    void resetFlatCode();
}
