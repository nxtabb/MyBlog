package com.hrbeu.controller.admin;

import com.hrbeu.pojo.User;
import com.hrbeu.service.adminService.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ViewController {
    @Autowired
    private TypeService typeService;

    @RequestMapping(value = "/admin",method = RequestMethod.GET)
    public String login(HttpServletRequest request){
        User user =(User) request.getSession().getAttribute("user");
        if(user!=null) {
            return "redirect:/admin/index";
        }
        else {
            return "admin/login";
        }
    }

    @RequestMapping(value = "/admin/register",method = RequestMethod.GET)
    public String register(){
        return "admin/register";
    }

    @RequestMapping(value = "/admin/index",method = RequestMethod.GET)
    public String admin_index(){
        return "admin/index";
    }

    @GetMapping("/admin/types/input")
    public String typesInput(){
        return "admin/type-input";
    }

    @GetMapping("/admin/tags/input")
    public String tagsInput(){
        return "admin/tag-input";
    }

    @RequestMapping(value = "/admin/blogs")
    public String documents(){
        return "document";
    }

}
