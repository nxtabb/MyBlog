package com.hrbeu.pojo;

import java.util.Date;

public class Comment {
    private Long commentId;
    private String nickname;
    private String email;
    private String content;
    private Date createTime;
    private Long parentId;
    private Long documentId;
    public Comment(){}

    public Comment(Long commentId, String nickname, String email, String content, Date createTime, Long parentId, Long documentId) {
        this.commentId = commentId;
        this.nickname = nickname;
        this.email = email;
        this.content = content;
        this.createTime = createTime;
        this.parentId = parentId;
        this.documentId = documentId;
    }

    public Long getCommentId() {
        return commentId;
    }

    public void setCommentId(Long commentId) {
        this.commentId = commentId;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public Long getDocumentId() {
        return documentId;
    }

    public void setDocumentId(Long documentId) {
        this.documentId = documentId;
    }
}
