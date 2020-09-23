package com.hrbeu.controller.admin.UserController;

import com.hrbeu.pojo.User;
import com.hrbeu.service.adminService.UserService;
import com.hrbeu.utils.MD5Util;
import org.apache.ibatis.annotations.Param;
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
@RequestMapping("/admin")
public class RegisterController {
    @Autowired
    private UserService userService;
    //检查用户名
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
    //注册
    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String register(@Param("username")String username, @Param("password")String password, @Param("email")String email, @Param("nickname")String nickname, ModelAndView model, HttpServletRequest request){
        String password_input = MD5Util.md5(password);
        User user = new User();
        user.setUsername(username);
        user.setPassword(password_input);
        user.setEmail(email);
        user.setNickname(nickname);
        int effNum = userService.addUser(user);
        if(effNum<=0){
            return "redirect:/admin";
        }else {
            HttpSession session = request.getSession();
            User user1 = new User();
            user1.setNickname(user.getNickname());
            session.setAttribute("user",user1);
            return "redirect:/admin/index";
        }

    }
}
