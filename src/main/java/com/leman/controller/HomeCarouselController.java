package com.leman.controller;

import com.leman.entity.HomeCarousel;
import com.leman.entity.HomeEpisode;
import com.leman.service.HomeCarouselService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeCarouselController {
    @Autowired
    @Qualifier("HomeCarouselServiceImpl")
    private HomeCarouselService homeCarouselService;


    // 跳转到更新信息页面
    @RequestMapping("/toUpdateHomeCarousel")
    public String toUpdateHomeCarousel(Model model, int id) {
        HomeCarousel homeCarousel = homeCarouselService.queryHomeCarouselById(id);
        System.out.println(homeCarousel);
        model.addAttribute("homeCarousel",homeCarousel);
        return "admin/updateHomeCarousel";
    }

    @RequestMapping("/updateHomeCarousel")
    public String updateBook(Model model, HomeCarousel homeCarousel) {
        System.out.println("HomeCarouselController>>"+homeCarousel);
        homeCarouselService.updateHomeCarousel(homeCarousel);
        return "redirect:/admin/allHomeCarousel";
    }
}