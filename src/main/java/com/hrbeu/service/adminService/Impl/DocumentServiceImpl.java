package com.hrbeu.service.adminService.Impl;

import com.hrbeu.dao.DocumentDao;
import com.hrbeu.dao.DocumentTagDao;
import com.hrbeu.pojo.Document;
import com.hrbeu.pojo.Tag;
import com.hrbeu.service.adminService.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class DocumentServiceImpl implements DocumentService {
    @Autowired
    private DocumentDao documentDao;
    @Autowired
    private DocumentTagDao documentTagDao;


    @Override
    public void saveDocument(Document document) {
        documentDao.saveDocument(document);
        document.setDocumentId(document.getDocumentId());
        System.out.println(document.getDocumentId());
        List<Tag> tagList = document.getTagList();
        documentTagDao.saveDocumentsAndTags(document,tagList);

    }

    @Override
    public Document queryDocument(Long documentId) {
        return documentDao.queryDocument(documentId);
    }

    @Override
    public List<Document> getDocumentList(int pageIndex, int pageSize, Document document) {
        int documentIndex = pageSize*(pageIndex-1);
        return documentDao.getDocumentList(documentIndex,pageSize,document);
    }

    @Override
    public List<Document> getDocumentList(Document document) {

        return documentDao.getList(document);
    }


    @Override
    public int updateDocument(Long documentId, Document document) {
        return documentDao.updateDocument(documentId,document);
    }

    @Override
    public void deleteDocument(Long documentId) {
        documentDao.deleteDocument(documentId);
    }
    @Override
    public int documentCount(Document document) {
        return documentDao.documentCount(document);
    }


}
