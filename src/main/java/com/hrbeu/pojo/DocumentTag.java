package com.hrbeu.pojo;

public class DocumentTag {
    private Long documentId;
    private Long tagId;

    public DocumentTag(Long documentId, Long tagId) {
        this.documentId = documentId;
        this.tagId = tagId;
    }

    public Long getDocumentId() {
        return documentId;
    }

    public void setDocumentId(Long documentId) {
        this.documentId = documentId;
    }

    public Long getTagId() {
        return tagId;
    }

    public void setTagId(Long tagId) {
        this.tagId = tagId;
    }
}
