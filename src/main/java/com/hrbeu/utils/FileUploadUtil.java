package com.hrbeu.utils;

import com.hrbeu.pojo.User;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import java.io.*;

public class FileUploadUtil {
    public static void fileUpload(HttpServletRequest request) throws IOException {
        CommonsMultipartResolver resolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        if(resolver.isMultipart(request)){
            MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
            CommonsMultipartFile file = (CommonsMultipartFile) multipartHttpServletRequest.getFile("codefile");
            String fileName = file.getOriginalFilename();
            String extendFileName = PathUtil.getFileExtension(fileName);
            String basePath = PathUtil.getBasePath();
            String username = ((User) request.getSession().getAttribute("user")).getUsername();
            String savePath = basePath+PathUtil.getUserPath(username);
            PathUtil.mkDirPath(savePath);
            String filePath = savePath+ File.separator+username+extendFileName;
            OutputStream os = new FileOutputStream(filePath);
            InputStream ins = file.getInputStream();
            byte[] bytes = new byte[1024];
            int temp;
            while ((temp = ins.read(bytes)) != -1) {
                os.write(bytes, 0, temp);
            }
            os.close();
            ins.close();
        }
    }
}
