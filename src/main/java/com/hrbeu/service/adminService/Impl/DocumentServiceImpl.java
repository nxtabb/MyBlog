package com.hrbeu.service.adminService.Impl;

import com.hrbeu.dao.adminDao.DocumentDao;
import com.hrbeu.dao.adminDao.DocumentTagDao;
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
    public Document queryDetailedDocument(Long documentId) {
        return documentDao.queryDetailedDocument(documentId);
    }

    @Override
    public Document getMostDetailDocument(Long documentId) {
        return documentDao.getMostDetailDocument(documentId);
    }

    @Override
    public void createViewCount(Long documentId) {
        documentDao.createViewCount(documentId);
    }

    @Override
    public List<Document> getDocumentList(Document document) {

        return documentDao.getList(document);
    }


    @Override
    public void updateDocument(Document document) {
        List<Tag> tagList = document.getTagList();
        documentDao.updateDocument(document.getDocumentId(),document);
        Long documentId = document.getDocumentId();
        document = documentDao.queryDetailedDocument(document.getDocumentId());
        document.setDocumentId(documentId);
        documentTagDao.deleteById(documentId);
        documentTagDao.saveDocumentsAndTags(document,tagList);
    }

    @Override
    public void deleteDocument(Long documentId) {
        documentTagDao.deleteById(documentId);
        documentDao.deleteDocument(documentId);
    }
    @Override
    public int documentCount(Document document) {
        return documentDao.documentCount(document);
    }


}
