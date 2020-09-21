package com.hrbeu.controller;

import com.hrbeu.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ViewController {
    @Autowired
    private TypeService typeService;

    @RequestMapping(value = "/admin",method = RequestMethod.GET)
    public String login(){
        return "admin/login";
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



}
