package com.hrbeu.dao;

import com.hrbeu.pojo.Document;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LabDocumentDao {
    List<Document> getPublishedDocument(@Param("documentIndex") Integer documentIndex,@Param("pageSize")Integer pageSize);
}
