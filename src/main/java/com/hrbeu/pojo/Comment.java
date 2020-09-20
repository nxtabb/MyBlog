package com.hrbeu.pojo;

import java.util.Date;

public class Comment {
    private Long commentId;
    private String nickname;
    private String email;
    private String content;
    private Date createTime;
    //父评论
    private Comment parent;
    //所属文件
    private Document document;


    public Comment() {
    }

    public Comment(Long commentId, String nickname, String email, String content,Date createTime, Comment parent, Document document) {
        this.commentId = commentId;
        this.nickname = nickname;
        this.email = email;
        this.content = content;
        this.createTime = createTime;
        this.parent = parent;
        this.document = document;
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

    public Comment getParent() {
        return parent;
    }

    public void setParent(Comment parent) {
        this.parent = parent;
    }

    public Document getDocument() {
        return document;
    }

    public void setDocument(Document document) {
        this.document = document;
    }
}
