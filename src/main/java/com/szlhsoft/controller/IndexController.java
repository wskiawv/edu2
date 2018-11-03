package com.szlhsoft.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
@Controller
public class IndexController {
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
        return "admin/main";
    }
}
