package com.hrbeu.dao;

import com.hrbeu.BaseTest;
import com.hrbeu.dao.adminDao.UserDao;
import com.hrbeu.pojo.User;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class UserDaoTest extends BaseTest {
    @Autowired
    UserDao userDao;

    @Test
    public void test(){
        User user = userDao.queryUser("admin");
        System.out.println(user);
    }
}
