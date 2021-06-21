package com.leman.service;

import com.leman.entity.Comment;

import java.util.List;


public interface CommentService {
    //增加一个Comment
    int addComment(Comment comment);
    //根据id删除一个Comment
    int deleteCommentById(int id);
    //更新Comment
    int updateComment(Comment comments);
    //根据id查询,返回一个Comment
    Comment queryCommentById(int id);
    //查询全部Comment,返回list集合
    List<Comment> queryAllComment();

    //根据 episode_id 获取评论列表
    List<Comment> queryCommentByEpisodeId(int episode_id);
}