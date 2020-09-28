package com.hrbeu.service.Impl;

import com.hrbeu.dao.LabDocumentDao;
import com.hrbeu.pojo.Document;
import com.hrbeu.pojo.Type;
import com.hrbeu.pojo.pojo_sup.Tag_Count;
import com.hrbeu.pojo.pojo_sup.Type_Count;
import com.hrbeu.service.LabDocumentService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        return labDocumentDao.getPublishedDocumentCount();
    }

    @Override
    public List<Type_Count> getTypeAndCount(Integer typeCount) {
        return labDocumentDao.getTypeAndCount(typeCount);
    }


    @Override
    public List<Tag_Count> getTagAndCount(Integer tagCount) {
        return labDocumentDao.getTagAndCount(tagCount);
    }

    @Override
    public List<Document> getRecommendDocumentList(Integer recommendDocumentCount) {
        return labDocumentDao.getRecommendDocumentList(recommendDocumentCount);
    }

    @Override
    public List<Document> queryBySearch(String query, int pageIndex, int pageSize) {
        int documentIndex = pageSize*(pageIndex-1);
        return labDocumentDao.queryBySearch(query,documentIndex,pageSize);
    }

    @Override
    public int queryBySearchCount(String query) {
        return labDocumentDao.queryCountBySearch(query);
    }


}
