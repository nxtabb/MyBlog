package com.hrbeu.controller.admin.UserController;

import com.hrbeu.pojo.User;
import com.hrbeu.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value = "/admin")
public class LoginController {
    Logger logger = LoggerFactory.getLogger(LoginController.class);
    @Autowired
    UserService userService;
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public ModelAndView login(@Param("username")String username,@Param("password")String password,HttpServletRequest request){
        logger.info("====start====");
        long startTime = System.currentTimeMillis();
        User user = userService.checkUser(username, password);
        ModelAndView model = new ModelAndView();
        if(user==null){
            model.addObject("errMsg","用户名不存在或密码错误");
            model.setViewName("admin/login");
            logger.debug("username or password error");
            long endTime = System.currentTimeMillis();
            logger.debug("costTime=[{}ms]",endTime-startTime);
            logger.info("====end====");
            return model;
        }else {
            user.setPassword(null);
            HttpSession session = request.getSession();
            session.setAttribute("user",user);
        }
        model.setViewName("admin/index");
        return model;
    }

    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public String logout(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        return "redirect:/admin";
    }


    @RequestMapping(value = "/blogs",method = RequestMethod.GET)
    public String blogs(){
        return "admin/blogs";
    }





}
