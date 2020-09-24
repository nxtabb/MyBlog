package com.hrbeu.dao;

import com.hrbeu.pojo.Type;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TypeDao {
    int saveType(Type type);
    Type queryType(Long typeId);
    List<Type> queryTypeList(@Param("typeIndex")int typeIndex, @Param("pageSize")int pageSize);
    int updateType(@Param("typeId") Long typeId,@Param("type") Type type);
    void deleteType(Long typeId);
    int typeCount();
    int checkType(String typeName);
    List<Type> queryAllType();
}
