package com.hrbeu.service.adminService.Impl;

import com.hrbeu.dao.TagDao;
import com.hrbeu.pojo.Tag;
import com.hrbeu.pojo.Type;
import com.hrbeu.service.adminService.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class TagServiceImpl implements TagService {
    @Autowired
    private TagDao tagDao;
    @Override
    public int saveTag(Tag tag) {
        return tagDao.saveTag(tag);
    }

    @Override
    public Tag queryTag(Long tagId) {
        return tagDao.queryTag(tagId);
    }

    @Override
    public List<Tag> queryTagList(int pageIndex, int pageSize) {
        int tagIndex = pageSize*(pageIndex-1);
        List<Tag> tags = tagDao.queryTagList(tagIndex,pageSize);
        return tags;
    }

    @Override
    public int updateTag(Long tagId, Tag tag) {
        return tagDao.updateTag(tagId,tag);
    }

    @Override
    public void deleteTag(Long tagId) {
        tagDao.deleteTag(tagId);
    }

    @Override
    public int tagCount() {
        return tagDao.tagCount();
    }

    @Override
    public int checkTag(String tagName) {
        return tagDao.checkTag(tagName);
    }
}