package com.hrbeu.controller.admin.UserController;

import com.hrbeu.pojo.User;
import com.hrbeu.service.adminService.UserService;
import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/admin")
public class LoginController {
    Logger logger = LoggerFactory.getLogger(LoginController.class);
    @Autowired
    UserService userService;
    //登录
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public ModelAndView login(@Param("username")String username,@Param("password")String password,HttpServletRequest request){
        ModelAndView model = new ModelAndView();
        logger.info("====start====");
        long startTime = System.currentTimeMillis();
        User user = userService.checkUser(username, password);
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
        model.setViewName("redirect:/admin/index");
        return model;
    }
    //登出
    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public String logout(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        return "redirect:/admin";
    }
}
