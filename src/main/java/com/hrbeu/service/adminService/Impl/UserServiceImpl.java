package com.hrbeu.service.adminService.Impl;

import com.hrbeu.dao.adminDao.UserDao;
import com.hrbeu.pojo.User;
import com.hrbeu.service.adminService.UserService;
import com.hrbeu.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao userDao;

    @Override
    public User checkUser(String username, String password) {
        User user = userDao.queryUser(username);
        if(user==null){
            return null;
        }else {
            if(user.getPassword().equals(MD5Util.md5(password))){
                return user;
            }else {
                return null;
            }
        }
    }

    @Override
    public int userExists(String username) {
        User user = userDao.queryUser(username);
        if(user!=null){
            return 1;
        }
        else {
            return 0;
        }
    }

    @Override
    public int addUser(User user) {
        user.setAuthority(1);
        user.setCreateTime(new Date());
        user.setLastEditTime(new Date());
        user.setImage("https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=692442730,856156816&fm=26&gp=0.jpg");
        return userDao.addUser(user);
    }
}
