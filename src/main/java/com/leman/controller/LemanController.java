package com.leman.controller;

import com.leman.entity.*;
import com.leman.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

/**
 * 实现主要页面请求的控制
 *
* */
@Controller
public class LemanController {
    @Autowired
    @Qualifier("EpisodeServiceImpl")
    private EpisodeService episodeService;
    @Autowired
    @Qualifier("CommentServiceImpl")
    private CommentService commentService;
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;
    @Autowired
    @Qualifier("HomeEpisodeServiceImpl")
    private HomeEpisodeService homeEpisodeService;
    @Autowired
    @Qualifier("HomeCarouselServiceImpl")
    private HomeCarouselService homeCarouseService;
    @Autowired
    @Qualifier("AnimeServiceImpl")
    private AnimeService animeService;

    // 首页
    @RequestMapping("/index")
    public String list(Model model) {
        // 获取轮播图
        List<HomeCarousel> homeCarouselList = homeCarouseService.queryAllHomeCarousel();
        LinkedHashMap<Anime,Episode> carEpisodeAndAnimeMap = new LinkedHashMap<Anime,Episode>();
        for (HomeCarousel homeCarouseItem:homeCarouselList){
            int anime_id = homeCarouseItem.getAnime_id(); // 对应剧集 id
            // 使用剧集id查找对应剧集
            Anime anime= animeService.queryAnimeById(anime_id);
            System.out.println("Anime====>" + anime);
            // 使用剧集id 查找对应剧集的播放id获取第一集
            Episode firstEpisode = episodeService.queryFirstEpisodeByFatherId(anime.getId());
            System.out.println("firstEpisode====>" + firstEpisode);
            // 将剧集和视频放入 HashMap
            carEpisodeAndAnimeMap.put(anime,firstEpisode);
            System.out.println("Map在这里====》"+carEpisodeAndAnimeMap);
        }
        model.addAttribute("carMap",carEpisodeAndAnimeMap);


        // 获取首页 5 个精选视频
        List<HomeEpisode> homeEpisodeList = homeEpisodeService.queryAllHomeEpisode();
//        String episode_id = "20200101";
        model.addAttribute("top01_id",homeEpisodeList.get(0).getEpisode_id());
        model.addAttribute("top02_id",homeEpisodeList.get(1).getEpisode_id());
        model.addAttribute("top03_id",homeEpisodeList.get(2).getEpisode_id());
        model.addAttribute("top04_id",homeEpisodeList.get(3).getEpisode_id());
        model.addAttribute("top05_id",homeEpisodeList.get(4).getEpisode_id());


        return "index";
    }
    // 用户中心
    @RequestMapping("/userInfo")
    public String list(Model model, HttpSession session) {
        if (session.getAttribute("USER_SESSION") != null){
            return "user";
        }else {
            return "index";
        }
    }
    // 播放视频
    @RequestMapping("/play/{episode_id}")
    public String play(Model model,@PathVariable("episode_id") int id){
        // 根据 id 查询 episode 表，获取 视频 url
        System.out.println(id);
        Episode episode = episodeService.queryEpisodeById(id);
        System.out.println(episode);
        // 获取 该视频的父剧集 并列出该剧集的所有视频
        List<Episode> episodeList = episodeService.queryEpisodeByFatherId(episode.getFather_id());

        System.out.println(episodeList);
        // 根据 episode_id 获取 评论列表 和用户名列表
        List<Comment> commentList = commentService.queryCommentByEpisodeId(id);
        List<User> userList = new ArrayList<User>();
        for (Comment comment : commentList){
            userList.add(userService.queryUserById(comment.getUser_id()));
        }
        model.addAttribute("episode",episode);
        model.addAttribute("commentList",commentList);
        model.addAttribute("userList",userList);
        model.addAttribute("episodeList",episodeList);
        return "play";
    }

    // 管理员登录
    @RequestMapping("/admin")
    public String admin(Model model,HttpSession session){
        if (session.getAttribute("ADMIN_SESSION") != null){
            return "admin/index";
        }else {
            return "admin/login";
        }
    }
    // 【测试用例】 管理界面
    @RequestMapping("/adminIndexTest")
    public String adminIndex(Model model){
        return "admin/index";
    }

    // 【测试用例】 显示图片
    @RequestMapping("/submit_img")
    public String submit_img(Model model, HttpSession session) {
        return "submit_img";
    }

    // 【测试用例】 显示图片
    @RequestMapping("/show_img")
    public String show_img(Model model, HttpSession session) {
        return "show_img";
    }
}