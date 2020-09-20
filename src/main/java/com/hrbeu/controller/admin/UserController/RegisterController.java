package com.hrbeu.controller.admin.UserController;

import com.hrbeu.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;
@Controller
@RequestMapping("/admin")
public class RegisterController {
    @Autowired
    private UserService userService;


    @RequestMapping(value = "/checkusername",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> checkUsername(@Param("username")String username){
        Map<String,Object> modelMap = new HashMap<>();
        int userCount  = userService.userExists(username);
        if(userCount==0){
            modelMap.put("success",true);
        }else {
            modelMap.put("success",false);
        }
        return modelMap;
    }
}
