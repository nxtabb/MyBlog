package com.hrbeu.dao;

import com.hrbeu.pojo.Document;
import com.hrbeu.pojo.Tag;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DocumentTagDao {
    void saveDocumentsAndTags(@Param("document") Document document,@Param("tagList") List<Tag> tagList);
    int  deleteById(Long documentId);
}
