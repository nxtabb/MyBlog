package com.hrbeu.controller.admin.TypeController;

import com.hrbeu.pojo.Type;
import com.hrbeu.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/admin")
public class typeController {
    @Autowired
    private TypeService typeService;
    @RequestMapping(value = "/types/{pageIndex}")
    @ResponseBody
    public ModelAndView types(@PathVariable("pageIndex")int pageIndex, ModelAndView modelAndView) {
        int maxCount = typeService.typeCount();
        int pageSize = 5;
        List<Type> typeList = new ArrayList<>();
        int maxPage = 1;
        if (maxCount < pageSize) {
            maxPage = 1;
        } else if (maxCount % pageSize == 0) {
            maxPage = maxCount / pageSize;
        } else {
            maxPage = maxCount / pageSize + 1;
        }
        typeList = typeService.queryTypeList(pageIndex, pageSize);
        int nextPage = 0;
        int prePage = 0;
        int currentPage = pageIndex;
        if (currentPage >= maxPage) {
            nextPage = maxPage;
            prePage = currentPage - 1;
        } else if (currentPage <= 1) {
            nextPage = currentPage + 1;
            prePage = 1;

        } else {
            nextPage = currentPage + 1;
            prePage = currentPage - 1;
        }
        modelAndView.addObject("nextPage", nextPage);
        modelAndView.addObject("prePage", prePage);
        modelAndView.addObject("typeList", typeList);
        modelAndView.setViewName("/admin/types");
        return modelAndView;

    }
}
