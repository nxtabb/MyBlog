package com.hrbeu.pojo;

public class File {
    private Long fileId;
    private String fileName;
    private String filePath;
    private User user;
    private Document document;
    public File(){}

    public File(Long fileId, String fileName, String filePath, User user, Document document) {
        this.fileId = fileId;
        this.fileName = fileName;
        this.filePath = filePath;
        this.user = user;
        this.document = document;
    }

    public Long getFileId() {
        return fileId;
    }

    public void setFileId(Long fileId) {
        this.fileId = fileId;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Document getDocument() {
        return document;
    }

    public void setDocument(Document document) {
        this.document = document;
    }
}
