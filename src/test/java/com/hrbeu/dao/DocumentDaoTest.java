package com.hrbeu.dao;

import com.hrbeu.BaseTest;
import com.hrbeu.pojo.Document;
import com.hrbeu.pojo.Type;
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

}
