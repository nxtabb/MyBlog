package com.hrbeu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ViewController {

    @RequestMapping(value = "/admin",method = RequestMethod.GET)
    public String login(){
        return "admin/login";
    }
    @RequestMapping(value = "/admin/register",method = RequestMethod.GET)
    public String register(){
        return "admin/register";
    }

}
