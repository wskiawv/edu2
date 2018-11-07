package com.szlhsoft.controller.sys;

import com.szlhsoft.core.annotation.Ctl;
import com.szlhsoft.core.annotation.Method;
import com.szlhsoft.core.model.Message;
import com.szlhsoft.service.sys.FlatCodeServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/sys/FlatCodes")
@Ctl(name="代码")
public class FlatCodes {
    @Autowired
    private FlatCodeServiceI flatCodeServiceI;
    @RequestMapping(value="/init", method={RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    @Method(name="初始化代码")
    public Object init(){
        Message m=new Message();
        flatCodeServiceI.initFlatCode();
        m.setTitle("温馨提示");
        m.setContent("代码初始化成功");
        m.setSuccess(true);
        return m;
    }
    @RequestMapping(value="/getFlatCode", method={RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    @Method(name="获取代码")
    public Object getFlatCode() {
        Message m = new Message();
        flatCodeServiceI.getFlatCode();
        return m;
    }
}
