package com.hrbeu.dao.adminDao;

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
    Document getMostDetailDocument(Long documentId);
    void createViewCount(Long documentId);
    List<Document> queryDocumentByTypeId(@Param("documentIndex") int documentIndex,@Param("pageSize") int pageSize,@Param("typeId") Long typeId);
    int queryDocumentCountByTypeId(Long typeId);
    List<Document> queryDocumentByTagId(@Param("documentIndex") int documentIndex, @Param("pageSize")int pageSize,@Param("tagId") Long tagId);
    int queryDocumentCountByTagId(Long tagId);
}
