package com.hrbeu.controller.admin.FileController;


import com.hrbeu.pojo.File;
import com.hrbeu.service.adminService.FileService;
import com.hrbeu.utils.PathUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.nio.Buffer;

@RequestMapping("/admin")
@Controller
public class FileController {
    @Autowired
    private FileService fileService;
    @RequestMapping("/files/onlydeleteFile/{documentId}/{fileId}")
    public String onlyDeleteFile(@PathVariable("documentId")Long documentId,@PathVariable("fileId")Long fileId, HttpServletRequest request){
        fileService.onlydeleteFile(fileId);
        return "redirect:/admin/documents/updatedocument/"+documentId;

    }

    @GetMapping("/files/downloadFile/{fileId}")
    public void download(@PathVariable("fileId")Long fileId, HttpServletRequest request, HttpServletResponse response) throws IOException {
        File file = fileService.queryFile(fileId);
        String filePath = PathUtil.getBasePath()+file.getFilePath()+ java.io.File.separator+file.getFileName();
        java.io.File file_download = new java.io.File(filePath);
        if(!file_download.exists()){
            return;
        }
        else {
            String fileName = file.getFileOriginName();
            fileName = URLEncoder.encode(fileName,"UTF-8");
            response.addHeader("Content-Disposition","attachment;filename=" + fileName);
            response.setContentType("multipart/form-data");
            response.setContentLength((int)file_download.length());
            FileInputStream inputStream = new FileInputStream(filePath);
            OutputStream outputStream = response.getOutputStream();
            byte[] buffer = new byte[1024];
            int len = 0;
            while ((len = inputStream.read(buffer))!=-1){
                outputStream.write(buffer,0,len);
            }
            inputStream.close();
            outputStream.close();
        }
    }
}
