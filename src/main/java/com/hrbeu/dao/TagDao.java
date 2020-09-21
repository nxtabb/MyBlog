package com.hrbeu.dao;

import com.hrbeu.pojo.Tag;
import com.hrbeu.pojo.Type;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TagDao {
    int saveTag(Tag tag);
    Tag queryTag(Long tagId);
    List<Tag> queryTagList(@Param("TagIndex")int tagIndex, @Param("pageSize")int pageSize);
    int updateTag(@Param("tagId") Long tageId,@Param("tag") Tag tag);
    void deleteTag(Long tagId);
    int tagCount();
    int checkTag(String tagName);
}
