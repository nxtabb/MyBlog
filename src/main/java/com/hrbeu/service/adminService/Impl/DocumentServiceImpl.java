package com.hrbeu.service.adminService.Impl;

import com.hrbeu.dao.adminDao.DocumentDao;
import com.hrbeu.dao.adminDao.DocumentTagDao;
import com.hrbeu.dao.adminDao.TagDao;
import com.hrbeu.pojo.Document;
import com.hrbeu.pojo.DocumentTag;
import com.hrbeu.pojo.Tag;
import com.hrbeu.service.adminService.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


@Service
public class DocumentServiceImpl implements DocumentService {
    @Autowired
    private DocumentDao documentDao;
    @Autowired
    private DocumentTagDao documentTagDao;
    @Autowired
    private TagDao tagDao;


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
    public List<Document> queryDocumentByTypeId(int pageIndex,int pageSize,Long typeId) {
        int documentIndex = pageSize*(pageIndex-1);
        return documentDao.queryDocumentByTypeId(documentIndex,pageSize,typeId);
    }

    @Override
    public int queryDocumentCountByTypeId(Long typeId) {
        return documentDao.queryDocumentCountByTypeId(typeId);
    }

    @Override
    public List<Document> queryDocumentByTagId(int pageIndex, int pageSize, Long tagId) {
        int documentIndex = pageSize*(pageIndex-1);
        List<Document> documentList= documentDao.queryDocumentByTagId(documentIndex,pageSize,tagId);
        for(Document document:documentList){
            List<DocumentTag> documentTagList = documentTagDao.queryTagListByDocumentId(document.getDocumentId());
            List<Tag> tagList = new ArrayList<>();
            for(DocumentTag documentTag:documentTagList){
                Tag tag = tagDao.queryTag(documentTag.getTagId());
                tagList.add(tag);
            }
            document.setTagList(tagList);
        }
        return documentList;
    }

    @Override
    public int queryDocumentCountByTagId(Long tagId) {
        return documentDao.queryDocumentCountByTagId(tagId);
    }

    @Override
    public List<String> getTimeGroupByYearAndMonth() {
        return documentDao.getTimeGroupByYearAndMonth();
    }

    @Override
    public List<Document> findDocumentByTime(String time) {
        return documentDao.findDocumentByTime(time);
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
