package com.szlhsoft.controller;

import com.szlhsoft.core.controller.base.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
@Controller
public class IndexController extends BaseController {
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
    public String main(){
        LOGGER.info("main");
        LOGGER.debug("debug main");
        LOGGER.error("text");
        return "admin/main";
    }
}
