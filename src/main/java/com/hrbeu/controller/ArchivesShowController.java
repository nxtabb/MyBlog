package com.hrbeu.controller;

import com.hrbeu.pojo.Document;
import com.hrbeu.service.adminService.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ArchivesShowController {
    @Autowired
    private DocumentService documentService;
    @RequestMapping("/archives")
    public String archives(Model model){
        List<String> timeList = documentService.getTimeGroupByYearAndMonth();
        Map<String,List<Document>> resultMap = new LinkedHashMap<>();
        for(String time:timeList){
            List<Document>documentList = documentService.findDocumentByTime(time);
            resultMap.put(time,documentList);

        }
        model.addAttribute("resultMap",resultMap);
        int count = documentService.documentCount(null);
        model.addAttribute("count",count);
        return "archives";
    }
}
