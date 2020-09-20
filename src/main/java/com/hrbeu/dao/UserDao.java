package com.hrbeu.dao;

import com.hrbeu.pojo.User;
import org.apache.ibatis.annotations.Param;

public interface UserDao {
    User queryUser(@Param("username") String username);
}
