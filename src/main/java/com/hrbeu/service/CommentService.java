package com.hrbeu.service;

import com.hrbeu.pojo.Comment;

import java.util.List;
import java.util.Map;

public interface CommentService {
    int saveComment(Comment comment);
    List<Comment> queryByDocumentId(Long documentId);
    List<Comment> queryRootCommentByDocumentId(Long documentId);
    List<List<Comment>> querySecondCommentByRoot(List<Comment> rootcommentList);
}
