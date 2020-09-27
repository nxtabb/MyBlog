package com.hrbeu.dao.adminDao;

import com.hrbeu.pojo.User;
import org.apache.ibatis.annotations.Param;

public interface UserDao {
    User queryUser(@Param("username") String username);
    int addUser(User user);
}
