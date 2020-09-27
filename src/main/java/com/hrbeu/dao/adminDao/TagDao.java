package com.hrbeu.dao.adminDao;

import com.hrbeu.pojo.Tag;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TagDao {
    int saveTag(Tag tag);
    Tag queryTag(Long tagId);
    List<Tag> queryTagList(@Param("tagIndex")int tagIndex, @Param("pageSize")int pageSize);
    int updateTag(@Param("tagId") Long tagId,@Param("tag") Tag tag);
    void deleteTag(Long tagId);
    int tagCount();
    int checkTag(String tagName);
    List<Tag> getAllTags();
}
