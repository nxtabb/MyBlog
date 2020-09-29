package com.hrbeu.dao.adminDao;

import com.hrbeu.pojo.File;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface FileDao {
    int addFile(@Param("fileName") String fileName, @Param("filePath") String filePath, @Param("userId") Long userId, @Param("documentId") Long documentId, @Param("fileOriginName")String fileOriginName, @Param("createTime")Date createTime,@Param("lastEditTime")Date lastEditTime);
    List<File> queryFileList(@Param("documentId") Long documentId, @Param("userId") Long userId);
    void deleteFile(Long fileId);
    File queryFileById(Long fileId);
    void updateFile(@Param("fileId")Long fileId,@Param("fileName") String fileName,@Param("filePath") String filePath,@Param("fileOriginName") String fileOriginName,@Param("lastEditTime") Date lastEditTime);
    List<File> queryFileListByDocumentId(Long documentId);
}
