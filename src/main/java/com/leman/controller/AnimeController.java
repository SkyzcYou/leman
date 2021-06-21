package com.leman.controller;

import com.leman.entity.Anime;
import com.leman.service.AnimeService;
import com.leman.service.AnimeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
public class AnimeController {
    @Autowired
    @Qualifier("AnimeServiceImpl")
    private AnimeService animeService;

    @RequestMapping("/toAddAnime")
    public String toAddPaper() {
        return "admin/addAnime";
    }

    @RequestMapping("/addAnime")
    public String addPaper(Anime anime, HttpServletRequest request, MultipartFile file) throws IOException  {
        System.out.println(anime);
        /**
         * 上传图片
         */
        //图片上传成功后，将图片的地址写到数据库
        String realPath = request.getSession().getServletContext().getRealPath(File.separator);
        System.out.println(realPath);
        String filePath = realPath+"\\static\\upload";//保存图片的路径
        //获取原始图片的拓展名
        String originalFilename = file.getOriginalFilename();
        System.out.println("源文件名称为：" + originalFilename);
        //新的文件名字
        String newFileName = UUID.randomUUID()+originalFilename;
        System.out.println("新名称为：" + originalFilename);
        //　　　封装上传文件位置的全路径
        File targetFile = new File(filePath,newFileName);
        //　　　把本地文件上传到封装上传文件位置的全路径
        file.transferTo(targetFile);
        anime.setPimage(newFileName);


        animeService.addAnime(anime);
        return "redirect:/admin/allAnime";
    }


    @RequestMapping("/toUpdateAnime")
    public String toUpdateAnime(Model model, int id) {
        Anime anime = animeService.queryAnimeById(id);
        System.out.println(anime);
        model.addAttribute("anime",anime );
        return "admin/updateAnime";
    }

    @RequestMapping("/updateAnime")
    public String updateAnime(Model model, Anime anime, HttpServletRequest request, MultipartFile file) throws IOException {
        System.out.println(anime);

        /**
         * 上传图片
         */
        //图片上传成功后，将图片的地址写到数据库
        String realPath = request.getSession().getServletContext().getRealPath(File.separator);
        System.out.println(realPath);
        String filePath = realPath+"\\static\\upload";//保存图片的路径
        //获取原始图片的拓展名
        String originalFilename = file.getOriginalFilename();
        System.out.println("源文件名称为：" + originalFilename);
        //新的文件名字
        String newFileName = UUID.randomUUID()+originalFilename;
        System.out.println("新名称为：" + originalFilename);
        //　　　封装上传文件位置的全路径
        File targetFile = new File(filePath,newFileName);
        //　　　把本地文件上传到封装上传文件位置的全路径
        file.transferTo(targetFile);

        anime.setPimage(newFileName);


        animeService.updateAnime(anime);
        return "redirect:/admin/allAnime";
    }

    @RequestMapping("/delAnime/{id}")
    public String deleteAnime(@PathVariable("id") int id) {
        animeService.deleteAnimeById(id);
        return "redirect:/admin/allAnime";
    }
}
