package com.szlhsoft.core.controller.base;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 * Created by Administrator on 2018/9/19.
 */
public class BaseController {
    public static final Logger LOGGER = LoggerFactory.getLogger(BaseController.class);
    /**
     * 获取前台请求参数
     * @return
     */
    public Map<String,Object> getRequestParams(HttpServletRequest request){
        Map map=request.getParameterMap();
        Map <String,Object> params= new HashMap();
        Set<String> keySet=map.keySet();
        for(String key:keySet){
            String [] values=(String[])map.get(key);
            String sum="";
            for(String value:values){
                sum+=value;
                System.out.println(value);
            }
            params.put(key, sum);
        }
        return params;
    }
}
