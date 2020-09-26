package com.hrbeu.service.adminService;

import com.hrbeu.pojo.Document;
import com.hrbeu.pojo.Type;

import java.util.List;

public interface DocumentService {
    void saveDocument(Document document);
    Document queryDocument(Long documentId);
    List<Document> getDocumentList(Document document);
    void updateDocument(Long documentId, Document document);
    void deleteDocument(Long documentId);
    int documentCount(Document document);
    List<Document> getDocumentList(int pageIndex, int pageSize, Document document);
    Document queryDetailedDocument(Long documentId);
}
