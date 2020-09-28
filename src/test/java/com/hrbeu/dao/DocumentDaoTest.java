package com.hrbeu.dao;

import com.hrbeu.BaseTest;
import com.hrbeu.dao.adminDao.DocumentDao;
import com.hrbeu.pojo.Document;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class DocumentDaoTest  extends BaseTest {
    @Autowired
    private DocumentDao documentDao;
    @Test
    public void test01(){
        Long id = 1L;
        Document document = documentDao.queryDocument(id);
        System.out.println(document.getType().getTypeName());
    }
    @Test
    public void test02(){
        Document document = new Document();
        document.setTitle("java");
        List<Document> documents = documentDao.getDocumentList(0,5,document);
        System.out.println(documents);
        }

    @Test
    public void test03(){
        Long documentId = 61L;
        Document document = documentDao.getMostDetailDocument(documentId);
        System.out.println(document.getFlag());
    }

}
