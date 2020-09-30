package com.hrbeu.controller;

import com.hrbeu.pojo.*;
import com.hrbeu.pojo.pojo_sup.File_Len;
import com.hrbeu.pojo.pojo_sup.Tag_Count;
import com.hrbeu.pojo.pojo_sup.Type_Count;
import com.hrbeu.service.CommentService;
import com.hrbeu.service.LabDocumentService;
import com.hrbeu.service.adminService.DocumentService;
import com.hrbeu.service.adminService.FileService;
import com.hrbeu.utils.CommentUtil;
import com.hrbeu.utils.Md2Html;
import com.hrbeu.utils.PageUtil;
import com.hrbeu.utils.PathUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class FrontController {
    @Autowired
    private DocumentService documentService;
    @Autowired
    private LabDocumentService labDocumentService;
    @Autowired
    private FileService fileService;
    @Autowired
    private CommentService commentService;
    @GetMapping("/")
    public String index(Model model){
        int pageIndex =1;
        int pageSize = 5;
        List<Document> documentList = labDocumentService.getPublishedDocument(pageIndex,pageSize);
        int maxCount = labDocumentService.getPublishedDocumentCount();
        Integer typeCount = 6;
        List<Type_Count> typeCountList = labDocumentService.getTypeAndCount(typeCount);
        Integer tagCount =10;
        List<Tag_Count> tagCountList = labDocumentService.getTagAndCount(tagCount);
        Integer recommendDocumentCount = 10;
        List<Document> recommendDocumentList = labDocumentService.getRecommendDocumentList(recommendDocumentCount);
        Map<String,Integer> pageInfo = PageUtil.page(pageIndex,pageSize,maxCount);
        model.addAttribute("recommendDocumentList",recommendDocumentList);
        model.addAttribute("tagCountList",tagCountList);
        model.addAttribute("currentPage",pageIndex);
        model.addAttribute("typeCountList",typeCountList);
        model.addAttribute("nextPage",pageInfo.get("nextPage"));
        model.addAttribute("prePage",pageInfo.get("prePage"));
        model.addAttribute("documentList",documentList);
        model.addAttribute("maxCount",maxCount);
        return "index";
    }
    @GetMapping("/{pageIndex}")
    public String indexInPage(@PathVariable("pageIndex")int pageIndex, Model model){
        int pageSize = 5;
        List<Document> documentList = labDocumentService.getPublishedDocument(pageIndex,pageSize);
        int maxCount = labDocumentService.getPublishedDocumentCount();
        Integer typeCount = 6;
        List<Type_Count> typeCountList = labDocumentService.getTypeAndCount(typeCount);
        Integer tagCount =10;
        List<Tag_Count> tagCountList = labDocumentService.getTagAndCount(tagCount);
        Integer recommendDocumentCount = 10;
        List<Document> recommendDocumentList = labDocumentService.getRecommendDocumentList(recommendDocumentCount);
        Map<String,Integer> pageInfo = PageUtil.page(pageIndex,pageSize,maxCount);
        model.addAttribute("recommendDocumentList",recommendDocumentList);
        model.addAttribute("tagCountList",tagCountList);
        model.addAttribute("currentPage",pageIndex);
        model.addAttribute("typeCountList",typeCountList);
        model.addAttribute("nextPage",pageInfo.get("nextPage"));
        model.addAttribute("prePage",pageInfo.get("prePage"));
        model.addAttribute("documentList",documentList);
        model.addAttribute("maxCount",maxCount);
        return "index";
    }

    @RequestMapping("/search/{pageIndex}")
    public String search(@PathVariable("pageIndex")int pageIndex, Model model, HttpServletRequest request){
        String query = request.getParameter("query");
        HttpSession session = request.getSession();;
        if(query!=null&&!query.equals("")){
            session.removeAttribute("session");
        }
        else {
            query = (String)session.getAttribute("query");
        }
        int pageSize = 4;
        session.setAttribute("query",query);
        List<Document> documentList = labDocumentService.queryBySearch(query,pageIndex,pageSize);
        int maxCount = labDocumentService.queryBySearchCount(query);
        Map<String,Integer> pageInfo = PageUtil.page(pageIndex,pageSize,maxCount);
        model.addAttribute("documentList",documentList);
        model.addAttribute("maxCount",maxCount);
        model.addAttribute("prePage",pageInfo.get("prePage"));
        model.addAttribute("nextPage",pageInfo.get("nextPage"));
        model.addAttribute("query",query);
        return "searchresult";
    }

    @GetMapping("/document/{documentId}")
    public String document(@PathVariable("documentId")Long documentId, Model model){
        documentService.createViewCount(documentId);
        Document document = documentService.getMostDetailDocument(documentId);
        //查询附属文件信息
        List<File> fileList = fileService.getFileListInfo(documentId);
        List<File_Len> fileLenList = new ArrayList<>();
        if(fileList!=null){
            for(File file:fileList){
                File_Len file_len = new File_Len();
                java.io.File fileOfFile = new java.io.File(PathUtil.getBasePath()+file.getFilePath());
                Double fileLength = fileOfFile.length()/1024.0/1024.0;
                file_len.setFile(file);
                file_len.setLength(fileLength);
                fileLenList.add(file_len);
            }
        }
        if(document!=null){
            String flagStr = "原创";
            if(document.getFlag().equals("2")){
                flagStr = "转载";
            }
            if(document.getFlag().equals("3")){
                flagStr="翻译";
            }
            String contentHtml = Md2Html.md2htmlPro(document.getContent());
            model.addAttribute("fileLenList",fileLenList);
            model.addAttribute("contentHtml",contentHtml);
            model.addAttribute("document",document);
            model.addAttribute("flagStr",flagStr);
        }
        //评论显示
        //根评论
        List<Comment> commentList = commentService.listCommentByDocumentId(documentId);
        for(Comment comment:commentList){
            List<Comment> commentsofComment = comment.getCommnets();
            for(Comment child:commentsofComment){
                child.setParentComment(commentService.getParentComment(child));
            }
        }
        model.addAttribute("commentList",commentList);
        return "document";
    }



}
