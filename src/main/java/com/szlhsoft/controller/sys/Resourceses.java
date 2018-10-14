package com.szlhsoft.controller.sys;

import com.szlhsoft.annotation.Ctl;
import com.szlhsoft.annotation.Method;
import com.szlhsoft.controller.base.BaseController;
import com.szlhsoft.core.util.XmlUtil;
import com.szlhsoft.model.Message;
import com.szlhsoft.service.sys.ResourcesServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
    public ModelAndView login(HttpServletRequest request){
        //test();
        //getSysAllUrl();
        //HttpServletRequest request=((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
        Map map=request.getParameterMap();
        //String[] username=(String[])map.get("username");
        Map <String,Object> params= new HashMap();
        Set<String> keySet=map.keySet();
        for(String key:keySet){
            String [] values=(String[])map.get(key);
            String sum="";
            for(String value:values){
                sum+=value;
                System.out.println(value);
            }
            //System.out.println(sum);
            params.put(key, sum);
        }
        for(String name:params.keySet()){
            System.out.println(name);
            System.out.println(params.get(name));
        }
        ModelAndView modelAndView = new ModelAndView();
        getJsConfigPath(modelAndView);
        List<Map<String,Object>> urlList= XmlUtil.getElementObject(null);
        Boolean localFlag=XmlUtil.getRootAttribute(null);
        modelAndView.addObject("localFlag",localFlag.toString());
        if(urlList!=null&& urlList.size()>0&&!localFlag){
            Map<String,Object> urlMap=urlList.get(0);
            modelAndView.addObject("hdfsUrl",String.valueOf(urlMap.get("url")));
        }else{
            Map<String,Object> urlMap=urlList.get(1);
            modelAndView.addObject("localPath",String.valueOf(urlMap.get("url")));
        }
        modelAndView.setViewName("main");
        return modelAndView;
    }
	/*public List<JSONObject> genTree(List<Menu> list,Menu menu){
		List<JSONObject> menuList=new ArrayList();
		for(Menu m:list){
			if(m.getPid().equals(menu)){
				System.out.println("te------------");
			}
		}
		return menuList;
	}*/
    /**
     * 获取系统Js配置并返回给视图
     * @param modelAndView
     */
    public void getJsConfigPath(ModelAndView modelAndView){
        List<String>list=XmlUtil.getJsPath();
        modelAndView.addObject("jsConfigPathList", list);

    }

}
