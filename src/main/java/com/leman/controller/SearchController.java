package com.leman.controller;

import com.leman.entity.Anime;
import com.leman.service.AnimeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * 搜索
 */
@Controller
public class SearchController {
    @Autowired
    @Qualifier("AnimeServiceImpl")
    private AnimeService animeService;

    @RequestMapping("/search/{value}")
    public String search(Model model, @PathVariable("value") String value){
        // 传入搜索内容
        List<Anime> searchList = animeService.queryAnimeListByName(value);
        model.addAttribute("searchList",searchList);
        return "search";
    }
}