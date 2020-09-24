package com.hrbeu.controller.admin.DocumentController;

import com.hrbeu.pojo.Document;
import com.hrbeu.pojo.Type;
import com.hrbeu.service.adminService.DocumentService;
import com.hrbeu.service.adminService.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.print.Doc;
import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class DocumentController {
    @Autowired
    private DocumentService documentService;
    @Autowired
    private TypeService typeService;

    //进入文件列表+页码
    @GetMapping("/documentsIndex/{pageIndex}")
    public String documents(@PathVariable("pageIndex")int pageIndex,Model model){
        int pageSize = 7;
        int maxCount = documentService.documentCount(null);
        List<Document> documentList = documentService.getDocumentList(pageIndex,pageSize,null);
        List<Type> typeList = typeService.queryAllType();
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
        else {
            prePage = currentPage-1;
            nextPage = currentPage+1;
        }
        if(maxPage==1){
            prePage=1;
            nextPage =1;
        }

        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        model.addAttribute("typeList",typeList);
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
    @RequestMapping("/documents/search/{pageIndex}")
    public String searchDocuments(@PathVariable("pageIndex")int pageIndex, Model model, HttpServletRequest request){
        //判断request是否传值了
        //如果传值 就先清除session里的document//如果没传值
        Document document = null;
        Type type = new Type();
        String title = null;
        title =request.getParameter("title");
        if(title!=null&&title.equals("")){
            title = null;
        }
        String type_idStr = request.getParameter("type");
        Long typeId = null;
        if(type_idStr!=null){
            typeId = Long.parseLong(type_idStr);
        }
        Integer recommend = 0;
        String recommendStr = request.getParameter("recommend");
        if(recommendStr!=null&&recommendStr.equals("on")){
            recommend = 1;
        }
        if(title!=null||typeId!=null||recommendStr!=null){
            request.getSession().removeAttribute("document");
            document = new Document();
            type.setTypeId(typeId);
            document.setTitle(title);
            document.setType(type);
            document.setRecommend(recommend);
            request.getSession().setAttribute("deocument",document);
        }
        else {
            document = (Document) request.getSession().getAttribute("document");
        }
        int pageSize = 7;
        List<Document> documentList = documentService.getDocumentList(pageIndex,pageSize,document);

        int maxCount = documentService.documentCount(document);
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
        else {
            prePage = currentPage-1;
            nextPage = currentPage+1;
        }
        if(maxPage==1){
            prePage=1;
            nextPage =1;
        }
        model.addAttribute("prePage",prePage);
        model.addAttribute("nextPage",nextPage);
        model.addAttribute("document",document);
        request.getSession().setAttribute("document",document);
        model.addAttribute("documentList",documentList);
        return "admin/searchresult";

    }
    //进入新增文档的页面
    @GetMapping("/documents/adddocument")
    public String addDocument(){
        return "admin/document-input";
    }
}





