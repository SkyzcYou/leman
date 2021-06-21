package com.leman.controller;

import com.leman.entity.Episode;
import com.leman.service.EpisodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class EpisodeController {
    @Autowired
    @Qualifier("EpisodeServiceImpl")
    private EpisodeService episodeService;

    @RequestMapping("/toAddEpisode")
    public String toAddPaper() {
        return "admin/addEpisode";
    }
    // Admin 添加
    @RequestMapping("/addNewEpisode")
    public String addEpisodePaper(Episode episode) {
        episodeService.addEpisode(episode);
        return "redirect:/admin/allEpisode";
    }
    // Admin 更新
    @RequestMapping("/comment/toUpdateEpisode")
    public String toUpdateBook(Model model, int id) {
        Episode episode = episodeService.queryEpisodeById(id);
        String newUrl = episode.getUrl().replaceAll("\"","&quot;");
        episode.setUrl(newUrl);
        model.addAttribute("episode",episode);
        return "admin/updateEpisode";
    }
    // Admin 修改
    @RequestMapping("/updateEpisode")
    public String updateBook(Model model, Episode episode) {
        episodeService.updateEpisode(episode);
        Episode episode1 = episodeService.queryEpisodeById(episode.getId());
        model.addAttribute("episode", episode1);
        return "redirect:/admin/allEpisode";
    }
    // Admin 删除
    @RequestMapping("/episode/del/{id}")
    public String deleteBook(@PathVariable("id") int id) {
        episodeService.deleteEpisodeById(id);
        return "redirect:/admin/allEpisode";
    }
}
