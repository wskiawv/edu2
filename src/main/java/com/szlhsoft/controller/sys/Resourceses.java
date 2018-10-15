package com.szlhsoft.controller.sys;

import com.szlhsoft.core.annotation.Ctl;
import com.szlhsoft.core.annotation.Method;
import com.szlhsoft.core.controller.base.BaseController;
import com.szlhsoft.core.util.XmlUtil;
import com.szlhsoft.core.model.Message;
import com.szlhsoft.service.sys.ResourcesServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Controller
@RequestMapping("/sys/Resourceses")
@Ctl(name="系统资源")
public class Resourceses extends BaseController {
    @Autowired
    private ResourcesServiceI resourcesServiceI;
    @RequestMapping(value="/getMenu", method={RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    @Method(name="获取菜单")
    public Object getMenu(){
        Message m=new Message();
        Map<String,Object> menu=resourcesServiceI.getResources();
        m.setTitle("温馨提示");
        m.setContent("菜单初始化成功");
        m.setSuccess(true);
        m.setResult(menu);
        return m;
    }
    @RequestMapping(value="/init", method={RequestMethod.GET,RequestMethod.POST})
    @Method(name="初始化系统")
    public String login(HttpServletRequest request, Model model){
        Map map=request.getParameterMap();
        Map <String,Object> params= new HashMap();
        Set<String> keySet=map.keySet();
        for(String key:keySet){
            String [] values=(String[])map.get(key);
            String sum="";
            for(String value:values){
                sum+=value;
            }
            params.put(key, sum);
        }

        getJsConfigPath(model);
        List<Map<String,Object>> urlList= XmlUtil.getElementObject(null);
        Boolean localFlag=XmlUtil.getRootAttribute(null);
        model.addAttribute("localFlag",localFlag.toString());
        if(urlList!=null&& urlList.size()>0&&!localFlag){
            Map<String,Object> urlMap=urlList.get(0);
            model.addAttribute("hdfsUrl",String.valueOf(urlMap.get("url")));
        }else{
            Map<String,Object> urlMap=urlList.get(1);
            model.addAttribute("localPath",String.valueOf(urlMap.get("url")));
        }

        return "/admin/main";
    }

    /**
     * 获取系统Js配置并返回给视图
     * @param model
     */
    public void getJsConfigPath(Model model){
        List<String>list=XmlUtil.getJsPath();
        model.addAttribute("jsConfigPathList", list);

    }

}
