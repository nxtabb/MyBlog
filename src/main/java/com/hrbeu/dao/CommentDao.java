package com.hrbeu.dao;

import com.hrbeu.pojo.Comment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommentDao {
    List<Comment> queryByDocumentId(Long documentId);
    int saveComment(Comment comment);
    List<Comment> queryRootCommentByDocumentId(Long documentId);
    List<Comment> queryChildComment(Comment comment);
    Comment queryParentComment(Long parentId);
    void deleteComment(Long commentId);
    Long queryDocumentOfComment(Long commentId);
    void deleteCommentByDocumentId(Long documentId);
}
