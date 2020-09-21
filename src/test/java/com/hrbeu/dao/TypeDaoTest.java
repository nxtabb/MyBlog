package com.hrbeu.dao;

import com.hrbeu.BaseTest;
import com.hrbeu.pojo.Type;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class TypeDaoTest extends BaseTest {
    @Autowired
    TypeDao typeDao;
    @Test
    public void test(){
        Type type = new Type();
        type.setTypeName("java");
        typeDao.saveType(type);
    }

    @Test
    public void test1(){
        Type type = typeDao.queryType(1L);
        System.out.println(type.getTypeName());
    }

    @Test
    public void test2(){
        List<Type> type = typeDao.queryTypeList(0,3);
        for(Type type1:type){
            System.out.println(type1.getTypeName());
        }
    }
    @Test
    public void test03(){
        Type type = new Type(1L,"python");
        typeDao.updateType(1L,type);
    }
    @Test
    public void test04(){
        typeDao.deleteType(3L);
    }
}
