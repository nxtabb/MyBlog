package com.hrbeu.service;

import com.hrbeu.pojo.User;

public interface UserService {
    User checkUser(String username, String password);
}
