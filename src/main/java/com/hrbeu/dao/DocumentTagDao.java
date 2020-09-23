package com.hrbeu.dao;

import com.hrbeu.pojo.Tag;

import java.util.List;

public interface DocumentTagDao {
    List<Tag> getTagByDocumentId(Long documentId);
}
