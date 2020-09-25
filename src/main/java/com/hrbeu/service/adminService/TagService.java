package com.hrbeu.service.adminService;

import com.hrbeu.pojo.Tag;
import com.hrbeu.pojo.Type;

import java.util.List;

public interface TagService {
    int saveTag(Tag tag);
    Tag queryTag(Long tagId);
    List<Tag> queryTagList(int pageIndex, int pageSize);
    int updateTag(Long tagId,Tag tag);
    void deleteTag(Long tagId);
    int tagCount();
    int checkTag(String tagName);
    List<Tag> getAllTags();
}
