package com.leman.controller;

import com.leman.entity.*;
import com.leman.service.*;
import com.sun.xml.internal.bind.v2.TODO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    @Qualifier("AdminServiceImpl")
    private AdminService adminService;
    @Autowired
    @Qualifier("EpisodeServiceImpl")
    private EpisodeService episodeService;
    @Autowired
    @Qualifier("HomeEpisodeServiceImpl")
    private HomeEpisodeService homeEpisodeService;
    @Autowired
    @Qualifier("AnimeServiceImpl")
    private AnimeService animeService;
    @Autowired
    @Qualifier("HomeCarouselServiceImpl")
    private HomeCarouselService homeCarouselService;

    // 管理员登陆
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(Model model, @RequestParam("name") String name, @RequestParam("password") String password, HttpSession session){
        Admin admin = adminService.queryAdminByNameAndPassword(name,password);
        if (admin != null){
            session.setAttribute("ADMIN_SESSION",admin);
            System.out.println("验证成功，存入session 成功：" + admin);
            return "redirect:/admin";
        }else {
            // 发送一个 msg
            model.addAttribute("msg","登陆失败");
            System.out.println("登录错误");
            return "admin/login";
        }
    }
    // 管理员退出
    @RequestMapping("/logout")
    public String logout(Model model,HttpSession session){
        session.removeAttribute("ADMIN_SESSION");
        return "redirect:/admin";
    }

    // 管理员管理页面
    @RequestMapping("/allAdmin")
    public String list(Model model) {
        List<Admin> list = adminService.queryAllAdmin();
        model.addAttribute("list", list);
        return "admin/allAdmin";
    }
    // 视频管理页面
    @RequestMapping("/allEpisode")
    public String allEpisode(Model model) {
        List<Episode> episodeList = episodeService.queryAllEpisode();
        model.addAttribute("list", episodeList);
        return "admin/allEpisode";
    }
    // 首页视频管理页面
    @RequestMapping("/allHomeEpisode")
    public String allHomeVideo(Model model) {
        List<HomeEpisode> homeEpisodeList = homeEpisodeService.queryAllHomeEpisode();
        model.addAttribute("list", homeEpisodeList);
        return "admin/allHomeEpisode";
    }

    // 剧集管理页面
    @RequestMapping("/allAnime")
    public String allAnime(Model model) {
        //
        List<Anime> animeList = animeService.queryAllAnime();
        model.addAttribute("list", animeList);
        return "admin/allAnime";
    }

    // 轮播图推荐视频管理页面
    @RequestMapping("/allHomeCarousel")
    public String allHomeCarousel(Model model) {
        List<HomeCarousel> homeCarouselList = homeCarouselService.queryAllHomeCarousel();
        model.addAttribute("list", homeCarouselList);
        return "admin/allHomeCarousel";
    }

    @RequestMapping("/toAddAdmin")
    public String toAddPaper() {
        return "admin/addAdmin";
    }

    @RequestMapping("/addAdmin")
    public String addPaper(Admin admin) {
        System.out.println(admin);
        adminService.addAdmin(admin);
        return "redirect:/admin/allAdmin";
    }

    @RequestMapping("/toUpdateAdmin")
    public String toUpdateBook(Model model, int id) {
        Admin admin = adminService.queryAdminById(id);
        System.out.println(admin);
        model.addAttribute("admin",admin );
        return "admin/updateAdmin";
    }

    @RequestMapping("/updateAdmin")
    public String updateBook(Model model, Admin admin) {
        System.out.println(admin);
        adminService.updateAdmin(admin);
        Admin admin1 = adminService.queryAdminById(admin.getId());
        model.addAttribute("admin", admin1);
        return "redirect:/admin/allAdmin";
    }

    @RequestMapping("/del/{Id}")
    public String deleteBook(@PathVariable("Id") int id) {
        adminService.deleteAdminById(id);
        return "redirect:/admin/allAdmin";
    }

}
