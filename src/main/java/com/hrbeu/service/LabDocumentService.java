package com.hrbeu.service;

import com.hrbeu.pojo.Document;

import java.util.List;

public interface LabDocumentService {
    List<Document> getPublishedDocument(int pageIndex, int pageSize);
    int getPublishedDocumentCount();
}
