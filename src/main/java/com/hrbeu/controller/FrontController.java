package com.hrbeu.controller;

import com.hrbeu.pojo.Document;
import com.hrbeu.service.LabDocumentService;
import com.hrbeu.service.adminService.DocumentService;
import com.hrbeu.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;
import java.util.Map;


@Controller
public class FrontController {
    @Autowired
    private LabDocumentService labDocumentService;
    @GetMapping("/")
    public String index(Model model){
        int pageIndex =1;
        int pageSize = 10;
        List<Document> documentList = labDocumentService.getPublishedDocument(pageIndex,pageSize);
        int maxCount = labDocumentService.getPublishedDocumentCount();
        Map<String,Integer> pageInfo = PageUtil.page(pageIndex,pageSize,maxCount);
        model.addAttribute("currentPage",pageIndex);
        model.addAttribute("nextPage",pageInfo.get("nextPage"));
        model.addAttribute("prePage",pageInfo.get("prePage"));
        model.addAttribute("documentList",documentList);
        return "index";
    }
    @GetMapping("/{pageIndex}")
    public String indexInPage(@PathVariable("pageIndex")int pageIndex, Model model){
        int pageSize = 10;
        List<Document> documentList = labDocumentService.getPublishedDocument(pageIndex,pageSize);
        int maxCount = labDocumentService.getPublishedDocumentCount();
        Map<String,Integer> pageInfo = PageUtil.page(pageIndex,pageSize,maxCount);
        model.addAttribute("currentPage",pageIndex);
        model.addAttribute("nextPage",pageInfo.get("nextPage"));
        model.addAttribute("prePage",pageInfo.get("prePage"));
        model.addAttribute("documentList",documentList);
        return "index";
    }
}
