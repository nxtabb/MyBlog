package com.hrbeu.service.Impl;

import com.hrbeu.dao.CommentDao;
import com.hrbeu.pojo.Comment;
import com.hrbeu.service.CommentService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentDao commentDao;
    @Override
    public int saveComment(Comment comment) {
        Long commentParentId = comment.getParentId();
        if(commentParentId!=-1){
            comment.setParentId(commentParentId);
            comment.setCreateTime(new Date());
        }
        else {
            comment.setParentId(null);
            comment.setCreateTime(new Date());
        }
        int effNum = commentDao.saveComment(comment);
        return effNum;
    }

    @Override
    public List<Comment> queryByDocumentId(Long documentId) {
        return commentDao.queryByDocumentId(documentId);
    }

    @Override
    public List<Comment> queryRootCommentByDocumentId(Long documentId) {
        return commentDao.queryRootCommentByDocumentId(documentId);
    }

    @Override
    public List<List<Comment>> querySecondCommentByRoot(List<Comment> rootcommentList) {
        return null;
    }

}
