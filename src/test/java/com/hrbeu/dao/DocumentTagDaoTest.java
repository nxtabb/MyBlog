package com.hrbeu.dao;

import com.hrbeu.BaseTest;
import com.hrbeu.pojo.Document;
import com.hrbeu.pojo.Tag;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

public class DocumentTagDaoTest extends BaseTest {
    @Autowired
    private DocumentTagDao documentTagDao;
    @Test
    public void test(){
        List<Tag> tagList = new ArrayList<>();
        Tag tag = new Tag();
        tag.setTagId(1L);
        tagList.add(tag);
        tag.setTagId(2L);
        tagList.add(tag);
        Document document = new Document();
        document.setDocumentId(1L);
        document.setTagList(tagList);
        documentTagDao.saveDocumentsAndTags(document,tagList);
    }
}
