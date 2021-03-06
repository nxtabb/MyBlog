package com.hrbeu.controller;

import com.hrbeu.pojo.Document;
import com.hrbeu.pojo.Tag;
import com.hrbeu.pojo.pojo_sup.Tag_Count;
import com.hrbeu.service.LabDocumentService;
import com.hrbeu.service.adminService.DocumentService;
import com.hrbeu.service.adminService.TagService;
import com.hrbeu.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;
import java.util.Map;

@Controller
public class TagsShowController {

    @Autowired
    private TagService tagService;
    @Autowired
    private LabDocumentService labDocumentService;
    @Autowired
    private DocumentService documentService;
    @GetMapping("/tags/{tagId}/{pageIndex}")
    public String tags(@PathVariable("tagId")Long tagId, @PathVariable("pageIndex")int pageIndex, Model model){
        List<Tag> tagList = tagService.getAllTags();
        List<Tag_Count> tagCountList = labDocumentService.getTagAndCountByTagId();
        int pageSize = 5;
        List<Document> documentList = null;
        if(tagId==-1){
            tagId = tagList.get(0).getTagId();
            documentList = documentService.queryDocumentByTagId(pageIndex,pageSize,tagId);

        }
        else {
            documentList = documentService.queryDocumentByTagId(pageIndex,pageSize,tagId);
        }
        //查询该文件的所有tagList
        int count =documentService.queryDocumentCountByTagId(tagId);
        Map<String,Integer> pageInfo = PageUtil.page(pageIndex,pageSize,count);
        model.addAttribute("tagList",tagList);
        model.addAttribute("tagCountList",tagCountList);
        model.addAttribute("prePage",pageInfo.get("prePage"));
        model.addAttribute("nextPage",pageInfo.get("nextPage"));
        model.addAttribute("count",count);
        model.addAttribute("currenttagId",tagId);
        model.addAttribute("documentList",documentList);
        model.addAttribute("maxPage",pageInfo.get("maxPage"));
        return "tags";
   }
}
