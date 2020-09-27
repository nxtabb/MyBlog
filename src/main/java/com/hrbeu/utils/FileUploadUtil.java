package com.hrbeu.utils;

import com.hrbeu.pojo.User;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FileUploadUtil {
    public static Map<String,String> fileUpload(HttpServletRequest request, String documentTitle, String nowTimeStr) throws IOException {
        CommonsMultipartResolver resolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        Map<String, String> fileInfo = new HashMap<>();
        if (resolver.isMultipart(request)) {
            MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
            CommonsMultipartFile file = (CommonsMultipartFile) multipartHttpServletRequest.getFile("codefile");
            String fileName = file.getOriginalFilename();
            if (fileName != null&&!fileName.equals("")) {
                String extendFileName = PathUtil.getFileExtension(fileName);
                String basePath = PathUtil.getBasePath();
                String username = ((User) request.getSession().getAttribute("user")).getUsername();
                String savePath = basePath + PathUtil.getUserPath(username, documentTitle, nowTimeStr);
                PathUtil.mkDirPath(savePath);
                String filePath = savePath + File.separator + username + extendFileName;
                OutputStream os = new FileOutputStream(filePath);
                InputStream ins = file.getInputStream();
                byte[] bytes = new byte[1024];
                int temp;
                while ((temp = ins.read(bytes)) != -1) {
                    os.write(bytes, 0, temp);
                }
                os.close();
                ins.close();
                fileInfo.put("fileName", username + extendFileName);
                fileInfo.put("filePath", PathUtil.getUserPath(username, documentTitle, nowTimeStr));
                fileInfo.put("fileOriginName", fileName);
                return fileInfo;
            }
            else {
                return null;
            }

        }
        else {
            return null;
        }


    }
}
