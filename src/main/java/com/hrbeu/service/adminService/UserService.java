package com.hrbeu.service.adminService;

import com.hrbeu.pojo.User;

public interface UserService {
    User checkUser(String username, String password);
    int userExists(String username);
    int addUser(User user);
}
