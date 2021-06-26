package com.leman.controller;

import com.leman.entity.HomeEpisode;
import com.leman.service.HomeEpisodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeEpisodeController {
    @Autowired
    @Qualifier("HomeEpisodeServiceImpl")
    private HomeEpisodeService homeEpisodeService;


    // 跳转到更新信息页面
    @RequestMapping("/toUpdateHomeEpisode")
    public String toUpdateBook(Model model, int id) {
        HomeEpisode homeEpisode = homeEpisodeService.queryHomeEpisodeById(id);
        System.out.println(homeEpisode);
        model.addAttribute("homeEpisode",homeEpisode);
        return "admin/updateHomeEpisode";
    }

    @RequestMapping("/updateHomeEpisode")
    public String updateBook(Model model, HomeEpisode homeEpisode) {
        System.out.println(homeEpisode);
        homeEpisodeService.updateHomeEpisode(homeEpisode);
        return "redirect:/admin/allHomeEpisode";
    }
}