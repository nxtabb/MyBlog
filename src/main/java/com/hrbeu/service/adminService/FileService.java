package com.hrbeu.service.adminService;

import com.hrbeu.pojo.File;
import com.hrbeu.pojo.User;

import java.util.Date;

public interface FileService {
    int addFile(String fileName, String filePath, Long userId, Long documentId, String fileOriginName, Date createTime,Date lastEditTime);
    void deleteFile(Long documentId, User user);
    File getFileInfo(Long documentId, Long userId);
    void onlydeleteFile(Long fileId);
    File queryFile(Long fileId);
    void updateFile(Long fileId,String fileName, String filePath, Long userId, Long documentId, String fileOriginName, Date createTime, Date lastEditTime);
}
