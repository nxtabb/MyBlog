package com.hrbeu.service.adminService;

import com.hrbeu.pojo.Type;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TypeService {
    int saveType(Type type);
    Type queryType(Long typeId);
    List<Type> queryTypeList(int pageIndex,int pageSize);
    int updateType(Long typeId,Type type);
    void deleteType(Long typeId);
    int typeCount();
    int checkType(String typeName);
}
