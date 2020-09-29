package com.hrbeu.controller;

import com.hrbeu.pojo.Comment;
import com.hrbeu.pojo.Document;
import com.hrbeu.service.CommentService;
import com.hrbeu.service.adminService.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommentController {
    @Autowired
    private CommentService commentService;

    @PostMapping("/comments")
    public void sendComment(Comment comment){
        int effNum = commentService.saveComment(comment);
    }
}
