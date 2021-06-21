package com.leman.controller;

import com.leman.entity.Comment;
import com.leman.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

@Controller
public class CommentController {
    @Autowired
    @Qualifier("CommentServiceImpl")
    private CommentService commentService;
    // 获取所有评论
    @RequestMapping("/allComment")
    public String list(Model model) {
        List<Comment> list = commentService.queryAllComment();
        model.addAttribute("list", list);
        return "admin/allComment";
    }

    @RequestMapping("/toAddComment")
    public String toAddPaper() {
        return "admin/addComment";
    }
    // Admin 添加
    @RequestMapping("/addNewComment")
    public String addAdminPaper(Comment comment) {
        Date date = new Date();
        comment.setCreate_date(date);
        commentService.addComment(comment);
        return "redirect:/allComment";
    }
    // Admin 更新
    @RequestMapping("/comment/toUpdateComment")
    public String toUpdateBook(Model model, int id) {
        Comment comment = commentService.queryCommentById(id);
        model.addAttribute("comment",comment);
        return "admin/updateComment";
    }
    // Admin 修改
    @RequestMapping("/updateComment")
    public String updateBook(Model model, Comment comment) {
        comment.setCreate_date(new Date());
        commentService.updateComment(comment);
        Comment comment1 = commentService.queryCommentById(comment.getId());
        model.addAttribute("comment", comment1);
        return "redirect:/allComment";
    }
    // Admin 删除
    @RequestMapping("/comment/del/{commentId}")
    public String deleteBook(@PathVariable("commentId") int id) {
        commentService.deleteCommentById(id);
        return "redirect:/allComment";
    }

    // User 留言
    @RequestMapping("/addComment")
    @ResponseBody
    public String addPaper(Comment comment) {
        Date date = new Date();
        comment.setCreate_date(date);
        System.out.println(comment);
        int temp = commentService.addComment(comment);
        if (temp == 1){
            return "success";
        }else{
            return "error";
        }
    }
    // 获取某个视频下的所有评论 根据 spisode_id来获取

}
