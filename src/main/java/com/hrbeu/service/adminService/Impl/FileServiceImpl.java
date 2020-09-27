package com.hrbeu.service.adminService.Impl;

import com.hrbeu.dao.adminDao.FileDao;
import com.hrbeu.pojo.File;
import com.hrbeu.pojo.User;
import com.hrbeu.service.adminService.FileService;
import com.hrbeu.utils.PathUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

@Service
public class FileServiceImpl implements FileService {
    @Autowired
    private FileDao fileDao;


    @Override
    public int addFile(String fileName, String filePath, Long userId, Long documentId, String fileOriginName, Date createTime, Date lastEditTime) {
        return fileDao.addFile(fileName,filePath,userId,documentId,fileOriginName,createTime,lastEditTime);
    }

    @Override
    @Transactional
    public void deleteFile(Long documentId, User user) {
        //删除文件
        File file = fileDao.queryFile(documentId,user.getUserId());
        if(file!=null){
            String filePathStr = PathUtil.getBasePath()+file.getFilePath();
            java.io.File filePath = new java.io.File(filePathStr);
            //判断是否存在
            if(filePath.exists()){
                //判断是否是文件夹
                if(filePath.isDirectory()){
                    //获取文件夹下的所有文件
                    java.io.File[] files = filePath.listFiles();
                    //遍历删除
                    for(java.io.File f:files){
                        f.delete();
                    }
                }
                //最后删除该文件夹或文件。
                filePath.delete();
            }
            //删除表数据
            fileDao.deleteFile(file.getFileId());
        }

    }

    @Override
    public File getFileInfo(Long documentId, Long userId) {
        return fileDao.queryFile(documentId,userId);
    }

    @Override
    public void onlydeleteFile(Long fileId) {
        //删除文件
        File file = fileDao.queryFileById(fileId);
        String filePathStr = PathUtil.getBasePath()+file.getFilePath();
        java.io.File filePath = new java.io.File(filePathStr);
        //判断是否存在
        if(filePath.exists()){
            //判断是否是文件夹
            if(filePath.isDirectory()){
                //获取文件夹下的所有文件
                java.io.File[] files = filePath.listFiles();
                //遍历删除
                for(java.io.File f:files){
                    f.delete();
                }
            }
            //最后删除该文件夹或文件。
            filePath.delete();
        }
        //删除表数据
        fileDao.deleteFile(file.getFileId());
    }

    @Override
    public File queryFile(Long fileId) {
        return fileDao.queryFileById(fileId);
    }

    @Override
    @Transactional
    public void updateFile(Long fileId,String fileName, String filePath, Long userId, Long documentId, String fileOriginName, Date createTime, Date lastEditTime) {
        File file = fileDao.queryFileById(fileId);
        String filePathStr = PathUtil.getBasePath()+file.getFilePath();
        java.io.File fileFordel = new java.io.File(filePathStr);
        //判断是否存在
        if(fileFordel.exists()){
            //判断是否是文件夹
            if(fileFordel.isDirectory()){
                //获取文件夹下的所有文件
                java.io.File[] files = fileFordel.listFiles();
                //遍历删除
                for(java.io.File f:files){
                    f.delete();
                }
            }
            //最后删除该文件夹或文件。
            fileFordel.delete();
        }
        fileDao.updateFile(fileId,fileName,filePath,fileOriginName,lastEditTime);
    }
}
