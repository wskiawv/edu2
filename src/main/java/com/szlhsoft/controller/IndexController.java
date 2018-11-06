package com.szlhsoft.controller;

import com.szlhsoft.core.controller.base.BaseController;
import com.szlhsoft.service.sys.ResourcesServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
public class IndexController extends BaseController {
    @Autowired
    private ResourcesServiceI resourcesServiceI;
    /**
     * 首页
     *
     * @return
     */
    @GetMapping(value = {"/", "index"})
    public String index() {
        return "admin/login";
    }
    /**
     * 首页
     *
     * @return
     */
    @GetMapping(value = {"/main", "main"})
    public String main(HttpServletRequest request, Model model){
        Map<String,Object>menu= resourcesServiceI.getResources();
        //model.addAttribute("menu",menu );
        request.setAttribute("menu",menu);
        LOGGER.info("main");
        LOGGER.debug("debug main");
        LOGGER.error("text");
        return "admin/main";
    }
}
