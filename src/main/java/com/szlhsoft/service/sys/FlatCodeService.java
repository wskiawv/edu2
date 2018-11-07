package com.szlhsoft.service.sys;

import com.szlhsoft.core.model.Page;
import com.szlhsoft.core.util.XmlUtil;
import com.szlhsoft.dao.sys.FlatCodeDaoI;
import com.szlhsoft.model.sys.FlatCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class FlatCodeService  implements FlatCodeServiceI {
    @Autowired
    private FlatCodeDaoI flatCodeDaoI;
    @Override
    public void initFlatCode() {
        String xmlFile=this.getClass().getClassLoader().getResource("").getPath()+"/config/flat-codes.xml";
        List<FlatCode>list= XmlUtil.readXml(FlatCode.class, xmlFile);
        //导入数据前先清空表数据，再做导入
        resetFlatCode();
        for(FlatCode f : list){
            flatCodeDaoI.insertSelective(f);
        }
    }

    @Override
    public List<FlatCode> getFlatCode() {
        return null;
    }

    @Override
    public void resetFlatCode() {
        flatCodeDaoI.deleteAll();
    }

    @Override
    public Page search(Map params) {
        Page page =new Page(params);
        params.put("start", page.getStart());
        params.put("limit",page.getLimit());
        Long count=flatCodeDaoI.count(params);
        List<FlatCode>result=flatCodeDaoI.find(params);
        page.setTotalCount(count);
        page.setResult(result);
        return page;
    }

    @Override
    public List<FlatCode> exportData(Map params) {
        Map<String,Object> parameter=new HashMap();
        parameter.put("start", 0);
        parameter.put("limit", 25);
        parameter.put("page",1);
        Long count=flatCodeDaoI.count(params);
        List<FlatCode>List=flatCodeDaoI.find(params);
        return List;
    }

    @Override
    public void importData(List<FlatCode> list) {
        for(FlatCode f : list){
            flatCodeDaoI.insertSelective(f);
        }
    }

}
