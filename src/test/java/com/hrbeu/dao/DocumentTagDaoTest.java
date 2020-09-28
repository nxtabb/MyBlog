package com.hrbeu.dao;

import com.hrbeu.BaseTest;
import com.hrbeu.dao.adminDao.DocumentTagDao;
import com.hrbeu.pojo.Document;
import com.hrbeu.pojo.Tag;
import com.hrbeu.pojo.pojo_sup.Type_Count;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

public class DocumentTagDaoTest extends BaseTest {
    @Autowired
    private DocumentTagDao documentTagDao;
    @Autowired
    private LabDocumentDao labDocumentDao;
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
    @Test
    public void test3(){
        List<Type_Count> typeCountList=labDocumentDao.getTypeAndCount(6);
        System.out.println(typeCountList.get(1).getTypeName());
    }
}
