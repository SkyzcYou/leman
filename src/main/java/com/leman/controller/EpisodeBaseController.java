package com.leman.controller;

import com.leman.entity.Books;
import com.leman.entity.Episode;
import com.leman.service.BookService;
import com.leman.service.EpisodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class EpisodeBaseController {
    @Autowired
    @Qualifier("EpisodeServiceImpl")
    private EpisodeService episodeService;

    @RequestMapping("/videoBase")
    public String list(Model model) {
        List<Episode> list = episodeService.queryAllEpisode();
        model.addAttribute("list", list);
        return "EpisodeBase";
    }
}
