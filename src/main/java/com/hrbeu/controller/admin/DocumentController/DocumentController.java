package com.hrbeu.controller.admin.DocumentController;

import com.hrbeu.pojo.Document;
import com.hrbeu.pojo.Type;
import com.hrbeu.service.adminService.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class DocumentController {
    @Autowired
    private DocumentService documentService;

    //进入文件列表+页码
    @GetMapping("/documentsIndex/{pageIndex}")
    public String documents(@PathVariable("pageIndex")int pageIndex,Model model){
        int pageSize = 7;
        int maxCount = documentService.documentCount(null);
        List<Document> documentList = documentService.getDocumentList(pageIndex,pageSize,null);
        int maxPage = 0;
        if(maxCount<pageSize){
            maxPage = 1;
        }
        else if(maxCount%pageSize==0) {
            maxPage = maxCount/pageSize;
        }
        else {
            maxPage = maxCount/pageSize+1;
        }
        int prePage = 0;
        int nextPage = 0;
        int currentPage = pageIndex;
        if(currentPage>=maxPage){
            nextPage = maxPage;
            prePage = currentPage-1;
        }
        else if(currentPage<=1){
            prePage = 1;
            nextPage = currentPage+1;
        }
        if(maxPage==1){
            prePage=1;
            nextPage =1;
        }
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        model.addAttribute("prePage",prePage);
        model.addAttribute("nextPage",nextPage);
        model.addAttribute("documentList",documentList);
        return "admin/document";
    }

    //删除指定的文档
    @GetMapping("/documents/deleteById/{documentId}")
    public String deleteById(@PathVariable("documentId")Long documentId){
        try {
            documentService.deleteDocument(documentId);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "redirect:/admin/documentsIndex/1";
    }

    //进入搜索文档后的列表
    @PostMapping("/documents/search")
    public String searchDocuments(Model model, HttpServletRequest request){
        String title =request.getParameter("title");
        if(title.equals("")){
            title = null;
        }
        String type_idStr =null;
        try {
            type_idStr = request.getParameter("type");
        }catch (Exception e){

        }
        Long typeId= Long.parseLong(type_idStr);
        String recommendStr = request.getParameter("recommend");
        Integer recommend = 0;
        try {
            if(recommendStr.equals("on")){
                recommend=1;
            }
        }catch (Exception e){
            recommend = 0;
        }
        Document document = new Document();
        Type type = new Type();
        type.setTypeId(typeId);
        document.setTitle(title);
        document.setType(type);
        document.setRecommend(recommend);
        List<Document> documentList = documentService.getDocumentList(document);
        model.addAttribute("documentList",documentList);
        return "admin/searchresult";

    }
    //进入新增文档的页面
    @GetMapping("/documents/adddocument")
    public String addDocument(){
        return "admin/document-input";
    }
}





