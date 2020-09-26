package com.hrbeu.dao;

import com.hrbeu.pojo.Document;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DocumentDao {
    int saveDocument(@Param("document")Document document);
    Document queryDocument(Long documentId);
    List<Document> getDocumentList(@Param("documentIndex") int documentIndex,@Param("pageSize") int pageSize,@Param("document") Document document);
    List<Document> getList(@Param("document") Document document);
    int updateDocument(@Param("documentId") Long documentId,@Param("document") Document document);
    int deleteDocument(Long documentId);
    int documentCount(@Param("document") Document document);
    Document queryDetailedDocument(Long documentId);
}
