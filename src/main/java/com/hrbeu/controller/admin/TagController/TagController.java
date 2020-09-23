package com.hrbeu.controller.admin.TagController;

import com.hrbeu.pojo.Tag;
import com.hrbeu.pojo.Type;
import com.hrbeu.service.adminService.TagService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class TagController {
    @Autowired
    private TagService tagService;
    //进入标签列表
    @RequestMapping(value = "/tags/{pageIndex}")
    @ResponseBody
    public ModelAndView tags(@PathVariable("pageIndex")int pageIndex, ModelAndView modelAndView){
        int pageSize = 10;
        int maxCount = tagService.tagCount();
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
        pageSize =10;
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
        List<Tag> tagList = tagService.queryTagList(pageIndex,pageSize);
        modelAndView.addObject("nextPage",nextPage);
        modelAndView.addObject("prePage",prePage);
        modelAndView.addObject("tagList",tagList);
        modelAndView.setViewName("admin/tags");
        return modelAndView;
    }
    //新增标签
    @PostMapping("/tags/addtag")
    public String addtag(@Param("name")String name, RedirectAttributes attributes){
        Tag tag = new Tag();
        if(name==null||name.equals("")){
            attributes.addFlashAttribute("message","操作失败");
        }else {
            tag.setTagName(name);
            tagService.saveTag(tag);
            attributes.addFlashAttribute("message","操作成功");
        }
        return "redirect:/admin/tags/1";
    }
    //删除指定标签
    @RequestMapping("/tags/deleteById/{tagId}")
    public String deleteTageById(@PathVariable("tagId")Long tagId){
        tagService.deleteTag(tagId);
        return "redirect:/admin/tags/1";
    }
    //检查标签是否存在
    @RequestMapping("/tags/checktag/{tagName}")
    @ResponseBody
    public Map<String,Object> checktag(@PathVariable("tagName")String tagName){
        Map<String,Object> modelMap = new HashMap<>();
        int count  = tagService.checkTag(tagName);
        if(count>=1){
            modelMap.put("success",false);
        }
        else {
            modelMap.put("success",true);
        }
        return modelMap;
    }
    //更新标签
    @GetMapping("/tags/updateTag/{tagId}")
    public String updateTagView(@PathVariable("tagId")Long tagId, Model model){
        model.addAttribute("tag",tagService.queryTag(tagId));
        return "admin/tag-update";

    }

    @PostMapping("/tags/updateTag/{tagId}")
    public String updateTag(@PathVariable("tagId")Long tagId, @RequestParam("name")String tagName){
        Tag tag = new Tag();
        tag.setTagName(tagName);
        tagService.updateTag(tagId,tag);
        return "redirect:/admin/tags/1";

    }

}
