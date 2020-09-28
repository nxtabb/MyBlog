package com.hrbeu.service.Impl;

import com.hrbeu.dao.LabDocumentDao;
import com.hrbeu.pojo.Document;
import com.hrbeu.service.LabDocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class LabDocumentServiceImpl implements LabDocumentService {
    @Autowired
    private LabDocumentDao labDocumentDao;
    @Override
    public List<Document> getPublishedDocument(int pageIndex, int pageSize) {
        int documentIndex = pageSize*(pageIndex-1);
        return labDocumentDao.getPublishedDocument(documentIndex,pageSize);

    }

    @Override
    public int getPublishedDocumentCount() {
        return 0;
    }
}
