package com.leman.controller;

import com.leman.entity.Anime;
import com.leman.entity.Episode;
import com.leman.service.AnimeService;
import com.leman.service.EpisodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * 搜索
 */
@Controller
public class SearchController {
    @Autowired
    @Qualifier("AnimeServiceImpl")
    private AnimeService animeService;

    @Autowired
    @Qualifier("EpisodeServiceImpl")
    private EpisodeService episodeService;

    @RequestMapping("/search")
    public String search(Model model, @RequestParam("value") String value){
        // 传入搜索内容
        List<Episode> searchList = episodeService.queryEpisodeByFatherName(value);
        model.addAttribute("searchList",searchList);
        return "search";
    }
}